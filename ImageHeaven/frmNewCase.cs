using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using NovaNet.wfe;
using NovaNet.Utils;
using System.Data.Odbc;
using System.Net;
using LItems;
using System.IO;
using System.Collections;
using nControls;
using DataLayerDefs;

namespace ImageHeaven
{
    public partial class frmNewCase : Form
    {
        public string name = frmMain.name;
        //OdbcConnection sqlCon = null;
        NovaNet.Utils.GetProfile pData;
        NovaNet.Utils.ChangePassword pCPwd;
        NovaNet.Utils.Profile p;
        public static NovaNet.Utils.IntrRBAC rbc;
        //public Credentials crd;
        static wItem wi;
        public static string projKey;
        public static string bundleKey;
        public static string caseStatus = null;
        public static string caseNature = null;
        public static string caseType = null;
        public static string caseYear = null;
        public static string casefile = null;
        public static bool isWith = false;

        public static string filename = null;
        public static string old_filename = null;

        public Credentials crd = new Credentials();
        private OdbcConnection sqlCon;
        OdbcTransaction txn;
        public static DataLayerDefs.Mode _mode = DataLayerDefs.Mode._Edit;

        public static eSTATES[] state;
        //public delegate void OnAccept(DeedDetails retDeed);
        //OnAccept m_OnAccept;
        ////The method to be invoked when the user aborts all operations
        //public delegate void OnAbort();
        OdbcDataAdapter sqlAdap;

        public frmNewCase()
        {
            InitializeComponent();
        }

        public frmNewCase(string proj, string bundle, OdbcConnection pCon, Credentials pcrd, DataLayerDefs.Mode mode)
        {
            InitializeComponent();

            projKey = proj;

            bundleKey = bundle;

            sqlCon = pCon;

            //txn = pTxn;

            crd = pcrd;

            _mode = mode;

            init();
        }

        public frmNewCase(string proj, string bundle, OdbcConnection pCon, Credentials pcrd, DataLayerDefs.Mode mode, eSTATES[] prmState)
        {
            InitializeComponent();

            projKey = proj;

            bundleKey = bundle;

            sqlCon = pCon;

            //txn = pTxn;

            crd = pcrd;

            _mode = mode;

            state = prmState;

            init();
        }

        public frmNewCase(string proj, string bundle, OdbcConnection pCon, Credentials pcrd, DataLayerDefs.Mode mode, string file)
        {
            InitializeComponent();

            projKey = proj;

            bundleKey = bundle;

            sqlCon = pCon;

            //txn = pTxn;

            crd = pcrd;

            _mode = mode;

            old_filename = file;

            init();
        }

        public void init()
        {
            textBox1.Text = _GetBundleDetails().Rows[0][0].ToString();
            textBox2.Text = _GetBundleDetails().Rows[0][1].ToString();
            textBox3.Text = _GetBundleDetails().Rows[0][2].ToString();
            textBox4.Text = _GetBundleDetails().Rows[0][3].ToString();
            txtCreateDate.Text = _GetBundleDetails().Rows[0][4].ToString();
            txtHandoverDate.Text = _GetBundleDetails().Rows[0][5].ToString();
        }

        public DataTable _GetBundleDetails()
        {
            DataTable dt = new DataTable();
            string sql = "select distinct establishment as Establishment, Bundle_no as 'Bundle Number',bundle_code,bundle_name as 'Bundle Name',date_format(creation_date,'%Y-%m-%d'),date_format(handover_date,'%Y-%m-%d') as 'Handover Date' from bundle_master where proj_code = '" + projKey + "' and bundle_key = '" + bundleKey + "'";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        private void populateCaseStatus()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select case_status_id, case_status from case_status_master  ";

            OdbcDataAdapter odap = new OdbcDataAdapter(sql, sqlCon);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                deTextBox1.DataSource = dt;
                deTextBox1.DisplayMember = "case_status";
                deTextBox1.ValueMember = "case_status_id";
            }
        }

