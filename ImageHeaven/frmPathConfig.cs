using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Windows.Forms;
using System.Drawing.Drawing2D;
using System.Drawing.Text;
using System.ComponentModel;
using WeifenLuo.WinFormsUI.Docking;
using System.Runtime.InteropServices;
using DockSample.Customization;
using System.IO;
using DockSample;
using NovaNet.Utils;
using NovaNet.wfe;
using System.Data;
using System.Data.Odbc;
using System.Collections;
using LItems;
//using AForge.Imaging;
//using AForge;
//using AForge.Imaging.Filters;
using TwainLib;
using Inlite.ClearImageNet;
using System.Net;
using System.Collections.Generic;
//using System.Drawing.Bitmap;
//using System.Drawing.Graphics;
//using Graphics.DrawImage;


namespace ImageHeaven
{
    public partial class frmPathConfig : Form
    {
        OdbcConnection sqlCon = null;

        string iniPath = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Remove(0, 6) + "\\" + "IhConfiguration.ini";
        INIFile ini = new INIFile();

        public string scan_path = string.Empty;
        public string pathServer = string.Empty;
        public List<string> foldernames;
        public List<string> foldernamesServer;

        public frmPathConfig()
        {
            InitializeComponent();
            //find_lPath_sPath();
        }

        public frmPathConfig(OdbcConnection prmCon)
        {
            InitializeComponent();
            sqlCon = prmCon;
        }

        private void find_lPath_sPath()
        {
            if (File.Exists(iniPath) == true)
            {
                string lPath = ini.ReadINI("PATHCONF", "LPATH", string.Empty, iniPath).Trim();
                if(lPath == string.Empty || lPath == null || lPath == "" || lPath == "\0")
                {
                    deTextBox1.Text = string.Empty;
                    scan_path = string.Empty;
                }
                else
                {
                    scan_path = lPath;
                    deTextBox1.Text = lPath;
                }
                string sPath = ini.ReadINI("PATHCONF", "SPATH", string.Empty, iniPath).Trim();
                if (sPath == string.Empty || sPath == null || sPath == "" || sPath == "\0")
                {
                    deTextBox2.Text = string.Empty;
                    pathServer = string.Empty;
                }
                else
                {
                    pathServer = sPath;
                    deTextBox2.Text = sPath;
                }
                if (deTextBox1.Text == "" || deTextBox2.Text == "")
                {
                    deButton20.Enabled = false;
                }
                else
                { deButton20.Enabled = true; }
            }
        }
        private void frmPathConfig_Load(object sender, EventArgs e)
        {
            find_lPath_sPath();
            if(deTextBox1.Text == "" || deTextBox2.Text == "")
            {
                deButton20.Enabled = false;
            }
            else
            { deButton20.Enabled = true; }
        }

        private void deButton21_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void deButton1_Click(object sender, EventArgs e)
        {
            // Local Drive select
            deButton20.Enabled = false;
            //lstLot.Items.Clear();

            pathServer = string.Empty;
            int pos = 0;
            FolderBrowserDialog browseForComputer = new FolderBrowserDialog();
            string origIp = string.Empty;
            System.IO.FileStream fs;


            //Network Path Selection

            if (browseForComputer.ShowDialog() == DialogResult.OK)
            {
                deTextBox2.Text = browseForComputer.SelectedPath;
                pathServer =  deTextBox2.Text;
                if (pathServer != string.Empty || pathServer != "")
                {
                    deButton20.Enabled = true;
                    pos = pathServer.IndexOf("\\\\");
                    if (pos != -1)
                    {
                        int posSnd = pathServer.IndexOf("\\", 2);
                        string compName = pathServer.Substring(pos + 2, posSnd - 2);
                        string restPath = pathServer.Substring(posSnd);
                        if (compName != string.Empty)
                        {
                            try
                            {
                                IPHostEntry ip = Dns.GetHostEntry(compName);
                                IPAddress[] IpA = ip.AddressList;
                                for (int i = 0; i < IpA.Length; i++)
                                {
                                    origIp = IpA[i].ToString();
                                }
                                pathServer = "\\\\" + origIp + restPath;
                                fs = new System.IO.FileStream(pathServer + "\\temp.txt", System.IO.FileMode.Append);
                                fs.Close();
                                System.IO.File.Delete(pathServer + "\\temp.txt");
                                //CmdSave.Enabled = true;
                                deTextBox2.Text = pathServer;

                                foldernamesServer = new List<string>();

                                deButton20.Enabled = true;

                            }
                            catch (Exception ex)
                            {
                                deButton20.Enabled = false;
                                deTextBox2.Text = string.Empty;
                                MessageBox.Show(ex.Message.ToString());
                            }
                        }
                    }
                    else
                    {
                        deButton20.Enabled = false;
                        deTextBox2.Text = string.Empty;
                        MessageBox.Show("Selected drive is invalid. Please select folder from network drive..");
                    }
                }
            }
            else
            {
                deButton20.Enabled = false;
                deTextBox2.Text = string.Empty;
                MessageBox.Show("Selected drive is invalid. Please select folder from network drive..");
            }

        }

