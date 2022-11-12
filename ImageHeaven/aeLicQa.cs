using LItems;
using NovaNet.Utils;
using NovaNet.wfe;
using System;
using System.Collections;
using System.Data;
using System.Data.Odbc;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Windows.Forms;

namespace ImageHeaven
{
    public partial class aeLicQa : Form
    {

        private ImageConfig config = null;
        private static string docType;

        OdbcConnection sqlCon = null;
        NovaNet.Utils.dbCon dbcon = null;
        CtrlPolicy pPolicy = null;
        private CtrlImage pImage = null;
        wfePolicy wPolicy = null;
        wfeImage wImage = null;
        private string boxNo = null;
        private string policyNumber = null;
        private string projCode = null;
        private string batchCode = null;
        private string picPath = null;
        private udtPolicy policyData = null;
        string policyPath = null;
        private int policyStatus = 0;
        private int clickedIndexValue;
        private CtrlBox pBox = null;
        private int selBoxNo;
        string[] imageName;
        int policyRowIndex;
        //private CtrlBatch pBatch = null;

        //private MagickNet.Image imgQc;
        string imagePath = null;
        string photoPath = null;
        //private CtrlBox pBox=null;
        private Imagery img;
        private Imagery imgAll;
        private Credentials crd = new Credentials();
        public static NovaNet.Utils.exLog.Logger exMailLog = new NovaNet.Utils.exLog.emailLogger("./errLog.log", NovaNet.Utils.exLog.LogLevel.Dev, Constants._MAIL_TO, Constants._MAIL_FROM, Constants._SMTP);
        public static NovaNet.Utils.exLog.Logger exTxtLog = new NovaNet.Utils.exLog.txtLogger("./errLog.log", NovaNet.Utils.exLog.LogLevel.Dev);
        private string imgFileName = string.Empty;
        private int zoomWidth;
        private int zoomHeight;
        private Size zoomSize = new Size();
        private int keyPressed = 1;
        private DataTable gTable;
        ihwQuery wQ;
        private string selDocType = string.Empty;
        private int currntPg = 0;
        private bool firstDoc = true;
        private string prevDoc;
        private int policyLen = 0;

        private OdbcDataAdapter sqlAdap = null;

        public aeLicQa()
        {
            InitializeComponent();
        }

        public aeLicQa(OdbcConnection prmCon, Credentials prmCrd)
        {
            //
            // The InitializeComponent() call is required for Windows Forms designer support.
            //
            this.Name = "Quality control";
            InitializeComponent();
            sqlCon = prmCon;
            img = IgrFactory.GetImagery(Constants.IGR_CLEARIMAGE);
            //img = IgrFactory.GetImagery(Constants.IGR_GDPICTURE);
            imgAll = IgrFactory.GetImagery(Constants.IGR_CLEARIMAGE);
            this.Text = "Quality control";
            crd = prmCrd;
            exMailLog.SetNextLogger(exTxtLog);

            //img = IgrFactory.GetImagery(Constants.IGR_GDPICTURE);			
            //
            // TODO: Add constructor code after the InitializeComponent() call.
            //
        }

        private void aeLicQa_Load(object sender, EventArgs e)
        {
            System.Diagnostics.Process.GetCurrentProcess().PriorityClass = System.Diagnostics.ProcessPriorityClass.RealTime;
            System.Windows.Forms.ToolTip bttnToolTip = new System.Windows.Forms.ToolTip();
            System.Windows.Forms.ToolTip otherToolTip = new System.Windows.Forms.ToolTip();
            this.WindowState = FormWindowState.Maximized;
            PopulateProjectCombo();
            rdoShowAll.Checked = true;
            cmdZoomIn.ForeColor = Color.Black;
            cmdZoomOut.ForeColor = Color.Black;
            chkRejectBatch.Visible = false;
            bttnToolTip.SetToolTip(cmdZoomIn, "Shortcut Key- (+)");
            bttnToolTip.SetToolTip(cmdZoomOut, "Shortcut Key- (-)");
            label6.ForeColor = Color.Black;
            label7.ForeColor = Color.Black;
            label8.ForeColor = Color.Black;
            label9.ForeColor = Color.Black;
            txtPolicyNumber.ForeColor = Color.DarkRed;
            txtName.ForeColor = Color.DarkRed;
        }

        private void PopulateProjectCombo()
        {
            DataSet ds = new DataSet();

            dbcon = new NovaNet.Utils.dbCon();

            wfeProject tmpProj = new wfeProject(sqlCon);
            //cmbProject.Items.Add("Select");
            ds = tmpProj.GetAllValues();
            if (ds.Tables[0].Rows.Count > 0)
            {
                cmbProject.DataSource = ds.Tables[0];
                cmbProject.DisplayMember = ds.Tables[0].Columns[1].ToString();
                cmbProject.ValueMember = ds.Tables[0].Columns[0].ToString();
            }
        }

        private void cmbProject_Leave(object sender, EventArgs e)
        {
            PopulateBatchCombo();
        }
        public System.Data.DataSet GetAllValues(int prmProjectKey)
        {
            string sqlStr = null;

            DataSet batchDs = new DataSet();

            try
            {
                sqlStr = "select bundle_key,bundle_name from bundle_master where proj_code=" + prmProjectKey + " and status = '6' order by bundle_name";
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(batchDs);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();
                
                exMailLog.Log(ex);
            }
            return batchDs;
        }
        public DataSet GetAllBox(int prmBatchKey)
        {
            string sqlStr = null;
            DataSet dsBox = new DataSet();
            OdbcDataAdapter sqlAdap = null;

            sqlStr = "select distinct count(filename) as files from case_file_master where proj_code=" + projCode + " and bundle_key=" + prmBatchKey + " ";
            try
            {
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(dsBox);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();
                
                exMailLog.Log(ex);
            }
            return dsBox;
        }
        public DataSet GetReadyImageCount(eSTATES[] state, eSTATES[] prmPolicyState)
        {
            string sqlStr = null;
            DataSet dsImage = new DataSet();
            OdbcDataAdapter sqlAdap = null;


            sqlStr = "select count(page_name) as page_Count,sum(qc_size) as index_size from image_master A,case_file_master B" +
                    " where A.proj_key = B.proj_code and A.batch_key = B.bundle_key and A.policy_number = B.filename and B.proj_code=" + projCode +
                " and B.bundle_key=" + batchCode + " and a.box_number='1' and A.status<>29";
            /*
			for(int j=0;j<state.Length;j++)
			{
				if((int)state[j]!= 0)
				{
					if(j==0)
					{
						sqlStr=sqlStr + " and (A.status=" + (int)state[j] ;
					}
					else
						sqlStr=sqlStr + " or A.status=" + (int)state[j] ;
				}
			}
			sqlStr = sqlStr + " and A.status<>" + (int)eSTATES.PAGE_DELETED + " )";
            */
            for (int j = 0; j < state.Length; j++)
            {
                if ((int)state[j] != 0)
                {
                    if (j == 0)
                    {
                        sqlStr = sqlStr + " and (b.status = 4 or b.status = 40 or B.status=" + (int)prmPolicyState[j];
                    }
                    else
                        sqlStr = sqlStr + " or B.status=" + (int)prmPolicyState[j];
                }
            }
            sqlStr = sqlStr + " )";

            try
            {
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(dsImage);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();
                
                exMailLog.Log(ex);
            }
            return dsImage;
        }
        public int GetPolicyCount(eSTATES[] state)
        {
            string sqlStr = null;
            DataSet dsImage = new DataSet();
            OdbcDataAdapter sqlAdap = null;

            sqlStr = "select count(*) from case_file_master " +
                    " where proj_code=" + projCode +
                " and bundle_key=" + batchCode + " and (status = 4 or status = 5 or status = 19 or status = 22 or status = 30 or status = 31 ) ";


            try
            {
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(dsImage);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();
                
                exMailLog.Log(ex);
            }
            if (dsImage.Tables[0].Rows.Count > 0)
            {
                return Convert.ToInt32(dsImage.Tables[0].Rows[0][0].ToString());
            }
            else
            {
                return 0;
            }
        }
        private void PopulateBoxDetails()
        {
            string batchKey = null;
            DataSet ds = new DataSet();
            CtrlBox cBox = new CtrlBox((int)cmbProject.SelectedValue, (int)cmbBatch.SelectedValue, "0");
            dbcon = new NovaNet.Utils.dbCon();

            wfeBox tmpBox = new wfeBox(sqlCon, cBox);
            DataTable dt = new DataTable();
            DataSet imageCount = new DataSet();
            DataRow dr;
            int indexPolicyCont = 0;
            double avgSize;
            string totSize;
            string totPage;
            NovaNet.wfe.eSTATES[] state = new NovaNet.wfe.eSTATES[5];
            NovaNet.wfe.eSTATES[] policyState = new NovaNet.wfe.eSTATES[5];

            //dt.Columns.Add("BoxNo");
            dt.Columns.Add("Files");
            dt.Columns.Add("Ready");
            dt.Columns.Add("ScannedPages");
            dt.Columns.Add("Avg_Size");
            dt.Columns.Add("TotalSize");

            if (cmbBatch.SelectedValue != null)
            {
                batchKey = cmbBatch.SelectedValue.ToString();
                batchCode = batchKey;
                ds = GetAllBox(Convert.ToInt32(batchKey));
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        dr = dt.NewRow();
                        //dr["BoxNo"] = ds.Tables[0].Rows[i]["box_number"];
                        dr["Files"] = ds.Tables[0].Rows[i]["files"].ToString();

                        pPolicy = new CtrlPolicy(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()), "1", "0");
                        wPolicy = new wfePolicy(sqlCon, pPolicy);

                        policyState[0] = NovaNet.wfe.eSTATES.POLICY_INDEXED;
                        policyState[1] = NovaNet.wfe.eSTATES.POLICY_FQC;
                        policyState[2] = NovaNet.wfe.eSTATES.POLICY_CHECKED;
                        policyState[3] = NovaNet.wfe.eSTATES.POLICY_EXCEPTION;
                        policyState[4] = NovaNet.wfe.eSTATES.POLICY_EXPORTED;
                        indexPolicyCont = GetPolicyCount(policyState);

                        dr["Ready"] = indexPolicyCont;

                        pImage = new CtrlImage(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()), "1", "0", string.Empty, string.Empty);
                        wImage = new wfeImage(sqlCon, pImage);

                        state[0] = eSTATES.PAGE_INDEXED;
                        state[1] = eSTATES.PAGE_FQC;
                        state[2] = eSTATES.PAGE_CHECKED;
                        state[3] = eSTATES.PAGE_EXCEPTION;
                        state[4] = eSTATES.PAGE_EXPORTED;
                        //state[5] = eSTATES.PAGE_ON_HOLD;
                        imageCount = GetReadyImageCount(state, policyState);
                        totPage = imageCount.Tables[0].Rows[0]["page_count"].ToString();
                        dr["ScannedPages"] = totPage;
                        totSize = imageCount.Tables[0].Rows[0]["index_size"].ToString();
                        if (totSize != string.Empty)
                        {
                            dr["TotalSize"] = Math.Round(Convert.ToDouble(totSize), 2);
                        }
                        else
                        {
                            dr["TotalSize"] = string.Empty;
                        }

                        if ((totSize != string.Empty) && (totPage != "0"))
                        {
                            avgSize = Math.Round(Convert.ToDouble(totSize) / Convert.ToDouble(totPage), 2);
                            dr["Avg_Size"] = avgSize.ToString();
                        }