        private void populateCaseNature()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select case_nature_id, case_nature from case_nature_master  ";

            OdbcDataAdapter odap = new OdbcDataAdapter(sql, sqlCon);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                deTextBox2.DataSource = dt;
                deTextBox2.DisplayMember = "case_nature";
                deTextBox2.ValueMember = "case_nature_id";
            }
        }


        private void populateCaseType()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select case_type_id, case_type_code from case_type_master  ";

            OdbcDataAdapter odap = new OdbcDataAdapter(sql, sqlCon);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                deTextBox3.DataSource = dt;
                deTextBox3.DisplayMember = "case_type_code";
                deTextBox3.ValueMember = "case_type_id";
            }
        }

        public DataTable _GetFileCaseDetailsIndividual(string proj, string bundle, string casefileno, string item )
        {
            DataTable dt = new DataTable();
            string sql = "select distinct proj_code, bundle_Key,item_no,case_file_no,case_status, case_nature, case_type, case_year from case_file_master where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' and case_file_no = '" + casefileno + "' and item_no = '"+item+"' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        public DataTable _GetFileCaseDetailsIndividual(string proj, string bundle, string fileName)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct proj_code, bundle_Key,item_no,case_file_no,case_status, case_nature, case_type, case_year from case_file_master where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' and filename = '" + fileName + "' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        private void frmNewCase_Load(object sender, EventArgs e)
        {
            if(_mode == DataLayerDefs.Mode._Add)
            {
                populateCaseStatus();
                populateCaseNature();
                populateCaseType();

                deTextBox1.Text = string.Empty;
                deTextBox2.Text = string.Empty;
                deTextBox3.Text = string.Empty;
                deTextBox4.Text = string.Empty;
                deTextBox5.Text = string.Empty;

                deTextBox1.Focus();
                deTextBox1.Select();

                deCheckBox1.Enabled = true;

            }
            if(_mode == Mode._Edit)
            {
                populateCaseStatus();
                populateCaseNature();
                populateCaseType();

                deTextBox1.Text = _GetFileCaseDetailsIndividual(projKey, bundleKey, old_filename).Rows[0][4].ToString();
                deTextBox2.Text = _GetFileCaseDetailsIndividual(projKey, bundleKey, old_filename).Rows[0][5].ToString();
                deTextBox3.Text = _GetFileCaseDetailsIndividual(projKey, bundleKey, old_filename).Rows[0][6].ToString();
                deTextBox4.Text = _GetFileCaseDetailsIndividual(projKey, bundleKey, old_filename).Rows[0][7].ToString();
                deTextBox5.Text = _GetFileCaseDetailsIndividual(projKey, bundleKey, old_filename).Rows[0][3].ToString();

                deTextBox1.Focus();
                deTextBox1.Select();

                deCheckBox1.Enabled = false;
            }
        }


        private void frmNewCase_KeyUp(object sender, KeyEventArgs e)
        {
            if(e.KeyCode == Keys.Escape)
            {
                DialogResult result = MessageBox.Show("Do you want to Exit ? ", "Record Management - Confirmation !", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if (result == DialogResult.Yes)
                {
                    this.Close();
                }
                else
                {
                    return;
                }
            }
        }

        
        private void deButtonCancel_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Do you want to Exit ? ", "Record Management - Confirmation !", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (result == DialogResult.Yes)
            {
                this.Close();
            }
            else
            {
                return;
            }
        }

        public bool validate()
        {
            bool retval = false;

            string currDate = DateTime.Now.ToString("yyyy-MM-dd");
            string curYear = DateTime.Now.ToString("yyyy");
            int curIntYear = Convert.ToInt32(curYear);

            if (deTextBox4.Text != "")
            {

                bool res = System.Text.RegularExpressions.Regex.IsMatch(deTextBox4.Text, "[^0-9]");
                if (res != true && Convert.ToInt32(deTextBox4.Text) <= curIntYear && deTextBox4.Text.Length == 4 && deTextBox4.Text.Substring(0, 1) != "0")
                {
                    retval = true;
                }
                else
                {
                    retval = false;
                    MessageBox.Show("Please input Valid Year...");
                    deTextBox4.Focus();
                    return retval;
                }
            }
            else
            {
                retval = false;
                MessageBox.Show("Please input Valid Year...");
                deTextBox4.Focus();
                return retval;
            }


            return retval;
        }
        private void deTextBox4_Leave(object sender, EventArgs e)
        {
            validate();
        }

        private bool checkFileNotExists(string proj, string bundle, string file, string status, string nature, string type,string year)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            bool retval = false;

            string sql = "select case_file_no from case_file_master where case_file_no = '"+file+"' and case_type = '"+type+"' and case_year = '"+year+ "'  ";

            OdbcDataAdapter odap = new OdbcDataAdapter(sql, sqlCon);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                DataTable dtbundle = new DataTable();
                string sqlbundle = "select proj_code,bundle_key from case_file_master where case_file_no = '" + file + "' and case_type = '" + type + "' and case_year = '" + year + "'   ";
                OdbcDataAdapter odapbundle = new OdbcDataAdapter(sqlbundle, sqlCon);
                odapbundle.Fill(dtbundle);

                DataTable dtbundlename = new DataTable();
                string sqlbundlename = "select bundle_name from bundle_master where proj_code = '" + dtbundle.Rows[0][0].ToString() + "' and bundle_key = '" + dtbundle.Rows[0][1].ToString() + "'  ";
                OdbcDataAdapter odapbundlename = new OdbcDataAdapter(sqlbundlename, sqlCon);
                odapbundlename.Fill(dtbundlename);

                MessageBox.Show(this, "Case/Files Exists in Bundle Name - " + dtbundlename.Rows[0][0].ToString(), "Case / File Addition", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                retval = false;
                deTextBox5.Focus();
                return retval;
            }
            else
            {
                retval = true;
            }

            return retval;
        }

        private bool checkFileNotExistsEdit(string proj, string bundle, string file, string status, string nature, string type, string year)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            bool retval = false;

            string sql = "select case_file_no from case_file_master where case_file_no = '" + file + "' and case_type = '" + type + "' and case_year = '" + year + "'  ";

            OdbcDataAdapter odap = new OdbcDataAdapter(sql, sqlCon);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {

                DataTable dtbundle = new DataTable();
                string sqlbundle = "select proj_code,bundle_key from case_file_master where case_file_no = '" + file + "' and case_type = '" + type + "' and case_year = '" + year + "'  ";
                OdbcDataAdapter odapbundle = new OdbcDataAdapter(sqlbundle, sqlCon);
                odapbundle.Fill(dtbundle);

                DataTable dtbundlename = new DataTable();
                string sqlbundlename = "select bundle_name from bundle_master where proj_code = '" + dtbundle.Rows[0][0].ToString() + "' and bundle_key = '" + dtbundle.Rows[0][1].ToString() + "'  ";
                OdbcDataAdapter odapbundlename = new OdbcDataAdapter(sqlbundlename, sqlCon);
                odapbundlename.Fill(dtbundlename);

                MessageBox.Show(this, "Case/Files Exists in Bundle Name - " + dtbundlename.Rows[0][0].ToString(), "Case / File Edition", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                retval = false;
                deTextBox5.Focus();
                return retval;
            }
            else
            {
                retval = true;
            }

            return retval;
        }
        private void deButtonSave_Click(object sender, EventArgs e)
        {
            OdbcTransaction sqlTrans = null;
            if (sqlCon.State == ConnectionState.Closed || sqlCon.State == ConnectionState.Broken)
            {
                sqlCon.Open();
            }
            //txn = sqlCon.BeginTransaction();
            if (_mode == Mode._Add)
            {
                DialogResult result = MessageBox.Show("Do you want to save changes ? ", "Record Management - Confirmation !", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {
                    if (deTextBox1.Text != "" && deTextBox2.Text != "" && deTextBox5.Text != "" && deTextBox3.Text != "" && deTextBox4.Text != "")
                    {
                        if (validate() == true)
                        {
                            if (checkFileNotExists(projKey, bundleKey, deTextBox5.Text, deTextBox1.Text, deTextBox2.Text, deTextBox3.Text, deTextBox4.Text) == true)
                            {

                                casefile = deTextBox5.Text;
                                caseStatus = deTextBox1.Text;
                                caseNature = deTextBox2.Text;
                                caseType = deTextBox3.Text;
                                caseYear = deTextBox4.Text;

                                filename = caseType + casefile + caseYear;

                                if(deCheckBox1.Checked == true)
                                {
                                    isWith = true;
                                }
                                else
                                {
                                    isWith = false;
                                }

                                EntryForm entryForm = new EntryForm(sqlCon, projKey, bundleKey, Mode._Add, casefile, filename,crd);
                                entryForm.ShowDialog();
                            }
                            else
                            {

                                return;
                            }
                        }
                    }
                    else
                    {
                        MessageBox.Show("You have to fill all these fields", "Record Management", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        deTextBox1.Focus();
                        deTextBox1.Select();
                        return;
                    }
                    //for (int i = 0; i < listView1.Items.Count; i++)
                    //{
                    //    int itemno = Convert.ToInt32(listView1.Items[i].SubItems[0].Text);
                    //    string case_file_no = listView1.Items[i].SubItems[1].Text;
                    //    string case_status = listView1.Items[i].SubItems[2].Text;
                    //    string case_nature = listView1.Items[i].SubItems[3].Text;
                    //    string case_type = listView1.Items[i].SubItems[4].Text;
                    //    string case_year = listView1.Items[i].SubItems[5].Text;
                    //    insertIntoCaseFileDB(itemno, case_file_no, case_status, case_nature, case_type, case_year);

                    //}
                    //// sqlTrans.Commit();

                    //MessageBox.Show(this, "Case/Files added Successfully ", "Case / File Addition", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    //this.Close();
                }
                else
                {

                    return;
                }

            }
            if(_mode == Mode._Edit)
            {
                DialogResult result = MessageBox.Show("Do you want to save changes ? ", "Record Management - Confirmation !", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {
                    if (deTextBox1.Text != "" && deTextBox2.Text != "" && deTextBox5.Text != "" && deTextBox3.Text != "" && deTextBox4.Text != "")
                    {
                        if (validate() == true)
                        {
                            if(deTextBox5.Text != Files.casefileNo)
                            {
                                if (checkFileNotExistsEdit(projKey, bundleKey, deTextBox5.Text, deTextBox1.Text, deTextBox2.Text, deTextBox3.Text, deTextBox4.Text) == true)
                                {
                                    casefile = deTextBox5.Text;
                                    caseStatus = deTextBox1.Text;
                                    caseNature = deTextBox2.Text;
                                    caseType = deTextBox3.Text;
                                    caseYear = deTextBox4.Text;


                                    filename = caseType + casefile + caseYear;

                                    bool updatecaseFile = updateCaseFileEdit();
                                    bool updateMeta = updateMetaEdit();
                                    bool updateimageMaster = updateImageEdit();
                                    bool updatetransLog = updateTransLogEdit();
                                    bool updatecusExc = updateCustExcEdit();
                                    bool updateQa = updateQaEdit();


                                    if (updatecaseFile == true && updateMeta == true && updateimageMaster== true && updatetransLog==true && updatecusExc== true && updateQa== true)
                                    {
                                        //if (txn == null || txn.Connection == null)
                                        //{
                                        //    txn = sqlCon.BeginTransaction();
                                        //}
                                        //txn.Commit();
                                        //txn = null;

                                        string pathTemp = GetPolicyPath();

                                        string pathFinal = pathTemp + "\\" + old_filename;
                                        string pathDest = pathTemp + "\\" + filename;
                                        //Directory Rename
                                        if (Directory.Exists(pathFinal))
                                        {
                                           
                                            Directory.Move(pathFinal, pathDest);
                                         
                                        }

                                        
                                        //Scan folder check 
                                        string pathScan = pathTemp + "\\" + filename + "\\Scan";
                                        //Qc folder check 
                                        string pathQc = pathTemp + "\\" + filename + "\\QC";
                                        //Deleted
                                        string pathDeleted = pathScan + "\\" + ihConstants._DELETE_FOLDER;

                                        // Files Rename scan
                                        if(Directory.Exists(pathScan))
                                        {
                                            DirectoryInfo DirInfo = new DirectoryInfo(pathScan);
                                            FileInfo[] names = DirInfo.GetFiles();
                                            foreach (FileInfo f in names)
                                            {
                                                if (f.Name.Contains(old_filename))
                                                {
                                                    string str1 = f.Name;
                                                    
                                                    string str2=f.Name.Replace(old_filename, filename);

                                                    File.Move(pathScan + "\\" + str1, pathScan + "\\" + str2);
                                                }

                                            }
                                        }

                                        //// Files Rename Qc
                                        if (Directory.Exists(pathQc))
                                        {
                                            DirectoryInfo DirInfo = new DirectoryInfo(pathQc);
                                            FileInfo[] names = DirInfo.GetFiles();
                                            foreach (FileInfo f in names)
                                            {
                                                if (f.Name.Contains(old_filename))
                                                {
                                                    string str1 = f.Name;

                                                    string str2 = f.Name.Replace(old_filename, filename);

                                                    File.Move(pathQc + "\\" + str1, pathQc + "\\" + str2);
                                                }

                                            }
                                        }

                                        //// Files Rename deleted
                                        if (Directory.Exists(pathDeleted))
                                        {
                                            DirectoryInfo DirInfo = new DirectoryInfo(pathDeleted);
                                            FileInfo[] names = DirInfo.GetFiles();
                                            foreach (FileInfo f in names)
                                            {
                                                if (f.Name.Contains(old_filename))
                                                {
                                                    string str1 = f.Name;

                                                    string str2 = f.Name.Replace(old_filename, filename);

                                                    File.Move(pathDeleted + "\\" + str1, pathDeleted + "\\" + str2);
                                                }

                                            }
                                        }

                                        MessageBox.Show(this, "Record Saved Successfully...", "Record Management", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                        
                                        this.Close();

                                    }
                                    else
                                    {

                                        MessageBox.Show(this, "Ooops!!! There is an Error - Record not Saved...", "Record Management", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                        
                                        return;
                                        
                                    }
                                }
                            }
                            else
                            {
                                casefile = deTextBox5.Text;
                                caseStatus = deTextBox1.Text;
                                caseNature = deTextBox2.Text;
                                caseType = deTextBox3.Text;
                                caseYear = deTextBox4.Text;


                                filename = caseType + casefile + caseYear;

                                bool updatecaseFile = updateCaseFileEdit();
                                bool updateMeta = updateMetaEdit();
                                bool updateimageMaster = updateImageEdit();
                                bool updatetransLog = updateTransLogEdit();
                                bool updatecusExc = updateCustExcEdit();
                                bool updateQa = updateQaEdit();


                                if (updatecaseFile == true && updateMeta == true && updateimageMaster == true && updatetransLog == true && updatecusExc == true && updateQa == true)
                                {
                                    //if (txn == null || txn.Connection == null)
                                    //{
                                    //    txn = sqlCon.BeginTransaction();
                                    //}
                                    //txn.Commit();
                                    //txn = null;

                                    string pathTemp = GetPolicyPath();

                                    string pathFinal = pathTemp + "\\" + old_filename;
                                    string pathDest = pathTemp + "\\" + filename;

                                    //Directory Rename
                                    if (Directory.Exists(pathFinal))
                                    {
                                        
                                        Directory.Move(pathFinal, pathDest);
                                       
                                    }

                                    //Scan folder check 
                                    string pathScan = pathTemp + "\\" + filename + "\\Scan";
                                    //Qc folder check 
                                    string pathQc = pathTemp + "\\" + filename + "\\QC";
                                    //Deleted
                                    string pathDeleted = pathScan + "\\" + ihConstants._DELETE_FOLDER;

                                    // Files Rename scan
                                    if (Directory.Exists(pathScan))
                                    {
                                        DirectoryInfo DirInfo = new DirectoryInfo(pathScan);
                                        FileInfo[] names = DirInfo.GetFiles();
                                        foreach (FileInfo f in names)
                                        {
                                            if (f.Name.Contains(old_filename))
                                            {
                                                string str1 = f.Name;

                                                string str2 = f.Name.Replace(old_filename, filename);

                                                File.Move(pathScan + "\\" + str1, pathScan + "\\" + str2);
                                            }

                                        }
                                    }

                                    //// Files Rename Qc
                                    if (Directory.Exists(pathQc))
                                    {
                                        DirectoryInfo DirInfo = new DirectoryInfo(pathQc);
                                        FileInfo[] names = DirInfo.GetFiles();
                                        foreach (FileInfo f in names)
                                        {
                                            if (f.Name.Contains(old_filename))
                                            {
                                                string str1 = f.Name;

                                                string str2 = f.Name.Replace(old_filename, filename);

                                                File.Move(pathQc + "\\" + str1, pathQc + "\\" + str2);
                                            }

                                        }
                                    }

                                    //// Files Rename deleted
                                    if (Directory.Exists(pathDeleted))
                                    {
                                        DirectoryInfo DirInfo = new DirectoryInfo(pathDeleted);
                                        FileInfo[] names = DirInfo.GetFiles();
                                        foreach (FileInfo f in names)
                                        {
                                            if (f.Name.Contains(old_filename))
                                            {
                                                string str1 = f.Name;

                                                string str2 = f.Name.Replace(old_filename, filename);

                                                File.Move(pathDeleted + "\\" + str1, pathDeleted + "\\" + str2);
                                            }

                                        }
                                    }

                                    MessageBox.Show(this, "Record Saved Successfully...", "Record Management", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                    
                                    this.Close();

                                }
                                else
                                {

                                    MessageBox.Show(this, "Ooops!!! There is an Error - Record not Saved...", "Record Management", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                    
                                    return;
                                   
                                }
                            }
                        }
                    }
                    else 
                    {
                        MessageBox.Show("You have to fill all these fields", "Record Management", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        deTextBox1.Focus();
                        deTextBox1.Select();
                        return;
                    }
                }
                else
                {
                    return;
                }
            }
        }
        private string GetPolicyPath()
        {
            wfeBatch wBatch = new wfeBatch(sqlCon);
            string batchPath = GetPath(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey));
            return batchPath;
        }
        public string GetPath(int prmProjKey, int prmBatchKey)
        {
            string sqlStr = null;
            DataSet projDs = new DataSet();
            string Path;

            try
            {
                sqlStr = @"select bundle_path from bundle_master where proj_code=" + prmProjKey + " and bundle_key=" + prmBatchKey;
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(projDs);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();
                
            }
            if (projDs.Tables[0].Rows.Count > 0)
            {
                Path = projDs.Tables[0].Rows[0]["bundle_path"].ToString();
            }
            else
                Path = string.Empty;

            return Path;
        }
        public bool updateCaseFileEdit()
        {
            bool ret = false;
            if (ret == false)
            {
                _UpdateCaseFileEdit(projKey, bundleKey, old_filename ,filename);

                ret = true;
            }
            return ret;
        }

        public bool _UpdateCaseFileEdit(string projKey, string bundleKey, string oldfileName ,string fileName)
        {
            string sqlStr = null;

            OdbcCommand sqlCmd = new OdbcCommand();

            bool retVal = false;
            string sql = string.Empty;
            string remarks = string.Empty;
            

            sqlStr = "UPDATE case_file_master SET case_file_no = '"+casefile+"',case_status = '"+caseStatus+"',case_nature = '"+caseNature+"',case_type = '"+caseType+"',case_year = '"+caseYear+ "',filename = '"+fileName+"',modified_by ='" + crd.created_by + "',modified_dttm = '" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "'  WHERE proj_code = '" + projKey + "' AND bundle_key = '" + bundleKey + "' and filename = '" + oldfileName + "' ";
            //sqlCmd.Connection = sqlCon;
            //sqlCmd.Transaction = txn;
            //sqlCmd.CommandText = sqlStr;
            //int j = sqlCmd.ExecuteNonQuery();
            //if (j > 0)
            //{
            //    retVal = true;
            //}
            //else
            //{
            //    retVal = false;
            //}
            System.Diagnostics.Debug.Print(sqlStr);
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            //cmd.Connection = sqlCon;
            //cmd.CommandText = sqlStr;
            if (cmd.ExecuteNonQuery() >= 0)
            {
                retVal = true;
                //txn.Commit();
            }
            //System.Diagnostics.Debug.Print(sql);
            //OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            //if (cmd.ExecuteNonQuery() > 0)
            //{
            //    retVal = true;
            //}
            //if (cmd.ExecuteNonQuery() >= 0)
            //{
            //    retVal = true;
            //}

            return retVal;
        }

        public bool updateMetaEdit()
        {
            bool ret = false;
            if (ret == false)
            {
                _UpdateMetaEdit(projKey, bundleKey, old_filename, filename);

                ret = true;
            }
            return ret;
        }
        public bool updateImageEdit()
        {
            bool ret = false;
            if (ret == false)
            {
                _UpdateImageEdit(projKey, bundleKey, old_filename, filename);

                ret = true;
            }
            return ret;
        }
        public bool updateTransLogEdit()
        {
            bool ret = false;
            if (ret == false)
            {
                _UpdateTransLogEdit(projKey, bundleKey, old_filename, filename);

                ret = true;
            }
            return ret;
        }
        public bool updateQaEdit()
        {
            bool ret = false;
            if (ret == false)
            {
                _UpdateQaEdit(projKey, bundleKey, old_filename, filename);

                ret = true;
            }
            return ret;
        }
        public bool updateCustExcEdit()
        {
            bool ret = false;
            if (ret == false)
            {
                _UpdateCustExcEdit(projKey, bundleKey, old_filename, filename);

                ret = true;
            }
            return ret;
        }
        
        public bool _UpdateTransLogEdit(string projKey, string bundleKey, string oldFileName, string fileName)
        {
            string sqlStr = null;

            OdbcCommand sqlCmd = new OdbcCommand();

            bool retVal = false;
            string sql = string.Empty;
            string remarks = string.Empty;


            sqlStr = "UPDATE transaction_log SET policy_number= '" + fileName + "' WHERE proj_key = '" + projKey + "' AND batch_key = '" + bundleKey + "' and policy_number = '" + oldFileName + "' ";

            System.Diagnostics.Debug.Print(sqlStr);
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            //cmd.Connection = sqlCon;
            //cmd.CommandText = sqlStr;
            if (cmd.ExecuteNonQuery() >= 0)
            {
                retVal = true;
                //txn.Commit();
            }

            return retVal;
        }
        public bool _UpdateCustExcEdit(string projKey, string bundleKey, string oldFileName, string fileName)
        {
            string sqlStr = null;

            OdbcCommand sqlCmd = new OdbcCommand();

            bool retVal = false;
            string sql = string.Empty;
            string remarks = string.Empty;


            sqlStr = "UPDATE custom_exception SET policy_number= '" + fileName + "',modified_by ='" + crd.created_by + "',modified_dttm = '" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "' WHERE proj_key = '" + projKey + "' AND batch_key = '" + bundleKey + "' and policy_number = '" + oldFileName + "' ";

            System.Diagnostics.Debug.Print(sqlStr);
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            //cmd.Connection = sqlCon;
            //cmd.CommandText = sqlStr;
            if (cmd.ExecuteNonQuery() >= 0)
            {
                retVal = true;
                //txn.Commit();
            }

            return retVal;
        }
        public bool _UpdateQaEdit(string projKey, string bundleKey, string oldFileName, string fileName)
        {
            string sqlStr = null;

            OdbcCommand sqlCmd = new OdbcCommand();

            bool retVal = false;
            string sql = string.Empty;
            string remarks = string.Empty;


            sqlStr = "UPDATE lic_qa_log SET policy_number= '" + fileName + "',modified_by ='" + crd.created_by + "',modified_dttm = '" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "' WHERE proj_key = '" + projKey + "' AND batch_key = '" + bundleKey + "' and policy_number = '" + oldFileName + "' ";

            System.Diagnostics.Debug.Print(sqlStr);
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            //cmd.Connection = sqlCon;
            //cmd.CommandText = sqlStr;
            if (cmd.ExecuteNonQuery() >= 0)
            {
                retVal = true;
                //txn.Commit();
            }

            return retVal;
        }
        public bool _UpdateMetaEdit(string projKey, string bundleKey,string oldFileName,string fileName)
        {
            string sqlStr = null;

            OdbcCommand sqlCmd = new OdbcCommand();

            bool retVal = false;
            string sql = string.Empty;
            string remarks = string.Empty;


            sqlStr = "UPDATE metadata_entry SET case_file_no = '" + casefile + "',case_status = '" + caseStatus + "',case_nature = '" + caseNature + "',case_type = '" + caseType + "',case_year = '" + caseYear + "',filename= '"+fileName+"',modified_by ='" + crd.created_by + "',modified_dttm = '" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "'  WHERE proj_code = '" + projKey + "' AND bundle_key = '" + bundleKey + "' and filename = '" + oldFileName + "' ";
            
            System.Diagnostics.Debug.Print(sqlStr);
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            //cmd.Connection = sqlCon;
            //cmd.CommandText = sqlStr;
            if (cmd.ExecuteNonQuery() >= 0)
            {
                retVal = true;
                //txn.Commit();
            }
            
            return retVal;
        }
        public bool _UpdateImageEdit(string projKey, string bundleKey, string oldFileName, string fileName)
        {
            string sqlStr = null;

            OdbcCommand sqlCmd = new OdbcCommand();

            bool retVal = false;
            string sql = string.Empty;
            string remarks = string.Empty;


            sqlStr = "UPDATE image_master SET policy_number= '" + fileName + "',page_index_name = REPLACE(page_index_name,'"+oldFileName+"','"+fileName+ "'),page_name = REPLACE(page_name,'" + oldFileName + "','" + fileName + "'),modified_by ='" + crd.created_by + "',modified_dttm = '" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "'  WHERE proj_key = '" + projKey + "' AND batch_key = '" + bundleKey + "' and policy_number = '" + oldFileName + "' ";
          
            System.Diagnostics.Debug.Print(sqlStr);
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            //cmd.Connection = sqlCon;
            //cmd.CommandText = sqlStr;
            if (cmd.ExecuteNonQuery() >= 0)
            {
                retVal = true;
                //txn.Commit();
            }
            
            return retVal;
        }
        private void deTextBox5_Leave(object sender, EventArgs e)
        {
            if(_mode == Mode._Add)
            {
                checkFileNotExists(projKey, bundleKey, deTextBox5.Text,deTextBox1.Text,deTextBox2.Text,deTextBox3.Text,deTextBox4.Text);
            }
            if(_mode == Mode._Edit)
            {
                if(deTextBox5.Text != Files.casefileNo)
                {
                    checkFileNotExistsEdit(projKey, bundleKey, deTextBox5.Text, deTextBox1.Text, deTextBox2.Text, deTextBox3.Text, deTextBox4.Text);
                }
            }
        }
    }
}