        private void btnBrowse_Click(object sender, EventArgs e)
        {
            // Local Drive select

            string path = string.Empty;
            int pos = 0;
            FolderBrowserDialog browseForComputer = new FolderBrowserDialog();
            string origIp = string.Empty;
            System.IO.FileStream fs;


            //Local Drive Selection

            if (browseForComputer.ShowDialog() == DialogResult.OK)
            {
                deTextBox1.Text = browseForComputer.SelectedPath;
                scan_path = deTextBox1.Text;
                if (scan_path != string.Empty)
                {
                    deButton20.Enabled = true;
                    pos = path.IndexOf("\\\\");
                    if (pos == -1)
                    {
                        //int posSnd = path.IndexOf("\\", 2);
                        //string compName = path.Substring(pos + 2, posSnd - 2);
                        string compName = path;
                        //string restPath = path.Substring(posSnd);
                        if (compName != string.Empty)
                        {
                            try
                            {
                                //IPHostEntry ip = Dns.GetHostEntry(compName);
                                //IPAddress[] IpA = ip.AddressList;
                                //for (int i = 0; i < IpA.Length; i++)
                                //{
                                //    origIp = IpA[i].ToString();
                                //}
                                //path = "\\\\" + origIp + restPath;
                                fs = new System.IO.FileStream(scan_path + "\\temp.txt", System.IO.FileMode.Append);
                                fs.Close();
                                System.IO.File.Delete(scan_path + "\\temp.txt");
                                deButton20.Enabled = true;
                                deTextBox1.Text = scan_path;
                            }
                            catch (Exception ex)
                            {
                                deButton20.Enabled = false;
                                MessageBox.Show(ex.Message.ToString());
                            }
                        }
                    }
                    else
                    {
                        deButton20.Enabled = false;
                        MessageBox.Show("Selected drive is invalid. Please select folder from local drive..");
                    }
                }
            }
            else
            {
                deButton20.Enabled = false;
            }

        }

        private void deButton20_Click(object sender, EventArgs e)
        {
            if(deTextBox1.Text != "" || deTextBox1.Text != null)
            {
                int local = ini.WriteINI("PATHCONF", "LPATH",deTextBox1.Text,iniPath);
            }
            if (deTextBox2.Text != "" || deTextBox2.Text != null)
            {
                int server = ini.WriteINI("PATHCONF", "SPATH", deTextBox2.Text, iniPath);
            }
            MessageBox.Show(this, "Path configured successfully ", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void deTextBox1_Leave(object sender, EventArgs e)
        {
            if (deTextBox1.Text == "" || deTextBox2.Text == "")
            {
                deButton20.Enabled = false;
            }
            else
            { deButton20.Enabled = true; }
        }

        private void deTextBox2_Leave(object sender, EventArgs e)
        {
            if (deTextBox1.Text == "" || deTextBox2.Text == "")
            {
                deButton20.Enabled = false;
            }
            else
            { deButton20.Enabled = true; }
        }

        private void btnBrowse_Leave(object sender, EventArgs e)
        {
            if (deTextBox1.Text == "" || deTextBox2.Text == "")
            {
                deButton20.Enabled = false;
            }
            else
            { deButton20.Enabled = true; }
        }

        private void deButton1_Leave(object sender, EventArgs e)
        {
            if (deTextBox1.Text == "" || deTextBox2.Text == "")
            {
                deButton20.Enabled = false;
            }
            else
            { deButton20.Enabled = true; }
        }
    }
}