                        dt.Rows.Add(dr);
                    }
                    grdBox.DataSource = dt;
                    grdBox.ForeColor = Color.Black;
                }
            }
        }
        public System.Data.DataTable bundDetails(int prmProjectKey,int prmBatch)
        {
            string sqlStr = null;

            DataTable batchDs = new DataTable();

            try
            {
                sqlStr = "select establishment,date_format(handover_date,'%d-%m-%Y') from bundle_master where proj_code=" + prmProjectKey + " and bundle_key = '"+prmBatch+"'";
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(batchDs);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();
                
                exMailLog.Log(ex);
            }
            return batchDs;
        }

        public System.Data.DataTable mainMetaDetails(int prmProjectKey, int prmBatch,string prmFilename)
        {
            string sqlStr = null;

            DataTable batchDs = new DataTable();

            try
            {
                sqlStr = "SELECT CONCAT('',a.district,' ', '\r'), REPLACE(REPLACE(a.petitioner_name, '||', ' , \r'), '||', '\n'),REPLACE(REPLACE(a.respondant_name, '||', ' , \r'), '||', '\n') from metadata_entry a, bundle_master b where a.proj_code = b.proj_code and a.bundle_key = b.bundle_key and b.proj_code ='" + prmProjectKey+"' and b.bundle_key ='"+prmBatch+"' and a.filename = '"+prmFilename+"' ";
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(batchDs);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();

                exMailLog.Log(ex);
            }
            return batchDs;
        }
        public System.Data.DataTable mainMetaDetails1(int prmProjectKey, int prmBatch, string prmFilename)
        {
            string sqlStr = null;

            DataTable batchDs = new DataTable();
           
            try
            {
                sqlStr = "SELECT REPLACE(REPLACE(a.petitioner_name,';', '\r'),'||', '\n') as 'Petitioner' from metadata_entry a, bundle_master b where a.proj_code = b.proj_code and a.bundle_key = b.bundle_key and b.proj_code ='" + prmProjectKey + "' and b.bundle_key ='" + prmBatch + "' and a.filename = '" + prmFilename + "' ";
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(batchDs);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();

                exMailLog.Log(ex);
            }
            return batchDs;
        }
        public System.Data.DataTable mainMetaDetails2(int prmProjectKey, int prmBatch, string prmFilename)
        {
            string sqlStr = null;

            DataTable batchDs = new DataTable();
            
            try
            {
                sqlStr = "SELECT REPLACE(REPLACE(a.respondant_name,';', '\r'),'||','\n') as 'Respondant' from metadata_entry a, bundle_master b where a.proj_code = b.proj_code and a.bundle_key = b.bundle_key and b.proj_code ='" + prmProjectKey + "' and b.bundle_key ='" + prmBatch + "' and a.filename = '" + prmFilename + "' ";
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(batchDs);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();

                exMailLog.Log(ex);
            }
            return batchDs;
        }
        public System.Data.DataTable counselMetaDetails(int prmProjectKey, int prmBatch, string prmFilename)
        {
            string sqlStr = null;

            DataTable batchDs = new DataTable();

            try
            {
                sqlStr = "select REPLACE(REPLACE(a.judge_name, '||', ' \t\r'),'||','\n'),REPLACE(REPLACE(a.lc_judge_name, '||', ' \t\r'),'||','\n'),REPLACE(REPLACE(a.petitioner_counsel_name, '||', ' , \r'),'||','\n') as 'Petitioner Counsel',REPLACE(REPLACE(a.respondant_counsel_name, '||', ' , \r'),'||','\n') as 'Respondant Counsel',date_format(a.disposal_date,'%d-%m-%Y'),date_format(a.case_filling_date,'%d-%m-%Y'),a.ps_name,a.ps_case_no,REPLACE(REPLACE(a.lc_case_no, '||', ' \t\r'),'||','\n') as 'LC Case No',date_format(a.lc_order_date,'%d-%m-%Y'),REPLACE(REPLACE(a.conn_app_case_no, '||', ' \t\r'),'||','\n') as 'Conn App Case No',a.conn_disposal_type,REPLACE(REPLACE(a.conn_main_case_no, '||', ' \t\r'),'||','\n') as 'Conn Main Case No',REPLACE(REPLACE(a.analogous_case_no, '||', ' \t\r'),'||','\n') as 'Analogous Case No',a.old_case_type,a.old_case_no,a.old_case_year,a.file_move_history,a.dept_remark,a.cnrno from metadata_entry a, bundle_master b where a.proj_code = b.proj_code and a.bundle_key = b.bundle_key and b.proj_code ='" + prmProjectKey+"' and b.bundle_key ='"+prmBatch+"' and a.filename = '"+prmFilename+"' ";
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(batchDs);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();

                exMailLog.Log(ex);
            }
            return batchDs;
        }

        private void CheckBatchRejection(string pBatchKey)
        {
            wfeBatch wBatch = new wfeBatch(sqlCon);
            wQ = new ihwQuery(sqlCon);
            if (chkReadyUat.Checked == false)
            {
                
                if (wBatch.PolicyWithLICException(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(pBatchKey)) == true)
                {
                    chkRejectBatch.Visible = false;
                }
                else
                {
                    chkRejectBatch.Visible = false;
                }
                
            }
            else
            {
                chkRejectBatch.Visible = false;
            }
        }
        private void PopulateBatchCombo()
        {
            string projKey = null;
            DataSet ds = new DataSet();

            dbcon = new NovaNet.Utils.dbCon();
            NovaNet.wfe.eSTATES[] bState = new NovaNet.wfe.eSTATES[2];
            wfeBatch tmpBatch = new wfeBatch(sqlCon);
            if (cmbProject.SelectedValue != null)
            {
                projKey = cmbProject.SelectedValue.ToString();
                projCode = projKey;
                wQ = new ihwQuery(sqlCon);
                
                ds = GetAllValues(Convert.ToInt32(projKey));
                
                
                if (ds.Tables[0].Rows.Count > 0)
                {
                    cmbBatch.DataSource = ds.Tables[0];
                    cmbBatch.DisplayMember = ds.Tables[0].Columns[1].ToString();
                    cmbBatch.ValueMember = ds.Tables[0].Columns[0].ToString();
                }
                else
                {
                    cmbBatch.DataSource = ds.Tables[0];
                }
            }
        }
        public int GetTotalPolicies(eSTATES prmState)
        {
            string sqlStr = null;
            DataSet dsBox = new DataSet();
            OdbcDataAdapter sqlAdap = null;

            sqlStr = "select filename as filename from case_file_master where proj_code=" + projCode + " and bundle_key=" + batchCode;
            if ((int)prmState == 0)
            {
                sqlStr = sqlStr + " and 1=1 order by filename";
            }
            else
            {
                sqlStr = sqlStr + " and status=" + (int)prmState + " order by filename";
            }

            try
            {
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(dsBox);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();
                
                exMailLog.Log(ex);
            }

            return dsBox.Tables[0].Rows.Count;
        }
        public int GetTotalPolicies(eSTATES[] prmState)
        {
            string sqlStr = null;
            DataSet dsBox = new DataSet();
            OdbcDataAdapter sqlAdap = null;

            sqlStr = "select filename as filename from case_file_master where proj_code=" + projCode + " and bundle_key=" + batchCode;

            for (int j = 0; j < prmState.Length; j++)
            {
                if ((int)prmState[j] != 0)
                {
                    if (j == 0)
                    {
                        sqlStr = sqlStr + " and (status=" + (int)prmState[j];
                    }
                    else
                        sqlStr = sqlStr + " or status=" + (int)prmState[j];
                }
            }
            sqlStr = sqlStr + ") order by filename";
            try
            {
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(dsBox);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();
               
                exMailLog.Log(ex);
            }

            return dsBox.Tables[0].Rows.Count;
        }
        public double GetTotalBatchSize()
        {
            string sqlStr = null;
            DataSet dsBox = new DataSet();
            OdbcDataAdapter sqlAdap = null;
            double size = 0;

            ///changed in version 1.0.0.1
            sqlStr = "select sum(A.qc_size) as size from image_master A,case_file_master B where A.proj_key=B.proj_code and A.batch_key=B.bundle_key and A.policy_number=B.filename and A.proj_key=" + projCode + " and A.batch_key=" + batchCode + " and B.status<>" + (int)eSTATES.POLICY_ON_HOLD + " and A.status<>" + (int)eSTATES.PAGE_DELETED;
            try
            {
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(dsBox);
                size = Convert.ToInt32(dsBox.Tables[0].Rows[0]["size"]) / 1024;
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();
                
                exMailLog.Log(ex);
            }


            return size;
        }
        public int GetTotalImageCount()
        {
            string sqlStr = null;
            DataSet projDs = new DataSet();
            int count;

            try
            {
                sqlStr = @"select count(*) from image_master where proj_key=" + projCode + " and batch_key=" + batchCode;
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(projDs);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();

               
                exMailLog.Log(ex);
            }
            if (projDs.Tables[0].Rows.Count > 0)
            {
                count = Convert.ToInt32(projDs.Tables[0].Rows[0][0].ToString());
            }
            else
                count = 0;

            return count;
        }
        public int GetTotalImageCount(eSTATES[] state, bool prmIsSignaturePage, eSTATES[] prmPolicyState)
        {
            string sqlStr = null;
            DataSet dsBox = new DataSet();
            OdbcDataAdapter sqlAdap = null;

            sqlStr = "select count(page_name) as page_Count,sum(qc_size) as index_size from image_master A,case_file_master B" +
                    " where A.proj_key = B.proj_code and A.batch_key = B.bundle_key and A.policy_number = B.filename and B.proj_code=" + projCode +
                " and B.bundle_key=" + batchCode + " and A.status<>29";
            /*
            for (int j = 0; j < state.Length; j++)
            {
                if ((int)state[j] != 0)
                {
                    if (j == 0)
                    {
                        sqlStr = sqlStr + " and (A.status=" + (int)state[j];
                    }
                    else
                        sqlStr = sqlStr + " or A.status=" + (int)state[j];
                }
            }
             
            sqlStr = sqlStr + " and A.status<>" + (int)eSTATES.PAGE_DELETED + " )";
             */
            for (int j = 0; j < prmPolicyState.Length; j++)
            {
                if ((int)prmPolicyState[j] != 0)
                {
                    if (j == 0)
                    {
                        sqlStr = sqlStr + " and (b.status = 4 or b.status = 5 or B.status=" + (int)prmPolicyState[j];
                    }
                    else
                        sqlStr = sqlStr + " or B.status = " + (int)prmPolicyState[j];
                }
            }
            if (prmIsSignaturePage == false)
            {
                sqlStr = sqlStr + " )";
            }
            else
            {
                sqlStr = sqlStr + " ) and A.doc_type<>''";
            }
            try
            {
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(dsBox);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();
                
                exMailLog.Log(ex);
            }

            return Convert.ToInt32(dsBox.Tables[0].Rows[0]["page_Count"].ToString());
        }
        public int GetBatchStatus(int prmBatchKey)
        {
            string sqlStr = null;
            int status = 0;
            DataSet batchDs = new DataSet();

            try
            {
                sqlStr = "select status from bundle_master where bundle_key=" + prmBatchKey;
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(batchDs);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();
                
                exMailLog.Log(ex);
            }
            if (batchDs.Tables[0].Rows.Count > 0)
            {
                status = Convert.ToInt32(batchDs.Tables[0].Rows[0]["status"].ToString());
            }

            return status;
        }
        private void cmbBatch_Leave(object sender, EventArgs e)
        {
            try
            {
                if ((cmbProject.SelectedValue != null) && (cmbBatch.SelectedValue != null))
                {
                    wfeBox wBox;
                    PopulateBoxDetails();
                    eSTATES state = new eSTATES();

                    eSTATES[] tempState = new eSTATES[6];
                    eSTATES[] policyState = new eSTATES[6];
                    pBox = new CtrlBox(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()), "1");
                    wBox = new wfeBox(sqlCon, pBox);
                    lblTotPolicies.Text = GetTotalPolicies(state).ToString();
                    lblPolRcvd.Text = Convert.ToString((Convert.ToInt32(lblTotPolicies.Text) - Convert.ToInt32(GetTotalPolicies(eSTATES.POLICY_MISSING))));
                    lblPolHold.Text = GetTotalPolicies(eSTATES.POLICY_ON_HOLD).ToString();

                    policyState[0] = NovaNet.wfe.eSTATES.POLICY_INDEXED;
                    policyState[1] = NovaNet.wfe.eSTATES.POLICY_FQC;
                    policyState[2] = NovaNet.wfe.eSTATES.POLICY_CHECKED;
                    policyState[3] = NovaNet.wfe.eSTATES.POLICY_EXCEPTION;
                    policyState[4] = NovaNet.wfe.eSTATES.POLICY_EXPORTED;
                    policyState[5] = NovaNet.wfe.eSTATES.POLICY_NOT_INDEXED;
                    lblScannedPol.Text = GetTotalPolicies(policyState).ToString();
                    lblBatchSz.Text = GetTotalBatchSize().ToString();
                    tempState[0] = eSTATES.PAGE_INDEXED;
                    tempState[1] = eSTATES.PAGE_FQC;
                    tempState[2] = eSTATES.PAGE_CHECKED;
                    tempState[3] = eSTATES.PAGE_EXCEPTION;
                    tempState[4] = eSTATES.PAGE_EXPORTED;
                    tempState[5] = eSTATES.PAGE_NOT_INDEXED;
                    int scannedPol = Convert.ToInt32(lblScannedPol.Text);
                    lblAvgDocketSz.Text = Convert.ToString(Math.Round(Convert.ToDouble(Convert.ToDouble(lblBatchSz.Text) / scannedPol), 2));
                    lblTotImages.Text = GetTotalImageCount(tempState, false, policyState).ToString();
                    lblSigCount.Text = GetTotalImageCount(tempState, true, policyState).ToString();
                    lblNetImageCount.Text = Convert.ToString(GetTotalImageCount(tempState, false, policyState) - GetTotalImageCount(tempState, true, policyState));
                    double bSize = Convert.ToInt32(lblBatchSz.Text) * 1024;
                    double tImage = Convert.ToInt32(lblTotImages.Text);
                    double aImageSize = bSize / tImage;
                    lblAvgImageSize.Text = Math.Round(aImageSize, 1).ToString() + " KB";
                    wfeBatch wBatch = new wfeBatch(sqlCon);
                    if (GetBatchStatus(Convert.ToInt32(cmbBatch.SelectedValue.ToString())) == (int)eSTATES.BATCH_READY_FOR_UAT)
                    {
                        chkReadyUat.Enabled = false;
                        chkReadyUat.Checked = true;
                        cmdAccepted.Enabled = false;
                        cmdRejected.Enabled = false;
                    }
                    else
                    {
                        chkReadyUat.Enabled = true;
                        chkReadyUat.Checked = false;
                        cmdAccepted.Enabled = true;
                        cmdRejected.Enabled = true;
                    }
                    CheckBatchRejection(cmbBatch.SelectedValue.ToString());
                    lblTotPol.Text = wBox.GetLICCheckedCount().ToString();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error while generating bundle information........" + "  " + ex.Message);
            }
        }

        private void grdBox_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            selBoxNo = Convert.ToInt32("1");
            PolicyDetails("1");
            grdPolicy.ForeColor = Color.Black;
        }
        public DataSet GetPolicyList(eSTATES[] prmState)
        {
            string sqlStr = null;

            DataSet policyDs = new DataSet();

            try
            {
                if (prmState.Length == 0)
                {
                    sqlStr = "select A.case_file_no,A.filename,A.case_status,A.case_nature,a.case_type,a.case_year,a.status from case_file_master A where a.proj_code=" + projCode + " and a.bundle_key=" + batchCode ;
                }
                else
                {
                    
                    sqlStr = "select A.case_file_no,A.filename,A.case_status,A.case_nature,a.case_type,a.case_year,a.status from case_file_master A where a.proj_code=" + projCode + " and a.bundle_key=" + batchCode;


                    for (int j = 0; j < prmState.Length; j++)
                    {
                        if ((int)prmState[j] != 0)
                        {
                            if (j == 0)
                            {
                                sqlStr = sqlStr + " and (a.status=" + (int)prmState[j];
                            }
                            else
                                sqlStr = sqlStr + " or a.status=" + (int)prmState[j];
                        }
                    }
                    sqlStr = sqlStr + ")";
                }

                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(policyDs);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();
                
                exMailLog.Log(ex);
            }

            return policyDs;
        }
        void PolicyDetails(string prmBoxNo)
        {
            DataTable dt = new DataTable();
            DataRow dr;
            DataSet ds = new DataSet();
            DataSet dsPolicy = new DataSet();
            DataSet dsImage = new DataSet();
            eSTATES[] filterState = new eSTATES[1];
            double avgSize;
            string totSize = string.Empty;
            string totPage;
            string yr;
            string mm;
            string dd;
            NovaNet.wfe.eSTATES[] state = new NovaNet.wfe.eSTATES[6];

            dt.Columns.Add("SrlNo");

            dt.Columns.Add("FileNo");
            dt.Columns.Add("Filename");
            dt.Columns.Add("Case_status");
            dt.Columns.Add("Case_nature");
            dt.Columns.Add("Case_type");
            dt.Columns.Add("Case_year");


            dt.Columns.Add("ScannedPages");
            dt.Columns.Add("TotalSize");
            dt.Columns.Add("Avg_Size");

            dt.Columns.Add("STATUS");
            dt.Columns.Add("FILESTATUS");


            dt.Columns.Add("MAINPETITION");
            dt.Columns.Add("MAINPETITIONANNEXTURES");
            dt.Columns.Add("AFFIDAVITSWITHANNEXTURES");
            dt.Columns.Add("WRITTENSTATEMENTOBJECTION");
            dt.Columns.Add("CONNECTEDAPPLICATIONS");
            dt.Columns.Add("ANALOGOUSANDCONNECTEDCASE");
            dt.Columns.Add("VAKALATNAMAANDWARRENT");
            dt.Columns.Add("SUMMONS");
            dt.Columns.Add("WITNESSACTIONDEPOSITION");
            dt.Columns.Add("ISSUES");
            dt.Columns.Add("EXHIBITS");
            dt.Columns.Add("NOTICEOFARGUMENT");
            dt.Columns.Add("ENGROSSEDPRELIMINARY");
            dt.Columns.Add("ORDERSMAINCASE");
            dt.Columns.Add("ORDERSAPPLICATIONS");
            dt.Columns.Add("FINALJUDGEMENTORDER");
            dt.Columns.Add("LOWERCOURTRECORDS");
            dt.Columns.Add("IMPUGNEDORDER");
            dt.Columns.Add("OTHERS");
            dt.Columns.Add("REPORT");
            dt.Columns.Add("BRIEF");
            dt.Columns.Add("SETTLEMENT");
            dt.Columns.Add("RULE");
            dt.Columns.Add("BOND");
            dt.Columns.Add("CAVEAT");

            if(cmbBatch.Text != "")
            {
                if ((prmBoxNo != string.Empty) && (prmBoxNo != null) && (cmbProject.SelectedValue.ToString() != string.Empty) && (cmbProject.SelectedValue.ToString() != null) && (cmbBatch.SelectedValue.ToString() != string.Empty) && ((cmbBatch.SelectedValue.ToString() != null)))
            {
                boxNo = prmBoxNo;
                pPolicy = new CtrlPolicy(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()), prmBoxNo, "0");
                wPolicy = new wfePolicy(sqlCon, pPolicy);
                if (rdoShowAll.Checked == true)
                {
                    eSTATES[] allState = new eSTATES[0];
                    dsPolicy = GetPolicyList(allState);
                }
                if (rdoChecked.Checked == true)
                {
                    filterState[0] = eSTATES.POLICY_CHECKED;
                    dsPolicy =  GetPolicyList(filterState);
                }
                if (rdoExceptions.Checked == true)
                {
                    filterState[0] = eSTATES.POLICY_EXCEPTION;
                    dsPolicy = GetPolicyList(filterState);
                }

                if (rdoOnHold.Checked == true)
                {
                    filterState[0] = eSTATES.POLICY_ON_HOLD;
                    dsPolicy = GetPolicyList(filterState);
                }
                if (rdoMissing.Checked == true)
                {
                    filterState[0] = eSTATES.POLICY_MISSING;
                    dsPolicy = GetPolicyList(filterState);
                }

                if (rdo150.Checked == true)
                {
                    eSTATES[] allState = new eSTATES[0];
                    dsPolicy = GetPolicyList(allState);
                }

                for (int i = 0; i < dsPolicy.Tables[0].Rows.Count; i++)
                {
                    pImage = new CtrlImage(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()), prmBoxNo, dsPolicy.Tables[0].Rows[i]["filename"].ToString(), string.Empty, string.Empty);
                    wImage = new wfeImage(sqlCon, pImage);

                    //NovaNet.wfe.eSTATES[] state = new NovaNet.wfe.eSTATES[4];
                    state[0] = NovaNet.wfe.eSTATES.PAGE_EXCEPTION;
                    state[1] = NovaNet.wfe.eSTATES.PAGE_INDEXED;
                    state[2] = NovaNet.wfe.eSTATES.PAGE_CHECKED;
                    state[3] = NovaNet.wfe.eSTATES.PAGE_FQC;
                    state[4] = NovaNet.wfe.eSTATES.PAGE_EXPORTED;
                    state[5] = NovaNet.wfe.eSTATES.PAGE_ON_HOLD;
                    dsImage = wImage.GetPolicyWiseImageInfo(state);
                    if (rdo150.Checked == true)
                    {

                        totSize = dsImage.Tables[0].Rows[0]["qc_size"].ToString();
                        if (totSize != String.Empty)
                        {
                            double totFileSize = Convert.ToDouble(totSize) / 1024;
                            if (Convert.ToDouble(totFileSize) > ihConstants._DOCKET_MAX_SIZE)
                            {
                                if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) != (int)eSTATES.POLICY_SCANNED) && (Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) != (int)eSTATES.POLICY_QC) && (Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) != (int)eSTATES.POLICY_ON_HOLD))
                                {
                                    dr = dt.NewRow();
                                    dr["SrlNo"] = i + 1;

                                    dr["FileNo"] = dsPolicy.Tables[0].Rows[i]["case_file_no"].ToString();
                                    dr["Filename"] = dsPolicy.Tables[0].Rows[i]["filename"].ToString();
                                    dr["Case_status"] = dsPolicy.Tables[0].Rows[i]["case_status"].ToString();
                                    dr["Case_nature"] = dsPolicy.Tables[0].Rows[i]["case_nature"].ToString();
                                    dr["Case_type"] = dsPolicy.Tables[0].Rows[i]["case_type"].ToString();
                                    dr["Case_year"] = dsPolicy.Tables[0].Rows[i]["case_year"].ToString();
                                   
                                    

                                    pImage = new CtrlImage(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()), prmBoxNo, dsPolicy.Tables[0].Rows[i]["filename"].ToString(), string.Empty, string.Empty);
                                    wImage = new wfeImage(sqlCon, pImage);

                                    if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) != (int)eSTATES.POLICY_MISSING))
                                    {
                                        totPage = dsImage.Tables[0].Rows[0]["page_count"].ToString();
                                    }
                                    else
                                    {
                                        totPage = "0";
                                    }
                                    dr["ScannedPages"] = totPage;
                                    if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) != (int)eSTATES.POLICY_MISSING))
                                    {
                                        totSize = dsImage.Tables[0].Rows[0]["qc_size"].ToString();
                                    }
                                    else
                                    {
                                        totSize = string.Empty;
                                    }
                                    if (totSize != string.Empty)
                                    {
                                        totSize = Convert.ToString(Math.Round(Convert.ToDouble(totSize), 2));
                                    }
                                    dr["TotalSize"] = totSize;

                                    dr["STATUS"] = dsPolicy.Tables[0].Rows[i]["status"];
                                    if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_NOT_INDEXED))
                                    {
                                        dr["FILESTATUS"] = "Not Indexed";
                                    }
                                    if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_INDEXED) || (Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_FQC) )
                                    {
                                        dr["FILESTATUS"] = "Indexed";
                                    }
                                    if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_ON_HOLD))
                                    {
                                        dr["FILESTATUS"] = "On hold";
                                    }
                                    if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_MISSING))
                                    {
                                        dr["FILESTATUS"] = "Missing";
                                    }
                                    if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_EXCEPTION))
                                    {
                                        dr["FILESTATUS"] = "In exception";
                                    }
                                    if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_CHECKED))
                                    {
                                        dr["FILESTATUS"] = "Checked";
                                    }
                                    if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_EXPORTED))
                                    {
                                        dr["FILESTATUS"] = "Exported";
                                    }
                                    if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_SCANNED) || (Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_QC) || (Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_ON_HOLD))
                                    {
                                        dr["ScannedPages"] = "0";
                                        dr["TotalSize"] = string.Empty;
                                        totPage = "0";
                                        totSize = string.Empty;
                                    }
                                    if ((totSize != string.Empty) && (totPage != "0"))
                                    {
                                        avgSize = Convert.ToDouble(totSize) / Convert.ToDouble(totPage);
                                        dr["Avg_Size"] = Convert.ToString(Math.Round(avgSize, 2));
                                    }
                                    if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == 2) || (Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == 3) || (Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_ON_HOLD) || (Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_MISSING))
                                    {
                             
                                        dr["MAINPETITION"] = "0";
                                        dr["MAINPETITIONANNEXTURES"] = "0";
                                        dr["AFFIDAVITSWITHANNEXTURES"] = "0";
                                        dr["WRITTENSTATEMENTOBJECTION"] = "0";
                                        dr["CONNECTEDAPPLICATIONS"] = "0";
                                        dr["ANALOGOUSANDCONNECTEDCASE"] = "0";
                                        dr["VAKALATNAMAANDWARRENT"] = "0";
                                        dr["SUMMONS"] = "0";
                                        dr["WITNESSACTIONDEPOSITION"] = "0";
                                        dr["ISSUES"] = "0";
                                        dr["EXHIBITS"] = "0";
                                        dr["NOTICEOFARGUMENT"] = "0";
                                        dr["ENGROSSEDPRELIMINARY"] = "0";
                                        dr["ORDERSMAINCASE"] = "0";
                                        dr["ORDERSAPPLICATIONS"] = "0";
                                        dr["FINALJUDGEMENTORDER"] = "0";
                                        dr["LOWERCOURTRECORDS"] = "0";
                                        dr["IMPUGNEDORDER"] = "0";
                                        dr["OTHERS"] = "0";
                                        dr["REPORT"] = "0";
                                        dr["BRIEF"] = "0";
                                        dr["SETTLEMENT"] = "0";
                                        dr["RULE"] = "0";
                                        dr["BOND"] = "0";
                                        dr["CAVEAT"] = "0";
                                    }
                                    else
                                    {

                                        dr["MAINPETITION"] = wImage.GetDocTypeCount(ihConstants.MAINPETITION_FILE); 
                                        dr["MAINPETITIONANNEXTURES"] = wImage.GetDocTypeCount(ihConstants.MAINPETITIONANNEXTURES_FILE); 
                                        dr["AFFIDAVITSWITHANNEXTURES"] = wImage.GetDocTypeCount(ihConstants.AFFIDAVITSWITHANNEXTURES_FILE); 
                                        dr["WRITTENSTATEMENTOBJECTION"] = wImage.GetDocTypeCount(ihConstants.WRITTENSTATEMENTOBJECTION_FILE); 
                                        dr["CONNECTEDAPPLICATIONS"] = wImage.GetDocTypeCount(ihConstants.CONNECTEDAPPLICATIONS_FILE); 
                                        dr["ANALOGOUSANDCONNECTEDCASE"] = wImage.GetDocTypeCount(ihConstants.ANALOGOUSANDCONNECTEDCASE_FILE); 
                                        dr["VAKALATNAMAANDWARRENT"] = wImage.GetDocTypeCount(ihConstants.VAKALATNAMAANDWARRENT_FILE); 
                                        dr["SUMMONS"] = wImage.GetDocTypeCount(ihConstants.SUMMONS_FILE); 
                                        dr["WITNESSACTIONDEPOSITION"] = wImage.GetDocTypeCount(ihConstants.WITNESSACTIONDEPOSITION_FILE);
                                        dr["ISSUES"] = wImage.GetDocTypeCount(ihConstants.ISSUES_FILE);
                                        dr["EXHIBITS"] = wImage.GetDocTypeCount(ihConstants.EXHIBITS_FILE);
                                        dr["NOTICEOFARGUMENT"] = wImage.GetDocTypeCount(ihConstants.NOTICEOFARGUMENT_FILE);
                                        dr["ENGROSSEDPRELIMINARY"] = wImage.GetDocTypeCount(ihConstants.ENGROSSEDPRELIMINARY_FILE);
                                        dr["ORDERSMAINCASE"] = wImage.GetDocTypeCount(ihConstants.ORDERSMAINCASE_FILE);
                                        dr["ORDERSAPPLICATIONS"] = wImage.GetDocTypeCount(ihConstants.ORDERSAPPLICATIONS_FILE);
                                        dr["FINALJUDGEMENTORDER"] = wImage.GetDocTypeCount(ihConstants.FINALJUDGEMENTORDER_FILE);
                                        dr["LOWERCOURTRECORDS"] = wImage.GetDocTypeCount(ihConstants.LOWERCOURTRECORDS_FILE);
                                        dr["IMPUGNEDORDER"] = wImage.GetDocTypeCount(ihConstants.IMPUGNEDORDER_FILE);
                                        dr["OTHERS"] = wImage.GetDocTypeCount(ihConstants.OTHERS_FILE);
                                        dr["REPORT"] = wImage.GetDocTypeCount(ihConstants.REPORT_FILE);
                                        dr["BRIEF"] = wImage.GetDocTypeCount(ihConstants.BRIEF_FILE);
                                        dr["SETTLEMENT"] = wImage.GetDocTypeCount(ihConstants.SETTLEMENT_FILE);
                                        dr["RULE"] = wImage.GetDocTypeCount(ihConstants.RULE_FILE);
                                        dr["BOND"] = wImage.GetDocTypeCount(ihConstants.BOND_FILE);
                                        dr["CAVEAT"] = wImage.GetDocTypeCount(ihConstants.CAVEAT_FILE);


                                    }
                                    dt.Rows.Add(dr);
                                }
                            }
                        }
                    }
                    else
                    {
                        dr = dt.NewRow();
                        dr["SrlNo"] = i + 1;
                        dr["FileNo"] = dsPolicy.Tables[0].Rows[i]["case_file_no"].ToString();
                        dr["Filename"] = dsPolicy.Tables[0].Rows[i]["filename"].ToString();
                        dr["Case_status"] = dsPolicy.Tables[0].Rows[i]["case_status"].ToString();
                        dr["Case_nature"] = dsPolicy.Tables[0].Rows[i]["case_nature"].ToString();
                        dr["Case_type"] = dsPolicy.Tables[0].Rows[i]["case_type"].ToString();
                        dr["Case_year"] = dsPolicy.Tables[0].Rows[i]["case_year"].ToString();

                        if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) != (int)eSTATES.POLICY_MISSING))
                        {
                            totPage = dsImage.Tables[0].Rows[0]["page_count"].ToString();
                        }
                        else
                        {
                            totPage = "0";
                        }
                        dr["ScannedPages"] = totPage;
                        if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) != (int)eSTATES.POLICY_MISSING))
                        {
                            totSize = dsImage.Tables[0].Rows[0]["qc_size"].ToString();
                        }
                        else
                        {
                            totSize = string.Empty;
                        }
                        if (totSize != string.Empty)
                        {
                            totSize = Convert.ToString(Math.Round(Convert.ToDouble(totSize), 2));
                        }
                        dr["TotalSize"] = totSize;
                        dr["STATUS"] = dsPolicy.Tables[0].Rows[i]["status"];
                        if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_NOT_INDEXED))
                        {
                            dr["FILESTATUS"] = "Not Indexed";
                        }
                        if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_INDEXED) || (Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_FQC))
                        {
                            dr["FILESTATUS"] = "Indexed";
                        }
                        if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_ON_HOLD))
                        {
                            dr["FILESTATUS"] = "On hold";
                        }
                        if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_MISSING))
                        {
                            dr["FILESTATUS"] = "Missing";
                        }
                        if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_EXCEPTION))
                        {
                            dr["FILESTATUS"] = "In exception";
                        }
                        if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_CHECKED))
                        {
                            dr["FILESTATUS"] = "Checked";
                        }
                        if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_EXPORTED))
                        {
                            dr["FILESTATUS"] = "Exported";
                        }
                        if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == 2) || (Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == 3) || (Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_ON_HOLD))
                        {
                            dr["ScannedPages"] = "0";
                            dr["TotalSize"] = string.Empty;
                            totPage = "0";
                            totSize = string.Empty;
                        }
                        if ((totSize != string.Empty) && (totPage != "0"))
                        {
                            avgSize = Convert.ToDouble(totSize) / Convert.ToDouble(totPage);
                            dr["Avg_Size"] = Convert.ToString(Math.Round(avgSize, 2));
                        }
                        if ((Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == 2) || (Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == 3) || (Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_ON_HOLD) || (Convert.ToInt32(dsPolicy.Tables[0].Rows[i]["status"].ToString()) == (int)eSTATES.POLICY_MISSING))
                        {
                            dr["MAINPETITION"] = "0";
                            dr["MAINPETITIONANNEXTURES"] = "0";
                            dr["AFFIDAVITSWITHANNEXTURES"] = "0";
                            dr["WRITTENSTATEMENTOBJECTION"] = "0";
                            dr["CONNECTEDAPPLICATIONS"] = "0";
                            dr["ANALOGOUSANDCONNECTEDCASE"] = "0";
                            dr["VAKALATNAMAANDWARRENT"] = "0";
                            dr["SUMMONS"] = "0";
                            dr["WITNESSACTIONDEPOSITION"] = "0";
                            dr["ISSUES"] = "0";
                            dr["EXHIBITS"] = "0";
                            dr["NOTICEOFARGUMENT"] = "0";
                            dr["ENGROSSEDPRELIMINARY"] = "0";
                            dr["ORDERSMAINCASE"] = "0";
                            dr["ORDERSAPPLICATIONS"] = "0";
                            dr["FINALJUDGEMENTORDER"] = "0";
                            dr["LOWERCOURTRECORDS"] = "0";
                            dr["IMPUGNEDORDER"] = "0";
                            dr["OTHERS"] = "0";
                            dr["REPORT"] = "0";
                            dr["BRIEF"] = "0";
                            dr["SETTLEMENT"] = "0";
                            dr["RULE"] = "0";
                            dr["BOND"] = "0";
                            dr["CAVEAT"] = "0";
                        }
                        else
                        {
                            dr["MAINPETITION"] = wImage.GetDocTypeCount(ihConstants.MAINPETITION_FILE);
                            dr["MAINPETITIONANNEXTURES"] = wImage.GetDocTypeCount(ihConstants.MAINPETITIONANNEXTURES_FILE);
                            dr["AFFIDAVITSWITHANNEXTURES"] = wImage.GetDocTypeCount(ihConstants.AFFIDAVITSWITHANNEXTURES_FILE);
                            dr["WRITTENSTATEMENTOBJECTION"] = wImage.GetDocTypeCount(ihConstants.WRITTENSTATEMENTOBJECTION_FILE);
                            dr["CONNECTEDAPPLICATIONS"] = wImage.GetDocTypeCount(ihConstants.CONNECTEDAPPLICATIONS_FILE);
                            dr["ANALOGOUSANDCONNECTEDCASE"] = wImage.GetDocTypeCount(ihConstants.ANALOGOUSANDCONNECTEDCASE_FILE);
                            dr["VAKALATNAMAANDWARRENT"] = wImage.GetDocTypeCount(ihConstants.VAKALATNAMAANDWARRENT_FILE);
                            dr["SUMMONS"] = wImage.GetDocTypeCount(ihConstants.SUMMONS_FILE);
                            dr["WITNESSACTIONDEPOSITION"] = wImage.GetDocTypeCount(ihConstants.WITNESSACTIONDEPOSITION_FILE);
                            dr["ISSUES"] = wImage.GetDocTypeCount(ihConstants.ISSUES_FILE);
                            dr["EXHIBITS"] = wImage.GetDocTypeCount(ihConstants.EXHIBITS_FILE);
                            dr["NOTICEOFARGUMENT"] = wImage.GetDocTypeCount(ihConstants.NOTICEOFARGUMENT_FILE);
                            dr["ENGROSSEDPRELIMINARY"] = wImage.GetDocTypeCount(ihConstants.ENGROSSEDPRELIMINARY_FILE);
                            dr["ORDERSMAINCASE"] = wImage.GetDocTypeCount(ihConstants.ORDERSMAINCASE_FILE);
                            dr["ORDERSAPPLICATIONS"] = wImage.GetDocTypeCount(ihConstants.ORDERSAPPLICATIONS_FILE);
                            dr["FINALJUDGEMENTORDER"] = wImage.GetDocTypeCount(ihConstants.FINALJUDGEMENTORDER_FILE);
                            dr["LOWERCOURTRECORDS"] = wImage.GetDocTypeCount(ihConstants.LOWERCOURTRECORDS_FILE);
                            dr["IMPUGNEDORDER"] = wImage.GetDocTypeCount(ihConstants.IMPUGNEDORDER_FILE);
                            dr["OTHERS"] = wImage.GetDocTypeCount(ihConstants.OTHERS_FILE);
                            dr["REPORT"] = wImage.GetDocTypeCount(ihConstants.REPORT_FILE);
                            dr["BRIEF"] = wImage.GetDocTypeCount(ihConstants.BRIEF_FILE);
                            dr["SETTLEMENT"] = wImage.GetDocTypeCount(ihConstants.SETTLEMENT_FILE);
                            dr["RULE"] = wImage.GetDocTypeCount(ihConstants.RULE_FILE);
                            dr["BOND"] = wImage.GetDocTypeCount(ihConstants.BOND_FILE);
                            dr["CAVEAT"] = wImage.GetDocTypeCount(ihConstants.CAVEAT_FILE);
                        }

                        dt.Rows.Add(dr);
                    }
                }
                if (dt.Rows.Count > 0)
                {
                    grdPolicy.DataSource = ds;
                    grdPolicy.DataSource = dt;
                }
                else
                {
                    grdPolicy.DataSource = ds;
                }

                if ((grdPolicy.Rows.Count > 0))
                {
                    for (int l = 0; l < grdPolicy.Rows.Count; l++)
                    {
                        if (Convert.ToInt32(grdPolicy.Rows[l].Cells[10].Value.ToString()) == (int)eSTATES.POLICY_CHECKED)
                        {
                            grdPolicy.Rows[l].DefaultCellStyle.ForeColor = Color.Black;
                            grdPolicy.Rows[l].DefaultCellStyle.BackColor = Color.Green;
                        }
                        if ((Convert.ToInt32(grdPolicy.Rows[l].Cells[10].Value.ToString()) == (int)eSTATES.POLICY_EXCEPTION) || (Convert.ToInt32(grdPolicy.Rows[l].Cells[10].Value.ToString()) == (int)eSTATES.POLICY_EXCEPTION))
                        {
                            grdPolicy.Rows[l].DefaultCellStyle.ForeColor = Color.Black;
                            grdPolicy.Rows[l].DefaultCellStyle.BackColor = Color.Red;
                        }
                        if ((Convert.ToInt32(grdPolicy.Rows[l].Cells[10].Value.ToString()) == (int)eSTATES.POLICY_ON_HOLD))
                        {
                            grdPolicy.Rows[l].DefaultCellStyle.ForeColor = Color.Black;
                            grdPolicy.Rows[l].DefaultCellStyle.BackColor = Color.Turquoise;
                        }
                        if ((Convert.ToInt32(grdPolicy.Rows[l].Cells[10].Value.ToString()) == (int)eSTATES.POLICY_MISSING))
                        {
                            grdPolicy.Rows[l].DefaultCellStyle.ForeColor = Color.Black;
                            grdPolicy.Rows[l].DefaultCellStyle.BackColor = Color.Magenta;
                        }
                    }

                }
                if (dt.Rows.Count > 0)
                {
                    grdPolicy.Columns[10].Visible = false;
                    grdPolicy.Columns[0].Width = 40;
                    grdPolicy.Columns[1].Width = 70;
                    grdPolicy.Columns[2].Width = 120;
                    grdPolicy.Columns[3].Width = 70;
                    grdPolicy.Columns[4].Width = 70;
                    grdPolicy.Columns[5].Width = 40;
                    grdPolicy.Columns[6].Width = 50;
                    grdPolicy.Columns[7].Width = 60;
                    grdPolicy.Columns[8].Width = 60;
                    grdPolicy.Columns[9].Width = 60;
                    grdPolicy.Columns[10].Width = 30;
                    grdPolicy.Columns[11].Width = 30;
                    grdPolicy.Columns[12].Width = 30;
                    grdPolicy.Columns[13].Width = 30;
                    grdPolicy.Columns[14].Width = 30;
                    grdPolicy.Columns[15].Width = 30;
                    grdPolicy.Columns[16].Width = 30;
                    grdPolicy.Columns[17].Width = 30;
                    grdPolicy.Columns[18].Width = 30;
                    grdPolicy.Columns[19].Width = 30;
                    grdPolicy.Columns[20].Width = 30;
                    grdPolicy.Columns[21].Width = 30;
                    grdPolicy.Columns[22].Width = 30;
                    grdPolicy.Columns[23].Width = 30;
                    grdPolicy.Columns[24].Width = 30;
                    grdPolicy.Columns[25].Width = 30;
                    grdPolicy.Columns[26].Width = 30;
                }

            }
            }
        }

        private void rdoShowAll_Click(object sender, EventArgs e)
        {
            if ((selBoxNo.ToString() != string.Empty) && (selBoxNo != 0))
                PolicyDetails(selBoxNo.ToString());
        }

        private void rdoChecked_Click(object sender, EventArgs e)
        {
            if ((selBoxNo.ToString() != string.Empty) && (selBoxNo != 0))
                PolicyDetails(selBoxNo.ToString());
        }

        private void rdoExceptions_Click(object sender, EventArgs e)
        {
            if ((selBoxNo.ToString() != string.Empty) && (selBoxNo != 0))
                PolicyDetails(selBoxNo.ToString());
        }

        private void rdoOnHold_Click(object sender, EventArgs e)
        {
            if ((selBoxNo.ToString() != string.Empty) && (selBoxNo != 0))
                PolicyDetails(selBoxNo.ToString());
        }

        private void rdoMissing_Click(object sender, EventArgs e)
        {
            if ((selBoxNo.ToString() != string.Empty) && (selBoxNo != 0))
                PolicyDetails(selBoxNo.ToString());
        }

        private void rdo150_Click(object sender, EventArgs e)
        {
            if ((selBoxNo.ToString() != string.Empty) && (selBoxNo != 0))
                PolicyDetails(selBoxNo.ToString());
        }
        void ClearPicBox()
        {
            pictureBox1.Image = null;
            pictureBox2.Image = null;
            pictureBox3.Image = null;
            pictureBox4.Image = null;
            pictureBox5.Image = null;
            pictureBox6.Image = null;
        }
        private string GetPolicyPath(string policyNo)
        {
            //policyLst = (ListBox)BoxDtls.Controls["lstPolicy"];
            wfeBatch wBatch = new wfeBatch(sqlCon);
            string batchPath = GetPath(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()));
            return batchPath + "\\"  + policyNo;
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
                
                exMailLog.Log(ex);
            }
            if (projDs.Tables[0].Rows.Count > 0)
            {
                Path = projDs.Tables[0].Rows[0]["bundle_path"].ToString();
            }
            else
                Path = string.Empty;

            return Path;
        }
        private void DisplayDockType()
        {
            config = new ImageConfig(ihConstants.CONFIG_FILE_PATH);
            char PROPOSALFORM = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.PROPOSALFORM_KEY).Remove(1, 1).Trim());
            char PHOTOADDENDUM = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.PHOTOADDENDUM_KEY).Remove(1, 1).Trim());
            char PROPOSALENCLOSERS = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.PROPOSALENCLOSERS_KEY).Remove(1, 1).Trim());
            char SIGNATUREPAGE = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.SIGNATUREPAGE_KEY).Remove(1, 1).Trim());
            char MEDICALREPORT = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.MEDICALREPORT_KEY).Remove(1, 1).Trim());
            char PROPOSALREVIEWSLIP = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.PROPOSALREVIEWSLIP_KEY).Remove(1, 1).Trim());
            char POLICYBOND = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.POLICYBOND_KEY).Remove(1, 1).Trim());
            char NOMINATION = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.NOMINATION_KEY).Remove(1, 1).Trim());
            char ASSIGNMENT = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.ASSIGNMENT_KEY).Remove(1, 1).Trim());
            char ALTERATION = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.ALTERATION_KEY).Remove(1, 1).Trim());
            char REVIVALS = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.REVIVALS_KEY).Remove(1, 1).Trim());
            char POLICYLOANS = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.POLICYLOANS_KEY).Remove(1, 1).Trim());
            char SURRENDER = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.SURRENDER_KEY).Remove(1, 1).Trim());
            char CLAIMS = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.CLAIMS_KEY).Remove(1, 1).Trim());
            char CORRESPONDENCE = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.CORRESPONDENCE_KEY).Remove(1, 1).Trim());
            char OTHERS = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.OTHERS_KEY).Remove(1, 1).Trim());
            char KYCDOCUMENT = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.KYCDOCUMENT_KEY).Remove(1, 1).Trim());
            char MAINPETITION = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.MAINPETITION_KEY).Remove(1, 1).Trim());
            char MAINPETITIONANNEXURES = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.MAINPETITIONANNEXTURES_KEY).Remove(1, 1).Trim());
            char AFFIDAVITSWITHANNEXURES = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.AFFIDAVITSWITHANNEXTURES_KEY).Remove(1, 1).Trim());
            char WRITTENSTATEMENTOBJECTION = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.WRITTENSTATEMENTOBJECTION_KEY).Remove(1, 1).Trim());
            char CONNECTEDAPPLICATIONS = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.CONNECTEDAPPLICATIONS_KEY).Remove(1, 1).Trim());
            char ANALOGOUSANDCONNECTEDCASE = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.ANALOGOUSANDCONNECTEDCASE_KEY).Remove(1, 1).Trim());
            char VAKALATNAMAANDWARRENT = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.VAKALATNAMAANDWARRENT_KEY).Remove(1, 1).Trim());
            char SUMMONS = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.SUMMONS_KEY).Remove(1, 1).Trim());
            //char NOTICE = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.NOTICE_KEY).Remove(1, 1).Trim());
            char WITNESSACTIONDEPOSITION = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.WITNESSACTIONDEPOSITION_KEY).Remove(1, 1).Trim());
            char ISSUES = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.ISSUES_KEY).Remove(1, 1).Trim());
            char EXHIBITS = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.EXHIBITS_KEY).Remove(1, 1).Trim());
            //char DRAFTPAPERS = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.DRAFTPAPERS_KEY).Remove(1, 1).Trim());
            char NOTICEOFARGUMENT = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.NOTICEOFARGUMENT_KEY).Remove(1, 1).Trim());
            char ENGROSSEDPRELIMINARY = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.ENGROSSEDPRELIMINARY_KEY).Remove(1, 1).Trim());
            char ORDERSMAINCASE = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.ORDERSMAINCASE_KEY).Remove(1, 1).Trim());
            char ORDERSAPPLICATIONS = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.ORDERSAPPLICATIONS_KEY).Remove(1, 1).Trim());
            char FINALJUDGEMENTORDER = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.FINALJUDGEMENTORDER_KEY).Remove(1, 1).Trim());
            char LOWERCOURTRECORDS = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.LOWERCOURTRECORDS_KEY).Remove(1, 1).Trim());
            char IMPUGNEDORDER = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.IMPUGNEDORDER_KEY).Remove(1, 1).Trim());
            //char PAPERBOOK = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.PAPERBOOK_KEY).Remove(1, 1).Trim());
            char REPORT = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.REPORT_KEY).Remove(1, 1).Trim());
            char BRIEF = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.BRIEF_KEY).Remove(1, 1).Trim());
            char SETTLEMENT = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.SETTLEMENT_KEY).Remove(1, 1).Trim());
            char RULE = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.RULE_KEY).Remove(1, 1).Trim());
            char BOND = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.BOND_KEY).Remove(1, 1).Trim());
            char CAVEAT = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.CAVEAT_KEY).Remove(1, 1).Trim());
            char DELETE = Convert.ToChar(config.GetValue(ihConstants.INDEX_SHORTCUT_KEY_SECTION, ihConstants.DELETE_KEY).Remove(1, 1).Trim());
            lvwDockTypes.Items.Clear();
            /*ListViewItem lvwItem = lvwDockTypes.Items.Add("PROPOSAL FORM");
            lvwItem.SubItems.Add(PROPOSALFORM.ToString());
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add("PHOTO ADDENDUM");
            lvwItem.SubItems.Add(PHOTOADDENDUM.ToString());
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add("PROPOSAL ENCLOSERS");
            lvwItem.SubItems.Add(PROPOSALENCLOSERS.ToString());
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add("SIGNATURE PAGE");
            lvwItem.SubItems.Add(SIGNATUREPAGE.ToString());
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add("MEDICAL REPORT");
            lvwItem.SubItems.Add(MEDICALREPORT.ToString());
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add("PROPOSAL REVIEW SLIP");
            lvwItem.SubItems.Add(PROPOSALREVIEWSLIP.ToString());
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add("POLICY BOND");
            lvwItem.SubItems.Add(POLICYBOND.ToString());
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add("NOMINATION");
            lvwItem.SubItems.Add(NOMINATION.ToString());
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add("ASSIGNMENT");
            lvwItem.SubItems.Add(ASSIGNMENT.ToString());
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add("ALTERATION");
            lvwItem.SubItems.Add(ALTERATION.ToString());
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add("REVIVALS");
            lvwItem.SubItems.Add(REVIVALS.ToString());
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add("POLICY LOANS");
            lvwItem.SubItems.Add(POLICYLOANS.ToString());
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add("SURRENDER");
            lvwItem.SubItems.Add(SURRENDER.ToString());
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add("CLAIMS");
            lvwItem.SubItems.Add(CLAIMS.ToString());
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add("CORRESPONDENCE");
            lvwItem.SubItems.Add(CORRESPONDENCE.ToString());
            lvwItem.SubItems.Add("0");

            

            lvwItem = lvwDockTypes.Items.Add("KYC DOCUMENT");
            lvwItem.SubItems.Add(KYCDOCUMENT.ToString());
            lvwItem.SubItems.Add("0");*/

            ListViewItem lvwItem = lvwDockTypes.Items.Add(ihConstants.MAINPETITION_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Red;
            lvwItem.BackColor = System.Drawing.Color.Yellow;
            
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.MAINPETITIONANNEXTURES_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Red;
            lvwItem.BackColor = System.Drawing.Color.Yellow;
           
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.AFFIDAVITSWITHANNEXTURES_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
            
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.WRITTENSTATEMENTOBJECTION_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
           
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.CONNECTEDAPPLICATIONS_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
            
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.ANALOGOUSANDCONNECTEDCASE_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
            
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.VAKALATNAMAANDWARRENT_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Red;
            lvwItem.BackColor = System.Drawing.Color.Yellow;
 
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.SUMMONS_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
           
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.REPORT_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
           
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.WITNESSACTIONDEPOSITION_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
           
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.ISSUES_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
         
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.EXHIBITS_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
           
            lvwItem.SubItems.Add("0");

            

            lvwItem = lvwDockTypes.Items.Add(ihConstants.NOTICEOFARGUMENT_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
           
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.ENGROSSEDPRELIMINARY_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
            
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.ORDERSMAINCASE_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Red;
            lvwItem.BackColor = System.Drawing.Color.Yellow;
           
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.ORDERSAPPLICATIONS_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
         
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.FINALJUDGEMENTORDER_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Red;
            lvwItem.BackColor = System.Drawing.Color.Yellow;
            
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.LOWERCOURTRECORDS_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
         
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.IMPUGNEDORDER_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
            
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.BRIEF_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
           
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.SETTLEMENT_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
         
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.RULE_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
         
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.BOND_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
          
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.CAVEAT_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
           
            lvwItem.SubItems.Add("0");

            lvwItem = lvwDockTypes.Items.Add(ihConstants.OTHERS_FILE);
            lvwItem.ForeColor = System.Drawing.Color.Blue;
          
            lvwItem.SubItems.Add("0");
            //		lvwItem=lvwDockTypes.Items.Add("DELETE");
            //		lvwItem.SubItems.Add(DELETE.ToString());
            //		lvwItem.SubItems.Add("0");
        }
        private void DisplayDocTypeCount()
        {

            int pos;

            DisplayDockType();
            for (int i = 0; i < lstImage.Items.Count; i++)
            {
                pos = lstImage.Items[i].ToString().IndexOf("-");
                docType = lstImage.Items[i].ToString().Substring(pos + 1);
                /*if (docType == ihConstants.PROPOSALFORM_FILE)
                {
                    lvwDockTypes.Items[0].SubItems[2].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[0].SubItems[2].Text) + 1));
                }
                if (docType == ihConstants.PHOTOADDENDUM_FILE)
                {
                    lvwDockTypes.Items[1].SubItems[2].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[1].SubItems[2].Text) + 1));
                }
                if (docType == ihConstants.PROPOSALENCLOSERS_FILE)
                {
                    lvwDockTypes.Items[2].SubItems[2].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[2].SubItems[2].Text) + 1));
                }
                if (docType == ihConstants.SIGNATUREPAGE_FILE)
                {
                    lvwDockTypes.Items[3].SubItems[2].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[3].SubItems[2].Text) + 1));
                }
                if (docType == ihConstants.MEDICALREPORT_FILE)
                {
                    lvwDockTypes.Items[4].SubItems[2].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[4].SubItems[2].Text) + 1));
                }
                if (docType == ihConstants.PROPOSALREVIEWSLIP_FILE)
                {
                    lvwDockTypes.Items[5].SubItems[2].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[5].SubItems[2].Text) + 1));
                }
                if (docType == ihConstants.POLICYBOND_FILE)
                {
                    lvwDockTypes.Items[6].SubItems[2].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[6].SubItems[2].Text) + 1));
                }
                if (docType == ihConstants.NOMINATION_FILE)
                {
                    lvwDockTypes.Items[7].SubItems[2].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[7].SubItems[2].Text) + 1));
                }
                if (docType == ihConstants.ASSIGNMENT_FILE)
                {
                    lvwDockTypes.Items[8].SubItems[2].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[8].SubItems[2].Text) + 1));
                } if (docType == ihConstants.ALTERATION_FILE)
                {
                    lvwDockTypes.Items[9].SubItems[2].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[9].SubItems[2].Text) + 1));
                } if (docType == ihConstants.REVIVALS_FILE)
                {
                    lvwDockTypes.Items[10].SubItems[2].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[10].SubItems[2].Text) + 1));
                } if (docType == ihConstants.POLICYLOANS_FILE)
                {
                    lvwDockTypes.Items[11].SubItems[2].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[11].SubItems[2].Text) + 1));
                } if (docType == ihConstants.SURRENDER_FILE)
                {
                    lvwDockTypes.Items[12].SubItems[2].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[12].SubItems[2].Text) + 1));
                } if (docType == ihConstants.CLAIMS_FILE)
                {
                    lvwDockTypes.Items[13].SubItems[2].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[13].SubItems[2].Text) + 1));
                } if (docType == ihConstants.CORRESPONDENCE_FILE)
                {
                    lvwDockTypes.Items[14].SubItems[2].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[14].SubItems[2].Text) + 1));
                } 
                if (docType == ihConstants.KYCDOCUMENT_FILE)
                {
                    lvwDockTypes.Items[16].SubItems[2].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[16].SubItems[2].Text) + 1));
                }*/

                if (docType == ihConstants.MAINPETITION_FILE)
                {
                    lvwDockTypes.Items[0].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[0].SubItems[1].Text) + 1));
                    lvwDockTypes.Items[0].ForeColor = Color.Blue;
                }
                if (docType == ihConstants.MAINPETITIONANNEXTURES_FILE)
                {
                    lvwDockTypes.Items[1].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[1].SubItems[1].Text) + 1));
                    lvwDockTypes.Items[1].ForeColor = Color.Blue;
                }
                if (docType == ihConstants.AFFIDAVITSWITHANNEXTURES_FILE)
                {
                    lvwDockTypes.Items[2].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[2].SubItems[1].Text) + 1));
                    //lvwDockTypes.Items[2].ForeColor = Color.Blue;
                }
                if (docType == ihConstants.WRITTENSTATEMENTOBJECTION_FILE)
                {
                    lvwDockTypes.Items[3].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[3].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.CONNECTEDAPPLICATIONS_FILE)
                {
                    lvwDockTypes.Items[4].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[4].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.ANALOGOUSANDCONNECTEDCASE_FILE)
                {
                    lvwDockTypes.Items[5].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[5].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.VAKALATNAMAANDWARRENT_FILE)
                {
                    lvwDockTypes.Items[6].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[6].SubItems[1].Text) + 1));
                    lvwDockTypes.Items[6].ForeColor = Color.Blue;
                }
                if (docType == ihConstants.SUMMONS_FILE)
                {
                    lvwDockTypes.Items[7].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[7].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.REPORT_FILE)
                {
                    lvwDockTypes.Items[8].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[8].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.WITNESSACTIONDEPOSITION_FILE)
                {
                    lvwDockTypes.Items[9].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[9].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.ISSUES_FILE)
                {
                    lvwDockTypes.Items[10].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[10].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.EXHIBITS_FILE)
                {
                    lvwDockTypes.Items[11].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[11].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.NOTICEOFARGUMENT_FILE)
                {
                    lvwDockTypes.Items[12].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[12].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.ENGROSSEDPRELIMINARY_FILE)
                {
                    lvwDockTypes.Items[13].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[13].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.ORDERSMAINCASE_FILE)
                {
                    lvwDockTypes.Items[14].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[14].SubItems[1].Text) + 1));
                    lvwDockTypes.Items[14].ForeColor = Color.Blue;
                    lvwDockTypes.Items[16].ForeColor = Color.Blue;
                }
                if (docType == ihConstants.ORDERSAPPLICATIONS_FILE)
                {
                    lvwDockTypes.Items[15].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[15].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.FINALJUDGEMENTORDER_FILE)
                {
                    lvwDockTypes.Items[16].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[16].SubItems[1].Text) + 1));
                    lvwDockTypes.Items[16].ForeColor = Color.Blue;
                    lvwDockTypes.Items[14].ForeColor = Color.Blue;
                }
                if (docType == ihConstants.LOWERCOURTRECORDS_FILE)
                {
                    lvwDockTypes.Items[17].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[17].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.IMPUGNEDORDER_FILE)
                {
                    lvwDockTypes.Items[18].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[18].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.BRIEF_FILE)
                {
                    lvwDockTypes.Items[19].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[19].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.SETTLEMENT_FILE)
                {
                    lvwDockTypes.Items[20].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[20].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.RULE_FILE)
                {
                    lvwDockTypes.Items[21].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[21].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.BOND_FILE)
                {
                    lvwDockTypes.Items[22].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[22].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.CAVEAT_FILE)
                {
                    lvwDockTypes.Items[23].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[23].SubItems[1].Text) + 1));
                }
                if (docType == ihConstants.OTHERS_FILE)
                {
                    lvwDockTypes.Items[24].SubItems[1].Text = Convert.ToString((Convert.ToInt32(lvwDockTypes.Items[24].SubItems[1].Text) + 1));
                }

            }
            //imageDelLst = (ListBox)BoxDtls.Controls["lstImageDel"];
            //lvwDockTypes.Items[15].SubItems[2].Text =Convert.ToString(imageDelLst.Items.Count);
        }
        public ArrayList GetItems(eITEMS item, string case_file_no)
        {
            OdbcDataAdapter wAdap;
            OdbcTransaction trns = null;
            OdbcCommand oCom = new OdbcCommand();
            string strQuery = null;
            wItemControl wic = null;
            DataSet ds = new DataSet();
            string strQr = string.Empty;
            //wfePolicy queryPolicy = (wfePolicy)wi;
            ArrayList arrItem = new ArrayList();

            if (item == eITEMS.LIC_QA_PAGE)
            {
                strQuery = "select distinct A.proj_key,A.batch_key,A.box_number,A.policy_number,A.page_name,A.page_index_name,A.doc_type from image_master A,case_file_master B where A.proj_key=B.proj_code and A.batch_key = B.bundle_key  and A.policy_number = B.filename and A.photo <> 1 and A.proj_key=" + projCode + " and A.batch_key=" + batchCode + " and  A.policy_number='" + case_file_no + "' and a.status <> 29 and (b.status = 3 or b.status = 4 or b.status = 5 or b.status = 6 or b.status ='7' or b.status = '8' or b.status = '30' or b.status = '31' or b.status = '37' or b.status = '40' or b.status = '77') order by a.serial_no";

                oCom.Connection = sqlCon;
                oCom.CommandText = strQuery;
                wAdap = new OdbcDataAdapter(oCom);
                wAdap.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {

                        wic = new CtrlImage(Convert.ToInt32(ds.Tables[0].Rows[i]["proj_key"].ToString()), Convert.ToInt32(ds.Tables[0].Rows[i]["batch_key"].ToString()), "1", ds.Tables[0].Rows[i]["policy_number"].ToString(), ds.Tables[0].Rows[i]["page_name"].ToString(), ds.Tables[0].Rows[i]["doc_type"].ToString());
                        arrItem.Add(wic);
                    }
                }
            }

            return arrItem;
        }
        private void grdPolicy_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (cmbBatch.Text != "")
            {
                try
                {
                    ClearPicBox();

                    firstDoc = true;
                    DataSet expDs = new DataSet();
                    clickedIndexValue = e.RowIndex;
                    picControl.Image = null;
                    lstImage.Items.Clear();
                    DisplayDockType();
                    policyNumber = grdPolicy.Rows[e.RowIndex].Cells[2].Value.ToString();
                    policyLen = policyNumber.Length;
                    txtPolicyNumber.Text = grdPolicy.Rows[e.RowIndex].Cells[1].Value.ToString();
                    txtName.Text = grdPolicy.Rows[e.RowIndex].Cells[2].Value.ToString();
                    txtDOB.Text = grdPolicy.Rows[e.RowIndex].Cells[3].Value.ToString();
                    txtCommDt.Text = grdPolicy.Rows[e.RowIndex].Cells[4].Value.ToString();
                    textBox1.Text = grdPolicy.Rows[e.RowIndex].Cells[5].Value.ToString();
                    textBox2.Text = grdPolicy.Rows[e.RowIndex].Cells[6].Value.ToString();

                    string hdate = bundDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode)).Rows[0][1].ToString();
                    deLabel1.Text = "Establishment : " + bundDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode)).Rows[0][0].ToString();
                    deLabel2.Text = "Handover Date : " + hdate;
                    deLabel3.Text = "District : " + mainMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][0].ToString();
                    //string xyz = mainMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][1].ToString();
                    //string petitioner_name = mainMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][1].ToString();
                    //if (petitioner_name == null || petitioner_name == "")
                    //{
                    //    deTextBox1.Text = string.Empty;

                    //}
                    //else
                    //{
                    //    deTextBox1.Text = string.Empty;
                    //    string[] split = petitioner_name.Split(new string[] { "||" }, StringSplitOptions.None);

                    //    foreach (string petitioner in split)
                    //    {

                    //        if (petitioner == null || petitioner == "")
                    //        {
                    //        }
                    //        else
                    //        {
                    //            deTextBox1.Text = deTextBox1.Text + petitioner + "\n";

                    //        }
                    //    }

                    //}
                    deTextBox1.Text = mainMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][1].ToString();
                    deTextBox2.Text = mainMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][2].ToString();
                    deTextBox3.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][0].ToString();
                    deTextBox4.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][1].ToString();
                    deTextBox5.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][2].ToString();
                    deTextBox6.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][3].ToString();
                    textBox3.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][4].ToString();
                    textBox4.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][5].ToString();
                    textBox5.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][6].ToString();
                    textBox6.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][7].ToString();
                    textBox7.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][9].ToString();
                    deTextBox7.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][8].ToString();
                    deTextBox8.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][10].ToString();
                    deTextBox9.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][12].ToString();
                    deTextBox10.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][13].ToString();
                    textBox8.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][14].ToString();
                    textBox9.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][15].ToString();
                    textBox10.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][16].ToString();
                    deTextBox11.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][17].ToString();
                    deTextBox12.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][18].ToString();
                    textBox11.Text = counselMetaDetails(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), policyNumber).Rows[0][19].ToString();

                    policyRowIndex = e.RowIndex;
                    if (Convert.ToDouble(grdPolicy.Rows[e.RowIndex].Cells[7].Value.ToString()) > 0)
                    {
                        for (int i = 0; i < grdPolicy.Columns.Count - 12; i++)
                        {
                            lvwDockTypes.Items[i].SubItems[1].Text = grdPolicy.Rows[e.RowIndex].Cells[i + 12].Value.ToString();
                        }
                        lblTotFiles.Text = Convert.ToString(Math.Round(Convert.ToDouble(grdPolicy.Rows[e.RowIndex].Cells[7].Value.ToString()), 2));
                        lblAvgSize.Text = Convert.ToString(Math.Round(Convert.ToDouble(grdPolicy.Rows[e.RowIndex].Cells[8].Value.ToString()), 2)) + " KB";
                        lblDock.Text = Convert.ToString(Math.Round(Convert.ToDouble(grdPolicy.Rows[e.RowIndex].Cells[9].Value.ToString()), 2)) + " KB";
                        policyStatus = Convert.ToInt32(grdPolicy.Rows[e.RowIndex].Cells[10].Value.ToString());

                        if (policyStatus == (int)eSTATES.POLICY_EXPORTED)
                        {
                            cmdAccepted.Enabled = false;
                            cmdRejected.Enabled = false;
                        }
                        else
                        {
                            cmdAccepted.Enabled = true;
                            cmdRejected.Enabled = true;
                        }
                        //lstImage.Items.Clear();
                        pPolicy = new CtrlPolicy(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()), boxNo, grdPolicy.Rows[e.RowIndex].Cells[2].Value.ToString());
                        wfePolicy policy = new wfePolicy(sqlCon, pPolicy);
                        //policyData = (udtPolicy)policy.LoadValuesFromDB();
                        policyPath = GetPolicyPath(policyNumber); //policyData.policy_path;
                        expDs = policy.GetAllException();
                        if (expDs.Tables[0].Rows.Count > 0)
                        {
                            if (Convert.ToInt32(expDs.Tables[0].Rows[0]["missing_img_exp"].ToString()) == 1)
                            {
                                chkMissingImg.Checked = true;
                            }
                            else
                            {
                                chkMissingImg.Checked = false;
                            }

                            if (Convert.ToInt32(expDs.Tables[0].Rows[0]["crop_clean_exp"].ToString()) == 1)
                            {
                                chkCropClean.Checked = true;
                            }
                            else
                            {
                                chkCropClean.Checked = false;
                            }

                            if (Convert.ToInt32(expDs.Tables[0].Rows[0]["poor_scan_exp"].ToString()) == 1)
                            {
                                chkPoorScan.Checked = true;
                            }
                            else
                            {
                                chkPoorScan.Checked = false;
                            }
                            if (Convert.ToInt32(expDs.Tables[0].Rows[0]["wrong_indexing_exp"].ToString()) == 1)
                            {
                                chkIndexing.Checked = true;
                            }
                            else
                            {
                                chkIndexing.Checked = false;
                            }
                            if (Convert.ToInt32(expDs.Tables[0].Rows[0]["linked_policy_exp"].ToString()) == 1)
                            {
                                chkLinkedPolicy.Checked = true;
                            }
                            else
                            {
                                chkLinkedPolicy.Checked = false;
                            }
                            if (Convert.ToInt32(expDs.Tables[0].Rows[0]["decision_misd_exp"].ToString()) == 1)
                            {
                                chkDesicion.Checked = true;
                            }
                            else
                            {
                                chkDesicion.Checked = false;
                            }
                            if (Convert.ToInt32(expDs.Tables[0].Rows[0]["extra_page_exp"].ToString()) == 1)
                            {
                                chkExtraPage.Checked = true;
                            }
                            else
                            {
                                chkExtraPage.Checked = false;
                            }
                            if (Convert.ToInt32(expDs.Tables[0].Rows[0]["decision_misd_exp"].ToString()) == 1)
                            {
                                chkDesicion.Checked = true;
                            }
                            else
                            {
                                chkDesicion.Checked = false;
                            }
                            if (Convert.ToInt32(expDs.Tables[0].Rows[0]["rearrange_exp"].ToString()) == 1)
                            {
                                chkRearrange.Checked = true;
                            }
                            else
                            {
                                chkRearrange.Checked = false;
                            }
                            if (Convert.ToInt32(expDs.Tables[0].Rows[0]["other_exp"].ToString()) == 1)
                            {
                                chkOther.Checked = true;
                            }
                            else
                            {
                                chkOther.Checked = false;
                            }
                            if (Convert.ToInt32(expDs.Tables[0].Rows[0]["move_to_respective_policy_exp"].ToString()) == 1)
                            {
                                chkMove.Checked = true;
                            }
                            else
                            {
                                chkMove.Checked = false;
                            }
                            if (Convert.ToInt32(expDs.Tables[0].Rows[0]["metadata_exp"].ToString()) == 1)
                            {
                                chkMeta.Checked = true;
                            }
                            else
                            {
                                chkMeta.Checked = false;
                            }

                            txtComments.Text = expDs.Tables[0].Rows[0]["comments"].ToString() + "\r\n";
                            txtComments.SelectionStart = txtComments.Text.Length;
                            txtComments.ScrollToCaret();
                            txtComments.Refresh();
                        }
                        else
                        {
                            chkMissingImg.Checked = false;
                            chkCropClean.Checked = false;
                            chkPoorScan.Checked = false;
                            chkIndexing.Checked = false;
                            chkLinkedPolicy.Checked = false;
                            chkDesicion.Checked = false;
                            chkExtraPage.Checked = false;
                            chkDesicion.Checked = false;
                            chkRearrange.Checked = false;
                            chkOther.Checked = false;
                            chkMove.Checked = false;
                            chkMeta.Checked = false;
                            txtComments.Text = string.Empty;
                        }

                        ArrayList arrImage = new ArrayList();
                        wQuery pQuery = new ihwQuery(sqlCon);
                        eSTATES[] state = new eSTATES[5];
                        state[0] = eSTATES.POLICY_CHECKED;
                        state[1] = eSTATES.POLICY_FQC;
                        state[2] = eSTATES.POLICY_INDEXED;
                        state[3] = eSTATES.POLICY_EXCEPTION;
                        state[4] = eSTATES.POLICY_EXPORTED;
                        CtrlImage ctrlImage;
                        arrImage = GetItems(eITEMS.LIC_QA_PAGE, policyNumber);
                        for (int i = 0; i < arrImage.Count; i++)
                        {
                            ctrlImage = (CtrlImage)arrImage[i];
                            if (ctrlImage.DocType != string.Empty)
                            {
                                lstImage.Items.Add(ctrlImage.ImageName + "-" + ctrlImage.DocType);
                            }
                            else
                                lstImage.Items.Add(ctrlImage.ImageName);
                        }
                        DisplayDocTypeCount();
                        tabControl1.SelectedIndex = 1;
                        if (lstImage.Items.Count > 0)
                        {
                            lstImage.SelectedIndex = 0;
                            cmdAccepted.Enabled = true;
                            cmdRejected.Enabled = true;
                        }

                    }
                    else
                    {
                        cmdAccepted.Enabled = false;
                        cmdRejected.Enabled = false;
                    }

                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error while getting the information of the selected policy.....");
                    exMailLog.Log(ex);
                }
            }
        }
        private bool GetThumbnailImageAbort()
        {
            return false;
        }
        
        private void ShowThumbImage(string pDocType)
        {
            DataSet ds = new DataSet();
            string imageFileName;
            Image imgNew = null;
            IContainerControl icc = tabControl2.GetContainerControl();

            //tabControl2.SelectedIndex = 1;
            //picBig.Visible = false;
            //panelBig.Visible = false;
            //picBig.Image = null;
            System.Drawing.Image imgThumbNail = null;

            pImage = new CtrlImage(Convert.ToInt32(projCode), Convert.ToInt32(batchCode), boxNo, policyNumber, string.Empty, pDocType);
            wfeImage wImage = new wfeImage(sqlCon, pImage);
            ds = wImage.GetAllIndexedImageName();
            ClearPicBox();
            if (ds.Tables[0].Rows.Count > 0)
            {
                imageName = new string[ds.Tables[0].Rows.Count];
                if (ds.Tables[0].Rows.Count <= 6)
                {
                    pgOne.Visible = true;
                    pgTwo.Visible = false;
                    pgThree.Visible = false;
                }
                if ((ds.Tables[0].Rows.Count > 6) && (ds.Tables[0].Rows.Count <= 12))
                {
                    pgOne.Visible = true;
                    pgTwo.Visible = true;
                    pgThree.Visible = false;
                }
                if ((ds.Tables[0].Rows.Count > 12) && (ds.Tables[0].Rows.Count <= 14))
                {
                    pgOne.Visible = true;
                    pgTwo.Visible = true;
                    pgThree.Visible = true;
                }
                for (int j = 0; j < ds.Tables[0].Rows.Count; j++)
                {
                    if (picPath != null)
                    {
                        imageFileName = picPath + "\\" + ds.Tables[0].Rows[j][0].ToString();
                        imgAll.LoadBitmapFromFile(imageFileName);

                        if (imgAll.GetBitmap().PixelFormat == PixelFormat.Format24bppRgb)
                        {
                            try
                            {
                                imgAll.GetLZW("tmp.TIF");
                                imgNew = Image.FromFile("tmp.TIF");
                                imgThumbNail = imgNew;
                            }
                            catch (Exception ex)
                            {
                                string err = ex.Message;
                            }
                        }
                        else
                        {
                            imgThumbNail = System.Drawing.Image.FromFile(imageFileName);
                        }
                        imageName[j] = imageFileName;
                        if (!System.IO.File.Exists(imageFileName)) return;
                        //imgThumbNail = Image.FromFile(imageFileName);
                        double scaleX = (double)pictureBox1.Width / (double)imgThumbNail.Width;
                        double scaleY = (double)pictureBox1.Height / (double)imgThumbNail.Height;
                        double Scale = Math.Min(scaleX, scaleY);
                        int w = (int)(imgThumbNail.Width * Scale);
                        int h = (int)(imgThumbNail.Height * Scale);
                        w = w - 5;
                        imgThumbNail = imgThumbNail.GetThumbnailImage(w, h, new System.Drawing.Image.GetThumbnailImageAbort(GetThumbnailImageAbort), IntPtr.Zero);

                        if (j == 0)
                        {
                            pictureBox1.Image = imgThumbNail;
                            pictureBox1.Tag = imageFileName;
                        }
                        if (j == 1)
                        {
                            pictureBox2.Image = imgThumbNail;
                            pictureBox2.Tag = imageFileName;
                        }
                        if (j == 2)
                        {
                            pictureBox3.Image = imgThumbNail;
                            pictureBox3.Tag = imageFileName;
                        }
                        if (j == 3)
                        {
                            pictureBox4.Image = imgThumbNail;
                            pictureBox4.Tag = imageFileName;
                        }
                        if (j == 4)
                        {
                            pictureBox5.Image = imgThumbNail;
                            pictureBox5.Tag = imageFileName;
                        }
                        if (j == 5)
                        {
                            pictureBox6.Image = imgThumbNail;
                            pictureBox6.Tag = imageFileName;
                        }
                        if (imgNew != null)
                        {
                            imgNew.Dispose();
                            imgNew = null;
                            if (File.Exists("tmp.tif"))
                                File.Delete("tmp.TIF");
                        }
                    }
                }
            }
            else
            {
                ClearPicBox();
                imageName = null;
            }

        }
        private void lvwDockTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
            pgOne.Visible = false;
            pgTwo.Visible = false;
            pgThree.Visible = false;
            currntPg = 0;
            //if (tabControl2.SelectedIndex == 1)
            //{
            for (int i = 0; i < lvwDockTypes.Items.Count; i++)
            {
                if (lvwDockTypes.Items[i].Selected == true)
                {
                    selDocType = lvwDockTypes.Items[i].SubItems[0].Text;
                    ShowThumbImage(selDocType);
                    for (int j = 0; j < lstImage.Items.Count; j++)
                    {
                        string srchStr = lstImage.Items[j].ToString();
                        if (srchStr.IndexOf(selDocType) > 0)
                        {
                            lstImage.SelectedIndex = j;
                            break;
                        }
                    }
                    lstImage.Focus();
                }
            }
        }
        private void ChangeSize()
        {
            Image imgTot = null;
            try
            {
                if (img.IsValid() == true)
                {
                    if (img.GetBitmap().PixelFormat == PixelFormat.Format1bppIndexed)
                    {
                        picControl.Height = tabControl1.Height - 75;
                        picControl.Width = tabControl2.Width - 30;
                        if (!System.IO.File.Exists(imgFileName)) return;
                        Image newImage;
                        imgAll.LoadBitmapFromFile(imgFileName);
                        if (imgAll.GetBitmap().PixelFormat == PixelFormat.Format24bppRgb)
                        {
                            imgAll.GetLZW("tmp1.TIF");
                            imgTot = Image.FromFile("tmp1.TIF");
                            newImage = imgTot;
                            //File.Delete("tmp1.TIF");
                        }
                        else
                        {
                            newImage = System.Drawing.Image.FromFile(imgFileName);
                        }

                        double scaleX = (double)picControl.Width / (double)newImage.Width;
                        double scaleY = (double)picControl.Height / (double)newImage.Height;
                        double Scale = Math.Min(scaleX, scaleY);
                        int w = (int)(newImage.Width * Scale);
                        int h = (int)(newImage.Height * Scale);
                        picControl.Width = w;
                        picControl.Height = h;
                        picControl.Image = newImage.GetThumbnailImage(w, h, new System.Drawing.Image.GetThumbnailImageAbort(GetThumbnailImageAbort), IntPtr.Zero);
                        newImage.Dispose();
                        picControl.Refresh();
                        if (imgTot != null)
                        {
                            imgTot.Dispose();
                            imgTot = null;
                            if (File.Exists("tmp1.tif"))
                                File.Delete("tmp1.TIF");
                        }
                    }
                    else
                    {
                        picControl.Height = tabControl1.Height - 75;
                        picControl.Width = tabControl2.Width - 100;
                        img.LoadBitmapFromFile(imgFileName);
                        picControl.Image = img.GetBitmap();
                        picControl.SizeMode = PictureBoxSizeMode.StretchImage;
                        picControl.Refresh();
                    }
                }
            }
            catch (Exception ex)
            {
                exMailLog.Log(ex);
                MessageBox.Show("Error ..." + ex.Message, "Error");
            }
        }
        private void lstImage_SelectedIndexChanged(object sender, EventArgs e)
        {
            int pos;
            string changedImage = null;
            double fileSize;
            string currntDoc;
            wfeImage wImage = null;
            //string photoImageName=null;

            try
            {
                pos = lstImage.SelectedItem.ToString().IndexOf("-");
                if(pos < 0)
                {
                    changedImage = lstImage.SelectedItem.ToString();
                }
                else
                { changedImage = lstImage.SelectedItem.ToString().Substring(0, pos); }
                
                //changedImage=lstImage.SelectedItem.ToString().Substring(0,pos);
                pImage = new CtrlImage(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()), boxNo, policyNumber, changedImage, string.Empty);
                wImage = new wfeImage(sqlCon, pImage);
                changedImage = wImage.GetIndexedImageName();

                if ((policyStatus == (int)4) || (policyStatus == (int)eSTATES.POLICY_CHECKED) || (policyStatus == (int)eSTATES.POLICY_EXCEPTION) || (policyStatus == (int)eSTATES.POLICY_EXPORTED))
                {
                    if (Directory.Exists(policyPath + "\\" + ihConstants._FQC_FOLDER))
                    {
                        picPath = policyPath + "\\" + ihConstants._FQC_FOLDER;
                        imagePath = policyPath + "\\" + ihConstants._FQC_FOLDER + "\\" + changedImage;
                        if (changedImage.Substring(policyLen, 6) == "_000_A")
                        {
                            imgFileName = policyPath + "\\" + ihConstants._FQC_FOLDER + "\\" + changedImage;
                            if (File.Exists(imgFileName) == false)
                            {
                                imgFileName = policyPath + "\\" + ihConstants._FQC_FOLDER + "\\" + changedImage;
                                picPath = policyPath + "\\" + ihConstants._FQC_FOLDER;
                            }
                            //img.SaveAsTiff(policyPath + "\\" + ihConstants._FQC_FOLDER + "\\" + changedImage, IGRComressionTIFF.JPEG);
                            photoPath = imagePath;
                        }
                        else
                        {
                            imgFileName = policyPath + "\\" + ihConstants._FQC_FOLDER + "\\" + changedImage;
                            if (File.Exists(imgFileName) == true)
                            {
                                imgFileName = policyPath + "\\" + ihConstants._FQC_FOLDER + "\\" + changedImage;
                                picPath = policyPath + "\\" + ihConstants._FQC_FOLDER;
                            }
                        }
                    }
                    else
                    {
                        imagePath = policyPath + "\\" + ihConstants._FQC_FOLDER + "\\" + changedImage;
                        picPath = policyPath + "\\" + ihConstants._FQC_FOLDER;
                        if (changedImage.Substring(policyLen, 6) == "_000_A")
                        {
                            imgFileName = policyPath + "\\" + ihConstants._FQC_FOLDER + "\\" + changedImage;
                            img.LoadBitmapFromFile(imgFileName);
                            //img.SaveAsTiff(policyPath + "\\" + ihConstants._INDEXING_FOLDER + "\\" + changedImage, IGRComressionTIFF.JPEG);
                            photoPath = imagePath;
                        }
                        else
                        {
                            imgFileName = policyPath + "\\" + ihConstants._FQC_FOLDER + "\\" + changedImage;

                        }
                    }

                }
                else
                {
                    picPath = policyPath + "\\" + ihConstants._FQC_FOLDER;
                    imagePath = policyPath + "\\" + ihConstants._FQC_FOLDER + "\\" + changedImage;
                    if (changedImage.Substring(policyLen, 6) == "_000_A")
                    {
                        imgFileName = policyPath + "\\" + ihConstants._FQC_FOLDER + "\\" + changedImage;
                        if (File.Exists(imgFileName) == true)
                        {
                            imgFileName = policyPath + "\\" + ihConstants._FQC_FOLDER + "\\" + changedImage;
                            picPath = policyPath + "\\" + ihConstants._FQC_FOLDER;
                        }
                        //img.SaveAsTiff(policyPath + "\\" + ihConstants._FQC_FOLDER + "\\" + changedImage, IGRComressionTIFF.JPEG);
                        photoPath = imagePath;
                    }
                    else
                    {
                        imgFileName = policyPath + "\\" + ihConstants._FQC_FOLDER + "\\" + changedImage;
                        if (File.Exists(imgFileName) == false)
                        {
                            imgFileName = policyPath + "\\" + ihConstants._FQC_FOLDER + "\\" + changedImage;
                            picPath = policyPath + "\\" + ihConstants._FQC_FOLDER;
                        }
                    }

                }
                System.IO.FileInfo info = new System.IO.FileInfo(imgFileName);

                fileSize = info.Length;
                fileSize = fileSize / 1024;
                lblImageSize.Text = Convert.ToString(Math.Round(fileSize, 2)) + " KB";
                img.LoadBitmapFromFile(imgFileName);
                int dashPos = lstImage.SelectedItem.ToString().IndexOf("-") + 1;
                //currntDoc = lstImage.Items[lstImage.SelectedIndex].ToString().Substring(dashPos);

                //if ((prevDoc != currntDoc))
                //{
                //    ListViewItem lvwItem = lvwDockTypes.FindItemWithText(currntDoc);
                //    lvwDockTypes.Items[lvwItem.Index].Selected = true;
                //}
                //firstDoc = false;
                if (imgFileName != string.Empty)
                {
                    ChangeSize();
                }
                //prevDoc = currntDoc;
                //ChangeSize();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error while generating the preview....");
                exMailLog.Log(ex);
            }
        }

        private void cmdNext_Click(object sender, EventArgs e)
        {
            ListViewItem lvwItem;
            if (tabControl2.SelectedIndex == 0)
            {
                if (lstImage.Items.Count > 0)
                {
                    if ((lstImage.Items.Count - 1) != lstImage.SelectedIndex)
                    {
                        lstImage.SelectedIndex = lstImage.SelectedIndex + 1;
                    }
                }
                if (tabControl2.SelectedIndex == 1)
                {
                    if (lstImage.SelectedIndex != 0)
                    {
                        int dashPos = lstImage.SelectedItem.ToString().IndexOf("-") + 1;
                        string currntDoc = lstImage.Items[lstImage.SelectedIndex - 1].ToString().Substring(dashPos);
                        string prevDoc = lstImage.Items[lstImage.SelectedIndex].ToString().Substring(dashPos);
                        if (currntDoc != prevDoc)
                        {
                            lvwItem = lvwDockTypes.FindItemWithText(prevDoc);
                            lvwDockTypes.Items[lvwItem.Index].Selected = true;
                            lvwDockTypes.Focus();
                            //lstImage.Focus();
                        }
                    }
                }
            }
        }
        private void ThumbnailChangeSize(string fName)
        {
            Image imgTot = null;
            try
            {
                //picBig.Height = tabControl1.Height - 75;
                //picBig.Width = tabControl2.Width - 30;
                //if (!System.IO.File.Exists(fName)) return;
                //Image newImage;
                //imgAll.LoadBitmapFromFile(fName);
                //if (imgAll.GetBitmap().PixelFormat == PixelFormat.Format24bppRgb)
                //{
                //    imgAll.GetLZW("tmp1.TIF");
                //    imgTot = Image.FromFile("tmp1.TIF");
                //    newImage = imgTot;
                //}
                //else
                //{
                //    newImage = System.Drawing.Image.FromFile(fName);
                //}
                //double scaleX = (double)picBig.Width / (double)newImage.Width;
                //double scaleY = (double)picBig.Height / (double)newImage.Height;
                //double Scale = Math.Min(scaleX, scaleY);
                //int w = (int)(newImage.Width * Scale);
                //int h = (int)(newImage.Height * Scale);
                //picBig.Width = w;
                //picBig.Height = h;
                //picBig.Image = newImage.GetThumbnailImage(w, h, new System.Drawing.Image.GetThumbnailImageAbort(GetThumbnailImageAbort), IntPtr.Zero);
                //newImage.Dispose();
                //picBig.Refresh();
                //if (imgTot != null)
                //{
                //    imgTot.Dispose();
                //    imgTot = null;
                //    if (File.Exists("tmp1.tif"))
                //        File.Delete("tmp1.TIF");
                //}
            }
            catch (Exception ex)
            {
                exMailLog.Log(ex);
                MessageBox.Show("Error ..." + ex.Message, "Error");
            }
        }
        private void cmdPrevious_Click(object sender, EventArgs e)
        {
            ListViewItem lvwItem;
            if (tabControl2.SelectedIndex == 0)
            {
                if (lstImage.SelectedIndex != 0)
                {
                    lstImage.SelectedIndex = lstImage.SelectedIndex - 1;
                }
                if (tabControl2.SelectedIndex == 1)
                {
                    if (lstImage.SelectedIndex != 0)
                    {
                        int dashPos = lstImage.SelectedItem.ToString().IndexOf("-") + 1;
                        string currntDoc = lstImage.Items[lstImage.SelectedIndex].ToString().Substring(dashPos);
                        string prevDoc = lstImage.Items[lstImage.SelectedIndex + 1].ToString().Substring(dashPos);
                        if (currntDoc != prevDoc)
                        {
                            lvwItem = lvwDockTypes.FindItemWithText(currntDoc);
                            lvwDockTypes.Items[lvwItem.Index].Selected = true;
                            lvwDockTypes.Focus();
                        }
                    }
                }
            }
        }

        private void cmdZoomIn_Click(object sender, EventArgs e)
        {
            ZoomIn();
        }

        private void cmdZoomOut_Click(object sender, EventArgs e)
        {
            ZoomIn();
        }
        int ZoomIn()
        {
            try
            {
                if (img.IsValid() == true)
                {
                    picControl.Dock = DockStyle.None;
                    //OperationInProgress = ihConstants._OTHER_OPERATION;
                    keyPressed = keyPressed + 1;
                    zoomHeight = Convert.ToInt32(img.GetBitmap().Height * (1.2));
                    zoomWidth = Convert.ToInt32(img.GetBitmap().Width * (1.2));
                    zoomSize.Height = zoomHeight;
                    zoomSize.Width = zoomWidth;

                    picControl.Width = Convert.ToInt32(Convert.ToDouble(picControl.Width) * 1.2);
                    picControl.Height = Convert.ToInt32(Convert.ToDouble(picControl.Height) * 1.2);
                    picControl.Refresh();
                    ChangeZoomSize();

                    //delinsrtBol = false;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error while zooming the image " + ex.Message, "Zoom Error");
                exMailLog.Log(ex);
            }
            return 0;
        }
        int ZoomOut()
        {
            try
            {
                if (keyPressed > 0)
                {
                    picControl.Dock = DockStyle.None;
                    //OperationInProgress = ihConstants._OTHER_OPERATION;
                    keyPressed = keyPressed + 1;
                    zoomHeight = Convert.ToInt32(img.GetBitmap().Height / (1.2));
                    zoomWidth = Convert.ToInt32(img.GetBitmap().Width / (1.2));
                    zoomSize.Height = zoomHeight;
                    zoomSize.Width = zoomWidth;

                    picControl.Width = Convert.ToInt32(Convert.ToDouble(picControl.Width) / 1.2);
                    picControl.Height = Convert.ToInt32(Convert.ToDouble(picControl.Height) / 1.2);
                    picControl.Refresh();
                    ChangeZoomSize();
                    //delinsrtBol = false;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error while zooming the image " + ex.Message, "Zoom Error");
            }
            return 0;
        }
        private void ChangeZoomSize()
        {
            if (!System.IO.File.Exists(imgFileName)) return;
            Image newImage = Image.FromFile(imgFileName);
            double scaleX = (double)picControl.Width / (double)newImage.Width;
            double scaleY = (double)picControl.Height / (double)newImage.Height;
            double Scale = Math.Min(scaleX, scaleY);
            int w = (int)(newImage.Width * Scale);
            int h = (int)(newImage.Height * Scale);
            picControl.Width = w;
            picControl.Height = h;
            picControl.Image = newImage.GetThumbnailImage(w, h, new System.Drawing.Image.GetThumbnailImageAbort(GetThumbnailImageAbort), IntPtr.Zero);
            picControl.Invalidate();
            newImage.Dispose();
        }

        private void tabControl2_TabIndexChanged(object sender, EventArgs e)
        {
            if (imgFileName != string.Empty)
            {
                if (tabControl2.SelectedIndex == 0)
                    ChangeSize();
                ThumbnailChangeSize(imgFileName);
            }
        }

        private void tabControl2_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListViewItem lvwItem;
            string currntDoc = string.Empty;
            if (tabControl2.SelectedIndex == 1)
            {
                firstDoc = false;
                for (int i = 0; i < lvwDockTypes.Items.Count; i++)
                {
                    if (lvwDockTypes.Items[i].Selected == true)
                    {
                        currntDoc = lvwDockTypes.Items[i].SubItems[0].Text;
                        break;
                    }
                }
                if (currntDoc != string.Empty)
                {
                    lvwItem = lvwDockTypes.FindItemWithText(currntDoc);
                    lvwDockTypes.Items[lvwItem.Index].Selected = true;
                }
            }
            else
            {
                ChangeSize();
            }
            lvwDockTypes.Focus();
        }

        private void pictureBox1_DoubleClick(object sender, EventArgs e)
        {

            //Bitmap bmp;
            //picBig.Image = null;
            if (imageName != null)
            {
                if (imageName.Length >= 1)
                {
                    //ThumbnailChangeSize(pictureBox1.Tag.ToString());

                    int lstIndex;
                    lstIndex = (currntPg * 6) + 0 + GetDocTypePos();

                    if (lstIndex < lstImage.Items.Count)
                    {
                        lstImage.SelectedIndex = lstIndex;
                    }
                    tabControl2.SelectedIndex = 0;
                    lvwDockTypes.Focus();
                    //picBig.Visible = true;
                    //panelBig.Visible = true;
                }
            }
        }

        private void pictureBox2_DoubleClick(object sender, EventArgs e)
        {
            //Bitmap bmp;
            //picBig.Image = null;
            if (imageName != null)
            {
                if (imageName.Length >= 2)
                {

                    //ThumbnailChangeSize(pictureBox2.Tag.ToString());
                    int lstIndex;
                    lstIndex = (currntPg * 6) + 1 + GetDocTypePos();
                    if (lstIndex < lstImage.Items.Count)
                    {
                        lstImage.SelectedIndex = lstIndex;
                    }
                    tabControl2.SelectedIndex = 0;
                    lvwDockTypes.Focus();
                    //picBig.Visible = true;
                    //panelBig.Visible = true;
                }
            }
        }

        private void pictureBox3_DoubleClick(object sender, EventArgs e)
        {
            //picBig.Image = null;
            if (imageName != null)
            {
                if (imageName.Length >= 3)
                {

                    //ThumbnailChangeSize(pictureBox3.Tag.ToString());
                    int lstIndex;
                    lstIndex = (currntPg * 6) + 2 + GetDocTypePos();
                    if (lstIndex < lstImage.Items.Count)
                    {
                        lstImage.SelectedIndex = lstIndex;
                    }
                    tabControl2.SelectedIndex = 0;
                    lvwDockTypes.Focus();
                    //picBig.Visible = true;
                    //panelBig.Visible = true;
                }
            }
        }

        private void pictureBox4_DoubleClick(object sender, EventArgs e)
        {
            //Bitmap bmp;
            //picBig.Image = null;
            if (imageName != null)
            {
                if (imageName.Length >= 4)
                {

                    //ThumbnailChangeSize(pictureBox4.Tag.ToString());
                    int lstIndex;
                    lstIndex = (currntPg * 6) + 3 + GetDocTypePos();
                    if (lstIndex < lstImage.Items.Count)
                    {
                        lstImage.SelectedIndex = lstIndex;
                    }
                    tabControl2.SelectedIndex = 0;
                    lvwDockTypes.Focus();
                    //picBig.Visible = true;
                    //panelBig.Visible = true;
                }
            }
        }

        private void pictureBox5_DoubleClick(object sender, EventArgs e)
        {
            //Bitmap bmp;
            //picBig.Image = null;
            if (imageName != null)
            {
                if (imageName.Length >= 5)
                {

                    //ThumbnailChangeSize(pictureBox5.Tag.ToString());
                    int lstIndex;
                    lstIndex = (currntPg * 6) + 4 + GetDocTypePos();
                    if (lstIndex < lstImage.Items.Count)
                    {
                        lstImage.SelectedIndex = lstIndex;
                    }
                    tabControl2.SelectedIndex = 0;
                    lvwDockTypes.Focus();
                    //picBig.Visible = true;
                    //panelBig.Visible = true;
                }
            }
        }
        private int GetDocTypePos()
        {
            string currntDoc;
            int index = 0;
            string srchStr;
            for (int i = 0; i < lvwDockTypes.Items.Count; i++)
            {
                if (lvwDockTypes.Items[i].Selected == true)
                {
                    currntDoc = lvwDockTypes.Items[i].SubItems[0].Text;
                    for (int j = 0; j < lstImage.Items.Count; j++)
                    {
                        srchStr = lstImage.Items[j].ToString();
                        if (srchStr.IndexOf(currntDoc) > 0)
                        {
                            index = j;
                            break;
                        }
                    }
                    break;
                }
            }
            return index;
        }
        private void pictureBox6_DoubleClick(object sender, EventArgs e)
        {
            //Bitmap bmp;
            //picBig.Image = null;
            if (imageName != null)
            {
                if (imageName.Length >= 6)
                {

                    //ThumbnailChangeSize(pictureBox6.Tag.ToString());
                    int lstIndex;
                    lstIndex = (currntPg * 6) + 5 + GetDocTypePos();
                    if (lstIndex < lstImage.Items.Count)
                    {
                        lstImage.SelectedIndex = lstIndex;
                    }
                    tabControl2.SelectedIndex = 0;
                    lvwDockTypes.Focus();
                    //picBig.Visible = true;
                    //panelBig.Visible = true;
                }
            }
        }

        private void pgOne_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            string imageFileName;
            Image imgNew = null;
            tabControl2.SelectedIndex = 1;

            System.Drawing.Image imgThumbNail = null;
            ClearPicBox();
            for (int i = 0; i < imageName.Length; i++)
            {
                imageFileName = imageName[i];
                if (!System.IO.File.Exists(imageFileName)) return;
                imgAll.LoadBitmapFromFile(imageFileName);

                if (imgAll.GetBitmap().PixelFormat == PixelFormat.Format24bppRgb)
                {
                    try
                    {
                        imgAll.GetLZW("tmp.TIF");
                        imgNew = Image.FromFile("tmp.TIF");
                        imgThumbNail = imgNew;
                    }
                    catch (Exception ex)
                    {
                        string err = ex.Message;
                    }
                }
                else
                {
                    imgThumbNail = System.Drawing.Image.FromFile(imageFileName);
                }
                double scaleX = (double)pictureBox1.Width / (double)imgThumbNail.Width;
                double scaleY = (double)pictureBox1.Height / (double)imgThumbNail.Height;
                double Scale = Math.Min(scaleX, scaleY);
                int w = (int)(imgThumbNail.Width * Scale);
                int h = (int)(imgThumbNail.Height * Scale);
                w = w - 5;
                imgThumbNail = imgThumbNail.GetThumbnailImage(w, h, new System.Drawing.Image.GetThumbnailImageAbort(GetThumbnailImageAbort), IntPtr.Zero);
                currntPg = 0;
                if (i == 0)
                {
                    pictureBox1.Image = imgThumbNail;
                    pictureBox1.Tag = imageFileName;
                }
                if (i == 1)
                {
                    pictureBox2.Image = imgThumbNail;
                    pictureBox2.Tag = imageFileName;
                }
                if (i == 2)
                {
                    pictureBox3.Image = imgThumbNail;
                    pictureBox3.Tag = imageFileName;
                }
                if (i == 3)
                {
                    pictureBox4.Image = imgThumbNail;
                    pictureBox4.Tag = imageFileName;
                }
                if (i == 4)
                {
                    pictureBox5.Image = imgThumbNail;
                    pictureBox5.Tag = imageFileName;
                }
                if (i == 5)
                {
                    pictureBox6.Image = imgThumbNail;
                    pictureBox6.Tag = imageFileName;
                }
                if (imgNew != null)
                {
                    imgNew.Dispose();
                    imgNew = null;
                    if (File.Exists("tmp.tif"))
                        File.Delete("tmp.TIF");
                }
            }
        }

        private void pgTwo_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            string imageFileName;
            Image imgNew = null;
            tabControl2.SelectedIndex = 1;

            System.Drawing.Image imgThumbNail = null;
            ClearPicBox();
            for (int i = 6; i < imageName.Length; i++)
            {
                imageFileName = imageName[i];
                if (!System.IO.File.Exists(imageFileName)) return;
                imgAll.LoadBitmapFromFile(imageFileName);
                currntPg = 1;
                if (imgAll.GetBitmap().PixelFormat == PixelFormat.Format24bppRgb)
                {
                    try
                    {
                        imgAll.GetLZW("tmp.TIF");
                        imgNew = Image.FromFile("tmp.TIF");
                        imgThumbNail = imgNew;
                    }
                    catch (Exception ex)
                    {
                        string err = ex.Message;
                    }
                }
                else
                {
                    imgThumbNail = System.Drawing.Image.FromFile(imageFileName);
                }
                double scaleX = (double)pictureBox1.Width / (double)imgThumbNail.Width;
                double scaleY = (double)pictureBox1.Height / (double)imgThumbNail.Height;
                double Scale = Math.Min(scaleX, scaleY);
                int w = (int)(imgThumbNail.Width * Scale);
                int h = (int)(imgThumbNail.Height * Scale);
                w = w - 5;
                imgThumbNail = imgThumbNail.GetThumbnailImage(w, h, new System.Drawing.Image.GetThumbnailImageAbort(GetThumbnailImageAbort), IntPtr.Zero);

                if (i == 6)
                {
                    pictureBox1.Image = imgThumbNail;
                    pictureBox1.Tag = imageFileName;
                }
                if (i == 7)
                {
                    pictureBox2.Image = imgThumbNail;
                    pictureBox2.Tag = imageFileName;
                }
                if (i == 8)
                {
                    pictureBox3.Image = imgThumbNail;
                    pictureBox3.Tag = imageFileName;
                }
                if (i == 9)
                {
                    pictureBox4.Image = imgThumbNail;
                    pictureBox4.Tag = imageFileName;
                }
                if (i == 10)
                {
                    pictureBox5.Image = imgThumbNail;
                    pictureBox5.Tag = imageFileName;
                }
                if (i == 11)
                {
                    pictureBox6.Image = imgThumbNail;
                    pictureBox6.Tag = imageFileName;
                }
                if (imgNew != null)
                {
                    imgNew.Dispose();
                    imgNew = null;
                    if (File.Exists("tmp.tif"))
                        File.Delete("tmp.TIF");
                }
            }
        }

        private void pgThree_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            string imageFileName;
            Image imgNew = null;
            tabControl2.SelectedIndex = 1;

            System.Drawing.Image imgThumbNail = null;
            ClearPicBox();
            for (int i = 0; i < imageName.Length; i++)
            {
                imageFileName = imageName[i];
                if (!System.IO.File.Exists(imageFileName)) return;
                imgAll.LoadBitmapFromFile(imageFileName);
                currntPg = 2;
                if (imgAll.GetBitmap().PixelFormat == PixelFormat.Format24bppRgb)
                {
                    try
                    {
                        imgAll.GetLZW("tmp.TIF");
                        imgNew = Image.FromFile("tmp.TIF");
                        imgThumbNail = imgNew;
                    }
                    catch (Exception ex)
                    {
                        string err = ex.Message;
                    }
                }
                else
                {
                    imgThumbNail = System.Drawing.Image.FromFile(imageFileName);
                }
                double scaleX = (double)pictureBox1.Width / (double)imgThumbNail.Width;
                double scaleY = (double)pictureBox1.Height / (double)imgThumbNail.Height;
                double Scale = Math.Min(scaleX, scaleY);
                int w = (int)(imgThumbNail.Width * Scale);
                int h = (int)(imgThumbNail.Height * Scale);
                w = w - 5;
                imgThumbNail = imgThumbNail.GetThumbnailImage(w, h, new System.Drawing.Image.GetThumbnailImageAbort(GetThumbnailImageAbort), IntPtr.Zero);

                if (i == 12)
                {
                    pictureBox1.Image = imgThumbNail;
                    pictureBox1.Tag = imageFileName;
                }
                if (i == 13)
                {
                    pictureBox2.Image = imgThumbNail;
                    pictureBox2.Tag = imageFileName;
                }
                if (i == 14)
                {
                    pictureBox3.Image = imgThumbNail;
                    pictureBox3.Tag = imageFileName;
                }
                if (imgNew != null)
                {
                    imgNew.Dispose();
                    imgNew = null;
                    if (File.Exists("tmp.tif"))
                        File.Delete("tmp.TIF");
                }
            }
        }

        private void chkMissingImg_CheckedChanged(object sender, EventArgs e)
        {
            int tifPos;
            string origDoctype = string.Empty;
            if (lstImage.SelectedIndex >= 0)
            {
                tifPos = lstImage.SelectedItem.ToString().IndexOf("-") + 1;
                string imgNumber;
                imgNumber = lstImage.SelectedItem.ToString().Substring((lstImage.SelectedItem.ToString().IndexOf("_") + 1), 5);
                if (tifPos > 0)
                {
                    origDoctype = lstImage.SelectedItem.ToString().Substring(tifPos);
                }
                if (chkMissingImg.Checked)
                {
                    txtComments.Text = txtComments.Text + imgNumber + "-" + origDoctype + " Missing image \r\n";
                    txtComments.SelectionStart = txtComments.Text.Length;
                    txtComments.ScrollToCaret();
                    txtComments.Refresh();
                }
                else
                {
                    string strToReplace;
                    strToReplace = imgNumber + "-" + origDoctype + " Missing image \r\n";
                    txtComments.Text = txtComments.Text.Replace(strToReplace, "");
                }
            }
        }

        private void chkPoorScan_CheckedChanged(object sender, EventArgs e)
        {
            int tifPos;
            string origDoctype = string.Empty;
            string imgNumber;
            if (lstImage.SelectedIndex >= 0)
            {
                tifPos = lstImage.SelectedItem.ToString().IndexOf("-") + 1;
                imgNumber = lstImage.SelectedItem.ToString().Substring((lstImage.SelectedItem.ToString().IndexOf("_") + 1), 5);
                if (tifPos > 0)
                {
                    origDoctype = lstImage.SelectedItem.ToString().Substring(tifPos);
                }
                if (chkPoorScan.Checked)
                {
                    txtComments.Text = txtComments.Text + imgNumber + "-" + origDoctype + " Poor scan quality \r\n";
                    txtComments.SelectionStart = txtComments.Text.Length;
                    txtComments.ScrollToCaret();
                    txtComments.Refresh();
                }
                else
                {
                    string strToReplace;
                    strToReplace = imgNumber + "-" + origDoctype + " Poor scan quality \r\n";
                    txtComments.Text = txtComments.Text.Replace(strToReplace, "");
                }
            }
        }

        private void chkDesicion_CheckedChanged(object sender, EventArgs e)
        {
            int tifPos;
            string origDoctype = string.Empty;
            string imgNumber;
            if (lstImage.SelectedIndex >= 0)
            {
                tifPos = lstImage.SelectedItem.ToString().IndexOf("-") + 1;
                imgNumber = lstImage.SelectedItem.ToString().Substring((lstImage.SelectedItem.ToString().IndexOf("_") + 1), 5);
                if (tifPos > 0)
                {
                    origDoctype = lstImage.SelectedItem.ToString().Substring(tifPos);
                }
                if (chkDesicion.Checked)
                {
                    txtComments.Text = txtComments.Text + imgNumber + "-" + origDoctype + " Desicion misd \r\n";
                    txtComments.SelectionStart = txtComments.Text.Length;
                    txtComments.ScrollToCaret();
                    txtComments.Refresh();
                }
                else
                {
                    string strToReplace;
                    strToReplace = imgNumber + "-" + origDoctype + " Desicion misd \r\n";
                    txtComments.Text = txtComments.Text.Replace(strToReplace, "");
                }
            }
        }

        private void chkExtraPage_CheckedChanged(object sender, EventArgs e)
        {
            int tifPos;
            string origDoctype = string.Empty;
            if (lstImage.SelectedIndex >= 0)
            {
                tifPos = lstImage.SelectedItem.ToString().IndexOf("-") + 1;
                string imgNumber;
                imgNumber = lstImage.SelectedItem.ToString().Substring((lstImage.SelectedItem.ToString().IndexOf("_") + 1), 5);
                if (tifPos > 0)
                {
                    origDoctype = lstImage.SelectedItem.ToString().Substring(tifPos);
                }
                if (chkExtraPage.Checked)
                {
                    txtComments.Text = txtComments.Text + imgNumber + "-" + origDoctype + " Extra page \r\n";
                    txtComments.SelectionStart = txtComments.Text.Length;
                    txtComments.ScrollToCaret();
                    txtComments.Refresh();
                }
                else
                {
                    string strToReplace;
                    strToReplace = imgNumber + "-" + origDoctype + " Extra page \r\n";
                    txtComments.Text = txtComments.Text.Replace(strToReplace, "");
                }
            }
        }

        private void chkMove_CheckedChanged(object sender, EventArgs e)
        {
            int tifPos;
            string origDoctype = string.Empty;
            if (lstImage.SelectedIndex >= 0)
            {
                tifPos = lstImage.SelectedItem.ToString().IndexOf("-") + 1;
                string imgNumber;
                imgNumber = lstImage.SelectedItem.ToString().Substring((lstImage.SelectedItem.ToString().IndexOf("_") + 1), 5);
                if (tifPos > 0)
                {
                    origDoctype = lstImage.SelectedItem.ToString().Substring(tifPos);
                }
                if (chkMove.Checked)
                {
                    txtComments.Text = txtComments.Text + imgNumber + "-" + origDoctype + " Move to respective file \r\n";
                    txtComments.SelectionStart = txtComments.Text.Length;
                    txtComments.ScrollToCaret();
                    txtComments.Refresh();
                }
                else
                {
                    string strToReplace;
                    strToReplace = imgNumber + "-" + origDoctype + " Move to respective file \r\n";
                    txtComments.Text = txtComments.Text.Replace(strToReplace, "");
                }
            }
        }

        private void chkLinkedPolicy_CheckedChanged(object sender, EventArgs e)
        {
            int tifPos;
            string origDoctype = string.Empty;

            if (lstImage.SelectedIndex >= 0)
            {
                tifPos = lstImage.SelectedItem.ToString().IndexOf("-") + 1;
                string imgNumber;
                imgNumber = lstImage.SelectedItem.ToString().Substring((lstImage.SelectedItem.ToString().IndexOf("_") + 1), 5);
                if (tifPos > 0)
                {
                    origDoctype = lstImage.SelectedItem.ToString().Substring(tifPos);
                }
                if (chkLinkedPolicy.Checked)
                {
                    txtComments.Text = txtComments.Text + imgNumber + "-" + origDoctype + " Linked file problem \r\n";
                    txtComments.SelectionStart = txtComments.Text.Length;
                    txtComments.ScrollToCaret();
                    txtComments.Refresh();
                }
                else
                {
                    string strToReplace;
                    strToReplace = imgNumber + "-" + origDoctype + " Linked file problem \r\n";
                    txtComments.Text = txtComments.Text.Replace(strToReplace, "");
                }
            }
        }

        private void chkCropClean_CheckedChanged(object sender, EventArgs e)
        {
            int tifPos;
            string origDoctype = string.Empty;
            string imgNumber;
            if (lstImage.SelectedIndex >= 0)
            {
                tifPos = lstImage.SelectedItem.ToString().IndexOf("-") + 1;
                imgNumber = lstImage.SelectedItem.ToString().Substring((lstImage.SelectedItem.ToString().IndexOf("_") + 1), 5);
                if (tifPos > 0)
                {
                    origDoctype = lstImage.SelectedItem.ToString().Substring(tifPos);
                }
                if (chkCropClean.Checked)
                {
                    txtComments.Text = txtComments.Text + imgNumber + "-" + origDoctype + " Crop clean problem \r\n";
                    txtComments.SelectionStart = txtComments.Text.Length;
                    txtComments.ScrollToCaret();
                    txtComments.Refresh();
                }
                else
                {
                    string strToReplace;
                    strToReplace = imgNumber + "-" + origDoctype + " Crop clean problem \r\n";
                    txtComments.Text = txtComments.Text.Replace(strToReplace, "");
                }
            }
        }

        private void chkIndexing_CheckedChanged(object sender, EventArgs e)
        {
            int tifPos;
            string origDoctype = string.Empty;
            if (lstImage.SelectedIndex >= 0)
            {
                tifPos = lstImage.SelectedItem.ToString().IndexOf("-") + 1;
                string imgNumber;
                imgNumber = lstImage.SelectedItem.ToString().Substring((lstImage.SelectedItem.ToString().IndexOf("_") + 1), 5);
                if (tifPos > 0)
                {
                    origDoctype = lstImage.SelectedItem.ToString().Substring(tifPos);
                }
                if (chkIndexing.Checked)
                {
                    txtComments.Text = txtComments.Text + imgNumber + "-" + origDoctype + " Wrong doc type \r\n";
                    txtComments.SelectionStart = txtComments.Text.Length;
                    txtComments.ScrollToCaret();
                    txtComments.Refresh();
                }
                else
                {
                    string strToReplace;
                    strToReplace = imgNumber + "-" + origDoctype + " Wrong doc type \r\n";
                    txtComments.Text = txtComments.Text.Replace(strToReplace, "");
                }
            }
        }

        private void chkOther_CheckedChanged(object sender, EventArgs e)
        {
            int tifPos;
            string origDoctype = string.Empty;
            string imgNumber;
            if (lstImage.SelectedIndex >= 0)
            {
                tifPos = lstImage.SelectedItem.ToString().IndexOf("-") + 1;
                imgNumber = lstImage.SelectedItem.ToString().Substring((lstImage.SelectedItem.ToString().IndexOf("_") + 1), 5);
                if (tifPos > 0)
                {
                    origDoctype = lstImage.SelectedItem.ToString().Substring(tifPos);
                }
                if (chkOther.Checked)
                {
                    txtComments.Text = txtComments.Text + imgNumber + "-" + origDoctype + " Other \r\n";
                    txtComments.SelectionStart = txtComments.Text.Length;
                    txtComments.ScrollToCaret();
                    txtComments.Refresh();
                }
                else
                {
                    string strToReplace;
                    strToReplace = imgNumber + "-" + origDoctype + " Other \r\n";
                    txtComments.Text = txtComments.Text.Replace(strToReplace, "");
                }
            }
        }

        private void chkRearrange_CheckedChanged(object sender, EventArgs e)
        {
            int tifPos;
            string origDoctype = string.Empty;
            if (lstImage.SelectedIndex >= 0)
            {
                tifPos = lstImage.SelectedItem.ToString().IndexOf("-") + 1;
                string imgNumber;
                imgNumber = lstImage.SelectedItem.ToString().Substring((lstImage.SelectedItem.ToString().IndexOf("_") + 1), 5);
                if (tifPos > 0)
                {
                    origDoctype = lstImage.SelectedItem.ToString().Substring(tifPos);
                }
                if (chkRearrange.Checked)
                {
                    txtComments.Text = txtComments.Text + imgNumber + "-" + origDoctype + " Rearrange error \r\n";
                    txtComments.SelectionStart = txtComments.Text.Length;
                    txtComments.ScrollToCaret();
                    txtComments.Refresh();
                }
                else
                {
                    string strToReplace;
                    strToReplace = imgNumber + "-" + origDoctype + " Rearrange error \r\n";
                    txtComments.Text = txtComments.Text.Replace(strToReplace, "");
                }
            }
        }
        public bool UpdateStatus(eSTATES state, Credentials prmCrd)
        {
            string sqlStr = null;
            OdbcTransaction sqlTrans = null;
            bool commitBol = true;
            OdbcCommand sqlCmd = new OdbcCommand();

            sqlStr = @"update case_file_master" +
                " set status=" + (int)state + ",modified_by='" + prmCrd.created_by + "',modified_dttm='" + prmCrd.created_dttm + "' where proj_code=" + projCode +
                " and bundle_key=" + batchCode + " " +
                " and filename='" + policyNumber + "' and status<>" + (int)eSTATES.POLICY_EXPORTED;

            try
            {

                sqlTrans = sqlCon.BeginTransaction();
                sqlCmd.Connection = sqlCon;
                sqlCmd.Transaction = sqlTrans;
                sqlCmd.CommandText = sqlStr;
                int i = sqlCmd.ExecuteNonQuery();
                sqlTrans.Commit();
                if (i > 0)
                {
                    commitBol = true;
                }
                else
                {
                    commitBol = false;
                }
            }
            catch (Exception ex)
            {
                commitBol = false;
                sqlTrans.Rollback();
                sqlCmd.Dispose();
                
                exMailLog.Log(ex);
            }
            return commitBol;
        }
        private void cmdAccepted_Click(object sender, EventArgs e)
        {
            string pageName;
            try
            {
                if (crd.role == ihConstants._LIC_ROLE)
                {
                    if (chkReadyUat.Checked == false)
                    {
                        if (lstImage.Items.Count > 0)
                        {
                            pPolicy = new CtrlPolicy(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()), boxNo, policyNumber);
                            wfePolicy wPolicy = new wfePolicy(sqlCon, pPolicy);
                            UpdateStatus(eSTATES.POLICY_CHECKED, crd);

                            //for (int i = 0; i < lstImage.Items.Count; i++)
                            //{
                            //    pageName = lstImage.Items[i].ToString().Substring(0, lstImage.Items[i].ToString().IndexOf("-"));
                            //    pImage = new CtrlImage(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()), Convert.ToInt32(boxNo), Convert.ToInt32(policyNumber), pageName, string.Empty);
                            //    wfeImage wImage = new wfeImage(sqlCon, pImage);
                            //    wImage.UpdateStatus(eSTATES.PAGE_CHECKED, crd);
                            //}
                            CtrlImage exppImage = new CtrlImage(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()), boxNo, policyNumber, string.Empty, string.Empty);
                            wfeImage expwImage = new wfeImage(sqlCon, exppImage);
                            expwImage.UpdateAllImageStatus(eSTATES.PAGE_CHECKED, crd);

                            if(wPolicy.GetAllException().Tables[0].Rows.Count > 0)
                            { wPolicy.QaExceptionStatus(ihConstants._POLICY_EXCEPTION_SOLVED, ihConstants._LIC_QA_POLICY_CHECKED); }
                            else
                            {
                                wPolicy.InitiateQaPolicyException(crd);
                                wPolicy.QaExceptionStatus(ihConstants._POLICY_EXCEPTION_SOLVED, ihConstants._LIC_QA_POLICY_CHECKED); 
                            }
                            
                            grdPolicy.Rows[policyRowIndex].DefaultCellStyle.BackColor = Color.Green;
                            if ((GetPolicyStatus() == (int)eSTATES.POLICY_NOT_INDEXED))
                            {
                                grdPolicy.Rows[policyRowIndex].Cells[11].Value = "Not Indexed";
                            }
                            if ((GetPolicyStatus() == (int)4) || (GetPolicyStatus() == (int)eSTATES.POLICY_FQC) )
                            {
                                grdPolicy.Rows[policyRowIndex].Cells[11].Value = "Indexed";
                            }
                            if ((GetPolicyStatus() == (int)eSTATES.POLICY_ON_HOLD))
                            {
                                grdPolicy.Rows[policyRowIndex].Cells[11].Value = "On hold";
                            }
                            if (GetPolicyStatus() == (int)eSTATES.POLICY_MISSING)
                            {
                                grdPolicy.Rows[policyRowIndex].Cells[11].Value = "Missing";
                            }
                            if (GetPolicyStatus() == (int)eSTATES.POLICY_EXCEPTION)
                            {
                                grdPolicy.Rows[policyRowIndex].Cells[11].Value = "In exception";
                            }
                            if (GetPolicyStatus() == (int)eSTATES.POLICY_CHECKED)
                            {
                                grdPolicy.Rows[policyRowIndex].Cells[11].Value = "Checked";
                            }
                            tabControl1.SelectedIndex = 0;
                            //tabControl2.SelectedIndex = 0;
                            CheckBatchRejection(cmbBatch.SelectedValue.ToString());
                        }
                    }
                    else
                    {
                        MessageBox.Show("This bundle is already marked as ready for UAT.....");
                    }
                }
                else
                {
                    MessageBox.Show("You are not authorized to do this.....");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public int GetPolicyStatus()
        {
            string sqlStr = null;
            DataSet dsImage = new DataSet();
            OdbcDataAdapter sqlAdap = null;

            sqlStr = "select status from case_file_master " +
                    " where proj_code=" + projCode +
                " and bundle_key=" + batchCode + " and filename='" + policyNumber + "'";

            try
            {
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(dsImage);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();
                
                exMailLog.Log(ex);
            }
            return Convert.ToInt32(dsImage.Tables[0].Rows[0]["status"]);
        }
        private void cmdRejected_Click(object sender, EventArgs e)
        {
            bool expBol = false;
            policyException udtExp = new policyException();
            NovaNet.Utils.dbCon dbcon = new NovaNet.Utils.dbCon();
            string pageName = null;
            if (crd.role == ihConstants._LIC_ROLE)
            {
                if (chkReadyUat.Checked == false)
                {
                    if (lstImage.Items.Count > 0)
                    {
                        pPolicy = new CtrlPolicy(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()), boxNo, policyNumber);
                        wfePolicy policy = new wfePolicy(sqlCon, pPolicy);
                        if (chkCropClean.Checked == true)
                        {
                            udtExp.crop_clean_exp = 1;
                            expBol = true;
                        }
                        else
                        {
                            udtExp.crop_clean_exp = 0;
                        }

                        if (chkDesicion.Checked == true)
                        {
                            udtExp.decision_misd_exp = 1;
                            expBol = true;
                        }
                        else
                        {
                            udtExp.decision_misd_exp = 0;
                        }

                        if (chkExtraPage.Checked == true)
                        {
                            udtExp.extra_page_exp = 1;
                            expBol = true;
                        }
                        else
                        {
                            udtExp.extra_page_exp = 0;
                        }

                        if (chkLinkedPolicy.Checked == true)
                        {
                            udtExp.linked_policy_exp = 1;
                            expBol = true;
                        }
                        else
                        {
                            udtExp.linked_policy_exp = 0;
                        }

                        if (chkMissingImg.Checked == true)
                        {
                            udtExp.missing_img_exp = 1;
                            expBol = true;
                        }
                        else
                        {
                            udtExp.missing_img_exp = 0;
                        }
                        if (chkMove.Checked == true)
                        {
                            udtExp.move_to_respective_policy_exp = 1;
                            expBol = true;
                        }
                        else
                        {
                            udtExp.move_to_respective_policy_exp = 0;
                        }
                        if (chkOther.Checked == true)
                        {
                            udtExp.other_exp = 1;
                            expBol = true;
                        }
                        else
                        {
                            udtExp.other_exp = 0;
                        }

                        if (chkPoorScan.Checked == true)
                        {
                            udtExp.poor_scan_exp = 1;
                            expBol = true;
                        }
                        else
                        {
                            udtExp.poor_scan_exp = 0;
                        }
                        if (chkRearrange.Checked == true)
                        {
                            udtExp.rearrange_exp = 1;
                            expBol = true;
                        }
                        else
                        {
                            udtExp.rearrange_exp = 0;
                        }
                        if (chkIndexing.Checked == true)
                        {
                            udtExp.wrong_indexing_exp = 1;
                            expBol = true;
                        }
                        else
                        {
                            udtExp.wrong_indexing_exp = 0;
                        }
                        if (chkMeta.Checked == true)
                        {
                            udtExp.metadata_exp = 1;
                            expBol = true;
                        }
                        else
                        {
                            udtExp.metadata_exp = 0;
                        }
                        udtExp.comments = txtComments.Text;
                        //udtExp.status = ihConstants._LIC_QA_POLICY_EXCEPTION;
                        if (expBol == true)
                        {
                            udtExp.solved = ihConstants._POLICY_EXCEPTION_NOT_SOLVED;
                            //if(policy.InitiateQaPolicyException(crd))
                            if(policy.GetAllException().Tables[0].Rows.Count > 0)
                            {
                                if (policy.UpdateQaPolicyException(crd, udtExp) == true)
                                {
                                    if (policy.QaExceptionStatus(ihConstants._POLICY_EXCEPTION_NOT_SOLVED, ihConstants._LIC_QA_POLICY_EXCEPTION) == true)
                                    {
                                        UpdateStatus(eSTATES.POLICY_EXCEPTION, crd);

                                        CtrlImage exppImage = new CtrlImage(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()), boxNo, policyNumber, string.Empty, string.Empty);
                                        wfeImage expwImage = new wfeImage(sqlCon, exppImage);
                                        expwImage.UpdateAllImageStatus(eSTATES.PAGE_EXCEPTION, crd);
                                        grdPolicy.Rows[policyRowIndex].DefaultCellStyle.BackColor = Color.Red;
                                        if ((GetPolicyStatus() == (int)eSTATES.POLICY_NOT_INDEXED))
                                        {
                                            grdPolicy.Rows[policyRowIndex].Cells[11].Value = "Not Indexed";
                                        }
                                        if ((GetPolicyStatus() == (int)4) || (GetPolicyStatus() == (int)eSTATES.POLICY_FQC))
                                        {
                                            grdPolicy.Rows[policyRowIndex].Cells[11].Value = "Indexed";
                                        }
                                        if ((GetPolicyStatus() == (int)eSTATES.POLICY_ON_HOLD))
                                        {
                                            grdPolicy.Rows[policyRowIndex].Cells[11].Value = "On hold";
                                        }
                                        if (GetPolicyStatus() == (int)eSTATES.POLICY_MISSING)
                                        {
                                            grdPolicy.Rows[policyRowIndex].Cells[11].Value = "Missing";
                                        }
                                        if (GetPolicyStatus() == (int)eSTATES.POLICY_EXCEPTION)
                                        {
                                            grdPolicy.Rows[policyRowIndex].Cells[11].Value = "In exception";
                                        }
                                        if (GetPolicyStatus() == (int)eSTATES.POLICY_CHECKED)
                                        {
                                            grdPolicy.Rows[policyRowIndex].Cells[11].Value = "Checked";
                                        }
                                        //box.UpdateStatus(eSTATES.BOX_CONFLICT);
                                    }
                                }
                                tabControl1.SelectedIndex = 0;
                                //tabControl2.SelectedIndex = 0;
                                CheckBatchRejection(cmbBatch.SelectedValue.ToString());
                            }
                            else
                            {
                                policy.InitiateQaPolicyException(crd);
                                if (policy.UpdateQaPolicyException(crd, udtExp) == true)
                                {
                                    if (policy.QaExceptionStatus(ihConstants._POLICY_EXCEPTION_NOT_SOLVED, ihConstants._LIC_QA_POLICY_EXCEPTION) == true)
                                    {
                                        UpdateStatus(eSTATES.POLICY_EXCEPTION, crd);

                                        CtrlImage exppImage = new CtrlImage(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()), boxNo, policyNumber, string.Empty, string.Empty);
                                        wfeImage expwImage = new wfeImage(sqlCon, exppImage);
                                        expwImage.UpdateAllImageStatus(eSTATES.PAGE_EXCEPTION, crd);
                                        grdPolicy.Rows[policyRowIndex].DefaultCellStyle.BackColor = Color.Red;
                                        if ((GetPolicyStatus() == (int)eSTATES.POLICY_NOT_INDEXED))
                                        {
                                            grdPolicy.Rows[policyRowIndex].Cells[11].Value = "Not Indexed";
                                        }
                                        if ((GetPolicyStatus() == (int)4) || (GetPolicyStatus() == (int)eSTATES.POLICY_FQC))
                                        {
                                            grdPolicy.Rows[policyRowIndex].Cells[11].Value = "Indexed";
                                        }
                                        if ((GetPolicyStatus() == (int)eSTATES.POLICY_ON_HOLD))
                                        {
                                            grdPolicy.Rows[policyRowIndex].Cells[11].Value = "On hold";
                                        }
                                        if (GetPolicyStatus() == (int)eSTATES.POLICY_MISSING)
                                        {
                                            grdPolicy.Rows[policyRowIndex].Cells[11].Value = "Missing";
                                        }
                                        if (GetPolicyStatus() == (int)eSTATES.POLICY_EXCEPTION)
                                        {
                                            grdPolicy.Rows[policyRowIndex].Cells[11].Value = "In exception";
                                        }
                                        if (GetPolicyStatus() == (int)eSTATES.POLICY_CHECKED)
                                        {
                                            grdPolicy.Rows[policyRowIndex].Cells[11].Value = "Checked";
                                        }
                                        //box.UpdateStatus(eSTATES.BOX_CONFLICT);
                                    }
                                }
                                tabControl1.SelectedIndex = 0;
                                //tabControl2.SelectedIndex = 0;
                                CheckBatchRejection(cmbBatch.SelectedValue.ToString());
                            }
                            
                        }
                        else
                        {
                            MessageBox.Show("Provide atleast one exception type", "B'Zer", MessageBoxButtons.OK);
                        }

                    }
                }
                else
                {
                    MessageBox.Show("This bundle is already marked as ready for UAT.....");
                }
            }
            else
            {
                MessageBox.Show("You are not authorized to do this.....");
            }
        }
        
        private bool GetMissingPoliyLst()
        {
            CtrlPolicy ctrlPolicy;
            wfePolicy wPolicy;
            bool missingDoc = false;
            ctrlPolicy = new CtrlPolicy(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()), "1", "");
            wPolicy = new wfePolicy(sqlCon, ctrlPolicy);
            eSTATES[] pState = new eSTATES[5];
            DataSet pDs = new DataSet();
            DataSet iDs = new DataSet();
            DataTable dt = new DataTable();
            DataRow dr;

            //dt.Columns.Add("Boxnumber");
            dt.Columns.Add("Filename");
            dt.Columns.Add(ihConstants.MAINPETITION_FILE);
            dt.Columns.Add(ihConstants.MAINPETITIONANNEXTURES_FILE);
            dt.Columns.Add(ihConstants.VAKALATNAMAANDWARRENT_FILE);
            dt.Columns.Add(ihConstants.ORDERSMAINCASE_FILE + "/" + ihConstants.FINALJUDGEMENTORDER_FILE);
            

            pState[0] = eSTATES.POLICY_CHECKED;
            pState[1] = eSTATES.POLICY_FQC;
            pState[2] = eSTATES.POLICY_EXCEPTION;
            pState[3] = eSTATES.POLICY_INDEXED;
            pState[3] = eSTATES.POLICY_NOT_INDEXED;
            pDs = GetPolicyList(pState);
            if (pDs.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < pDs.Tables[0].Rows.Count; i++)
                {
                    ctrlPolicy = new CtrlPolicy(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()), "1", pDs.Tables[0].Rows[i][1].ToString());
                    wPolicy = new wfePolicy(sqlCon, ctrlPolicy);
                    iDs = wPolicy.GetMissingDocumentPolicyLst();
                    if (iDs.Tables[0].Rows.Count < 4)
                    {
                        dr = dt.NewRow();
                        //dr["Boxnumber"] = pDs.Tables[0].Rows[i]["box_number"].ToString();
                        dr["Filename"] = pDs.Tables[0].Rows[i]["filename"].ToString();
                        for (int j = 0; j < iDs.Tables[0].Rows.Count; j++)
                        {
                            if (iDs.Tables[0].Rows[j][0].ToString() == ihConstants.MAINPETITION_FILE)
                            {
                                dr[ihConstants.MAINPETITION_FILE] = iDs.Tables[0].Rows[j][1].ToString();
                            }

                            if (iDs.Tables[0].Rows[j][0].ToString() == ihConstants.MAINPETITIONANNEXTURES_FILE)
                            {
                                dr[ihConstants.MAINPETITIONANNEXTURES_FILE] = iDs.Tables[0].Rows[j][1].ToString();
                            }

                            if (iDs.Tables[0].Rows[j][0].ToString() == ihConstants.VAKALATNAMAANDWARRENT_FILE)
                            {
                                dr[ihConstants.VAKALATNAMAANDWARRENT_FILE] = iDs.Tables[0].Rows[j][1].ToString();
                            }

                            if (iDs.Tables[0].Rows[j][0].ToString() == ihConstants.ORDERSMAINCASE_FILE || iDs.Tables[0].Rows[j][0].ToString() == ihConstants.FINALJUDGEMENTORDER_FILE)
                            {
                                dr[ihConstants.ORDERSMAINCASE_FILE + "/" + ihConstants.FINALJUDGEMENTORDER_FILE] = iDs.Tables[0].Rows[j][1].ToString();
                            }

                        }
                        missingDoc = true;
                        dt.Rows.Add(dr);
                    }
                }
            }
            if (missingDoc == true)
            {
                gTable = dt;
                return true;
            }
            else
                return false;
        }
        public bool PolicyWithLICException(int prmProjKey, int prmBatchKey)
        {
            string sqlStr = null;
            DataSet projDs = new DataSet();

            try
            {
                sqlStr = @"select filename from case_file_master where proj_code=" + prmProjKey + " and bundle_key=" + prmBatchKey + " and status=" + (int)eSTATES.POLICY_EXCEPTION;
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(projDs);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();
                
                exMailLog.Log(ex);
            }
            if (projDs.Tables[0].Rows.Count > 0)
            {
                return true;
            }
            else
                return false;
        }
        public bool UpdateStatus(eSTATES state,int prmProjKey, int prmBatchKey)
        {
            string sqlStr = null;
            OdbcTransaction sqlTrans = null;
            bool commitBol = true;

            OdbcCommand sqlCmd = new OdbcCommand();

            sqlStr = @"update bundle_master" +
                " set status=" + (int)state + " where " +
                " proj_code = '"+ prmProjKey + "' and bundle_key=" + prmBatchKey + " and status<>" + (int)eSTATES.BATCH_READY_FOR_UAT;

            try
            {

                sqlTrans = sqlCon.BeginTransaction();
                sqlCmd.Connection = sqlCon;
                sqlCmd.Transaction = sqlTrans;
                sqlCmd.CommandText = sqlStr;
                int i = sqlCmd.ExecuteNonQuery();
                sqlTrans.Commit();
                commitBol = true;
            }
            catch (Exception ex)
            {
                commitBol = false;
                sqlTrans.Rollback();
                sqlCmd.Dispose();
               
                exMailLog.Log(ex);
            }
            return commitBol;
        }

        private void chkReadyUat_Click(object sender, EventArgs e)
        {
            DialogResult dlg;
            wfeBatch wBatch = new wfeBatch(sqlCon);
            ///changed in version 1.0.2
            if (crd.role == ihConstants._LIC_ROLE)
            {
                if ((cmbProject.SelectedValue != null) && (cmbBatch.SelectedValue != null))
                {
                    if (GetMissingPoliyLst() == false)
                    {
                        if ((grdBox.Rows.Count > 0) && (grdPolicy.Rows.Count > 0))
                        {
                            if (PolicyWithLICException(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString())) == false)
                            {
                                if (chkReadyUat.Checked == true)
                                {
                                    dlg = MessageBox.Show(this, "Are you sure, this bundle is ready for UAT?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                                    if (dlg == DialogResult.Yes)
                                    {
                                        UpdateStatus(eSTATES.BATCH_READY_FOR_UAT, Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()));
                                        chkReadyUat.Checked = true;
                                        chkReadyUat.Enabled = false;
                                        PopulateBatchCombo();
                                    }
                                    else
                                    {
                                        chkReadyUat.Checked = false;
                                        chkReadyUat.Enabled = true;
                                    }
                                }
                            }
                            else
                            {
                                MessageBox.Show("One or more files is in exception stage, clear the exceptions before proceeding....");
                                chkReadyUat.Checked = false;
                                chkReadyUat.Enabled = true;
                            }
                        }
                        else
                        {
                            MessageBox.Show("Populate file details.....");
                        }
                    }
                    else
                    {
                        DialogResult rslt = MessageBox.Show(this, "Mandatory document missing in one or more files, do you want to check the list.....", "Missing mandatory doc types", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                        if (rslt == DialogResult.Yes)
                        {
                            frmMandPolicyList frmMiss = new frmMandPolicyList(gTable, cmbBatch.Text);
                            frmMiss.ShowDialog(this);
                            gTable.Clear();
                            gTable.Dispose();
                            chkReadyUat.Checked = false;
                        }
                        else
                        {
                            if ((grdBox.Rows.Count > 0) && (grdPolicy.Rows.Count > 0))
                            {
                                if (PolicyWithLICException(Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString())) == false)
                                {
                                    if (chkReadyUat.Checked == true)
                                    {
                                        dlg = MessageBox.Show(this, "Are you sure, this bundle is ready for UAT?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                                        if (dlg == DialogResult.Yes)
                                        {
                                            UpdateStatus(eSTATES.BATCH_READY_FOR_UAT, Convert.ToInt32(cmbProject.SelectedValue.ToString()), Convert.ToInt32(cmbBatch.SelectedValue.ToString()));
                                            chkReadyUat.Checked = true;
                                            chkReadyUat.Enabled = false;
                                            PopulateBatchCombo();
                                        }
                                        else
                                        {
                                            chkReadyUat.Checked = false;
                                            chkReadyUat.Enabled = true;
                                        }
                                    }
                                }
                                else
                                {
                                    MessageBox.Show("One or more file is in exception stage, clear the exceptions before proceeding....");
                                    chkReadyUat.Checked = false;
                                    chkReadyUat.Enabled = true;
                                }
                            }
                            else
                            {
                                MessageBox.Show("Populate the file details.....");
                            }
                        }
                    }
                }
            }
            else
            {
                MessageBox.Show("You are not authorized to do this.....");
                chkReadyUat.Checked = false;
            }
        }

        private void chkMeta_CheckedChanged(object sender, EventArgs e)
        {
            int tifPos;
            string origDoctype = string.Empty;
            string imgNumber;
            if (lstImage.SelectedIndex >= 0)
            {
                tifPos = lstImage.SelectedItem.ToString().IndexOf("-") + 1;
                imgNumber = lstImage.SelectedItem.ToString().Substring((lstImage.SelectedItem.ToString().IndexOf("_") + 1), 5);
                if (tifPos > 0)
                {
                    origDoctype = lstImage.SelectedItem.ToString().Substring(tifPos);
                }
                if (chkMeta.Checked)
                {
                    txtComments.Text = txtComments.Text + imgNumber + "-" + origDoctype + " Wrong metadata entry \r\n";
                    txtComments.SelectionStart = txtComments.Text.Length;
                    txtComments.ScrollToCaret();
                    txtComments.Refresh();
                }
                else
                {
                    string strToReplace;
                    strToReplace = imgNumber + "-" + origDoctype + " Wrong metadata entry \r\n";
                    txtComments.Text = txtComments.Text.Replace(strToReplace, "");
                }
            }
        }
    }
}
