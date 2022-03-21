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

namespace ImageHeaven
{
    public partial class frmBatch : Form
    {
        protected int mode;
        MemoryStream stateLog;
        private udtBatch objBatch;
        private OdbcDataAdapter sqlAdap = null;
        private DataSet dsPath = null;
        private wfeProject objProj = null;
        private INIReader rd = null;
        private KeyValueStruct udtKeyValue;
        public string err = null;
        private int projCode;
        wfeBatch crtBatch = null;
        OdbcConnection sqlCon = null;
        byte[] tmpWrite;
        public static NovaNet.Utils.exLog.Logger exMailLog = new NovaNet.Utils.exLog.emailLogger("./errLog.log", NovaNet.Utils.exLog.LogLevel.Dev, Constants._MAIL_TO, Constants._MAIL_FROM, Constants._SMTP);
        public static NovaNet.Utils.exLog.Logger exTxtLog = new NovaNet.Utils.exLog.txtLogger("./errLog.log", NovaNet.Utils.exLog.LogLevel.Dev);

        string name = frmMain.name;

        DataLayerDefs.Mode _mode = DataLayerDefs.Mode._Edit;

        public string currentDate;
        public string handoverDate;

        string old_path;
        public frmBatch()
        {
            InitializeComponent();
        }

        public frmBatch(wItem prmCmd, OdbcConnection prmCon, DataLayerDefs.Mode mode)
		{
			//
			// The InitializeComponent() call is required for Windows Forms designer support.
			//
			InitializeComponent();
            //this.Icon = 
            exMailLog.SetNextLogger(exTxtLog);
            _mode = mode;
			crtBatch = (wfeBatch) prmCmd;
            sqlCon = prmCon;
			if (crtBatch.GetMode()==Constants._ADDING)
                this.Text = "B'Zer - Calcutta High Court (Add Bundle)";
			else
                this.Text = "B'Zer - Calcutta High Court (Edit Bundle)";
			//
			// TODO: Add constructor code after the InitializeComponent() call.
			//
		}


        

        private void frmBatch_Load(object sender, EventArgs e)
        {
            if (_mode == DataLayerDefs.Mode._Add)
            {
                groupBox3.Enabled = false;
                populateProject();
                button2.Enabled = false;

                currentDate = DateTime.Now.ToString("yyyy-MM-dd");
                handoverDate = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
            }
            if(_mode == DataLayerDefs.Mode._Edit)
            {
                this.Text = "B'Zer - Calcutta High Court (Edit Bundle)";
                groupBox3.Enabled = true;
                populateProject();

                populateEstablishment();

                cmbProject.Text = getProjectName(frmEntrySummary.projKey).Rows[0][0].ToString();
                groupBox2.Enabled = false;

                textBox1.Text = getBundleDetails(frmEntrySummary.projKey, frmEntrySummary.bundleKey).Rows[0][2].ToString();
                textBox2.Text = getBundleDetails(frmEntrySummary.projKey, frmEntrySummary.bundleKey).Rows[0][3].ToString();
                //txtCreateDate.Text = getBundleDetails(frmEntrySummary.projKey, frmEntrySummary.bundleKey).Rows[0][4].ToString();
                //dateTimePicker1.Text = getBundleDetails(frmEntrySummary.projKey, frmEntrySummary.bundleKey).Rows[0][5].ToString();

                textBox3.Text = getBundleDetails(frmEntrySummary.projKey, frmEntrySummary.bundleKey).Rows[0][0].ToString();
                textBox4.Text = getBundleDetails(frmEntrySummary.projKey, frmEntrySummary.bundleKey).Rows[0][1].ToString();

                currentDate = getBundleDetails(frmEntrySummary.projKey, frmEntrySummary.bundleKey).Rows[0][4].ToString();
                handoverDate = getBundleDetails(frmEntrySummary.projKey, frmEntrySummary.bundleKey).Rows[0][5].ToString();

                old_path = getBundleDetails(frmEntrySummary.projKey, frmEntrySummary.bundleKey).Rows[0][6].ToString();

                txtCreateDate.Text = currentDate;
                txtHandoverDate.Text = handoverDate;
                dateTimePicker1.Text = handoverDate;
                dateTimePicker1.Format = DateTimePickerFormat.Custom;
                dateTimePicker1.CustomFormat = "yyyy-MM-dd";
                dateTimePicker1.Value = Convert.ToDateTime(handoverDate.ToString());
                dateTimePicker1.Enabled = true;

                textBox2.Focus();
                textBox2.Select();

                deButton1.Enabled = true;
                button2.Enabled = false;
            }
        }

