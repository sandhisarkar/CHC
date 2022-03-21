using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.Odbc;
using NovaNet.Utils;
using NovaNet.wfe;
using System.IO;
using System.Net;

namespace ImageHeaven
{
    public partial class frmDataTransfer : Form
    {
        public string scan_path = string.Empty;
        public string pathServer = string.Empty;
        public string finalPath = string.Empty;
        public List<string> foldernames;
        public List<string> foldernamesServer;
        public List<string> foldernamesServerFolder;
        OdbcConnection sqlCon = new OdbcConnection();
        OdbcTransaction txn = null;
        private Credentials crd = new Credentials();

        private OdbcDataAdapter sqlAdap = null;
        byte[] tmpWrite;
        System.IO.MemoryStream stateLog;
        public string err = null;
        public static NovaNet.Utils.exLog.Logger exMailLog = new NovaNet.Utils.exLog.emailLogger("./errLog.log", NovaNet.Utils.exLog.LogLevel.Dev, Constants._MAIL_TO, Constants._MAIL_FROM, Constants._SMTP);
        public static NovaNet.Utils.exLog.Logger exTxtLog = new NovaNet.Utils.exLog.txtLogger("./errLog.log", NovaNet.Utils.exLog.LogLevel.Dev);

        string iniPath = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Remove(0, 6) + "\\" + "IhConfiguration.ini";
        INIFile ini = new INIFile();

        public frmDataTransfer()
        {
            InitializeComponent();
        }


        public frmDataTransfer(OdbcConnection prmCon, Credentials prmCrd)
        {
            InitializeComponent();

            sqlCon = prmCon;

            crd = prmCrd;

            exMailLog.SetNextLogger(exTxtLog);
        }

        private void find_lPath_sPath()
        {
            if (File.Exists(iniPath) == true)
            {
                string lPath = ini.ReadINI("PATHCONF", "LPATH", string.Empty, iniPath).Trim();
                if (lPath == string.Empty || lPath == null || lPath == "" || lPath == "\0")
                {
                    txtScanPath.Text = string.Empty;
                    scan_path = string.Empty;
                }
                else
                {
                    scan_path = lPath;
                    txtScanPath.Text = lPath;
                }
                string sPath = ini.ReadINI("PATHCONF", "SPATH", string.Empty, iniPath).Trim();
                if (sPath == string.Empty || sPath == null || sPath == "" || sPath == "\0")
                {
                    txtServerPath.Text = string.Empty;
                    pathServer = string.Empty;
                }
                else
                {
                    pathServer = sPath;
                    txtServerPath.Text = sPath;
                }
                if (txtScanPath.Text == "" || txtServerPath.Text == "")
                {
                    deButton20.Enabled = false;
                }
                else
                { deButton20.Enabled = true; }
            }
        }

        private void frmDataTransfer_Load(object sender, EventArgs e)
        {
            lstBundle.Items.Clear();
            find_lPath_sPath();

            if(scan_path != null || scan_path != "")
            { }
            else
            { 
                MessageBox.Show(this, "Local drive path is not set", "Check !", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if(pathServer != null || pathServer != "")
            { }
            else
            { 
                MessageBox.Show(this, "Server drive path is not set", "Check !", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            //check if exists
            if (Directory.Exists(txtScanPath.Text))
            {
                foldernames = new List<string>();

                foreach (string folderName in Directory.GetDirectories(txtScanPath.Text))
                {
                    string folder = Path.GetFileName(folderName);
                    if (folder != "Backup")
                    {
                        foldernames.Add(folderName);
                        lstBundle.Items.Add(folder);
                    }
                }


                if (Directory.Exists(txtServerPath.Text))
                {
                    foldernamesServer = new List<string>();

                    foreach (string folderName in Directory.GetDirectories(txtServerPath.Text))
                    {
                        string folder = Path.GetFileName(folderName);

                        foldernamesServer.Add(folderName);
                        lstLot.Items.Add(folder);

                    }
                }
                else
                {
                    MessageBox.Show("No such server scan folder found");
                    this.Close();
                }

            }
            else
            {
                MessageBox.Show("No such scan folder found for this computer");
                this.Close();
            }

            if (lstLot.Items.Count <= 0 && listBox1.Items.Count <= 0)
            {
                deButton20.Enabled = false;
            }
            else
            { deButton20.Enabled = true; }
        }

        private void lstLot_SelectedIndexChanged(object sender, EventArgs e)
        {
            listBox1.Items.Clear();

            if (lstLot.Items.Count > 0)
            {
                if (lstLot.SelectedItems.Count > 0)
                {
                    if (lstLot.SelectedItems[0].ToString() != null)
                    {


                        finalPath = txtServerPath.Text + "\\" + lstLot.SelectedItems[0].ToString();


                        foldernamesServerFolder = new List<string>();

                        foreach (string folderName in Directory.GetDirectories(finalPath))
                        {
                            string folder = Path.GetFileName(folderName);

                            foldernamesServerFolder.Add(folderName);
                            listBox1.Items.Add(folder);

                        }


                        if (lstLot.Items.Count <= 0 && listBox1.Items.Count <= 0)
                        {

                            deButton20.Enabled = false;
                        }
                        else
                        { deButton20.Enabled = true; }

                    }
                }
            }
        }

        private void deButton21_Click(object sender, EventArgs e)
        {
            this.Close();
        }


        private bool insertIntoDB(string bundleName, string serverFolder, string mainFolder, string serverLoc, int imgCou, OdbcTransaction trans)
        {
            bool commitBol = true;

            string sqlStr = string.Empty;

            OdbcCommand sqlCmd = new OdbcCommand();
            sqlStr = @"insert into tbl_trigger(created_by,created_dttm,bundle_name,server_main_folder,server_sub_folder,server_loc,img_count) values('" +
                        crd.created_by + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "', '" + bundleName + "','" + mainFolder + "', '" + serverFolder + "','" + serverLoc.Replace("\\", "\\\\") + "','" + imgCou + "') ";

            /* sqlStr = @"insert into image_import(proj_key,batch_key, filename,created_by,created_dttm,Page_name,status,photo,serial_no,page_index_name) values('" +
                            cmbProject.SelectedValue.ToString() + "','" + cmbBatch.SelectedValue.ToString() + "','" + PolicyNo +
                            "','" + frmMain.name + "','" + DateTime.Now.ToString("yyyy-MM-dd") + "','" + image + "','0','0','" + imageNo + "','" + image + "')"; */
            sqlCmd.Connection = sqlCon;
            sqlCmd.Transaction = trans;
            sqlCmd.CommandText = sqlStr;
            int i = sqlCmd.ExecuteNonQuery();
            if (i > 0)
            {
                commitBol = true;
            }
            else
            {
                commitBol = false;
            }


            return commitBol;

        }

        private void deButton20_Click(object sender, EventArgs e)
        {
            deButton20.Enabled = false;
            OdbcTransaction sqlTrans = null;

            if (lstBundle.Items.Count > 0 && listBox1.Items.Count > 0)
            {
                if (lstBundle.SelectedItems.Count > 0 && listBox1.SelectedItems.Count > 0)
                {

                    sqlTrans = sqlCon.BeginTransaction();



                    if (!Directory.Exists(txtScanPath.Text + "\\" + "Backup"))
                    {
                        Directory.CreateDirectory(txtScanPath.Text + "\\" + "Backup");
                    }


                    List<string> bundleList = new List<string>();
                    for (int i = 0; i < lstBundle.SelectedItems.Count; i++)
                    {
                        string selectedBundle = lstBundle.SelectedItems[i].ToString();

                        string folderPath = txtScanPath.Text + "\\" + selectedBundle;

                        string destFolderPath = txtServerPath.Text + "\\" + lstLot.SelectedItems[0].ToString() + "\\" + listBox1.SelectedItems[0].ToString();

                        bundleList.Add(selectedBundle);

                        //copy dir
                        if (!Directory.Exists(destFolderPath + "\\" + selectedBundle))
                        {
                            Directory.CreateDirectory(destFolderPath + "\\" + selectedBundle);
                        }

                        //move dir
                        if (!Directory.Exists(txtScanPath.Text + "\\" + "Backup" + "\\" + selectedBundle))
                        {
                            Directory.CreateDirectory(txtScanPath.Text + "\\" + "Backup" + "\\" + selectedBundle);
                        }

                        int imgCount = 0;

                        DirectoryInfo selectedPath = new DirectoryInfo(folderPath);
                        foreach (FileInfo file in selectedPath.GetFiles())
                        {
                            if (file.Extension.Equals(".tif") || file.Extension.Equals(".TIF"))
                            {
                                //copy file
                                File.Copy(selectedPath + "\\" + file, destFolderPath + "\\" + selectedBundle + "\\" + file);
                                //move file
                                File.Move(selectedPath + "\\" + file, txtScanPath.Text + "\\" + "Backup" + "\\" + selectedBundle + "\\" + file);
                                //increase image count
                                imgCount++;
                            }
                        }

                        Directory.Delete(folderPath, true);

                        insertIntoDB(selectedBundle, listBox1.SelectedItems[0].ToString(), lstLot.SelectedItems[0].ToString(), txtServerPath.Text + "\\" + lstLot.SelectedItems[0].ToString() + "\\" + listBox1.SelectedItems[0].ToString(), imgCount, sqlTrans);

                    }

                    //items remove
                    foreach (string eachItem in bundleList)
                    {
                        lstBundle.Items.Remove(eachItem);
                    }

                    sqlTrans.Commit();

                    MessageBox.Show("Scan Data transfer completed successfully...");

                    deButton20.Enabled = true;
                }
            }
        }
    }
}