        private void populateProject()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select proj_key, proj_code from project_master ";
            
            OdbcDataAdapter odap = new OdbcDataAdapter(sql, sqlCon);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                cmbProject.DataSource = dt;
                cmbProject.DisplayMember = "proj_code";
                cmbProject.ValueMember = "proj_key";
            }
            else
            {
                MessageBox.Show("Add one project first...");
            }

        }

        public DataTable getProjectName(string pcode)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct proj_key,proj_code from project_master where proj_key = '"+pcode+"' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        public DataTable getBundleDetails(string pcode, string bcode)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct bundle_code,bundle_name,establishment,bundle_no,date_format(creation_date,'%Y-%m-%d'),date_format(handover_date,'%Y-%m-%d'),bundle_path from bundle_master where proj_code = '" + pcode + "' and bundle_key = '"+bcode+"' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        private void populateEstablishment()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select establishment_no, establishment_name from establishment_master ";

            OdbcDataAdapter odap = new OdbcDataAdapter(sql, sqlCon);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                textBox1.DataSource = dt;
                textBox1.DisplayMember = "establishment_name";
                textBox1.ValueMember = "establishment_no";
            }
            else
            {
                textBox1.Text = string.Empty;
            }
            
        }

        private void ClearAllField()
        {
            textBox1.Text = string.Empty;
            textBox2.Text = string.Empty;
            txtCreateDate.Text = string.Empty;
            txtHandoverDate.Text = string.Empty;
            dateTimePicker1.Format = DateTimePickerFormat.Custom;
            dateTimePicker1.CustomFormat = " ";
            //dateTimePicker1.Value = Convert.ToDateTime("");
            textBox3.Text = string.Empty;
            textBox4.Text = string.Empty;
            button2.Enabled = false;
            cmbProject.Focus();
        }

        private void cmbProject_Leave_1(object sender, EventArgs e)
        {
            
            if (cmbProject.Text == "" || cmbProject.Text == null)
            {
                MessageBox.Show("Please select a project name");
                cmbProject.Focus();
                cmbProject.Select();
            }
            else
            {
                populateEstablishment();

                groupBox3.Enabled = true;

                textBox1.Focus();
                textBox1.Select();

                txtCreateDate.Text = currentDate;
                txtHandoverDate.Text = handoverDate;
                dateTimePicker1.Text = handoverDate;
                dateTimePicker1.Format = DateTimePickerFormat.Custom;
                dateTimePicker1.CustomFormat = "yyyy-MM-dd";
                dateTimePicker1.Value = Convert.ToDateTime(handoverDate.ToString());
            }
        }

        private void cmbProject_MouseLeave(object sender, EventArgs e)
        {
            
            if (cmbProject.Text == "" || cmbProject.Text == null)
            {
                MessageBox.Show("Please select a project name");
                cmbProject.Focus();
                cmbProject.Select();
            }
            else
            {
                populateEstablishment();

                groupBox3.Enabled = true;

                textBox1.Focus();
                textBox1.Select();

                txtCreateDate.Text = currentDate;
                txtHandoverDate.Text = handoverDate;
                dateTimePicker1.Text = handoverDate;
                dateTimePicker1.Format = DateTimePickerFormat.Custom;
                dateTimePicker1.CustomFormat = "yyyy-MM-dd";
                dateTimePicker1.Value = Convert.ToDateTime(handoverDate.ToString());
            }
        }

        private void deButton1_Click(object sender, EventArgs e)
        {
            if(_mode == DataLayerDefs.Mode._Add)
            {
                DateTime temp;
                string isDate = dateTimePicker1.Text;
                string currDate = DateTime.Now.ToString("yyyy-MM-dd");
                if (DateTime.TryParse(isDate, out temp))
                {
                    //validateBol = true;
                    if (textBox1.Text == "" || textBox1.Text == null)
                    {
                        MessageBox.Show("You cannot leave Bundle Number field blank....", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        textBox1.Focus();
                        textBox1.Select();
                        return;
                    }
                    if (textBox2.Text == "" || textBox2.Text == null)
                    {
                        MessageBox.Show("You cannot left Bundle Number field blank....", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        textBox2.Focus();
                        textBox2.Select();
                        return;
                    }
                    if ((textBox1.Text != "" || textBox1.Text != null) && (textBox2.Text != "" || textBox2.Text != null))
                    {

                        string bundleCount = "HN" + getBundleCount().PadLeft(6, '0');



                        string bundleCode = bundleCount + "_" + textBox2.Text.ToUpper();

                        textBox3.Text = bundleCode;
                        textBox4.Text = bundleCode;

                        button2.Enabled = true;


                    }
                }
                else
                {
                    //retval = false;
                    MessageBox.Show("Please select a valid Handover Date", "", MessageBoxButtons.OK, MessageBoxIcon.Error);

                    dateTimePicker1.Select();
                    //validateBol = false;

                }
            }
            if(_mode == DataLayerDefs.Mode._Edit)
            {
                DateTime temp;
                string isDate = dateTimePicker1.Text;
                string currDate = DateTime.Now.ToString("yyyy-MM-dd");
                if (DateTime.TryParse(isDate, out temp) && (DateTime.Parse(isDate) > DateTime.Parse(currDate) || DateTime.Parse(isDate) <= DateTime.Parse(currDate)) && DateTime.Parse(isDate) > DateTime.Parse(currentDate))
                {
                    //validateBol = true;
                    if (textBox1.Text == "" || textBox1.Text == null)
                    {
                        MessageBox.Show("You cannot leave Bundle Number field blank....", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        textBox1.Focus();
                        textBox1.Select();
                        return;
                    }
                    if (textBox2.Text == "" || textBox2.Text == null)
                    {
                        MessageBox.Show("You cannot left Bundle Number field blank....", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        textBox2.Focus();
                        textBox2.Select();
                        return;
                    }
                    if ((textBox1.Text != "" || textBox1.Text != null) && (textBox2.Text != "" || textBox2.Text != null))
                    {

                        string bundleCount = getBundleDetails(frmEntrySummary.projKey, frmEntrySummary.bundleKey).Rows[0][0].ToString();



                        string bundleCode = bundleCount.Substring(0,8) + "_" + textBox2.Text.ToUpper();

                        textBox3.Text = bundleCode;
                        textBox4.Text = bundleCode;

                        button2.Enabled = true;


                    }
                }
                else
                {
                    //retval = false;
                    MessageBox.Show("Please select a valid Handover Date", "", MessageBoxButtons.OK, MessageBoxIcon.Error);

                    dateTimePicker1.Select();
                    //validateBol = false;

                }
            }
            
        }

        private string getBundleCount()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select Count(*) from bundle_master";

            OdbcDataAdapter odap = new OdbcDataAdapter(sql, sqlCon);
            odap.Fill(dt);

            int count = Convert.ToInt32(dt.Rows[0][0].ToString());

            string getCount = Convert.ToString(count + 1);

            return getCount;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed || sqlCon.State == ConnectionState.Broken)
            {
                sqlCon.Open();
            }
            this.Close();
        }
        public bool KeyCheck(string prmValue)
        {
            string sqlStr = null;
            OdbcCommand cmd = null;
            bool existsBol = true;

            sqlStr = "select bundle_code from bundle_master where bundle_code='" + prmValue.ToUpper() + "'";
            cmd = new OdbcCommand(sqlStr, sqlCon);
            existsBol = cmd.ExecuteReader().HasRows;

            return existsBol;
        }
        private bool Validate(udtBatch cmd)
        {
            bool validateBol = true;
            //errList = new Hashtable();
            if (cmd.batch_code == string.Empty || KeyCheck(cmd.batch_code) == true)
            {
                validateBol = false;
                //errList.Add("Code", Constants.NOT_VALID);
            }

            if (cmd.batch_name == string.Empty)
            {
                validateBol = false;
                //errList.Add("Name", Constants.NOT_VALID);
            }

            if (cmd.Created_By == string.Empty && mode == Constants._ADDING)
            {
                validateBol = false;
                //errList.Add("Created_By", Constants.NOT_VALID);
            }

            if (cmd.Created_DTTM == string.Empty && mode == Constants._ADDING)
            {
                validateBol = false;
               // errList.Add("Created_DTTM", Constants.NOT_VALID);
            }

            ///Required at the time of editing
            if (cmd.Modified_By == string.Empty && mode == Constants._EDITING)
            {
                validateBol = false;
                //errList.Add("Modified_By", Constants.NOT_VALID);
            }

            if (cmd.Modified_DTTM == string.Empty && mode == Constants._EDITING)
            {
                validateBol = false;
                //errList.Add("Modified_DTTM", Constants.NOT_VALID);
            }

            if(_mode == DataLayerDefs.Mode._Add)
            {
                DateTime temp;
                string isDate = dateTimePicker1.Text;
                string currDate = DateTime.Now.ToString("yyyy-MM-dd");
                if (DateTime.TryParse(isDate, out temp))
                {
                    validateBol = true;
                }
                else
                {
                    //retval = false;
                    MessageBox.Show("Please select a valid Handover Date", "", MessageBoxButtons.OK, MessageBoxIcon.Error);

                    dateTimePicker1.Select();
                    validateBol = false;

                }
            }
            if(_mode == DataLayerDefs.Mode._Edit)
            {
                DateTime temp;
                string isDate = dateTimePicker1.Text;
                string currDate = DateTime.Now.ToString("yyyy-MM-dd");
                if (DateTime.TryParse(isDate, out temp))
                {
                    validateBol = true;
                }
                else
                {
                    //retval = false;
                    MessageBox.Show("Please select a valid Handover Date", "", MessageBoxButtons.OK, MessageBoxIcon.Error);

                    dateTimePicker1.Select();
                    validateBol = false;

                }
            }
            

            return validateBol;
        }

        public bool Commit_Bundle_Edit(string establishment, string bundle_no, string createDt, string handoverDt)
        {
            string sqlStr = null;
            OdbcTransaction sqlTrans = null;
            bool commitBol = true;
            OdbcCommand sqlCmd = new OdbcCommand();
            string scanbatchPath = null;

            //errList = new Hashtable();
            objProj = new wfeProject(sqlCon);

            dsPath = objProj.GetPath(objBatch.proj_code);

            if (dsPath.Tables[0].Rows.Count > 0)
            {
                scanbatchPath = dsPath.Tables[0].Rows[0]["project_Path"] + "\\" + objBatch.batch_code;
            }

            sqlStr = @"update bundle_master set bundle_code = '" + objBatch.batch_code.ToUpper() + "', bundle_name = '" + objBatch.batch_name + "',establishment='" + establishment + "',bundle_no='"+bundle_no+ "',creation_date='"+ createDt + "',handover_date='" + handoverDt + "',bundle_path='"+ scanbatchPath.Replace("\\", "\\\\") + "',modified_by = '" + objBatch.Created_By + "',modified_dttm = '" + objBatch.Created_DTTM + "' where proj_code = '"+frmEntrySummary.projKey+"' and bundle_key = '"+frmEntrySummary.bundleKey+"'";

            //sqlStr = @"insert into bundle_master(proj_code,bundle_code,bundle_name,created_by" +
            //    ",Created_DTTM,establishment,bundle_no,creation_date,handover_date,bundle_path) values(" +
            //    objBatch.proj_code + ",'" + objBatch.batch_code.ToUpper() + "','" + objBatch.batch_name + "'," +
            //    "'" + objBatch.Created_By + "','" + objBatch.Created_DTTM + "','" + establishment + "','" + bundle_no + "','" + createDt + "','" + handoverDt + "','" +
            //    scanbatchPath.Replace("\\", "\\\\") + "')";
            try
            {
                if (KeyCheck(objBatch.batch_code) == false)
                {
                    sqlTrans = sqlCon.BeginTransaction();
                    sqlCmd.Connection = sqlCon;
                    sqlCmd.Transaction = sqlTrans;
                    sqlCmd.CommandText = sqlStr;
                    sqlCmd.ExecuteNonQuery();

                    if (mode == Constants._ADDING)
                    {
                        //string old_path = getBundleDetails(frmEntrySummary.projKey, frmEntrySummary.bundleKey).Rows[0][6].ToString();

                        //if(Directory.Exists(old_path) == true)
                        //{
                            //Directory.Delete(old_path,true);
                            
                            if (FileorFolder.RenameFolder(old_path, scanbatchPath) == true)
                            {
                                commitBol = true;
                                sqlTrans.Commit();
                            }
                            else
                            {
                                commitBol = false;
                                sqlTrans.Rollback();
                                rd = new INIReader(Constants.EXCEPTION_INI_FILE_PATH);
                                udtKeyValue.Key = Constants.BATCH_FOLDER_CREATE_ERROR.ToString();
                                udtKeyValue.Section = Constants.BATCH_EXCEPTION_SECTION;
                                string ErrMsg = rd.Read(udtKeyValue);
                                throw new CreateFolderException(ErrMsg);
                            }
                        //}
                        //else
                        //{
                        //    commitBol = false;
                        //    sqlTrans.Rollback();
                        //    rd = new INIReader(Constants.EXCEPTION_INI_FILE_PATH);
                        //    udtKeyValue.Key = Constants.BATCH_FOLDER_CREATE_ERROR.ToString();
                        //    udtKeyValue.Section = Constants.BATCH_EXCEPTION_SECTION;
                        //    string ErrMsg = rd.Read(udtKeyValue);
                        //    throw new CreateFolderException(ErrMsg);
                        //}
                    }
                    else
                    {
                        commitBol = true;
                        sqlTrans.Commit();
                    }
                }
                else
                    commitBol = false;
            }
            catch (Exception ex)
            {
                //errList.Add(Constants.DBERRORTYPE, ex.Message);
                commitBol = false;
                sqlTrans.Rollback();
                sqlCmd.Dispose();
                stateLog = new MemoryStream();
                tmpWrite = new System.Text.ASCIIEncoding().GetBytes(sqlStr + "\n");
                stateLog.Write(tmpWrite, 0, tmpWrite.Length);
                exMailLog.Log(ex);
            }
            return commitBol;
        }

        public bool Commit_Bundle(string establishment, string bundle_no, string createDt, string handoverDt)
        {
            string sqlStr = null;
            OdbcTransaction sqlTrans = null;
            bool commitBol = true;
            OdbcCommand sqlCmd = new OdbcCommand();
            string scanbatchPath = null;

            //errList = new Hashtable();
            objProj = new wfeProject(sqlCon);

            dsPath = objProj.GetPath(objBatch.proj_code);

            if (dsPath.Tables[0].Rows.Count > 0)
            {
                scanbatchPath = dsPath.Tables[0].Rows[0]["project_Path"] + "\\" + objBatch.batch_code;
            }

            sqlStr = @"insert into bundle_master(proj_code,bundle_code,bundle_name,created_by" +
                ",Created_DTTM,establishment,bundle_no,creation_date,handover_date,bundle_path) values(" +
                objBatch.proj_code + ",'" + objBatch.batch_code.ToUpper() + "','" + objBatch.batch_name + "'," +
                "'" + objBatch.Created_By + "','" + objBatch.Created_DTTM + "','" + establishment + "','" + bundle_no + "','" + createDt + "','" + handoverDt + "','" +
                scanbatchPath.Replace("\\", "\\\\") + "')";
            try
            {
                if (KeyCheck(objBatch.batch_code) == false)
                {
                    sqlTrans = sqlCon.BeginTransaction();
                    sqlCmd.Connection = sqlCon;
                    sqlCmd.Transaction = sqlTrans;
                    sqlCmd.CommandText = sqlStr;
                    sqlCmd.ExecuteNonQuery();

                    if (mode == Constants._ADDING)
                    {
                        if (FileorFolder.CreateFolder(scanbatchPath) == true)
                        {
                            commitBol = true;
                            sqlTrans.Commit();
                        }
                        else
                        {
                            commitBol = false;
                            sqlTrans.Rollback();
                            rd = new INIReader(Constants.EXCEPTION_INI_FILE_PATH);
                            udtKeyValue.Key = Constants.BATCH_FOLDER_CREATE_ERROR.ToString();
                            udtKeyValue.Section = Constants.BATCH_EXCEPTION_SECTION;
                            string ErrMsg = rd.Read(udtKeyValue);
                            throw new CreateFolderException(ErrMsg);
                        }
                    }
                    else
                    {
                        commitBol = true;
                        sqlTrans.Commit();
                    }
                }
                else
                    commitBol = false;
            }
            catch (Exception ex)
            {
                //errList.Add(Constants.DBERRORTYPE, ex.Message);
                commitBol = false;
                sqlTrans.Rollback();
                sqlCmd.Dispose();
                stateLog = new MemoryStream();
                tmpWrite = new System.Text.ASCIIEncoding().GetBytes(sqlStr + "\n");
                stateLog.Write(tmpWrite, 0, tmpWrite.Length);
                exMailLog.Log(ex);
            }
            return commitBol;
        }

        public bool _bundleCodeExists(string bundlecode)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            bool retval = false;

            string sql = "select bundle_code from bundle_master where  bundle_code = '" + bundlecode + "' ";

            OdbcDataAdapter odap = new OdbcDataAdapter(sql, sqlCon);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                MessageBox.Show(this, "This Bundle Already Exists ", "Bundle Add", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                retval = false;
                textBox2.Focus();
                return retval;
            }
            else
            {
                retval = true;
            }

            return retval;
        }
        public bool _bundleExists(string bundleno)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            bool retval = false;

            string sql = "select bundle_no from bundle_master where  bundle_no = '" + bundleno + "' ";

            OdbcDataAdapter odap = new OdbcDataAdapter(sql, sqlCon);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                MessageBox.Show(this, "This Bundle Already Exists ", "Bundle Add", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                retval = false;
                textBox2.Focus();
                return retval;
            }
            else
            {
                retval = true;
            }

            return retval;
        }
        public bool _bundleExistsEdit(string bundleno)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            bool retval = false;

            string sql = "select bundle_no from bundle_master where  bundle_no = '" + bundleno + "' ";

            OdbcDataAdapter odap = new OdbcDataAdapter(sql, sqlCon);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                MessageBox.Show(this, "This Bundle Already Exists ", "Bundle Edit", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                retval = false;
                textBox2.Focus();
                return retval;
            }
            else
            {
                retval = true;
            }

            return retval;
        }
        public bool TransferValuesBundle(udtCmd cmd, string est, string bundle, string creatdate, string handdate)
        {

            objBatch = (udtBatch)(cmd);
            if (KeyCheck(objBatch.batch_code) == false)
            {
                if (Validate(objBatch) == true)
                {
                    
                    if (Commit_Bundle(est, bundle, creatdate, handdate) == true)
                    {
                        return true;
                    }
                    else
                    {
                        rd = new INIReader(Constants.EXCEPTION_INI_FILE_PATH);
                        udtKeyValue.Key = Constants.SAVE_ERROR.ToString();
                        udtKeyValue.Section = Constants.COMMON_EXCEPTION_SECTION;
                        string ErrMsg = rd.Read(udtKeyValue);
                        throw new DbCommitException(ErrMsg);
                    }
                }
                else
                {
                    //throw new ValidationException(Constants.ValidationException) ;
                    return false;
                }
            }
            else
            {
                rd = new INIReader(Constants.EXCEPTION_INI_FILE_PATH);
                udtKeyValue.Key = Constants.DUPLICATE_KEY_CHECK.ToString();
                udtKeyValue.Section = Constants.COMMON_EXCEPTION_SECTION;
                string ErrMsg = rd.Read(udtKeyValue);
                throw new KeyCheckException(ErrMsg);
            }
        }

        public bool TransferValuesBundleEdit(udtCmd cmd, string est, string bundle, string creatdate, string handdate)
        {

            objBatch = (udtBatch)(cmd);
            if (KeyCheck(objBatch.batch_code) == false)
            {
                if (Validate(objBatch) == true)
                {

                    if (Commit_Bundle_Edit(est, bundle, creatdate, handdate) == true)
                    {
                        return true;
                    }
                    else
                    {
                        rd = new INIReader(Constants.EXCEPTION_INI_FILE_PATH);
                        udtKeyValue.Key = Constants.SAVE_ERROR.ToString();
                        udtKeyValue.Section = Constants.COMMON_EXCEPTION_SECTION;
                        string ErrMsg = rd.Read(udtKeyValue);
                        throw new DbCommitException(ErrMsg);
                    }
                }
                else
                {
                    //throw new ValidationException(Constants.ValidationException) ;
                    return false;
                }
            }
            else
            {
                rd = new INIReader(Constants.EXCEPTION_INI_FILE_PATH);
                udtKeyValue.Key = Constants.DUPLICATE_KEY_CHECK.ToString();
                udtKeyValue.Section = Constants.COMMON_EXCEPTION_SECTION;
                string ErrMsg = rd.Read(udtKeyValue);
                throw new KeyCheckException(ErrMsg);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed || sqlCon.State == ConnectionState.Broken)
            {
                sqlCon.Open();
            }
            if(_mode == DataLayerDefs.Mode._Add)
            {
                if (textBox3.Text == null || textBox3.Text == "")
                {
                    MessageBox.Show("Please generate a Bundle Code...");
                    textBox1.Focus();
                    textBox1.Select();
                }
                else
                {
                    int len = textBox3.Text.Length;
                    int startInd = textBox3.Text.IndexOf('_') + 1;
                    int length = len - startInd;
                    string bundleNo = textBox3.Text.Substring(startInd, length);

                    if (bundleNo == textBox2.Text)
                    {

                        NovaNet.Utils.dbCon dbcon = new NovaNet.Utils.dbCon();
                        udtBatch objBatch = new udtBatch();
                        try
                        {
                            statusStrip1.Items.Clear();
                            crtBatch = new wfeBatch(sqlCon);

                            objBatch.proj_code = Convert.ToInt32(cmbProject.SelectedValue);
                            objBatch.batch_code = textBox3.Text;
                            objBatch.batch_name = textBox4.Text;
                            objBatch.Created_By = name;
                            objBatch.Created_DTTM = dbcon.GetCurrenctDTTM(1, sqlCon);

                            if (TransferValuesBundle(objBatch, textBox1.Text, textBox2.Text, txtCreateDate.Text, dateTimePicker1.Text) == true)
                            {
                                MessageBox.Show("Bundle SucessFully Created");
                                statusStrip1.Items.Add("Status: Data SucessFully Saved");
                                statusStrip1.ForeColor = System.Drawing.Color.Black;
                                ClearAllField();

                            }
                            else
                            {
                                MessageBox.Show(this, "Data Cannot be Saved", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                statusStrip1.Items.Add("Status: Data Cannot be Saved");
                                statusStrip1.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                        catch (KeyCheckException ex)
                        {
                            MessageBox.Show(ex.Message, "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            stateLog = new MemoryStream();
                            tmpWrite = new System.Text.ASCIIEncoding().GetBytes("Batch Key-" + objBatch.batch_key + "\n" + "project Key-" + objBatch.proj_code + "\n");
                            stateLog.Write(tmpWrite, 0, tmpWrite.Length);
                            //exMailLog.Log(ex, this);
                        }
                        catch (DbCommitException dbex)
                        {
                            MessageBox.Show(dbex.Message, "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            stateLog = new MemoryStream();
                            tmpWrite = new System.Text.ASCIIEncoding().GetBytes("Error while Commit" + "Batch Key-" + objBatch.batch_key + "\n" + "project Key-" + objBatch.proj_code + "\n");
                            stateLog.Write(tmpWrite, 0, tmpWrite.Length);
                            // exMailLog.Log(dbex, this);
                        }
                        catch (CreateFolderException folex)
                        {
                            MessageBox.Show(folex.Message, "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            stateLog = new MemoryStream();
                            tmpWrite = new System.Text.ASCIIEncoding().GetBytes("Error while Create Folder" + "Batch Key-" + objBatch.batch_key + "\n" + "project Key-" + objBatch.proj_code + "\n");
                            stateLog.Write(tmpWrite, 0, tmpWrite.Length);
                            // exMailLog.Log(folex, this);
                        }
                        catch (DBConnectionException conex)
                        {
                            MessageBox.Show(conex.Message, "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            stateLog = new MemoryStream();
                            tmpWrite = new System.Text.ASCIIEncoding().GetBytes("Error while Connection error" + "Batch Key-" + objBatch.batch_key + "\n" + "project Key-" + objBatch.proj_code + "\n");
                            stateLog.Write(tmpWrite, 0, tmpWrite.Length);
                            //exMailLog.Log(conex, this);
                        }
                        catch (INIFileException iniex)
                        {
                            MessageBox.Show(iniex.Message, "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            stateLog = new MemoryStream();
                            tmpWrite = new System.Text.ASCIIEncoding().GetBytes("Error while INI read error" + "Batch Key-" + objBatch.batch_key + "\n" + "project Key-" + objBatch.proj_code + "\n");
                            stateLog.Write(tmpWrite, 0, tmpWrite.Length);
                            //exMailLog.Log(iniex, this);
                        }

                    }
                    else
                    {
                        MessageBox.Show("Bundle Number Mismatch", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        textBox2.Focus();
                        textBox2.Select();
                        return;
                    }


                }
            }
            if(_mode == DataLayerDefs.Mode._Edit)
            {
                if (textBox3.Text == null || textBox3.Text == "")
                {
                    MessageBox.Show("Please generate a Bundle Code...");
                    textBox1.Focus();
                    textBox1.Select();
                }
                else
                {
                    int len = textBox3.Text.Length;
                    int startInd = textBox3.Text.IndexOf('_') + 1;
                    int length = len - startInd;
                    string bundleNo = textBox3.Text.Substring(startInd, length);

                    if (bundleNo == textBox2.Text)
                    {
                        if(_bundleCodeExists(textBox3.Text) == true)
                        {
                            NovaNet.Utils.dbCon dbcon = new NovaNet.Utils.dbCon();
                            udtBatch objBatch = new udtBatch();
                            try
                            {
                                statusStrip1.Items.Clear();
                                crtBatch = new wfeBatch(sqlCon);

                                objBatch.proj_code = Convert.ToInt32(cmbProject.SelectedValue);
                                objBatch.batch_code = textBox3.Text;
                                objBatch.batch_name = textBox4.Text;
                                objBatch.Created_By = name;
                                objBatch.Created_DTTM = dbcon.GetCurrenctDTTM(1, sqlCon);

                                if (TransferValuesBundleEdit(objBatch, textBox1.Text, textBox2.Text, txtCreateDate.Text, dateTimePicker1.Text) == true)
                                {
                                    statusStrip1.Items.Add("Status: Data SucessFully Saved");
                                    statusStrip1.ForeColor = System.Drawing.Color.Black;
                                    ClearAllField();


                                    MessageBox.Show(this, "Bundle Updated Successfully", "Bundle Updation", MessageBoxButtons.OK, MessageBoxIcon.Information);

                                    this.Close();
                                }
                                else
                                {
                                    statusStrip1.Items.Add("Status: Data Can not be Saved");
                                    statusStrip1.ForeColor = System.Drawing.Color.Red;
                                }
                            }
                            catch (KeyCheckException ex)
                            {
                                MessageBox.Show(ex.Message, "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                stateLog = new MemoryStream();
                                tmpWrite = new System.Text.ASCIIEncoding().GetBytes("Batch Key-" + objBatch.batch_key + "\n" + "project Key-" + objBatch.proj_code + "\n");
                                stateLog.Write(tmpWrite, 0, tmpWrite.Length);
                                //exMailLog.Log(ex, this);
                            }
                            catch (DbCommitException dbex)
                            {
                                MessageBox.Show(dbex.Message, "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                stateLog = new MemoryStream();
                                tmpWrite = new System.Text.ASCIIEncoding().GetBytes("Error while Commit" + "Batch Key-" + objBatch.batch_key + "\n" + "project Key-" + objBatch.proj_code + "\n");
                                stateLog.Write(tmpWrite, 0, tmpWrite.Length);
                                // exMailLog.Log(dbex, this);
                            }
                            catch (CreateFolderException folex)
                            {
                                MessageBox.Show(folex.Message, "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                stateLog = new MemoryStream();
                                tmpWrite = new System.Text.ASCIIEncoding().GetBytes("Error while Create Folder" + "Batch Key-" + objBatch.batch_key + "\n" + "project Key-" + objBatch.proj_code + "\n");
                                stateLog.Write(tmpWrite, 0, tmpWrite.Length);
                                // exMailLog.Log(folex, this);
                            }
                            catch (DBConnectionException conex)
                            {
                                MessageBox.Show(conex.Message, "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                stateLog = new MemoryStream();
                                tmpWrite = new System.Text.ASCIIEncoding().GetBytes("Error while Connection error" + "Batch Key-" + objBatch.batch_key + "\n" + "project Key-" + objBatch.proj_code + "\n");
                                stateLog.Write(tmpWrite, 0, tmpWrite.Length);
                                //exMailLog.Log(conex, this);
                            }
                            catch (INIFileException iniex)
                            {
                                MessageBox.Show(iniex.Message, "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                stateLog = new MemoryStream();
                                tmpWrite = new System.Text.ASCIIEncoding().GetBytes("Error while INI read error" + "Batch Key-" + objBatch.batch_key + "\n" + "project Key-" + objBatch.proj_code + "\n");
                                stateLog.Write(tmpWrite, 0, tmpWrite.Length);
                                //exMailLog.Log(iniex, this);
                            }
                        }
                        

                    }
                    else
                    {
                        MessageBox.Show("Bundle Number Mismatch", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        textBox2.Focus();
                        textBox2.Select();
                        return;
                    }


                }
            }
            
        }

        private void dateTimePicker1_Leave(object sender, EventArgs e)
        {
            if(_mode == DataLayerDefs.Mode._Add)
            {
                DateTime temp;
                string isDate = dateTimePicker1.Text;
                string currDate = DateTime.Now.ToString("yyyy-MM-dd");
                if (DateTime.TryParse(isDate, out temp))
                {
                    //validateBol = true;
                }
                else
                {
                    //retval = false;
                    MessageBox.Show("Please select a valid Handover Date", "", MessageBoxButtons.OK, MessageBoxIcon.Error);

                    dateTimePicker1.Select();
                    //validateBol = false;

                }
            }
            if (_mode == DataLayerDefs.Mode._Edit)
            {
                DateTime temp;
                string isDate = dateTimePicker1.Text;
                string currDate = DateTime.Now.ToString("yyyy-MM-dd");
                if (DateTime.TryParse(isDate, out temp))
                {
                    //validateBol = true;
                }
                else
                {
                    //retval = false;
                    MessageBox.Show("Please select a valid Handover Date", "", MessageBoxButtons.OK, MessageBoxIcon.Error);

                    dateTimePicker1.Select();
                    //validateBol = false;

                }
            }
            
        }

        private void frmBatch_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Control == true && e.KeyCode == Keys.S)
            {
                button2_Click(sender, e);
            }
            if (e.KeyCode == Keys.Escape)
            {
                //this.Close();
            }
            
        }

        private void textBox2_Leave(object sender, EventArgs e)
        {
            if(_mode == DataLayerDefs.Mode._Add)
            {
                _bundleExists(textBox2.Text);
            }
            if(_mode == DataLayerDefs.Mode._Edit)
            {
                if(textBox2.Text != frmEntrySummary.bundleNo)
                {
                    _bundleExistsEdit(textBox2.Text);
                }
            }
        }
    }
}
