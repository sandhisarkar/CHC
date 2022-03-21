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
using nControls;

namespace ImageHeaven
{
    public partial class EntryForm : Form
    {
        System.Windows.Forms.ToolTip bttnToolTip = new System.Windows.Forms.ToolTip();
        public static int index;
        public static int nxt;
        Credentials crd = new Credentials();
        private OdbcConnection con = null;
        //Transaction
        OdbcTransaction txn;
        public static string item;

        string name = frmMain.name;
        OdbcConnection sqlCon = null;
        public static bool _modeBool;

        public static DataLayerDefs.Mode _mode = DataLayerDefs.Mode._Edit;

        public static string projKey;
        public static string bundleKey;

        public static string caseFileNo;

        public static string filename;

        public static List<string> jList = new List<string>();
        public static string jCount;
        List<Judges> JudgesList = null;

        public static List<string> pList = new List<string>();
        public static string pCount;
        List<Petitioner> PetitionerList = null;

        public static List<string> pcList = new List<string>();
        public static string pcCount;
        List<PetitionerCounsel> PetitionerCounselList = null;

        public static List<string> rList = new List<string>();
        public static string rCount;
        List<Respondant> RespondantList = null;

        public static List<string> rcList = new List<string>();
        public static string rcCount;
        List<RespondantCounsel> RespondantCounselList = null;

        public static List<string> lcNList = new List<string>();
        public static string lcNCount;
        List<LowerCourtCase> LowerCourtCaselList = null;

        public static List<string> lcJList = new List<string>();
        public static string lcJCount;
        List<LCJudges> LCJudgesList = null;

        public static List<string> cList = new List<string>();
        public static string cCount;
        List<ConnApp> ConnAppList = null;

        public static List<string> cMList = new List<string>();
        public static string cMCount;
        List<ConnMain> ConnMainList = null;

        public static List<string> aList = new List<string>();
        public static string aCount;
        List<Analogous> AnalogousList = null;

        public class Judges
        {
            private string projKey;
            private string bundleKey;
            private string caseFileNo;
            
            private string judge_name;

            public string Proj_code
            {
                get { return projKey; }
                set
                {
                    projKey = value;
                }
            }

            public string Bundle_code
            {
                get { return bundleKey; }
                set
                {
                    bundleKey = value;
                }
            }
            public string CaseFile
            {
                get { return caseFileNo; }
                set
                {
                    caseFileNo = value;
                }
            }
            
            public string Judge_name
            {
                get { return judge_name; }
                set
                {
                    judge_name = value;
                }
            }
        }
        public class LCJudges
        {
            private string projKey;
            private string bundleKey;
            private string caseFileNo;

            private string lc_judge_name;

            public string Proj_code
            {
                get { return projKey; }
                set
                {
                    projKey = value;
                }
            }

            public string Bundle_code
            {
                get { return bundleKey; }
                set
                {
                    bundleKey = value;
                }
            }
            public string CaseFile
            {
                get { return caseFileNo; }
                set
                {
                    caseFileNo = value;
                }
            }

            public string Lc_Judge_name
            {
                get { return lc_judge_name; }
                set
                {
                    lc_judge_name = value;
                }
            }
        }
        public class Petitioner
        {
            private string projKey;
            private string bundleKey;
            private string caseFileNo;
            
            private string petitioner_name;

            public string Proj_code
            {
                get { return projKey; }
                set
                {
                    projKey = value;
                }
            }

            public string Bundle_code
            {
                get { return bundleKey; }
                set
                {
                    bundleKey = value;
                }
            }
            public string CaseFile
            {
                get { return caseFileNo; }
                set
                {
                    caseFileNo = value;
                }
            }
           
            public string Petitioner_name
            {
                get { return petitioner_name; }
                set
                {
                    petitioner_name = value;
                }
            }
        }
        public class PetitionerCounsel
        {
            private string projKey;
            private string bundleKey;
            private string caseFileNo;

            private string petitioner_counsel_name;

            public string Proj_code
            {
                get { return projKey; }
                set
                {
                    projKey = value;
                }
            }

            public string Bundle_code
            {
                get { return bundleKey; }
                set
                {
                    bundleKey = value;
                }
            }
            public string CaseFile
            {
                get { return caseFileNo; }
                set
                {
                    caseFileNo = value;
                }
            }

            public string Petitioner_counsel_name
            {
                get { return petitioner_counsel_name; }
                set
                {
                    petitioner_counsel_name = value;
                }
            }
        }
        public class Respondant
        {
            private string projKey;
            private string bundleKey;
            private string caseFileNo;

            private string respondant_name;

            public string Proj_code
            {
                get { return projKey; }
                set
                {
                    projKey = value;
                }
            }

            public string Bundle_code
            {
                get { return bundleKey; }
                set
                {
                    bundleKey = value;
                }
            }
            public string CaseFile
            {
                get { return caseFileNo; }
                set
                {
                    caseFileNo = value;
                }
            }

            public string Respondant_name
            {
                get { return respondant_name; }
                set
                {
                    respondant_name = value;
                }
            }
        }
        public class RespondantCounsel
        {
            private string projKey;
            private string bundleKey;
            private string caseFileNo;

            private string repondant_counsel_name;

            public string Proj_code
            {
                get { return projKey; }
                set
                {
                    projKey = value;
                }
            }

            public string Bundle_code
            {
                get { return bundleKey; }
                set
                {
                    bundleKey = value;
                }
            }
            public string CaseFile
            {
                get { return caseFileNo; }
                set
                {
                    caseFileNo = value;
                }
            }

            public string Respondant_counsel_name
            {
                get { return repondant_counsel_name; }
                set
                {
                    repondant_counsel_name = value;
                }
            }
        }
        public class LowerCourtCase
        {
            private string projKey;
            private string bundleKey;
            private string caseFileNo;

            private string lc_case_name;

            public string Proj_code
            {
                get { return projKey; }
                set
                {
                    projKey = value;
                }
            }

            public string Bundle_code
            {
                get { return bundleKey; }
                set
                {
                    bundleKey = value;
                }
            }
            public string CaseFile
            {
                get { return caseFileNo; }
                set
                {
                    caseFileNo = value;
                }
            }

            public string Lc_case_name
            {
                get { return lc_case_name; }
                set
                {
                    lc_case_name = value;
                }
            }
        }

        public class ConnApp
        {
            private string projKey;
            private string bundleKey;
            private string caseFileNo;

            private string conn_app_case_name;

            public string Proj_code
            {
                get { return projKey; }
                set
                {
                    projKey = value;
                }
            }

            public string Bundle_code
            {
                get { return bundleKey; }
                set
                {
                    bundleKey = value;
                }
            }
            public string CaseFile
            {
                get { return caseFileNo; }
                set
                {
                    caseFileNo = value;
                }
            }

            public string Conn_app_case_name
            {
                get { return conn_app_case_name; }
                set
                {
                    conn_app_case_name = value;
                }
            }
        }

        public class ConnMain
        {
            private string projKey;
            private string bundleKey;
            private string caseFileNo;

            private string conn_main_case_name;

            public string Proj_code
            {
                get { return projKey; }
                set
                {
                    projKey = value;
                }
            }

            public string Bundle_code
            {
                get { return bundleKey; }
                set
                {
                    bundleKey = value;
                }
            }
            public string CaseFile
            {
                get { return caseFileNo; }
                set
                {
                    caseFileNo = value;
                }
            }

            public string Conn_main_case_name
            {
                get { return conn_main_case_name; }
                set
                {
                    conn_main_case_name = value;
                }
            }
        }

        public class Analogous
        {
            private string projKey;
            private string bundleKey;
            private string caseFileNo;

            private string analogous_case_name;

            public string Proj_code
            {
                get { return projKey; }
                set
                {
                    projKey = value;
                }
            }

            public string Bundle_code
            {
                get { return bundleKey; }
                set
                {
                    bundleKey = value;
                }
            }
            public string CaseFile
            {
                get { return caseFileNo; }
                set
                {
                    caseFileNo = value;
                }
            }

            public string Analogous_case_name
            {
                get { return analogous_case_name; }
                set
                {
                    analogous_case_name = value;
                }
            }
        }

        public EntryForm()
        {
            InitializeComponent();
        }

        public EntryForm(OdbcConnection pCon,string projkey, string batchkey, DataLayerDefs.Mode mode, string casefilename, NovaNet.Utils.Credentials prmCrd)
        {
            InitializeComponent();
            sqlCon = pCon;

            projKey = projkey;
            bundleKey = batchkey;
            filename = casefilename;

            crd = prmCrd;

            _mode = mode;
        }

        public EntryForm(OdbcConnection pCon, string projkey, string batchkey, DataLayerDefs.Mode mode, string casefileno, string casefilename, NovaNet.Utils.Credentials prmCrd)
        {
            InitializeComponent();
            sqlCon = pCon;

            projKey = projkey;
            bundleKey = batchkey;
            caseFileNo = casefileno;

            filename = casefilename;

            crd = prmCrd;

            _mode = mode;
        }

        public EntryForm(OdbcConnection pCon, DataLayerDefs.Mode mode,string fileName, OdbcTransaction pTxn, NovaNet.Utils.Credentials prmCrd)
        {
            
            InitializeComponent();
            sqlCon = pCon;
            txn = pTxn;
            crd = prmCrd;
            if (mode == DataLayerDefs.Mode._Add)
            {
                this.Text = "B'Zer - Calcutta High Court - Entry Details (Add)";
                projKey = Files.projKey;
                bundleKey = Files.bundleKey;

                filename = fileName;
                
                _mode = mode;
            }

            if (mode == DataLayerDefs.Mode._Edit)
            {
                this.Text = "B'Zer - Calcutta High Court - Entry Details (Add)";
                projKey = Files.projKey;
                bundleKey = Files.bundleKey;

                filename = fileName;

                _mode = mode;
            }
        }


        public EntryForm(OdbcConnection pCon, DataLayerDefs.Mode mode, string casefileno, string itemNo, OdbcTransaction pTxn, Credentials prmCrd)
        {

            InitializeComponent();
            sqlCon = pCon;
            txn = pTxn;
            crd = prmCrd;
            if (mode == DataLayerDefs.Mode._Add)
            {
                this.Text = "B'Zer - Calcutta High Court - Entry Details (Add)";
                projKey = Files.projKey;
                bundleKey = Files.bundleKey;

                caseFileNo = casefileno;

                _mode = mode;

                item = itemNo;
            }

            if (mode == DataLayerDefs.Mode._Edit)
            {
                this.Text = "B'Zer - Calcutta High Court - Entry Details (Add)";
                projKey = Files.projKey;
                bundleKey = Files.bundleKey;

                caseFileNo = casefileno;

                _mode = mode;

                item = itemNo;
            }
        }

        public DataTable _GetBundleDetails(string proj, string bundle)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct proj_code, bundle_Key,establishment as Establishment, bundle_name as 'Bundle Name', Bundle_no as 'Bundle Number', date_format(handover_date,'%Y-%m-%d') as 'Handover Date' from bundle_master where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon,txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        public DataTable _GetFileCaseDetails(string proj, string bundle, string fileName)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct proj_code, bundle_Key,item_no,case_file_no,case_status, case_nature, case_type, case_year, filename from case_file_master where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' and filename = '"+fileName+"'";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon,txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        public DataTable _GetFileCaseDetails(string proj, string bundle, string casefileno, string itemNo)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct proj_code, bundle_Key,item_no,case_file_no,case_status, case_nature, case_type, case_year from case_file_master where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' and case_file_no = '" + casefileno + "' and item_no = '"+itemNo+"' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        public DataTable _GetMetaCount(string proj, string bundle, string casefileno, string status, string nature, string type, string year)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct proj_code, bundle_Key,item_no,case_file_no from metadata_entry where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' and case_file_no = '" + casefileno + "' and case_status = '"+status+"' and case_type = '"+type+"' and case_nature = '"+nature+"' and case_year = '"+year+"' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

       
        public DataTable _GetMetaCount(string proj, string bundle, string casefileno)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct proj_code, bundle_Key,item_no,case_file_no from metadata_entry where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' and case_file_no = '" + casefileno + "'";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon,txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        public DataTable _GetMetaCount(string proj, string bundle)
        {
            DataTable dt = new DataTable();
            string sql = "select Count(*) from metadata_entry where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        public DataTable _GetFileCount(string proj, string bundle)
        {
            DataTable dt = new DataTable();
            string sql = "select Count(*) from case_file_master where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        private void disablegroup1()
        {
            deTextBox1.Enabled = false;
            deTextBox2.Enabled = false;
            deTextBox3.Enabled = false;
            deTextBox4.Enabled = false;
        }

        private void disablegroup2()
        {
            deTextBox8.Enabled = false;
            deComboBox1.Enabled = false;
            deComboBox2.Enabled = false;
            deTextBox5.Enabled = false;
            deComboBox12.Enabled = false;
        }

        private void disableDateDisposal()
        {
            deTextBox6.Enabled = false;
            deTextBox7.Enabled = false;
            deTextBox9.Enabled = false;
        }

        private void enableDateDisposal()
        {
            deTextBox6.Enabled = true;
            deTextBox7.Enabled = true;
            deTextBox9.Enabled = true;
        }

        private void populateCasestatus()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select case_status_id, case_status from case_status_master  ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                deComboBox1.DataSource = dt;
                deComboBox1.DisplayMember = "case_status";
                deComboBox1.ValueMember = "case_status_id";
            }
        }

        private void populateCaseNature()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select case_nature_id, case_nature from case_nature_master  ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                deComboBox12.DataSource = dt;
                deComboBox12.DisplayMember = "case_nature";
                deComboBox12.ValueMember = "case_nature_id";
            }
        }
        private void populateCaseType()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select case_type_id, case_type_code from case_type_master  ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                deComboBox2.DataSource = dt;
                deComboBox2.DisplayMember = "case_type_code";
                deComboBox2.ValueMember = "case_type_id";
            }
        }

        private void populateConnAppCaseType()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select case_type_id, case_type_code from case_type_master  ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                deComboBox7.DataSource = dt;
                deComboBox7.DisplayMember = "case_type_code";
                deComboBox7.ValueMember = "case_type_id";

                
            }
        }

        private void populateConnMainCaseType()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select case_type_id, case_type_code from case_type_master  ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                deComboBox9.DataSource = dt;
                deComboBox9.DisplayMember = "case_type_code";
                deComboBox9.ValueMember = "case_type_id";

            }
        }

        private void analogousCaseType()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select case_type_id, case_type_code from case_type_master  ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                deComboBox10.DataSource = dt;
                deComboBox10.DisplayMember = "case_type_code";
                deComboBox10.ValueMember = "case_type_id";
            }
        }

        private void oldCaseType()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select case_type_id, case_type_code from case_type_master  ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                deComboBox11.DataSource = dt;
                deComboBox11.DisplayMember = "case_type_code";
                deComboBox11.ValueMember = "case_type_id";
            }
        }

        private void populateLcCaseType()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select lc_case_type_id, lc_case_type_code from lc_case_type_master  ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                deComboBox5.DataSource = dt;
                deComboBox5.DisplayMember = "lc_case_type_code";
                deComboBox5.ValueMember = "lc_case_type_id";

               
            }
        }

        private void populateJudge()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "SELECT judge_designation, judge_name from judge_master  ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                deComboBox3.DataSource = dt;
                deComboBox3.DisplayMember = "judge_name";
                deComboBox3.ValueMember = "judge_designation";

            }
        }

        private void populateLCJudge()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select judge_designation, judge_name from judge_master  ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
               
                deComboBox6.DataSource = dt;
                deComboBox6.DisplayMember = "judge_name";
                deComboBox6.ValueMember = "judge_designation";
            }
        }
        private void populateDistrict()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select district_code, district_name from district  where district_code <> '00' and district_code <> '99' order by district_name";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                deComboBox4.DataSource = dt;
                deComboBox4.DisplayMember = "district_name";
                deComboBox4.ValueMember = "district_code";


            }
        }

        private void populateDisposalType()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select disposal_type_id, disposal_type_name from disposal_type_master";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                deComboBox8.DataSource = dt;
                deComboBox8.DisplayMember = "disposal_type_name";
                deComboBox8.ValueMember = "disposal_type_id";


            }
        }

        private DataTable searchJudge(string judge_name)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select judge_designation, judge_name from judge_master where judge_name = '" + judge_name + "' ";

            OdbcDataAdapter odap = new OdbcDataAdapter(sql, sqlCon);
            odap.Fill(dt);

            return dt;
            
        }

        private DataTable searchLCCaseType(string lc_case_type_code)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select lc_case_type_id, lc_case_type_code from lc_case_type_master where lc_case_type_code = '" + lc_case_type_code + "' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);

            return dt;

        }

        private DataTable searchCaseType(string case_type_code)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select case_type_id, case_type_code from case_type_master where case_type_code = '" + case_type_code + "' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);

            return dt;

        }
        private DataRow dr = null;
        private void EntryForm_Load(object sender, EventArgs e)
        {
            //txn = sqlCon.BeginTransaction();
            if (sqlCon.State == ConnectionState.Closed || sqlCon.State == ConnectionState.Broken)
            {
                sqlCon.Open();
            }
            deTextBox11.BackColor = Color.NavajoWhite;
            deTextBox18.BackColor = Color.NavajoWhite;
            deLabel50.Text = "Total Judges : " + jList.Count;
            deLabel51.Text = "Total Petitioner : " + pList.Count;
            deLabel52.Text = "Total Petitioner Counsel : " + pcList.Count;
            deLabel53.Text = "Total Respondant : " + rList.Count;
            deLabel54.Text = "Total Respondant Counsel : " + rcList.Count;
            deLabel55.Text = "Total LC Case : " + lcNList.Count;
            deLabel56.Text = "Total LC Judges : " + lcJList.Count;
            deLabel57.Text = "Total Connected Application : " + cList.Count;
            deLabel58.Text = "Total Connected Main Case : " + cMList.Count;
            deLabel59.Text = "Total Analogous Case : " + aList.Count;

            if (_mode == DataLayerDefs.Mode._Add)
            {
                populateCasestatus();
                populateCaseType();
                populateCaseNature();
                populateJudge();
                populateDistrict();
                populateLcCaseType();
                populateLCJudge();
                populateConnAppCaseType();
                populateDisposalType();
                populateConnMainCaseType();
                analogousCaseType();
                oldCaseType();

                //bundle details
                deTextBox1.Text = _GetBundleDetails(projKey, bundleKey).Rows[0][4].ToString();
                deTextBox2.Text = _GetBundleDetails(projKey, bundleKey).Rows[0][3].ToString();
                deTextBox3.Text = _GetBundleDetails(projKey, bundleKey).Rows[0][2].ToString();
                deTextBox4.Text = _GetBundleDetails(projKey, bundleKey).Rows[0][5].ToString();
                disablegroup1();

                //file details
                deTextBox8.Text = frmNewCase.casefile;
                deComboBox1.Text = frmNewCase.caseStatus;
                deComboBox2.Text = frmNewCase.caseType;
                deTextBox5.Text = frmNewCase.caseYear;
                deComboBox12.Text = frmNewCase.caseNature;

                filename = frmNewCase.caseType + frmNewCase.caseYear + frmNewCase.casefile;

                disablegroup2();
                if (deComboBox1.Text == "Disposed")
                {
                    deTextBox9.Focus();
                    deTextBox9.Select();
                    
                }
                else
                {
                    disableDateDisposal();
                    //deComboBox3.Select();
                    deButton22.Select();
                }
                deComboBox3.Text = string.Empty;
                deComboBox4.Text = string.Empty;
                deComboBox5.Text = string.Empty;
                deComboBox6.Text = string.Empty;
                deComboBox7.Text = string.Empty;
                deComboBox8.Text = string.Empty;
                deComboBox9.Text = string.Empty;
                deComboBox10.Text = string.Empty;
                deComboBox11.Text = string.Empty;


                if(frmNewCase.isWith == true)
                {
                    if (metadata_details_analogous(projKey, bundleKey).Rows.Count > 0)
                    {
                        string analogous_case_no = metadata_details_analogous(projKey, bundleKey).Rows[0][2].ToString();
                        if (analogous_case_no == null || analogous_case_no == "")
                        {
                            deComboBox10.Text = string.Empty;
                            deTextBox38.Text = string.Empty;
                            deTextBox39.Text = string.Empty;
                            listView6.Items.Clear();
                        }
                        else
                        {
                            deComboBox10.Text = string.Empty;
                            deTextBox38.Text = string.Empty;
                            deTextBox39.Text = string.Empty;
                            string[] split = analogous_case_no.Split(new string[] { "||" }, StringSplitOptions.None);

                            foreach (string analogouscaseno in split)
                            {
                                Console.WriteLine(analogouscaseno);
                                if (analogouscaseno == null || analogouscaseno == "")
                                {
                                }
                                else
                                {
                                    listView6.Items.Add(analogouscaseno);
                                    aList.Add(analogouscaseno);
                                }
                            }
                            deLabel59.Text = "Total Analogous Case : " + aList.Count;
                        }
                    }
                }
                
                
            }

            if (_mode == DataLayerDefs.Mode._Edit)
            {
                populateCasestatus();
                populateCaseType();
                populateCaseNature();
                populateJudge();
                populateDistrict();
                populateLcCaseType();
                populateLCJudge();
                populateConnAppCaseType();
                populateDisposalType();
                populateConnMainCaseType();
                analogousCaseType();
                oldCaseType();

                //bundle details
                deTextBox1.Text = _GetBundleDetails(projKey, bundleKey).Rows[0][4].ToString();
                deTextBox2.Text = _GetBundleDetails(projKey, bundleKey).Rows[0][3].ToString();
                deTextBox3.Text = _GetBundleDetails(projKey, bundleKey).Rows[0][2].ToString();
                deTextBox4.Text = _GetBundleDetails(projKey, bundleKey).Rows[0][5].ToString();
                disablegroup1();

                //file details
                deTextBox8.Text = _GetFileCaseDetails(projKey, bundleKey, filename).Rows[0][3].ToString();
                deComboBox1.Text = _GetFileCaseDetails(projKey, bundleKey, filename).Rows[0][4].ToString();
                deComboBox2.Text = _GetFileCaseDetails(projKey, bundleKey, filename).Rows[0][6].ToString();
                deTextBox5.Text = _GetFileCaseDetails(projKey, bundleKey, filename).Rows[0][7].ToString();
                deComboBox12.Text = _GetFileCaseDetails(projKey, bundleKey, filename).Rows[0][5].ToString();
                disablegroup2();
                if (deComboBox1.Text == "Disposed")
                {
                    enableDateDisposal();
                    deTextBox9.Focus();
                    deTextBox9.Select();
                }
                else
                {
                    disableDateDisposal();
                    //deComboBox3.Select();
                    deButton22.Select();
                }

                string item_no = _GetFileCaseDetails(projKey, bundleKey, filename).Rows[0][2].ToString();

                string disposal_date = metadata_details(projKey, bundleKey, filename).Rows[0][8].ToString();
                if(disposal_date == "" || disposal_date == null)
                {
                    deTextBox6.Text = string.Empty;
                    deTextBox7.Text = string.Empty;
                    deTextBox9.Text = string.Empty;
                }
                else
                {
                    deTextBox6.Text = disposal_date.Substring(0, 4);
                    deTextBox7.Text = disposal_date.Substring(5, 2);
                    deTextBox9.Text = disposal_date.Substring(8, 2);
                }
                string judge_name = metadata_details(projKey, bundleKey, filename).Rows[0][9].ToString();
                
                if (judge_name == "" || judge_name == null)
                {
                    deComboBox3.Text = string.Empty;
                    listView1.Items.Clear();
                    
                }
                else
                {
                    deComboBox3.Text = string.Empty;
                    string[] split = judge_name.Split(new string[] {"||"},StringSplitOptions.None);
                    
                    foreach (string judge in split)
                    {
                        Console.WriteLine(judge);
                        if (judge == null || judge == "")
                        {
                        }
                        else
                        {
                            listView1.Items.Add(judge);
                            jList.Add(judge);
                            

                        }
                    }
                    deLabel50.Text = "Total Judges : " + jList.Count;
                    
                }

                string district = metadata_details(projKey, bundleKey, filename).Rows[0][10].ToString();
                if(district == null || district == "")
                {
                    deComboBox4.Text = string.Empty;
                }
                else
                {
                    deComboBox4.Text = district;
                }

                string petitioner_name = metadata_details(projKey, bundleKey, filename).Rows[0][11].ToString();
                if(petitioner_name == null || petitioner_name == "")
                {
                    deTextBox11.Text = string.Empty;
                    listView2.Items.Clear();

                }
                else
                {
                    deTextBox11.Text = string.Empty;
                    string[] split = petitioner_name.Split(new string[] { "||" }, StringSplitOptions.None);

                    foreach (string petitioner in split)
                    {
                        Console.WriteLine(petitioner);
                        if (petitioner == null || petitioner == "")
                        {
                        }
                        else
                        {
                            listView2.Items.Add(petitioner);
                            pList.Add(petitioner);
                        }
                    }
                    
                    deLabel51.Text = "Total Petitioner : " + pList.Count;
                    
                }

                string petitioner_counsel_name = metadata_details(projKey, bundleKey, filename).Rows[0][12].ToString();
                if(petitioner_counsel_name == null || petitioner_counsel_name == "")
                {
                    deTextBox14.Text = string.Empty;
                    listView7.Items.Clear();
                }
                else
                {
                    deTextBox14.Text = string.Empty;
                    string[] split = petitioner_counsel_name.Split(new string[] { "||" }, StringSplitOptions.None);

                    foreach (string petitionercounsel in split)
                    {
                        Console.WriteLine(petitionercounsel);
                        if (petitionercounsel == null || petitionercounsel == "")
                        {
                        }
                        else
                        {
                            listView7.Items.Add(petitionercounsel);
                            pcList.Add(petitionercounsel);
                        }
                    }
                   
                    deLabel52.Text = "Total Petitioner Counsel : " + pcList.Count;
                    
                }

                string respondant_name = metadata_details(projKey, bundleKey, filename).Rows[0][13].ToString();
                if(respondant_name == null || respondant_name == "")
                {
                    deTextBox18.Text = string.Empty;
                    listView3.Items.Clear();
                }
                else
                {
                    deTextBox18.Text = string.Empty;
                    string[] split = respondant_name.Split(new string[] { "||" }, StringSplitOptions.None);

                    foreach (string respondant in split)
                    {
                        Console.WriteLine(respondant);
                        if (respondant == null || respondant == "")
                        {
                        }
                        else
                        {
                            listView3.Items.Add(respondant);
                            rList.Add(respondant);
                        }
                    }
                    
                    deLabel53.Text = "Total Respondant : " + rList.Count;
                    
                }

                string respondant_counsel = metadata_details(projKey, bundleKey, filename).Rows[0][14].ToString();
                if(respondant_counsel == null || respondant_counsel == "")
                {
                    deTextBox16.Text = string.Empty;
                    listView8.Items.Clear();
                }
                else
                {
                    deTextBox16.Text = string.Empty;
                    string[] split = respondant_counsel.Split(new string[] { "||" }, StringSplitOptions.None);

                    foreach (string respondantcounsel in split)
                    {
                        Console.WriteLine(respondantcounsel);
                        if (respondantcounsel == null || respondantcounsel == "")
                        {
                        }
                        else
                        {
                            listView8.Items.Add(respondantcounsel);
                            rcList.Add(respondantcounsel);
                        }
                    }
                    
                    deLabel54.Text = "Total Respondant Counsel : " + rcList.Count;
                    
                }

                string case_filling_date = metadata_details(projKey, bundleKey, filename).Rows[0][15].ToString();
                if(case_filling_date == null || case_filling_date == "")
                {
                    deTextBox21.Text = string.Empty;
                    deTextBox20.Text = string.Empty;
                    deTextBox19.Text = string.Empty;
                }
                else
                {
                    deTextBox21.Text = case_filling_date.Substring(0, 4);
                    deTextBox20.Text = case_filling_date.Substring(5, 2);
                    deTextBox19.Text = case_filling_date.Substring(8, 2);
                }

                string ps = metadata_details(projKey, bundleKey, filename).Rows[0][16].ToString();
                if(ps == null || ps == "")
                {
                    deTextBox22.Text = string.Empty;
                }
                else
                {
                    deTextBox22.Text = ps;
                }

                string ps_case_no = metadata_details(projKey, bundleKey, filename).Rows[0][17].ToString();
                if(ps_case_no == null || ps_case_no == "")
                {
                    deTextBox23.Text = string.Empty;
                }
                else
                {
                    deTextBox23.Text = ps_case_no;
                }

                string lc_case_no = metadata_details(projKey, bundleKey, filename).Rows[0][18].ToString();
                if(lc_case_no == null || lc_case_no == "")
                {
                    deComboBox5.Text = string.Empty;
                    deTextBox24.Text = string.Empty;
                    deTextBox25.Text = string.Empty;
                    listView4.Items.Clear();
                }
                else
                {
                    deComboBox5.Text = string.Empty;
                    deTextBox24.Text = string.Empty;
                    deTextBox25.Text = string.Empty;

                    string[] split = lc_case_no.Split(new string[] { "||" }, StringSplitOptions.None);

                    foreach (string lccaseno in split)
                    {
                        Console.WriteLine(lccaseno);
                        if (lccaseno == null || lccaseno == "")
                        {
                        }
                        else
                        {
                            listView4.Items.Add(lccaseno);
                            lcNList.Add(lccaseno);
                        }
                    }
                    
                    deLabel55.Text = "Total LC Case : " + lcNList.Count;
                    
                }

                string lc_order_date = metadata_details(projKey, bundleKey, filename).Rows[0][19].ToString();
                if(lc_order_date == null || lc_order_date == "")
                {
                    deTextBox29.Text = string.Empty;
                    deTextBox28.Text = string.Empty;
                    deTextBox27.Text = string.Empty;
                }
                else
                {
                    deTextBox29.Text = lc_order_date.Substring(0, 4);
                    deTextBox28.Text = lc_order_date.Substring(5, 2);
                    deTextBox27.Text = lc_order_date.Substring(8, 2);
                }

                string lc_judge_name = metadata_details(projKey, bundleKey, filename).Rows[0][20].ToString();
                if(lc_judge_name == null || lc_judge_name == "")
                {
                    deComboBox6.Text = string.Empty;
                    listView9.Items.Clear();
                }
                else
                {
                    deComboBox6.Text = string.Empty;
                    string[] split = lc_judge_name.Split(new string[] { "||" }, StringSplitOptions.None);

                    foreach (string lcjudge in split)
                    {
                        Console.WriteLine(lcjudge);
                        if (lcjudge == null || lcjudge == "")
                        {
                        }
                        else
                        {
                            listView9.Items.Add(lcjudge);
                            lcJList.Add(lcjudge);
                        }
                    }
                    
                    deLabel56.Text = "Total LC Judges : " + lcJList.Count;
                }

                string conn_app_case_no = metadata_details(projKey, bundleKey, filename).Rows[0][21].ToString();
                if(conn_app_case_no == null || conn_app_case_no == "")
                {
                    deComboBox7.Text = string.Empty;
                    deTextBox31.Text = string.Empty;
                    deTextBox32.Text = string.Empty;
                    listView5.Items.Clear();
                }
                else
                {
                    deComboBox7.Text = string.Empty;
                    deTextBox31.Text = string.Empty;
                    deTextBox32.Text = string.Empty;
                    string[] split = conn_app_case_no.Split(new string[] { "||" }, StringSplitOptions.None);

                    foreach (string connappcaseno in split)
                    {
                        Console.WriteLine(connappcaseno);
                        if (connappcaseno == null || connappcaseno == "")
                        {
                        }
                        else
                        {
                            listView5.Items.Add(connappcaseno);
                            cList.Add(connappcaseno);
                        }
                    }
                    deLabel57.Text = "Total Connected Application : " + cList.Count;
                }

                string conn_disposal_type = metadata_details(projKey, bundleKey, filename).Rows[0][22].ToString();
                if(conn_disposal_type == null || conn_disposal_type == "")
                {
                    deComboBox8.Text = string.Empty;
                }
                else
                {
                    deComboBox8.Text = conn_disposal_type;
                }

                string conn_main_case_no = metadata_details(projKey, bundleKey, filename).Rows[0][23].ToString();
                if(conn_main_case_no == null || conn_main_case_no == "")
                {
                    deComboBox9.Text = string.Empty;
                    deTextBox35.Text = string.Empty;
                    deTextBox36.Text = string.Empty;
                    listView10.Items.Clear();
                }
                else
                {
                    deComboBox9.Text = string.Empty;
                    deTextBox35.Text = string.Empty;
                    deTextBox36.Text = string.Empty;
                    string[] split = conn_main_case_no.Split(new string[] { "||" }, StringSplitOptions.None);

                    foreach (string connmaincaseno in split)
                    {
                        Console.WriteLine(connmaincaseno);
                        if (connmaincaseno == null || connmaincaseno == "")
                        {
                        }
                        else
                        {
                            listView10.Items.Add(connmaincaseno);
                            cMList.Add(connmaincaseno);
                        }
                    }
                    deLabel58.Text = "Total Connected Main Case : " + cMList.Count;
                }

                string analogous_case_no = metadata_details(projKey, bundleKey, filename).Rows[0][24].ToString();
                if(analogous_case_no == null || analogous_case_no == "")
                {
                    deComboBox10.Text = string.Empty;
                    deTextBox38.Text = string.Empty;
                    deTextBox39.Text = string.Empty;
                    listView6.Items.Clear();
                }
                else
                {
                    deComboBox10.Text = string.Empty;
                    deTextBox38.Text = string.Empty;
                    deTextBox39.Text = string.Empty;
                    string[] split = analogous_case_no.Split(new string[] { "||" }, StringSplitOptions.None);

                    foreach (string analogouscaseno in split)
                    {
                        Console.WriteLine(analogouscaseno);
                        if (analogouscaseno == null || analogouscaseno == "")
                        {
                        }
                        else
                        {
                            listView6.Items.Add(analogouscaseno);
                            aList.Add(analogouscaseno);
                        }
                    }
                    deLabel59.Text = "Total Analogous Case : " + aList.Count;
                }

                string old_case_type = metadata_details(projKey, bundleKey, filename).Rows[0][25].ToString();
                if (old_case_type == null || old_case_type == "")
                {
                    deComboBox11.Text = string.Empty;
                }
                else
                {
                    deComboBox11.Text = old_case_type;
                }

                string old_case_no = metadata_details(projKey, bundleKey, filename).Rows[0][26].ToString();
                if (old_case_no == null || old_case_no == "")
                {
                    deTextBox40.Text = string.Empty;
                }
                else
                {
                    deTextBox40.Text = old_case_no;
                }

                string old_case_year = metadata_details(projKey, bundleKey, filename).Rows[0][27].ToString();
                if (old_case_year == null || old_case_year == "")
                {
                    deTextBox41.Text = string.Empty;
                }
                else
                {
                    deTextBox41.Text = old_case_year;
                }

                string file_move_history = metadata_details(projKey, bundleKey, filename).Rows[0][28].ToString();
                if (file_move_history == null || file_move_history == "")
                {
                    deTextBox42.Text = string.Empty;
                }
                else
                {
                    deTextBox42.Text = file_move_history;
                }

                string dept_remark = metadata_details(projKey, bundleKey, filename).Rows[0][29].ToString();
                if (dept_remark == null || dept_remark == "")
                {
                    deTextBox43.Text = string.Empty;
                }
                else
                {
                    deTextBox43.Text = dept_remark;
                }

               
            }
        }

        private DataTable metadata_details(string projkey, string bundlekey, string casefileno, string item_no)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select proj_code, bundle_key, item_no,case_file_no, case_status, case_type, case_nature, case_year, disposal_date, judge_name, district,petitioner_name,petitioner_counsel_name,respondant_name, respondant_counsel_name, case_filling_date, ps_name, ps_case_no, lc_case_no,lc_order_date,lc_judge_name, conn_app_case_no, conn_disposal_type,conn_main_case_no, analogous_case_no, old_case_type,old_case_no,old_case_year,file_move_history,dept_remark from metadata_entry where proj_code = '"+projkey+"' and bundle_key = '"+bundlekey+"' and case_file_no = '"+casefileno+"' and item_no = '"+item_no+"' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);

            return dt;

        }

        private DataTable metadata_details(string projkey, string bundlekey, string fileName)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select proj_code, bundle_key, item_no,case_file_no, case_status, case_type, case_nature, case_year, disposal_date, judge_name, district,petitioner_name,petitioner_counsel_name,respondant_name, respondant_counsel_name, case_filling_date, ps_name, ps_case_no, lc_case_no,lc_order_date,lc_judge_name, conn_app_case_no, conn_disposal_type,conn_main_case_no, analogous_case_no, old_case_type,old_case_no,old_case_year,file_move_history,dept_remark from metadata_entry where proj_code = '" + projkey + "' and bundle_key = '" + bundlekey + "' and filename = '" + fileName + "'  ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);

            return dt;

        }
        private DataTable metadata_details_analogous(string projkey, string bundlekey)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select proj_code, bundle_key, analogous_case_no from metadata_entry where proj_code = '" + projkey + "' and bundle_key = '" + bundlekey + "' and analogous_case_no <> '' order by item_no DESC ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);

            return dt;

        }
        private void EntryForm_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Escape)
            {
                if (_mode == DataLayerDefs.Mode._Add)
                {
                    DialogResult dr = MessageBox.Show(this, "Do you want to Exit ? ", "B'Zer - Calcutta High Court ", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                    if (dr == DialogResult.Yes)
                    {
                        jList.Clear();
                        pList.Clear();
                        pcList.Clear();
                        rList.Clear();
                        rcList.Clear();
                        lcNList.Clear();
                        lcJList.Clear();
                        cList.Clear();
                        cMList.Clear();
                        aList.Clear();
                        this.Close();
                        
                    }
                    else
                    {
                        return;
                    }
                }

                if (_mode == DataLayerDefs.Mode._Edit)
                {
                    DialogResult dr = MessageBox.Show(this, "Do you want to Exit ? ", "B'Zer - Calcutta High Court ", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                    if (dr == DialogResult.Yes)
                    {
                        jList.Clear();
                        pList.Clear();
                        pcList.Clear();
                        rList.Clear();
                        rcList.Clear();
                        lcNList.Clear();
                        lcJList.Clear();
                        cList.Clear();
                        cMList.Clear();
                        aList.Clear();
                        this.Close();
                        //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Edit);
                        //fm.ShowDialog(this);
                    }
                    else
                    {
                        return;
                    }
                }
            }

            if (e.Control == true && e.KeyCode == Keys.S)
            {
                deButton20_Click(sender, e);
            }

            if (e.Control == true && e.KeyCode == Keys.D)
            {
                deComboBox4.Focus();
                return;
            }

            if (e.Control == true && e.KeyCode == Keys.J)
            {
                deButton22.Focus();
                return;
            }

            if (e.Control == true && e.KeyCode == Keys.P)
            {
                deButton23.Focus();
                return;
            }

            if (e.Control == true && e.KeyCode == Keys.R)
            {
                deButton25.Focus();
                return;
            }

            if (e.Control == true && e.KeyCode == Keys.L)
            {
                deButton27.Focus();
                return;
            }

            if (e.Control == true && e.KeyCode == Keys.C)
            {
                deButton29.Focus();
                return;
            }

            if (e.Control == true && e.KeyCode == Keys.M)
            {
                deButton30.Focus();
                return;
            }

            if ((e.Alt == true && e.KeyCode == Keys.A) || (e.Control == true && e.KeyCode == Keys.A))
            {
                deButton31.Focus();
                return;
            }

            if (e.Control == true && e.KeyCode == Keys.O)
            {
                deComboBox11.Focus();
                return;
            }

            if (e.Control == true && e.KeyCode == Keys.F)
            {
                deTextBox19.Focus();
                return;
            }

            if (e.Control == true && e.KeyCode == Keys.N)
            {
                deTextBox43.Focus();
                return;
            }

            if(e.Alt == true && e.KeyCode == Keys.N)
            {
                deTextBox43.Focus();
                return;
            }

            if (e.Modifiers == Keys.Alt && e.KeyCode == Keys.N)
            {
                deTextBox43.Focus();
                return;
            }
        }

        private void cmdnew_Click(object sender, EventArgs e)
        {
            deComboBox3.Text = deComboBox3.Text.Trim();
            if ((deComboBox3.Text.Trim() != "" || deComboBox3.Text.Trim() != null || !String.IsNullOrEmpty(deComboBox3.Text.Trim()) || !String.IsNullOrWhiteSpace(deComboBox3.Text.Trim())) && searchJudge(deComboBox3.Text.Trim()).Rows.Count > 0)
            {
                string judge_name = "HON`BLE " + deComboBox3.SelectedValue.ToString() + " " + deComboBox3.Text.Trim();

                for (int i = 0; i < listView1.Items.Count; i++)
                {
                    if (listView1.Items[i].SubItems[0].Text == judge_name)
                    {
                        MessageBox.Show("This Judge name is already added...");
                        deComboBox3.Focus();
                        return;
                    }
                    else
                    {
                        continue;
                    }
                }

                string[] row = { judge_name };
                var listItem = new ListViewItem(row);
                listView1.Items.Add(listItem);
                deComboBox3.Text = string.Empty;
                deComboBox3.Focus();

            }
            else
            {
                MessageBox.Show("No Such Judge name is selected...");
                deComboBox3.Focus();
                return;
            }
        }

        private void deButton1_Click(object sender, EventArgs e)
        {
            if(listView1.Items.Count > 0)
            {
                for (int i = 0; i < listView1.Items.Count; i++)
                {
                    if (listView1.Items[i].Selected == true)
                    {
                        if (listView1.SelectedItems[0].Selected == true)
                        {
                            listView1.SelectedItems[0].Remove();
                            deComboBox3.Text = string.Empty;
                            deComboBox3.Focus();
                        }
                    }
                }
            }
        }

        private void deButton3_Click(object sender, EventArgs e)
        {
            if (deTextBox11.Text == "" || deTextBox11.Text == null || deTextBox11.Text == string.Empty || String.IsNullOrEmpty(deTextBox11.Text) || String.IsNullOrWhiteSpace(deTextBox11.Text))
            {
                deTextBox11.Focus();
                return;
            }
            if (deTextBox11.Text != "" || deTextBox11.Text != string.Empty)
            {
                for (int i = 0; i < listView2.Items.Count; i++)
                {
                    if (listView2.Items[i].SubItems[0].Text == deTextBox11.Text.Trim())
                    {
                        MessageBox.Show("This Petinioer name is already added...");
                        deTextBox11.Focus();
                        return;
                    }
                    else
                    {
                        continue;
                    }
                }

                string[] row = { deTextBox11.Text.Trim() };
                var listItem = new ListViewItem(row);
                listView2.Items.Add(listItem);
                deTextBox11.Text = string.Empty;
                deTextBox11.Focus();
            }
            
        }

        private void deButton2_Click(object sender, EventArgs e)
        {
            if (listView2.Items.Count > 0)
            {
                for (int i = 0; i < listView2.Items.Count; i++)
                {
                    if(listView2.Items[i].Selected == true)
                    {
                        if (listView2.SelectedItems[0].Selected == true)
                        {
                            listView2.SelectedItems[0].Remove();
                            deTextBox11.Text = string.Empty;
                            deTextBox11.Focus();
                        }
                    }
                }
                   
            }
        }

        private void deButton10_Click(object sender, EventArgs e)
        {

            if (deTextBox18.Text == "" || deTextBox18.Text == null || String.IsNullOrEmpty(deTextBox18.Text) || String.IsNullOrWhiteSpace(deTextBox18.Text))
            {
                deTextBox18.Focus();
                return;
            }
            if (deTextBox18.Text != "" || deTextBox18.Text != null)
            {
                for (int i = 0; i < listView3.Items.Count; i++)
                {
                    if (listView3.Items[i].SubItems[0].Text == deTextBox18.Text.Trim())
                    {
                        MessageBox.Show("This Respondant name is already added...");
                        deTextBox18.Focus();
                        return;
                    }
                    else
                    {
                        continue;
                    }
                }
                string[] row = { deTextBox18.Text.Trim() };
                var listItem = new ListViewItem(row);
                listView3.Items.Add(listItem);
                deTextBox18.Text = string.Empty;
                deTextBox18.Focus();
            }
           
        }

        private void deButton11_Click(object sender, EventArgs e)
        {
            if (listView3.Items.Count > 0)
            {
                for (int i = 0; i < listView3.Items.Count; i++)
                {
                    if (listView3.Items[i].Selected == true)
                    {
                        if (listView3.SelectedItems[0].Selected == true)
                        {
                            listView3.SelectedItems[0].Remove();
                            deTextBox18.Text = string.Empty;
                            deTextBox18.Focus();
                        }
                    }
                }
            }
        }

        private void deButton5_Click(object sender, EventArgs e)
        {

            if (deTextBox14.Text == "" || deTextBox14.Text == null || String.IsNullOrEmpty(deTextBox14.Text) || String.IsNullOrWhiteSpace(deTextBox14.Text))
            {
                deTextBox14.Focus();
                return;
            }
            if (deTextBox14.Text != "" || deTextBox14.Text != null)
            {
                for (int i = 0; i < listView7.Items.Count; i++)
                {
                    if (listView7.Items[i].SubItems[0].Text == deTextBox14.Text.Trim())
                    {
                        MessageBox.Show("This Petinioner Counsel name is already added...");
                        deTextBox14.Focus();
                        return;
                    }
                    else
                    {
                        continue;
                    }
                }
                string[] row = { deTextBox14.Text.Trim() };
                var listItem = new ListViewItem(row);
                listView7.Items.Add(listItem);
                deTextBox14.Text = string.Empty;
                deTextBox14.Focus();
            }
           
        }

        private void deButton4_Click(object sender, EventArgs e)
        {
            if (listView7.Items.Count > 0)
            {
                for (int i = 0; i < listView7.Items.Count; i++)
                {
                    if (listView7.Items[i].Selected == true)
                    {
                        if (listView7.SelectedItems[0].Selected == true)
                        {
                            listView7.SelectedItems[0].Remove();
                            deTextBox14.Text = string.Empty;
                            deTextBox14.Focus();
                        }
                    }
                }
            }
        }

        private void deButton6_Click(object sender, EventArgs e)
        {
            if (deTextBox16.Text == "" || deTextBox16.Text == null || String.IsNullOrEmpty(deTextBox16.Text) || String.IsNullOrWhiteSpace(deTextBox16.Text))
            {
                deTextBox16.Focus();
                return;
            }
            if (deTextBox16.Text != "" || deTextBox16.Text != null)
            {
                for (int i = 0; i < listView8.Items.Count; i++)
                {
                    if (listView8.Items[i].SubItems[0].Text == deTextBox16.Text.Trim())
                    {
                        MessageBox.Show("This Respondant Counsel name is already added...");
                        deTextBox16.Focus();
                        return;
                    }
                    else
                    {
                        continue;
                    }
                }
                string[] row = { deTextBox16.Text.Trim() };
                var listItem = new ListViewItem(row);
                listView8.Items.Add(listItem);
                deTextBox16.Text = string.Empty;
                deTextBox16.Focus();
            }
            
        }

        private void deButton7_Click(object sender, EventArgs e)
        {
            if (listView8.Items.Count > 0)
            {
                for (int i = 0; i < listView8.Items.Count; i++)
                {
                    if (listView8.Items[i].Selected == true)
                    {
                        if (listView8.SelectedItems[0].Selected == true)
                        {
                            listView8.SelectedItems[0].Remove();
                            deTextBox16.Text = string.Empty;
                            deTextBox16.Focus();
                        }
                    }
                }
            }
        }

        private void deButton9_Click(object sender, EventArgs e)
        {
            
            if ((deComboBox5.Text == "" || deComboBox5.Text == null || String.IsNullOrEmpty(deComboBox5.Text) || String.IsNullOrWhiteSpace(deComboBox5.Text)) || (deTextBox24.Text == "" || deTextBox24.Text == null || String.IsNullOrEmpty(deTextBox24.Text) || String.IsNullOrWhiteSpace(deTextBox24.Text)) || (deTextBox25.Text == "" || deTextBox25.Text == string.Empty || deTextBox25.Text == null || String.IsNullOrEmpty(deTextBox25.Text) || String.IsNullOrWhiteSpace(deTextBox25.Text)))
            {
                MessageBox.Show("Please Fill All the fields ...");
                deComboBox5.Focus();
                return;
            }

            if ((deComboBox5.Text != "" || deComboBox5.Text != null) || (deTextBox24.Text != "" || deTextBox24.Text != null) || (deTextBox25.Text != "" || deTextBox25.Text != null))
            {
                deComboBox5.Text = deComboBox5.Text.Trim().ToUpper();
                if (searchLCCaseType(deComboBox5.Text.Trim()).Rows.Count > 0)
                {
                    string lc_case_number = deComboBox5.Text.Trim() + "/" + deTextBox24.Text + "/" + deTextBox25.Text;

                    for (int i = 0; i < listView4.Items.Count; i++)
                    {
                        if (listView4.Items[i].SubItems[0].Text == lc_case_number)
                        {
                            MessageBox.Show("This Lower court case number is already added...");
                            deComboBox5.Focus();
                            return;
                        }
                        else
                        {
                            continue;
                        }
                    }

                    string[] row = { lc_case_number };
                    var listItem = new ListViewItem(row);
                    listView4.Items.Add(listItem);
                    deComboBox5.Text = string.Empty;
                    deTextBox24.Text = string.Empty;
                    deTextBox25.Text = string.Empty;
                    deComboBox5.Focus();
                }
                else
                {
                    MessageBox.Show("Select proper LC Case type...");
                    deComboBox5.Text = string.Empty;
                    deTextBox24.Text = string.Empty;
                    deTextBox25.Text = string.Empty;
                    deComboBox5.Focus();
                    return;
                }

            }
            
        }

        private void deButton8_Click(object sender, EventArgs e)
        {
            if (listView4.Items.Count > 0)
            {
                for (int i = 0; i < listView4.Items.Count; i++)
                {
                    if (listView4.Items[i].Selected == true)
                    {
                        if (listView4.SelectedItems[0].Selected == true)
                        {
                            listView4.SelectedItems[0].Remove();
                            deComboBox5.Text = string.Empty;
                            deTextBox24.Text = string.Empty;
                            deTextBox25.Text = string.Empty;
                            deComboBox5.Focus();
                        }
                    }
                }
            }
        }

        private void deButton13_Click(object sender, EventArgs e)
        {
            deComboBox6.Text = deComboBox6.Text.Trim();

            if ((deComboBox6.Text == "" || deComboBox6.Text == null || String.IsNullOrEmpty(deComboBox6.Text)) || String.IsNullOrWhiteSpace(deComboBox6.Text))
            {
                MessageBox.Show("No Such LC Judge name is selected...");
                deComboBox6.Focus();
                return;
            }
            if ((deComboBox6.Text != "" || deComboBox6.Text != null) && searchJudge(deComboBox6.Text.Trim()).Rows.Count > 0)
            {
                string judge_name = "HON`BLE " + deComboBox6.SelectedValue.ToString() + " " + deComboBox6.Text.Trim();

                for (int i = 0; i < listView9.Items.Count; i++)
                {
                    if (listView9.Items[i].SubItems[0].Text == judge_name)
                    {
                        MessageBox.Show("This LC Judge name is already added...");
                        deComboBox6.Focus();
                        return;
                    }
                    else
                    {
                        continue;
                    }
                }

                string[] row = { judge_name };
                var listItem = new ListViewItem(row);
                listView9.Items.Add(listItem);
                deComboBox6.Text = string.Empty;
                deComboBox6.Focus();

            }
            
        }

        private void deButton12_Click(object sender, EventArgs e)
        {
            if (listView9.Items.Count > 0)
            {
                for (int i = 0; i < listView9.Items.Count; i++)
                {
                    if (listView9.Items[i].Selected == true)
                    {
                        if (listView9.SelectedItems[0].Selected == true)
                        {
                            listView9.SelectedItems[0].Remove();
                            deComboBox6.Text = string.Empty;
                            deComboBox6.Focus();
                        }
                    }
                }
            }
        }

        private void deButton14_Click(object sender, EventArgs e)
        {
            if (listView5.Items.Count > 0)
            {
                for (int i = 0; i < listView5.Items.Count; i++)
                {
                    if (listView5.Items[i].Selected == true)
                    {
                        if (listView5.SelectedItems[0].Selected == true)
                        {
                            listView5.SelectedItems[0].Remove();
                            deComboBox7.Text = string.Empty;
                            deTextBox31.Text = string.Empty;
                            deTextBox32.Text = string.Empty;
                            deComboBox7.Focus();
                        }
                    }
                }
            }
        }

        private void deButton15_Click(object sender, EventArgs e)
        {
            
            if ((deComboBox7.Text == "" || deComboBox7.Text == null || String.IsNullOrEmpty(deComboBox7.Text) || String.IsNullOrWhiteSpace(deComboBox7.Text)) || (deTextBox31.Text == "" || deTextBox31.Text == null || String.IsNullOrEmpty(deTextBox31.Text) || String.IsNullOrWhiteSpace(deTextBox31.Text)) || (deTextBox32.Text == "" || deTextBox32.Text == null || String.IsNullOrEmpty(deTextBox32.Text) || String.IsNullOrWhiteSpace(deTextBox32.Text)))
            {
                MessageBox.Show("Please Fill All the fields ...");
                deComboBox7.Focus();
                return;
            }
            if ((deComboBox7.Text != "" || deComboBox7.Text != null) && (deTextBox31.Text != "" || deTextBox31.Text != null) && (deTextBox32.Text != "" || deTextBox32.Text != null))
            {
                deComboBox7.Text = deComboBox7.Text.Trim().ToUpper();
                if (searchCaseType(deComboBox7.Text.Trim()).Rows.Count > 0)
                {
                    string con_case_number = deComboBox7.Text.Trim() + "/" + deTextBox31.Text + "/" + deTextBox32.Text;

                    for (int i = 0; i < listView5.Items.Count; i++)
                    {
                        if (listView5.Items[i].SubItems[0].Text == con_case_number)
                        {
                            MessageBox.Show("This Connected application case number is already added...");
                            deComboBox7.Focus();
                            return;
                        }
                        else
                        {
                            continue;
                        }
                    }

                    string[] row = { con_case_number };
                    var listItem = new ListViewItem(row);
                    listView5.Items.Add(listItem);
                    deComboBox7.Text = string.Empty;
                    deTextBox31.Text = string.Empty;
                    deTextBox32.Text = string.Empty;
                    deComboBox7.Focus();
                }
                else
                {
                    MessageBox.Show("Select proper Case type...");
                    deComboBox7.Focus();
                    return;
                }

            }
            
        }

        private void deButton17_Click(object sender, EventArgs e)
        {
           
            if ((deComboBox9.Text == "" || deComboBox9.Text == null || String.IsNullOrEmpty(deComboBox9.Text) || String.IsNullOrWhiteSpace(deComboBox9.Text)) || (deTextBox35.Text == "" || deTextBox35.Text == null || String.IsNullOrEmpty(deTextBox35.Text) || String.IsNullOrWhiteSpace(deTextBox35.Text)) || (deTextBox36.Text == "" || deTextBox36.Text == null || String.IsNullOrEmpty(deTextBox36.Text) || String.IsNullOrWhiteSpace(deTextBox36.Text)))
            {
                MessageBox.Show("Please Fill All the fields ...");
                deComboBox9.Focus();
                return;
            }
            if ((deComboBox9.Text != "" || deComboBox9.Text != null) && (deTextBox35.Text != "" || deTextBox35.Text != null) && (deTextBox36.Text != "" || deTextBox36.Text != null))
            {
                deComboBox9.Text = deComboBox9.Text.Trim().ToUpper();
                if (searchCaseType(deComboBox9.Text.Trim()).Rows.Count > 0)
                {
                    string con_main_case_number = deComboBox9.Text.Trim() + "/" + deTextBox35.Text + "/" + deTextBox36.Text;

                    for (int i = 0; i < listView10.Items.Count; i++)
                    {
                        if (listView10.Items[i].SubItems[0].Text == con_main_case_number)
                        {
                            MessageBox.Show("This Connected Main case number is already added...");
                            deComboBox9.Focus();
                            return;
                        }
                        else
                        {
                            continue;
                        }
                    }

                    string[] row = { con_main_case_number };
                    var listItem = new ListViewItem(row);
                    listView10.Items.Add(listItem);
                    deComboBox9.Text = string.Empty;
                    deTextBox35.Text = string.Empty;
                    deTextBox36.Text = string.Empty;
                    deComboBox9.Focus();
                }
                else
                {
                    MessageBox.Show("Select proper Case type...");
                    deComboBox9.Focus();
                    return;
                }

            }
           
        }

        private void deButton16_Click(object sender, EventArgs e)
        {
            if (listView10.Items.Count > 0)
            {
                for (int i = 0; i < listView10.Items.Count; i++)
                {
                    if (listView10.Items[i].Selected == true)
                    {
                        if (listView10.SelectedItems[0].Selected == true)
                        {
                            listView10.SelectedItems[0].Remove();
                            deComboBox9.Text = string.Empty;
                            deTextBox35.Text = string.Empty;
                            deTextBox36.Text = string.Empty;
                            deComboBox9.Focus();
                        }
                    }
                }
            }
        }

        private void deButton19_Click(object sender, EventArgs e)
        {
            
            if ((deComboBox10.Text == "" || deComboBox10.Text == null || String.IsNullOrEmpty(deComboBox10.Text) || String.IsNullOrWhiteSpace(deComboBox10.Text)) || (deTextBox38.Text == "" || deTextBox38.Text == null || String.IsNullOrEmpty(deTextBox38.Text) || String.IsNullOrWhiteSpace(deTextBox38.Text)) || (deTextBox39.Text == "" || deTextBox39.Text == null || String.IsNullOrEmpty(deTextBox39.Text) || String.IsNullOrWhiteSpace(deTextBox39.Text)))
            {
                MessageBox.Show("Please Fill All the fields ...");
                deComboBox10.Focus();
                return;
            }
            if ((deComboBox10.Text != "" || deComboBox10.Text != null) && (deTextBox38.Text != "" || deTextBox38.Text != null) && (deTextBox39.Text != "" || deTextBox39.Text != null))
            {
                deComboBox10.Text = deComboBox10.Text.Trim().ToUpper();
                if (searchCaseType(deComboBox10.Text.Trim()).Rows.Count > 0)
                {
                    string analogous_case_number = deComboBox10.Text.Trim() + "/" + deTextBox38.Text + "/" + deTextBox39.Text;

                    for (int i = 0; i < listView6.Items.Count; i++)
                    {
                        if (listView6.Items[i].SubItems[0].Text == analogous_case_number)
                        {
                            MessageBox.Show("This Analogous case number is already added...");
                            deComboBox10.Focus();
                            return;
                        }
                        else
                        {
                            continue;
                        }
                    }

                    string[] row = { analogous_case_number };
                    var listItem = new ListViewItem(row);
                    listView6.Items.Add(listItem);
                    deComboBox10.Text = string.Empty;
                    deTextBox38.Text = string.Empty;
                    deTextBox39.Text = string.Empty;
                    deComboBox10.Focus();
                }
                else
                {
                    MessageBox.Show("Select proper Case type...");
                    deComboBox10.Focus();
                    return;
                }

            }
            
        }

        private void deButton18_Click(object sender, EventArgs e)
        {
            if (listView6.Items.Count > 0)
            {
                for (int i = 0; i < listView6.Items.Count; i++)
                {
                    if (listView6.Items[i].Selected == true)
                    {
                        if (listView6.SelectedItems[0].Selected == true)
                        {
                            listView6.SelectedItems[0].Remove();
                            deComboBox10.Text = string.Empty;
                            deTextBox38.Text = string.Empty;
                            deTextBox39.Text = string.Empty;
                            deComboBox10.Focus();
                        }
                    }
                }
            }
        }

        private void deButton21_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed || sqlCon.State == ConnectionState.Broken)
            {
                sqlCon.Open();
            }
            if (_mode == DataLayerDefs.Mode._Add)
            {
                DialogResult dr = MessageBox.Show(this, "Do you want to Exit ? ", "B'Zer - Calcutta High Court ", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if (dr == DialogResult.Yes)
                {
                    jList.Clear();
                    pList.Clear();
                    pcList.Clear();
                    rList.Clear();
                    rcList.Clear();
                    lcNList.Clear();
                    lcJList.Clear();
                    cList.Clear();
                    cMList.Clear();
                    aList.Clear();
                    this.Close();
                    //this.Hide();
                    //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Add, txn, crd);
                    //fm.ShowDialog(this);
                }
                else
                {
                    return;
                }
            }
            if (_mode == DataLayerDefs.Mode._Edit)
            {
                DialogResult dr = MessageBox.Show(this, "Do you want to Exit ? ", "B'Zer - Calcutta High Court ", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if (dr == DialogResult.Yes)
                {
                    jList.Clear();
                    pList.Clear();
                    pcList.Clear();
                    rList.Clear();
                    rcList.Clear();
                    lcNList.Clear();
                    lcJList.Clear();
                    cList.Clear();
                    cMList.Clear();
                    aList.Clear();
                    this.Close();
                    //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Edit);
                    //fm.ShowDialog(this);
                }
                else
                {
                    return;
                }
            }
        }

        

        public bool validate()
        {
            bool retval = false;

            string currDate = DateTime.Now.ToString("yyyy-MM-dd");
            string curYear = DateTime.Now.ToString("yyyy");
            int curIntYear = Convert.ToInt32(curYear);

            if(_mode == DataLayerDefs.Mode._Add)
            {
                if(frmNewCase.isWith == true && aList.Count == 0 )
                {
                    retval = false;
                    MessageBox.Show(this,"Please add some analogous case ...", "Warning", MessageBoxButtons.OK,MessageBoxIcon.Warning);
                    deButton31.Focus();
                    return retval;
                }
                else
                { retval = true; }
                
            }


            if (deTextBox6.Text != "" || deTextBox7.Text != "" || deTextBox9.Text != "")
            {
                if (deTextBox6.Text != "")
                {

                    bool res = System.Text.RegularExpressions.Regex.IsMatch(deTextBox6.Text, "[^0-9]");
                    if (res != true && Convert.ToInt32(deTextBox6.Text) <= curIntYear && deTextBox6.Text.Length == 4 && deTextBox6.Text.Substring(0, 1) != "0")
                    {
                        retval = true;
                    }
                    else
                    {
                        retval = false;
                        MessageBox.Show(this,"Please input Valid Year...", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        deTextBox6.Focus();
                        return retval;
                    }
                }
                
                if (deTextBox7.Text != "")
                {

                    bool res1 = System.Text.RegularExpressions.Regex.IsMatch(deTextBox7.Text, "[^0-9]");

                    if (res1 != true && deTextBox7.Text.Length == 2 && Convert.ToInt32(deTextBox7.Text) <= 12 && Convert.ToInt32(deTextBox7.Text) != 0 && deTextBox7.Text != "00")
                    {
                        retval = true;

                    }
                    else
                    {
                        retval = false;
                        MessageBox.Show(this,"Please input Valid Month...", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        deTextBox7.Focus();
                        return retval;
                    }
                }
                else
                {
                    retval = false;
                    MessageBox.Show(this,"Please input Valid Month...", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    deTextBox7.Focus();
                    return retval;
                }
                if (deTextBox9.Text != "")
                {

                    bool res2 = System.Text.RegularExpressions.Regex.IsMatch(deTextBox9.Text, "[^0-9]");
                    if (res2 != true && deTextBox9.Text.Length == 2 && Convert.ToInt32(deTextBox9.Text) <= 31 && Convert.ToInt32(deTextBox9.Text) != 0 && deTextBox9.Text != "00")
                    {
                        retval = true;

                    }
                    else
                    {
                        retval = false;
                        MessageBox.Show(this,"Please input Valid Date...", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        deTextBox9.Focus();
                        return retval;
                    }
                }
                else
                {
                    retval = false;
                    MessageBox.Show(this,"Please input Valid Date...", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    deTextBox9.Focus();
                    return retval;
                }

                DateTime temp;
                string isDate = deTextBox6.Text + "-" + deTextBox7.Text + "-" + deTextBox9.Text;
                if (DateTime.TryParse(isDate, out temp) && DateTime.Parse(isDate) <= DateTime.Parse(currDate))
                {
                    retval = true;
                }
                else
                {
                    retval = false;
                    MessageBox.Show(this,"Please select a valid date", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                    deTextBox6.Select();
                    return retval;

                }
            }
            else
            {
                retval = true;
            }

            if (deTextBox21.Text != "" || deTextBox20.Text != "" || deTextBox19.Text != "")
            {
                if (deTextBox21.Text != "")
                {

                    bool res = System.Text.RegularExpressions.Regex.IsMatch(deTextBox21.Text, "[^0-9]");
                    if (res != true && Convert.ToInt32(deTextBox21.Text) <= curIntYear && deTextBox21.Text.Length == 4 && deTextBox21.Text.Substring(0, 1) != "0")
                    {
                        //retval = true;
                        retval = true;
                    }
                    else
                    {
                        retval = false;
                        MessageBox.Show(this,"Please input Valid Year...", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        deTextBox21.Focus();
                        return retval;
                    }
                }

                if (deTextBox20.Text != "")
                {

                    bool res1 = System.Text.RegularExpressions.Regex.IsMatch(deTextBox20.Text, "[^0-9]");

                    if (res1 != true && deTextBox20.Text.Length == 2 && Convert.ToInt32(deTextBox20.Text) <= 12 && Convert.ToInt32(deTextBox20.Text) != 0 && deTextBox20.Text != "00")
                    {
                        //retval = true;
                        retval = true;
                    }
                    else
                    {
                        retval = false;
                        MessageBox.Show(this,"Please input Valid Month...", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        deTextBox20.Focus();
                        return retval;
                    }
                }
                else
                {
                    retval = false;
                    MessageBox.Show(this,"Please input Valid Month...", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    deTextBox20.Focus();
                    return retval;
                }

                if (deTextBox19.Text != "")
                {

                    bool res2 = System.Text.RegularExpressions.Regex.IsMatch(deTextBox19.Text, "[^0-9]");
                    if (res2 != true && deTextBox19.Text.Length == 2 && Convert.ToInt32(deTextBox19.Text) <= 31 && Convert.ToInt32(deTextBox19.Text) != 0 && deTextBox19.Text != "00")
                    {
                        //retval = true;
                        retval = true;
                    }
                    else
                    {
                        retval = false;
                        MessageBox.Show(this,"Please input Valid Date...", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        deTextBox19.Focus();
                        return retval;
                    }
                }
                else
                {
                    retval = false;
                    MessageBox.Show(this,"Please input Valid Date...", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    deTextBox19.Focus();
                    return retval;
                }

                DateTime temp;
                string isDate = deTextBox21.Text + "-" + deTextBox20.Text + "-" + deTextBox19.Text;
                if (DateTime.TryParse(isDate, out temp) && DateTime.Parse(isDate) <= DateTime.Parse(currDate))
                {
                    retval = true;
                }
                else
                {
                    retval = false;
                    MessageBox.Show(this,"Please select a valid date", "", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                    deTextBox21.Select();
                    return retval;

                }
            }
            else
            {
                retval = true;
            }

            if (deTextBox29.Text != "" || deTextBox28.Text != "" || deTextBox27.Text != "")
            {
                if (deTextBox29.Text != "")
                {

                    bool res = System.Text.RegularExpressions.Regex.IsMatch(deTextBox29.Text, "[^0-9]");
                    if (res != true && Convert.ToInt32(deTextBox29.Text) <= curIntYear && deTextBox29.Text.Length == 4 && deTextBox29.Text.Substring(0, 1) != "0")
                    {
                        //retval = true;
                        retval = true;
                    }
                    else
                    {
                        retval = false;
                        MessageBox.Show(this,"Please input Valid Year...", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        deTextBox29.Focus();
                        return retval;
                    }
                }
                if (deTextBox28.Text != "")
                {

                    bool res1 = System.Text.RegularExpressions.Regex.IsMatch(deTextBox28.Text, "[^0-9]");

                    if (res1 != true && deTextBox28.Text.Length == 2 && Convert.ToInt32(deTextBox28.Text) <= 12 && Convert.ToInt32(deTextBox28.Text) != 0 && deTextBox28.Text != "00")
                    {
                        //retval = true;
                        retval = true;
                    }
                    else
                    {
                        retval = false;
                        MessageBox.Show(this,"Please input Valid Month...", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        deTextBox28.Focus();
                        return retval;
                    }
                }
                else
                {
                    retval = false;
                    MessageBox.Show(this,"Please input Valid Month...", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    deTextBox28.Focus();
                    return retval;
                }
                if (deTextBox27.Text != "")
                {

                    bool res2 = System.Text.RegularExpressions.Regex.IsMatch(deTextBox27.Text, "[^0-9]");
                    if (res2 != true && deTextBox27.Text.Length == 2 && Convert.ToInt32(deTextBox27.Text) <= 31 && Convert.ToInt32(deTextBox27.Text) != 0 && deTextBox27.Text != "00")
                    {
                        //retval = true;
                        retval = true;
                    }
                    else
                    {
                        retval = false;
                        MessageBox.Show(this,"Please input Valid Date...", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        deTextBox27.Focus();
                        return retval;
                    }
                }
                else
                {
                    retval = false;
                    MessageBox.Show(this,"Please input Valid Date...", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    deTextBox27.Focus();
                    return retval;
                }

                DateTime temp;
                string isDate = deTextBox29.Text + "-" + deTextBox28.Text + "-" + deTextBox27.Text;
                if (DateTime.TryParse(isDate, out temp) && DateTime.Parse(isDate) <= DateTime.Parse(currDate))
                {
                    retval = true;
                }
                else
                {
                    retval = false;
                    MessageBox.Show(this,"Please select a valid date", "Please select a valid date", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                    deTextBox29.Select();
                    return retval;

                }
            }
            else
            {
                retval = true;
            }

            

            return retval;
        }

        private bool insertIntoCaseFileDB(string itemno, string case_file_no, string case_status, string case_nature, string case_type, string case_year, OdbcTransaction trans)
        {
            bool commitBol = true;

            string sqlStr = string.Empty;

            OdbcCommand sqlCmd = new OdbcCommand();

            //OdbcTransaction sqlTrans = null;

            filename = case_type + case_file_no + case_year;

            //int sl = _GetTotalCount();
            //int sl_no = sl + 1;

            itemno = Convert.ToString( Convert.ToInt32(itemno) + 1 );

            if(frmNewCase.state[0] == eSTATES.METADATA_ENTRY)
            {
                sqlStr = @"insert into case_file_master(proj_code,bundle_key, item_no,sl_no,case_file_no,case_status,case_nature,case_type,case_year,filename,created_by,created_dttm,status) values('" +
                        projKey + "','" + bundleKey + "','" + itemno +
                        "','" + itemno + "','" + case_file_no + "','" + case_status + "','" + case_nature + "','" + case_type + "','" + case_year + "','" + filename + "','" + crd.created_by + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',0)";
                //sqlCmd.Connection = sqlCon;
            }
            else
            {
                sqlStr = @"insert into case_file_master(proj_code,bundle_key, item_no,sl_no,case_file_no,case_status,case_nature,case_type,case_year,filename,created_by,created_dttm,status) values('" +
                        projKey + "','" + bundleKey + "','" + itemno +
                        "','" + itemno + "','" + case_file_no + "','" + case_status + "','" + case_nature + "','" + case_type + "','" + case_year + "','" + filename + "','" + crd.created_by + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',5)";
                //sqlCmd.Connection = sqlCon;
            }
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
            //sqlStr = @"insert into case_file_master(proj_code,bundle_key, item_no,sl_no,case_file_no,case_status,case_nature,case_type,case_year,filename,created_by,created_dttm,status) values('" +
            //            projKey + "','" + bundleKey + "','" + itemno +
            //            "','" + itemno + "','" + case_file_no + "','" + case_status + "','" + case_nature + "','" + case_type + "','" + case_year + "','"+filename+"','" + frmMain.name + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',0)";
            ////sqlCmd.Connection = sqlCon;
            ////sqlCmd.Transaction = trans;
            //sqlCmd.CommandText = sqlStr;
            //int i = sqlCmd.ExecuteNonQuery();
            //if (i > 0)
            //{
            //    commitBol = true;
            //}
            //else
            //{
            //    commitBol = false;
            //}
            //sqlCmd.Connection = sqlCon;
            //sqlCmd.Transaction = transaction;
            //sqlCmd.CommandText = sqlStr;
            //int j = sqlCmd.ExecuteNonQuery();
            //if (j > 0)
            //{
            //    commitBol = true;
            //}
            //else
            //{
            //    commitBol = false;
            //}

            //System.Diagnostics.Debug.Print(sqlStr);
            //OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon, txn);
            //if (cmd.ExecuteNonQuery() > 0)
            //{
            //    commitBol = true;
            //}

            //System.Diagnostics.Debug.Print(sqlStr);
            //OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon, txn);
            //cmd.Connection = sqlCon;
            //cmd.CommandText = sqlStr;
            //if (cmd.ExecuteNonQuery() >= 0)
            //{
            //    commitBol = true;
            //    //txn.Commit();
            //}
            //else
            //{
            //    commitBol = false;
            //    //txn.Dispose();
            //}

            return commitBol;
        }
        private bool insertIntoDB(string item_no, OdbcTransaction trans)
        {
            bool commitBol = true;

            string sqlStr = string.Empty;

            OdbcCommand sqlCmd = new OdbcCommand();

            string judge_name = "";
            string petitionoer_name = "";
            string petitionoer_counsel = "";
            string respondant_name = "";
            string respondant_counsel = "";
            string lc_case_no = "";
            string lc_judge_name = "";
            string conn_app_case_no = "";
            string conn_main_case_no = "";
            string analogous_case_no = "";

            string case_file_no = deTextBox8.Text;
            string case_status = deComboBox1.Text;
            string case_type = deComboBox2.Text;
            string case_nature = deComboBox12.Text;
            string case_year = deTextBox5.Text;

            filename = case_type + case_file_no + case_year;

            string disposal_date = "";

            if (deTextBox6.Text != "" && deTextBox7.Text != "" && deTextBox9.Text != "")
            {
                disposal_date = deTextBox6.Text+"-"+deTextBox7.Text+"-"+deTextBox9.Text;
            }
            else
            {
                disposal_date = "";
            }
            
            //if (listView1.Items.Count > 0)
            //{
            //    if (listView1.Items.Count == 1)
            //    {
            //        judge_name = listView1.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView1.Items.Count ;i++)
            //        {
            //            judge_name = judge_name + listView1.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    judge_name = string.Empty;
            //}

            if (jList.Count > 0)
            {
                if (jList.Count == 1)
                {
                    judge_name = jList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < jList.Count; i++)
                    {
                        if (i == jList.Count - 1)
                        {
                            judge_name = judge_name + jList[i].ToString();
                        }
                        else
                        {
                            judge_name = judge_name + jList[i].ToString() + "||";
                        }
                    }
                }
            }
            else
            {
                judge_name = string.Empty;
            }

            string district = deComboBox4.Text;

            //if (listView2.Items.Count > 0)
            //{
            //    if (listView2.Items.Count == 1)
            //    {
            //        petitionoer_name = listView2.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView2.Items.Count; i++)
            //        {
            //            petitionoer_name = petitionoer_name + listView2.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    petitionoer_name = string.Empty;
            //}
            if (pList.Count > 0)
            {
                if (pList.Count == 1)
                {
                    petitionoer_name = pList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < pList.Count; i++)
                    {
                        if(i == pList.Count - 1)
                        {
                            petitionoer_name = petitionoer_name + pList[i].ToString() ;
                        }
                        else
                        {
                            petitionoer_name = petitionoer_name + pList[i].ToString() + "||";
                        }
                        
                    }
                }
            }
            else
            {
                petitionoer_name = string.Empty;
            }
            //if (listView7.Items.Count > 0)
            //{
            //    if (listView7.Items.Count == 1)
            //    {
            //        petitionoer_counsel = listView7.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView7.Items.Count; i++)
            //        {
            //            petitionoer_counsel = petitionoer_counsel + listView7.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    petitionoer_counsel = string.Empty;
            //}
            if (pcList.Count > 0)
            {
                if (pcList.Count == 1)
                {
                    petitionoer_counsel = pcList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < pcList.Count; i++)
                    {
                        if(i == pcList.Count - 1)
                        {
                            petitionoer_counsel = petitionoer_counsel + pcList[i].ToString();
                        }
                        else
                        {
                            petitionoer_counsel = petitionoer_counsel + pcList[i].ToString() + "||";
                        }
                       
                    }
                }
            }
            else
            {
                petitionoer_counsel = string.Empty;
            }
            //if (listView3.Items.Count > 0)
            //{
            //    if (listView3.Items.Count == 1)
            //    {
            //        respondant_name = listView3.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView3.Items.Count; i++)
            //        {
            //            respondant_name = respondant_name + listView3.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    respondant_name = string.Empty;
            //}
            if (rList.Count > 0)
            {
                if (rList.Count == 1)
                {
                    respondant_name = rList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < rList.Count; i++)
                    {
                        if(i == rList.Count - 1)
                        {
                            respondant_name = respondant_name + rList[i].ToString() ;
                        }
                        else
                        {
                            respondant_name = respondant_name + rList[i].ToString() + "||";
                        }
                        
                    }
                }
            }
            else
            {
                respondant_name = string.Empty;
            }
            //if (listView8.Items.Count > 0)
            //{
            //    if (listView8.Items.Count == 1)
            //    {
            //        respondant_counsel = listView8.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView8.Items.Count; i++)
            //        {
            //            respondant_counsel = respondant_counsel + listView8.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    respondant_counsel = string.Empty;
            //}
            if (rcList.Count > 0)
            {
                if (rcList.Count == 1)
                {
                    respondant_counsel = rcList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < rcList.Count; i++)
                    {
                        if(i == rcList.Count - 1)
                        {
                            respondant_counsel = respondant_counsel + rcList[i].ToString();
                        }
                        else
                        {
                            respondant_counsel = respondant_counsel + rcList[i].ToString() + "||";
                        }
                        
                    }
                }
            }
            else
            {
                respondant_counsel = string.Empty;
            }
            string case_filling_date = "";
            if (deTextBox21.Text != "" && deTextBox20.Text != "" && deTextBox19.Text != "")
            {
                case_filling_date = deTextBox21.Text + "-" + deTextBox20.Text + "-" + deTextBox19.Text;
            }
            else
            {
                case_filling_date = "";
            }
            
            string ps = deTextBox22.Text.Trim();
            string ps_caseno = deTextBox23.Text.Trim();

            //if (listView4.Items.Count > 0)
            //{
            //    if (listView4.Items.Count == 1)
            //    {
            //        lc_case_no = listView4.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView4.Items.Count; i++)
            //        {
            //            lc_case_no = lc_case_no + listView4.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    lc_case_no = string.Empty;
            //}
            if (lcNList.Count > 0)
            {
                if (lcNList.Count == 1)
                {
                    lc_case_no = lcNList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < lcNList.Count; i++)
                    {
                        if(i == lcNList.Count - 1)
                        {
                            lc_case_no = lc_case_no + lcNList[i].ToString();
                        }
                        else
                        {
                            lc_case_no = lc_case_no + lcNList[i].ToString() + "||";
                        }
                        
                    }
                }
            }
            else
            {
                lc_case_no = string.Empty;
            }
            string lc_order_date = "";
            if (deTextBox29.Text != "" && deTextBox28.Text != "" && deTextBox27.Text != "")
            {
                lc_order_date = deTextBox29.Text + "-" + deTextBox28.Text + "-" + deTextBox27.Text;
            }
            else
            {
                lc_order_date = "";
            }

            //if (listView9.Items.Count > 0)
            //{
            //    if (listView9.Items.Count == 1)
            //    {
            //        lc_judge_name = listView9.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView9.Items.Count; i++)
            //        {
            //            lc_judge_name = lc_judge_name + listView9.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    lc_judge_name = string.Empty;
            //}
            if (lcJList.Count > 0)
            {
                if (lcJList.Count == 1)
                {
                    lc_judge_name = lcJList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < lcJList.Count; i++)
                    {
                        if(i == lcJList.Count - 1)
                        {
                            lc_judge_name = lc_judge_name + lcJList[i].ToString();
                        }
                        else
                        {
                            lc_judge_name = lc_judge_name + lcJList[i].ToString() + "||";
                        }
                       
                    }
                }
            }
            else
            {
                lc_judge_name = string.Empty;
            }
            //if (listView5.Items.Count > 0)
            //{
            //    if (listView5.Items.Count == 1)
            //    {
            //        conn_app_case_no = listView5.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView5.Items.Count; i++)
            //        {
            //            conn_app_case_no = conn_app_case_no + listView5.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    conn_app_case_no = string.Empty;
            //}
            if (cList.Count > 0)
            {
                if (cList.Count == 1)
                {
                    conn_app_case_no = cList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < cList.Count; i++)
                    {
                        if (i == cList.Count-1)
                        {
                            conn_app_case_no = conn_app_case_no + cList[i].ToString();
                        }
                        else
                        {
                            conn_app_case_no = conn_app_case_no + cList[i].ToString() + "||";
                        }
                        
                    }
                }
            }
            else
            {
                conn_app_case_no = string.Empty;
            }
            string conn_app_disposal_type = deComboBox8.Text;

            //if (listView10.Items.Count > 0)
            //{
            //    if (listView10.Items.Count == 1)
            //    {
            //        conn_main_case_no = listView10.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView10.Items.Count; i++)
            //        {
            //            conn_main_case_no = conn_main_case_no + listView10.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    conn_main_case_no = string.Empty;
            //}
            if (cMList.Count > 0)
            {
                if (cMList.Count == 1)
                {
                    conn_main_case_no = cMList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < cMList.Count; i++)
                    {
                        if(i == cMList.Count-1)
                        {
                            conn_main_case_no = conn_main_case_no + cMList[i].ToString();
                        }
                        else
                        {
                            conn_main_case_no = conn_main_case_no + cMList[i].ToString() + "||";
                        }
                        
                    }
                }
            }
            else
            {
                conn_main_case_no = string.Empty;
            }
            //if (listView6.Items.Count > 0)
            //{
            //    if (listView6.Items.Count == 1)
            //    {
            //        analogous_case_no = listView6.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView6.Items.Count; i++)
            //        {
            //            analogous_case_no = analogous_case_no + listView6.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    analogous_case_no = string.Empty;
            //}
            if (aList.Count > 0)
            {
                if (aList.Count == 1)
                {
                    analogous_case_no = aList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < aList.Count; i++)
                    {
                        if(i == aList.Count - 1)
                        {
                            analogous_case_no = analogous_case_no + aList[i].ToString();
                        }
                        else
                        {
                            analogous_case_no = analogous_case_no + aList[i].ToString() + "||";
                        }
                        
                    }
                }
            }
            else
            {
                analogous_case_no = string.Empty;
            }
            string old_case_type = deComboBox11.Text;
            string old_case_no = deTextBox40.Text;
            string old_case_year = deTextBox41.Text;

            string file_move_history = deTextBox42.Text;
            string dept_note = deTextBox43.Text;

            item_no = Convert.ToString(Convert.ToInt32(item_no) + 1);

            sqlStr = @"insert into metadata_entry(proj_code,bundle_key,item_no,case_file_no,case_status,case_type,case_nature,case_year,filename,disposal_date,judge_name,district,petitioner_name,petitioner_counsel_name,respondant_name,respondant_counsel_name,case_filling_date,ps_name,ps_case_no,lc_case_no,lc_order_date,lc_judge_name,conn_app_case_no,conn_disposal_type,conn_main_case_no,analogous_case_no,old_case_type,old_case_no,old_case_year,file_move_history,dept_remark,created_by,created_dttm) values('" +
                        projKey + "','" + bundleKey + "','"+item_no+"','" + case_file_no +
                        "','" + case_status + "','" + case_type + "','" + case_nature + "','" + case_year + "','"+filename+"','" + disposal_date + "','" + judge_name + "','" + district + "','" + petitionoer_name + "','" + petitionoer_counsel + "','" + respondant_name + "','" + respondant_counsel + "','" + case_filling_date + "','" + ps + "','" + ps_caseno + "','" + lc_case_no + "','" + lc_order_date + "','" + lc_judge_name + "','"+conn_app_case_no+"','"+conn_app_disposal_type+"','"+conn_main_case_no+"','"+analogous_case_no+"','"+old_case_type+"','"+old_case_no+"','"+old_case_year+"','"+file_move_history+"','"+dept_note+"','" + crd.created_by + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "')";
            //sqlCmd.Connection = sqlCon;
            //sqlCmd.Transaction = txn;
            //sqlCmd.CommandText = sqlStr;
            //int j = sqlCmd.ExecuteNonQuery();
            //if (j > 0)
            //{
            //    commitBol = true;
            //}
            //else
            //{
            //    commitBol = false;
            //}

            sqlCmd.Connection = sqlCon;
            sqlCmd.Transaction = trans;
            sqlCmd.CommandText = sqlStr;
            int j = sqlCmd.ExecuteNonQuery();
            if (j > 0)
            {
                commitBol = true;
            }
            else
            {
                commitBol = false;
            }

            //System.Diagnostics.Debug.Print(sqlStr);
            //OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon, txn);
            //if (cmd.ExecuteNonQuery() > 0)
            //{
            //    commitBol = true;
            //}

            //System.Diagnostics.Debug.Print(sqlStr);
            //OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            ////cmd.Connection = sqlCon;
            ////cmd.CommandText = sqlStr;
            //if (cmd.ExecuteNonQuery() > 0)
            //{
            //    commitBol = true;
            //    //txn.Commit();
            //}
            //else
            //{
            //    commitBol = false;
            //}
            //return retVal;

            return commitBol;
        }

        private bool updateDB(string item_no)
        {
            bool commitBol = true;

            string sqlStr = string.Empty;

            OdbcCommand sqlCmd = new OdbcCommand();

            string judge_name = "";
            string petitionoer_name = "";
            string petitionoer_counsel = "";
            string respondant_name = "";
            string respondant_counsel = "";
            string lc_case_no = "";
            string lc_judge_name = "";
            string conn_app_case_no = "";
            string conn_main_case_no = "";
            string analogous_case_no = "";

            string case_file_no = deTextBox8.Text;
            string case_status = deComboBox1.Text;
            string case_type = deComboBox2.Text;
            string case_nature = deComboBox12.Text;
            string case_year = deTextBox5.Text;
            string disposal_date = "";

            filename = case_type + case_file_no + case_year;

            if (deTextBox6.Text != "" && deTextBox7.Text != "" && deTextBox9.Text != "")
            {
                disposal_date = deTextBox6.Text + "-" + deTextBox7.Text + "-" + deTextBox9.Text;
            }
            else
            {
                disposal_date = "";
            }

            //if (listView1.Items.Count > 0)
            //{
            //    if (listView1.Items.Count == 1)
            //    {
            //        judge_name = listView1.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView1.Items.Count; i++)
            //        {
            //            judge_name = judge_name + listView1.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    judge_name = string.Empty;
            //}
            if (jList.Count > 0)
            {
                if (jList.Count == 1)
                {
                    judge_name = jList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < jList.Count; i++)
                    {
                        if(i==jList.Count-1)
                        {
                            judge_name = judge_name + jList[i].ToString();
                        }
                        else
                        {
                            judge_name = judge_name + jList[i].ToString() + "||";
                        }
                        
                    }
                }
            }
            else
            {
                judge_name = string.Empty;
            }
            string district = deComboBox4.Text;

            //if (listView2.Items.Count > 0)
            //{
            //    if (listView2.Items.Count == 1)
            //    {
            //        petitionoer_name = listView2.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView2.Items.Count; i++)
            //        {
            //            petitionoer_name = petitionoer_name + listView2.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    petitionoer_name = string.Empty;
            //}
            if (pList.Count > 0)
            {
                if (pList.Count == 1)
                {
                    petitionoer_name = pList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < pList.Count; i++)
                    {
                        if (i == pList.Count - 1)
                        {
                            petitionoer_name = petitionoer_name + pList[i].ToString();
                        }
                        else
                        {
                            petitionoer_name = petitionoer_name + pList[i].ToString() + "||";
                        }
                        
                    }
                }
            }
            else
            {
                petitionoer_name = string.Empty;
            }
            //if (listView7.Items.Count > 0)
            //{
            //    if (listView7.Items.Count == 1)
            //    {
            //        petitionoer_counsel = listView7.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView7.Items.Count; i++)
            //        {
            //            petitionoer_counsel = petitionoer_counsel + listView7.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    petitionoer_counsel = string.Empty;
            //}
            if (pcList.Count > 0)
            {
                if (pcList.Count == 1)
                {
                    petitionoer_counsel = pcList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < pcList.Count; i++)
                    {
                        if (i == pcList.Count - 1)
                        {
                            petitionoer_counsel = petitionoer_counsel + pcList[i].ToString();
                        }
                        else
                        {
                            petitionoer_counsel = petitionoer_counsel + pcList[i].ToString() + "||";
                        }
                        
                    }
                }
            }
            else
            {
                petitionoer_counsel = string.Empty;
            }
            //if (listView3.Items.Count > 0)
            //{
            //    if (listView3.Items.Count == 1)
            //    {
            //        respondant_name = listView3.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView3.Items.Count; i++)
            //        {
            //            respondant_name = respondant_name + listView3.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    respondant_name = string.Empty;
            //}
            if (rList.Count > 0)
            {
                if (rList.Count == 1)
                {
                    respondant_name = rList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < rList.Count; i++)
                    {
                        if (i == rList.Count - 1)
                        { 
                            respondant_name = respondant_name + rList[i].ToString(); 
                        }
                        else 
                        {
                            respondant_name = respondant_name + rList[i].ToString() + "||";
                        }
                        
                    }
                }
            }
            else
            {
                respondant_name = string.Empty;
            }
            //if (listView8.Items.Count > 0)
            //{
            //    if (listView8.Items.Count == 1)
            //    {
            //        respondant_counsel = listView8.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView8.Items.Count; i++)
            //        {
            //            respondant_counsel = respondant_counsel + listView8.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    respondant_counsel = string.Empty;
            //}
            if (rcList.Count > 0)
            {
                if (rcList.Count == 1)
                {
                    respondant_counsel = rcList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < rcList.Count; i++)
                    {
                        if (i == rcList.Count - 1)
                        {
                            respondant_counsel = respondant_counsel + rcList[i].ToString();
                        }
                        else
                        {
                            respondant_counsel = respondant_counsel + rcList[i].ToString() + "||";
                        }
                        
                    }
                }
            }
            else
            {
                respondant_counsel = string.Empty;
            }
            string case_filling_date = "";
            if (deTextBox21.Text != "" && deTextBox20.Text != "" && deTextBox19.Text != "")
            {
                case_filling_date = deTextBox21.Text + "-" + deTextBox20.Text + "-" + deTextBox19.Text;
            }
            else
            {
                case_filling_date = "";
            }

            string ps = deTextBox22.Text.Trim();
            string ps_caseno = deTextBox23.Text.Trim();

            //if (listView4.Items.Count > 0)
            //{
            //    if (listView4.Items.Count == 1)
            //    {
            //        lc_case_no = listView4.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView4.Items.Count; i++)
            //        {
            //            lc_case_no = lc_case_no + listView4.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    lc_case_no = string.Empty;
            //}
            if (lcNList.Count > 0)
            {
                if (lcNList.Count == 1)
                {
                    lc_case_no = lcNList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < lcNList.Count; i++)
                    {
                        if (i == lcNList.Count - 1)
                        {
                            lc_case_no = lc_case_no + lcNList[i].ToString();
                        }
                        else
                        {
                            lc_case_no = lc_case_no + lcNList[i].ToString() + "||";
                        }
                        
                    }
                }
            }
            else
            {
                lc_case_no = string.Empty;
            }
            string lc_order_date = "";
            if (deTextBox29.Text != "" && deTextBox28.Text != "" && deTextBox27.Text != "")
            {
                lc_order_date = deTextBox29.Text + "-" + deTextBox28.Text + "-" + deTextBox27.Text;
            }
            else
            {
                lc_order_date = "";
            }

            //if (listView9.Items.Count > 0)
            //{
            //    if (listView9.Items.Count == 1)
            //    {
            //        lc_judge_name = listView9.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView9.Items.Count; i++)
            //        {
            //            lc_judge_name = lc_judge_name + listView9.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    lc_judge_name = string.Empty;
            //}
            if (lcJList.Count > 0)
            {
                if (lcJList.Count == 1)
                {
                    lc_judge_name = lcJList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < lcJList.Count; i++)
                    {
                        lc_judge_name = lc_judge_name + lcJList[i].ToString() + "||";
                    }
                }
            }
            else
            {
                lc_judge_name = string.Empty;
            }
            //if (listView5.Items.Count > 0)
            //{
            //    if (listView5.Items.Count == 1)
            //    {
            //        conn_app_case_no = listView5.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView5.Items.Count; i++)
            //        {
            //            conn_app_case_no = conn_app_case_no + listView5.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    conn_app_case_no = string.Empty;
            //}
            if (cList.Count > 0)
            {
                if (cList.Count == 1)
                {
                    conn_app_case_no = cList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < cList.Count; i++)
                    {
                        if (i == cList.Count - 1)
                        {
                            conn_app_case_no = conn_app_case_no + cList[i].ToString();
                        }
                        else
                        {
                            conn_app_case_no = conn_app_case_no + cList[i].ToString() + "||";
                        }
                       
                    }
                }
            }
            else
            {
                conn_app_case_no = string.Empty;
            }
            string conn_app_disposal_type = deComboBox8.Text;

            //if (listView10.Items.Count > 0)
            //{
            //    if (listView10.Items.Count == 1)
            //    {
            //        conn_main_case_no = listView10.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView10.Items.Count; i++)
            //        {
            //            conn_main_case_no = conn_main_case_no + listView10.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    conn_main_case_no = string.Empty;
            //}
            if (cMList.Count > 0)
            {
                if (cMList.Count == 1)
                {
                    conn_main_case_no = cMList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < cMList.Count; i++)
                    {
                        if (i == cMList.Count - 1)
                        {
                            conn_main_case_no = conn_main_case_no + cMList[i].ToString();
                        }
                        else
                        {
                            conn_main_case_no = conn_main_case_no + cMList[i].ToString() + "||";
                        }
                        
                    }
                }
            }
            else
            {
                conn_main_case_no = string.Empty;
            }
            //if (listView6.Items.Count > 0)
            //{
            //    if (listView6.Items.Count == 1)
            //    {
            //        analogous_case_no = listView6.Items[0].SubItems[0].Text;
            //    }
            //    else
            //    {
            //        for (int i = 0; i < listView6.Items.Count; i++)
            //        {
            //            analogous_case_no = analogous_case_no + listView6.Items[i].SubItems[0].Text + ";";
            //        }
            //    }
            //}
            //else
            //{
            //    analogous_case_no = string.Empty;
            //}
            if (aList.Count > 0)
            {
                if (aList.Count == 1)
                {
                    analogous_case_no = aList[0].ToString();
                }
                else
                {
                    for (int i = 0; i < aList.Count; i++)
                    {
                        analogous_case_no = analogous_case_no + aList[i].ToString() + "||";
                    }
                }
            }
            else
            {
                analogous_case_no = string.Empty;
            }
            string old_case_type = deComboBox11.Text;
            string old_case_no = deTextBox40.Text;
            string old_case_year = deTextBox41.Text;

            string file_move_history = deTextBox42.Text;
            string dept_note = deTextBox43.Text;


            sqlStr = @"update metadata_entry set case_status = '" + case_status + "',case_type ='" + case_type + "',case_nature='" + case_nature + "',case_year ='" + case_year + "',disposal_date='" + disposal_date + "',judge_name ='" + judge_name + "',district='" + district + "',petitioner_name ='" + petitionoer_name + "',petitioner_counsel_name='" + petitionoer_counsel + "',respondant_name='" + respondant_name + "',respondant_counsel_name='" + respondant_counsel + "',case_filling_date='" + case_filling_date + "',ps_name='" + ps + "',ps_case_no='" + ps_caseno + "',lc_case_no='" + lc_case_no + "',lc_order_date= '" + lc_order_date + "',lc_judge_name='" + lc_judge_name + "',conn_app_case_no='" + conn_app_case_no + "',conn_disposal_type='" + conn_app_disposal_type + "',conn_main_case_no='" + conn_main_case_no + "',analogous_case_no='" + analogous_case_no + "',old_case_type='" + old_case_type + "',old_case_no='" + old_case_no + "',old_case_year='" + old_case_year + "',file_move_history = '" + file_move_history + "',dept_remark = '" + dept_note + "',modified_by ='" + crd.created_by + "',modified_dttm = '" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "' where proj_code ='" + projKey + "' and bundle_key = '" + bundleKey + "' and filename = '" + filename + "' ";
            //sqlCmd.Connection = sqlCon;
            //sqlCmd.Transaction = txn;
            //sqlCmd.CommandText = sqlStr;
            //int j = sqlCmd.ExecuteNonQuery();
            //if (j >= 0)
            //{
            //    commitBol = true;
            //}
            //else
            //{
            //    commitBol = false;
            //}

            System.Diagnostics.Debug.Print(sqlStr);
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon, txn);
            if (cmd.ExecuteNonQuery() >= 0)
            {
                commitBol = true;
            }

            //sqlCmd.Connection = sqlCon;
            ////sqlCmd.Transaction = trans;
            //sqlCmd.CommandText = sqlStr;
            //OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon, txn);
            ////cmd.Connection = sqlCon;
            ////cmd.CommandText = sqlStr;
            ////int j = sqlCmd.ExecuteNonQuery();
            //if (cmd.ExecuteNonQuery() >= 0)
            //{
            //    commitBol = true;
            //    //txn.Commit();
            //}
            //else
            //{
            //    commitBol = false;
            //    //txn.Dispose();
            //}

            return commitBol;
        }
        public bool updateCaseFile()
        {
            bool ret = false;
            if (ret == false)
            {
                caseFileNo = deTextBox8.Text;
                _UpdateCaseFile(projKey, bundleKey, caseFileNo, frmNewCase.caseStatus, frmNewCase.caseNature, frmNewCase.caseType, frmNewCase.caseYear);

                ret = true;
            }
            return ret;
        }

        public bool updateCaseFileEdit()
        {
            bool ret = false;
            if (ret == false)
            {
                caseFileNo = deTextBox8.Text;
                _UpdateCaseFileEdit(projKey, bundleKey, caseFileNo, deComboBox1.Text, deComboBox12.Text, deComboBox2.Text, deTextBox5.Text);

                ret = true;
            }
            return ret;
        }

        public bool _UpdateCaseFileEdit(string projKey, string bundleKey, string caseFileNo, string status, string nature, string type, string year)
        {
            string sqlStr = null;

            OdbcCommand sqlCmd = new OdbcCommand();

            filename = type + caseFileNo + year;

            bool retVal = false;
            string sql = string.Empty;
            string remarks = string.Empty;
            string exception = string.Empty;

            if (pList.Count == 0 || rList.Count == 0)
            {
                remarks = "Incomplete";
            }

            if (pList.Count == 0 && rList.Count == 0)
            {
                exception = exception + "01" + "||" + "02";
            }
            else if (pList.Count > 0 && rList.Count == 0)
            {
                exception = exception + "02";
            }
            else if (pList.Count == 0 && rList.Count > 0)
            {
                exception = exception + "01";
            }
            else
            {
                exception = string.Empty;
            }

            sqlStr = "UPDATE case_file_master SET remarks = '" + remarks + "',entry_exception = '" + exception + "' WHERE proj_code = '" + projKey + "' AND bundle_key = '" + bundleKey + "' and case_file_no = '" + caseFileNo + "' and case_status = '" + status + "' and case_nature = '" + nature + "' and case_type = '" + type + "' and case_year = '" + year + "' and filename = '" + filename + "' ";
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
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon, txn);
            if (cmd.ExecuteNonQuery() >= 0)
            {
                retVal = true;
            }

            //System.Diagnostics.Debug.Print(sqlStr);
            //OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            ////cmd.Connection = sqlCon;
            ////cmd.CommandText = sqlStr;
            //if (cmd.ExecuteNonQuery() >= 0)
            //{
            //    retVal = true;
            //    //txn.Commit();
            //}
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
        public bool _UpdateCaseFile(string projKey, string bundleKey, string caseFileNo, string status , string nature, string type, string year)
        {
            string sqlStr = null;

            OdbcCommand sqlCmd = new OdbcCommand();


            filename = type + caseFileNo + year;

            bool retVal = false;
            string sql = string.Empty;
            string remarks = string.Empty;
            string exception = string.Empty;

            if (pList.Count == 0 || rList.Count == 0)
            {
                remarks = "Incomplete";
            }

            if (pList.Count == 0 && rList.Count == 0)
            {
                exception = exception + "01" + "||" + "02";
            }
            else if (pList.Count > 0 && rList.Count == 0)
            {
                exception = exception + "02";
            }
            else if (pList.Count == 0 && rList.Count > 0)
            {
                exception = exception + "01";
            }
            else
            {
                exception = string.Empty;
            }


            sqlStr = "UPDATE case_file_master SET remarks = '"+remarks+"',entry_exception = '"+exception+"' WHERE proj_code = '" + projKey + "' AND bundle_key = '" + bundleKey + "' and case_file_no = '"+caseFileNo+"' and case_status = '"+status+"' and case_nature = '"+nature+"' and case_type = '"+type+"' and case_year = '"+year+"' and filename = '"+filename+"' ";
            //sqlCmd.Connection = sqlCon;
            //sqlCmd.Transaction = txn;
            //sqlCmd.CommandText = sqlStr;
            //int j = sqlCmd.ExecuteNonQuery();
            //if (j >= 0)
            //{
            //    retVal = true;
            //}
            //else
            //{
            //    retVal = false;
            //}

            System.Diagnostics.Debug.Print(sqlStr);
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon, txn);
            if (cmd.ExecuteNonQuery() >= 0)
            {
                retVal = true;
            }

            //System.Diagnostics.Debug.Print(sqlStr);
            //OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            ////cmd.Connection = sqlCon;
            ////cmd.CommandText = sqlStr;
            //if (cmd.ExecuteNonQuery() >= 0)
            //{
            //    retVal = true;
            //    //txn.Commit();
            //}
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
        private DataTable searchDistrict(string dis_name)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select district_code, district_name from district where district_name = '" + dis_name + "' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);

            return dt;

        }
        private void deButton20_Click(object sender, EventArgs e)
        {
            //txn = sqlCon.BeginTransaction();

            OdbcTransaction sqlTrans = null;

            if (sqlCon.State == ConnectionState.Closed || sqlCon.State == ConnectionState.Broken )
            {
                sqlCon.Open();
            }
            if (deComboBox4.Text == "" || deComboBox4.Text == null || String.IsNullOrEmpty(deComboBox4.Text) || String.IsNullOrWhiteSpace(deComboBox4.Text))
            {
                MessageBox.Show("You cannot leave District field blank...", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                deComboBox4.Focus();
                return;
            }
            if (searchDistrict(deComboBox4.Text.Trim()).Rows.Count > 0)
            {

            }
            else
            {
                MessageBox.Show("Please select proper District ...", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                deComboBox4.Focus();
                return;
            }
            //if (!String.IsNullOrEmpty(deComboBox3.Text) || !String.IsNullOrWhiteSpace(deComboBox3.Text))
            //{
            //    MessageBox.Show("Please fill Judge Name...", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    deComboBox3.Focus();
            //    return;
            //}
            //if (!String.IsNullOrEmpty(deComboBox6.Text) || !String.IsNullOrWhiteSpace(deComboBox6.Text))
            //{
            //    MessageBox.Show("Please fill LC Judge Name...", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    deComboBox6.Focus();
            //    return;
            //}
            //if (!String.IsNullOrEmpty(deTextBox11.Text) || !String.IsNullOrWhiteSpace(deTextBox11.Text))
            //{
            //    MessageBox.Show("Please fill Petitioner ...", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    deTextBox11.Focus();
            //    return;
            //}
            //if (!String.IsNullOrEmpty(deTextBox14.Text) || !String.IsNullOrWhiteSpace(deTextBox14.Text))
            //{
            //    MessageBox.Show("Please fill Petitioner Counsel ...", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    deTextBox14.Focus();
            //    return;
            //}
            //if (!String.IsNullOrEmpty(deTextBox18.Text) || !String.IsNullOrWhiteSpace(deTextBox18.Text))
            //{
            //    MessageBox.Show("Please fill Respondant  ...", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    deTextBox18.Focus();
            //    return;
            //}
            //if (!String.IsNullOrEmpty(deTextBox16.Text) || !String.IsNullOrWhiteSpace(deTextBox16.Text))
            //{
            //    MessageBox.Show("Please fill Respondant Counsel...", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    deTextBox16.Focus();
            //    return;
            //}
            //if (!String.IsNullOrEmpty(deComboBox5.Text) || !String.IsNullOrWhiteSpace(deComboBox5.Text) || !String.IsNullOrEmpty(deTextBox24.Text) || !String.IsNullOrWhiteSpace(deTextBox24.Text) || !String.IsNullOrEmpty(deTextBox25.Text) || !String.IsNullOrWhiteSpace(deTextBox25.Text))
            //{
            //    MessageBox.Show("Please fill Lower Court Information...", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    deComboBox5.Focus();
            //    return;
            //}
            //if (!String.IsNullOrEmpty(deComboBox7.Text) || !String.IsNullOrWhiteSpace(deComboBox7.Text) || !String.IsNullOrEmpty(deTextBox31.Text) || !String.IsNullOrWhiteSpace(deTextBox31.Text) || !String.IsNullOrEmpty(deTextBox32.Text) || !String.IsNullOrWhiteSpace(deTextBox32.Text))
            //{
            //    MessageBox.Show("Please fill Connected Application Information...", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    deComboBox7.Focus();
            //    return;
            //}
            //if (!String.IsNullOrEmpty(deComboBox9.Text) || !String.IsNullOrWhiteSpace(deComboBox9.Text) || !String.IsNullOrEmpty(deTextBox35.Text) || !String.IsNullOrWhiteSpace(deTextBox35.Text) || !String.IsNullOrEmpty(deTextBox36.Text) || !String.IsNullOrWhiteSpace(deTextBox36.Text))
            //{
            //    MessageBox.Show("Please fill Connected Main Case Information...", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    deComboBox9.Focus();
            //    return;
            //}
            //if (!String.IsNullOrEmpty(deComboBox10.Text) || !String.IsNullOrWhiteSpace(deComboBox10.Text) || !String.IsNullOrEmpty(deTextBox38.Text) || !String.IsNullOrWhiteSpace(deTextBox38.Text) || !String.IsNullOrEmpty(deTextBox39.Text) || !String.IsNullOrWhiteSpace(deTextBox39.Text))
            //{
            //    MessageBox.Show("Please fill Analogous Case Information...", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    deComboBox10.Focus();
            //    return;
            //}
            
            if (deComboBox4.Text != "" || deComboBox4.Text != null) 
            {
                //if (listView2.Items.Count > 0 && listView3.Items.Count > 0)
                if (pList.Count > 0 && rList.Count > 0)
                {
                    
                       
                            if (_mode == DataLayerDefs.Mode._Add)
                            {
                                caseFileNo = deTextBox8.Text;
                                if (_GetMetaCount(projKey, bundleKey, caseFileNo,frmNewCase.caseStatus,frmNewCase.caseNature,frmNewCase.caseType,frmNewCase.caseYear).Rows.Count == 0)
                                {
                                    
                                       
                                        DialogResult dr = MessageBox.Show(this, "Do you want to Save ? ", "B'Zer - Calcutta High Court ", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                                        if (dr == DialogResult.Yes)
                                        {
                                            if (validate() == true)
                                            {
                                                bool insertCase = insertIntoCaseFileDB(Convert.ToString(_GetFileCount(projKey, bundleKey).Rows[0][0]), deTextBox8.Text, deComboBox1.Text, deComboBox12.Text, deComboBox2.Text, deTextBox5.Text, sqlTrans);
                                                bool insertmeta = insertIntoDB( Convert.ToString(_GetMetaCount(projKey, bundleKey).Rows[0][0]), sqlTrans );
                                                
                                                bool updatecasefile = updateCaseFile();

                                                if ( insertCase == true && insertmeta == true && updatecasefile == true)
                                                {
                                                    if (sqlTrans == null)
                                                    {
                                                        sqlTrans = sqlCon.BeginTransaction();
                                                    }
                                                    sqlTrans.Commit();
                                                    sqlTrans = null;
                                                    MessageBox.Show(this, "Record Saved Successfully...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                                    //this.Hide();
                                                    jList.Clear();
                                                    pList.Clear();
                                                    pcList.Clear();
                                                    rList.Clear();
                                                    rcList.Clear();
                                                    lcNList.Clear();
                                                    lcJList.Clear();
                                                    cList.Clear();
                                                    cMList.Clear();
                                                    aList.Clear();
                                                    this.Close();
                                                    
                                                    //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Add, txn, crd);
                                                    //fm.ShowDialog(this);
                                                }
                                                else
                                                {
                                                    
                                                    MessageBox.Show(this, "Ooops!!! There is an Error - Record not Saved...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                                    //this.Hide();
                                                    //jList.Clear();
                                                    //pList.Clear();
                                                    //pcList.Clear();
                                                    //rList.Clear();
                                                    //rcList.Clear();
                                                    //lcNList.Clear();
                                                    //lcJList.Clear();
                                                    //cList.Clear();
                                                    //cMList.Clear();
                                                    //aList.Clear();
                                                    return;
                                                    //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Add, txn, crd);
                                                    //fm.ShowDialog(this);
                                                }

                                            }
                                        }
                                        else
                                        {
                                            return;
                                        }
                                    
                                }
                                else
                                {
                                    MessageBox.Show(this, "Record Exists...", "B'Zer - Calcutta High Court ", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                    //this.Hide();
                                    jList.Clear();
                                    pList.Clear();
                                    pcList.Clear();
                                    rList.Clear();
                                    rcList.Clear();
                                    lcNList.Clear();
                                    lcJList.Clear();
                                    cList.Clear();
                                    cMList.Clear();
                                    aList.Clear();
                                    this.Close();
                                    //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Add, txn, crd);
                                    //fm.ShowDialog(this);
                                }
                                
                            }
                            else if (_mode == DataLayerDefs.Mode._Edit)
                            {
                                 
                                    DialogResult dr = MessageBox.Show(this, "Do you want to Save ? ", "B'Zer - Calcutta High Court ", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                                    if (dr == DialogResult.Yes)
                                    {
                                        if (validate() == true)
                                        {

                                            bool updatemeta = updateDB(_GetFileCaseDetails(projKey, bundleKey, filename).Rows[0][2].ToString());
                                            bool updatecasefile = updateCaseFileEdit();
                                            if (updatemeta == true && updatecasefile == true)
                                            {
                                                if (sqlTrans == null)
                                                {
                                                    sqlTrans = sqlCon.BeginTransaction();
                                                }
                                                sqlTrans.Commit();
                                                sqlTrans = null;
                                                MessageBox.Show(this, "Record Saved Successfully...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                                //this.Hide();
                                                jList.Clear();
                                                pList.Clear();
                                                pcList.Clear();
                                                rList.Clear();
                                                rcList.Clear();
                                                lcNList.Clear();
                                                lcJList.Clear();
                                                cList.Clear();
                                                cMList.Clear();
                                                aList.Clear();
                                                this.Close();
                                                //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Edit);
                                                //fm.ShowDialog(this);
                                            }
                                            else
                                            {
                                                MessageBox.Show(this, "Ooops!!! There is an Error - Record not Saved...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                                //this.Hide();
                                                //jList.Clear();
                                                //pList.Clear();
                                                //pcList.Clear();
                                                //rList.Clear();
                                                //rcList.Clear();
                                                //lcNList.Clear();
                                                //lcJList.Clear();
                                                //cList.Clear();
                                                //cMList.Clear();
                                                //aList.Clear();
                                                return;
                                                //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Edit);
                                                //fm.ShowDialog(this);
                                            }

                                        }
                                    }
                                    else
                                    {
                                        return;
                                    }
                                
                            }
                            else
                            {
                                MessageBox.Show(this, "Ooops!!! There is an Error - Record not Saved...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                //this.Hide();
                                //jList.Clear();
                                //pList.Clear();
                                //pcList.Clear();
                                //rList.Clear();
                                //rcList.Clear();
                                //lcNList.Clear();
                                //lcJList.Clear();
                                //cList.Clear();
                                //cMList.Clear();
                                //aList.Clear();
                                return;
                            }
                      
                    
                }
                else
                {
                    if (pList.Count == 0 && rList.Count == 0)
                    {
                        DialogResult dr = MessageBox.Show(this, "Do you want to Save ? No petitioner, no respondant name is added ", "B'Zer - Calcutta High Court ", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                        if (dr == DialogResult.Yes)
                        {
                            
                                if (_mode == DataLayerDefs.Mode._Add)
                                {
                                    caseFileNo = deTextBox8.Text;
                                    if (_GetMetaCount(projKey, bundleKey, caseFileNo, frmNewCase.caseStatus, frmNewCase.caseNature, frmNewCase.caseType, frmNewCase.caseYear).Rows.Count == 0)
                                    {
                                       
                                        DialogResult dr1 = MessageBox.Show(this, "Do you want to Save ? ", "B'Zer - Calcutta High Court ", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                                        if (dr1 == DialogResult.Yes)
                                        {
                                            
                                            if (validate() == true)
                                            {
                                                

                                                bool insertCase = insertIntoCaseFileDB(Convert.ToString(_GetFileCount(projKey, bundleKey).Rows[0][0]), deTextBox8.Text, deComboBox1.Text, deComboBox12.Text, deComboBox2.Text, deTextBox5.Text, sqlTrans);
                                                bool insertmeta = insertIntoDB(Convert.ToString(_GetMetaCount(projKey, bundleKey).Rows[0][0]), sqlTrans);
                                                bool updatecasefile = updateCaseFile();

                                                if (insertCase == true && insertmeta == true && updatecasefile == true)
                                                {
                                                    if (sqlTrans == null)
                                                    {
                                                         sqlTrans = sqlCon.BeginTransaction();
                                                    }
                                                    sqlTrans.Commit();
                                                    sqlTrans = null;
                                                    MessageBox.Show(this, "Record Saved Successfully...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                                    //this.Hide();
                                                    jList.Clear();
                                                    pList.Clear();
                                                    pcList.Clear();
                                                    rList.Clear();
                                                    rcList.Clear();
                                                    lcNList.Clear();
                                                    lcJList.Clear();
                                                    cList.Clear();
                                                    cMList.Clear();
                                                    aList.Clear();
                                                    this.Close();
                                                    //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Add, txn, crd);
                                                    //fm.ShowDialog(this);
                                                }
                                                else
                                                {
                                                    MessageBox.Show(this, "Ooops!!! There is an Error - Record not Saved...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                                    //this.Hide();
                                                    //jList.Clear();
                                                    //pList.Clear();
                                                    //pcList.Clear();
                                                    //rList.Clear();
                                                    //rcList.Clear();
                                                    //lcNList.Clear();
                                                    //lcJList.Clear();
                                                    //cList.Clear();
                                                    //cMList.Clear();
                                                    //aList.Clear();
                                                    return;
                                                    //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Add, txn, crd);
                                                    //fm.ShowDialog(this);
                                                }
                                            }
                                            
                                        }
                                        else 
                                        {
                                            return;
                                        }
                                        
                                    }
                                    else
                                    {
                                        MessageBox.Show(this, "Record Exists...", "B'Zer - Calcutta High Court ", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                        //this.Hide();
                                        jList.Clear();
                                        pList.Clear();
                                        pcList.Clear();
                                        rList.Clear();
                                        rcList.Clear();
                                        lcNList.Clear();
                                        lcJList.Clear();
                                        cList.Clear();
                                        cMList.Clear();
                                        aList.Clear();
                                        this.Close();
                                        //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Add, txn, crd);
                                        //fm.ShowDialog(this);
                                    }

                                }
                                else if (_mode == DataLayerDefs.Mode._Edit)
                                {
                                    
                                    DialogResult dr1 = MessageBox.Show(this, "Do you want to Save ? ", "B'Zer - Calcutta High Court ", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                                    if (dr1 == DialogResult.Yes)
                                    {
                                        if (validate() == true)
                                        {
                                            bool updatemeta = updateDB(_GetFileCaseDetails(projKey, bundleKey, filename).Rows[0][2].ToString());
                                            bool updatecasefile = updateCaseFileEdit();


                                            if (updatemeta == true && updatecasefile == true)
                                            {
                                                if (sqlTrans == null)
                                                {
                                                    sqlTrans = sqlCon.BeginTransaction();
                                                }
                                                sqlTrans.Commit();
                                                sqlTrans = null;
                                                MessageBox.Show(this, "Record Saved Successfully...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                                //this.Hide();
                                                jList.Clear();
                                                pList.Clear();
                                                pcList.Clear();
                                                rList.Clear();
                                                rcList.Clear();
                                                lcNList.Clear();
                                                lcJList.Clear();
                                                cList.Clear();
                                                cMList.Clear();
                                                aList.Clear();
                                                this.Close();
                                                //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Edit);
                                                //fm.ShowDialog(this);
                                            }
                                            else
                                            {
                                                MessageBox.Show(this, "Ooops!!! There is an Error - Record not Saved...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                                //this.Hide();
                                                //jList.Clear();
                                                //pList.Clear();
                                                //pcList.Clear();
                                                //rList.Clear();
                                                //rcList.Clear();
                                                //lcNList.Clear();
                                                //lcJList.Clear();
                                                //cList.Clear();
                                                //cMList.Clear();
                                                //aList.Clear();
                                                return;
                                                //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Edit);
                                                //fm.ShowDialog(this);
                                            }
                                        }
                                        
                                    }
                                    else
                                    {
                                        return;
                                    }
                                    
                                }
                                else
                                {
                                    MessageBox.Show(this, "Ooops!!! There is an Error - Record not Saved...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                    //this.Hide();
                                    //jList.Clear();
                                    //pList.Clear();
                                    //pcList.Clear();
                                    //rList.Clear();
                                    //rcList.Clear();
                                    //lcNList.Clear();
                                    //lcJList.Clear();
                                    //cList.Clear();
                                    //cMList.Clear();
                                    //aList.Clear();
                                    return;
                                }
                           
                        }
                        else
                        {
                            MessageBox.Show("You have to enter minimum one petitioner", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            deButton23.Focus();
                            return;
                        }
                    }
                    else if(pList.Count == 0 && rList.Count > 0)
                    {
                        DialogResult dr = MessageBox.Show(this, "Do you want to Save ? No Petitioner name is added ", "B'Zer - Calcutta High Court ", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                        if (dr == DialogResult.Yes)
                        {
                            
                                if (_mode == DataLayerDefs.Mode._Add)
                                {

                                    caseFileNo = deTextBox8.Text;
                                    if (_GetMetaCount(projKey, bundleKey, caseFileNo, frmNewCase.caseStatus, frmNewCase.caseNature, frmNewCase.caseType, frmNewCase.caseYear).Rows.Count == 0)
                                    {
                                        
                                        DialogResult dr1 = MessageBox.Show(this, "Do you want to Save ? ", "B'Zer - Calcutta High Court ", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                                        if (dr1 == DialogResult.Yes)
                                        {
                                            if (validate() == true)
                                            {
                                                bool insertCase = insertIntoCaseFileDB(Convert.ToString(_GetFileCount(projKey, bundleKey).Rows[0][0]), deTextBox8.Text, deComboBox1.Text, deComboBox12.Text, deComboBox2.Text, deTextBox5.Text, sqlTrans);
                                                bool insertmeta = insertIntoDB(Convert.ToString(_GetMetaCount(projKey, bundleKey).Rows[0][0]), sqlTrans);

                                                bool updatecasefile = updateCaseFile();
                                                if (insertCase == true && insertmeta == true && updatecasefile)
                                                {
                                                    if (sqlTrans == null)
                                                    {
                                                    sqlTrans = sqlCon.BeginTransaction();
                                                    }
                                                    sqlTrans.Commit();
                                                    sqlTrans = null;
                                                    MessageBox.Show(this, "Record Saved Successfully...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                                    //this.Hide();
                                                    jList.Clear();
                                                    pList.Clear();
                                                    pcList.Clear();
                                                    rList.Clear();
                                                    rcList.Clear();
                                                    lcNList.Clear();
                                                    lcJList.Clear();
                                                    cList.Clear();
                                                    cMList.Clear();
                                                    aList.Clear();
                                                    this.Close();
                                                    //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Add, txn, crd);
                                                    //fm.ShowDialog(this);
                                                }
                                                else
                                                {
                                                    MessageBox.Show(this, "Ooops!!! There is an Error - Record not Saved...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                                    //this.Hide();
                                                    //jList.Clear();
                                                    //pList.Clear();
                                                    //pcList.Clear();
                                                    //rList.Clear();
                                                    //rcList.Clear();
                                                    //lcNList.Clear();
                                                    //lcJList.Clear();
                                                    //cList.Clear();
                                                    //cMList.Clear();
                                                    //aList.Clear();
                                                    return;
                                                    //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Add, txn, crd);
                                                    //fm.ShowDialog(this);
                                                }
                                            }
                                            
                                        }
                                        else
                                        {
                                            return;
                                        }
                                        
                                    }
                                    else
                                    {
                                        MessageBox.Show(this, "Record Exists...", "B'Zer - Calcutta High Court ", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                        //this.Hide();
                                        jList.Clear();
                                        pList.Clear();
                                        pcList.Clear();
                                        rList.Clear();
                                        rcList.Clear();
                                        lcNList.Clear();
                                        lcJList.Clear();
                                        cList.Clear();
                                        cMList.Clear();
                                        aList.Clear();
                                        this.Close();
                                        //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Add, txn, crd);
                                        //fm.ShowDialog(this);
                                    }

                                }
                                else if (_mode == DataLayerDefs.Mode._Edit)
                                {
                                    
                                    DialogResult dr1 = MessageBox.Show(this, "Do you want to Save ? ", "B'Zer - Calcutta High Court ", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                                    if (dr1 == DialogResult.Yes)
                                    {
                                        if (validate() == true)
                                        {
                                            bool updatemeta = updateDB(_GetFileCaseDetails(projKey, bundleKey, filename).Rows[0][2].ToString());
                                            bool updatecasefile = updateCaseFileEdit();

                                            if (updatemeta == true && updatecasefile == true)
                                            {
                                                if (sqlTrans == null)
                                                {
                                                    sqlTrans = sqlCon.BeginTransaction();
                                                }
                                                sqlTrans.Commit();
                                                sqlTrans = null;
                                                MessageBox.Show(this, "Record Saved Successfully...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                                this.Hide();
                                                jList.Clear();
                                                pList.Clear();
                                                pcList.Clear();
                                                rList.Clear();
                                                rcList.Clear();
                                                lcNList.Clear();
                                                lcJList.Clear();
                                                cList.Clear();
                                                cMList.Clear();
                                                aList.Clear();
                                                this.Close();
                                                //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Edit);
                                                //fm.ShowDialog(this);
                                            }
                                            else
                                            {
                                                MessageBox.Show(this, "Ooops!!! There is an Error - Record not Saved...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                                //this.Hide();
                                                //jList.Clear();
                                                //pList.Clear();
                                                //pcList.Clear();
                                                //rList.Clear();
                                                //rcList.Clear();
                                                //lcNList.Clear();
                                                //lcJList.Clear();
                                                //cList.Clear();
                                                //cMList.Clear();
                                                //aList.Clear();
                                                return;
                                                //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Edit);
                                                //fm.ShowDialog(this);
                                            }
                                        }
                                        
                                    }
                                    else
                                    {
                                        return;
                                    }
                                    
                                }
                                else
                                {
                                    MessageBox.Show(this, "Ooops!!! There is an Error - Record not Saved...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                    //this.Hide();
                                    //jList.Clear();
                                    //pList.Clear();
                                    //pcList.Clear();
                                    //rList.Clear();
                                    //rcList.Clear();
                                    //lcNList.Clear();
                                    //lcJList.Clear();
                                    //cList.Clear();
                                    //cMList.Clear();
                                    //aList.Clear();
                                    return;
                                }
                         
                        }
                        else
                        {
                            MessageBox.Show("You have to enter minimum one petitioner", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            deButton23.Focus();
                            return;
                        }
                    }
                    else if (pList.Count > 0 && rList.Count == 0)
                    {
                        DialogResult dr = MessageBox.Show(this, "Do you want to Save ? No Respondant name is added ", "B'Zer - Calcutta High Court ", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                        if (dr == DialogResult.Yes)
                        {
                           
                                if (_mode == DataLayerDefs.Mode._Add)
                                {

                                    caseFileNo = deTextBox8.Text;

                                    if (_GetMetaCount(projKey, bundleKey, caseFileNo, frmNewCase.caseStatus, frmNewCase.caseNature, frmNewCase.caseType, frmNewCase.caseYear).Rows.Count == 0)
                                    {
                                       
                                        DialogResult dr1 = MessageBox.Show(this, "Do you want to Save ? ", "B'Zer - Calcutta High Court ", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                                        if (dr1 == DialogResult.Yes)
                                        {
                                            if (validate() == true)
                                            {
                                                bool insertCase = insertIntoCaseFileDB(Convert.ToString(_GetFileCount(projKey, bundleKey).Rows[0][0]), deTextBox8.Text, deComboBox1.Text, deComboBox12.Text, deComboBox2.Text, deTextBox5.Text, sqlTrans);
                                                bool insertmeta = insertIntoDB(Convert.ToString(_GetMetaCount(projKey, bundleKey).Rows[0][0]), sqlTrans);

                                                bool updatecasefile = updateCaseFile();
                                                if (insertCase == true && insertmeta == true && updatecasefile == true)
                                                {
                                                    if (sqlTrans == null)
                                                    {
                                                        sqlTrans = sqlCon.BeginTransaction();
                                                    }
                                                    sqlTrans.Commit();
                                                    sqlTrans = null;
                                                    MessageBox.Show(this, "Record Saved Successfully...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                                    //this.Hide();
                                                    jList.Clear();
                                                    pList.Clear();
                                                    pcList.Clear();
                                                    rList.Clear();
                                                    rcList.Clear();
                                                    lcNList.Clear();
                                                    lcJList.Clear();
                                                    cList.Clear();
                                                    cMList.Clear();
                                                    aList.Clear();
                                                    this.Close();
                                                    //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Add, txn, crd);
                                                    //fm.ShowDialog(this);
                                                }
                                                else
                                                {
                                                    MessageBox.Show(this, "Ooops!!! There is an Error - Record not Saved...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                                    //this.Hide();
                                                    //jList.Clear();
                                                    //pList.Clear();
                                                    //pcList.Clear();
                                                    //rList.Clear();
                                                    //rcList.Clear();
                                                    //lcNList.Clear();
                                                    //lcJList.Clear();
                                                    //cList.Clear();
                                                    //cMList.Clear();
                                                    //aList.Clear();
                                                    return;
                                                    //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Add, txn, crd);
                                                    //fm.ShowDialog(this);
                                                }
                                            }
                                            
                                        }
                                        else
                                        {
                                            return;
                                        }
                                        
                                    }
                                    else
                                    {
                                        MessageBox.Show(this, "Record Exists...", "B'Zer - Calcutta High Court ", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                        //this.Hide();
                                        jList.Clear();
                                        pList.Clear();
                                        pcList.Clear();
                                        rList.Clear();
                                        rcList.Clear();
                                        lcNList.Clear();
                                        lcJList.Clear();
                                        cList.Clear();
                                        cMList.Clear();
                                        aList.Clear();
                                        this.Close();
                                        //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Add, txn, crd);
                                        //fm.ShowDialog(this);
                                    }

                                }
                                else if (_mode == DataLayerDefs.Mode._Edit)
                                {
                                    
                                    DialogResult dr1 = MessageBox.Show(this, "Do you want to Save ? ", "B'Zer - Calcutta High Court ", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                                    if (dr1 == DialogResult.Yes)
                                    {
                                        if (validate() == true)
                                        {
                                            bool updatemeta = updateDB(_GetFileCaseDetails(projKey, bundleKey, filename).Rows[0][2].ToString());
                                            bool updatecasefile = updateCaseFileEdit();
                                            if (updatemeta == true && updatecasefile == true)
                                            {
                                                if (sqlTrans == null)
                                                {
                                                    sqlTrans = sqlCon.BeginTransaction();
                                                }
                                                sqlTrans.Commit();
                                                sqlTrans = null;
                                                MessageBox.Show(this, "Record Saved Successfully...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                                //this.Hide();
                                                jList.Clear();
                                                pList.Clear();
                                                pcList.Clear();
                                                rList.Clear();
                                                rcList.Clear();
                                                lcNList.Clear();
                                                lcJList.Clear();
                                                cList.Clear();
                                                cMList.Clear();
                                                aList.Clear();
                                                this.Close();
                                                //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Edit);
                                                //fm.ShowDialog(this);
                                            }
                                            else
                                            {
                                                MessageBox.Show(this, "Ooops!!! There is an Error - Record not Saved...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                                //this.Hide();
                                                //jList.Clear();
                                                //pList.Clear();
                                                //pcList.Clear();
                                                //rList.Clear();
                                                //rcList.Clear();
                                                //lcNList.Clear();
                                                //lcJList.Clear();
                                                //cList.Clear();
                                                //cMList.Clear();
                                                //aList.Clear();
                                                return;
                                                //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Edit);
                                                //fm.ShowDialog(this);
                                            }
                                        }
                                        
                                    }
                                    else
                                    {
                                        return;
                                    }
                                    
                                }
                                else
                                {
                                    MessageBox.Show(this, "Ooops!!! There is an Error - Record not Saved...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                    //this.Hide();
                                    //jList.Clear();
                                    //pList.Clear();
                                    //pcList.Clear();
                                    //rList.Clear();
                                    //rcList.Clear();
                                    //lcNList.Clear();
                                    //lcJList.Clear();
                                    //cList.Clear();
                                    //cMList.Clear();
                                    //aList.Clear();
                                    return;
                                }
                            
                        }
                        else
                        {
                            MessageBox.Show("You have to enter minimum one respondant", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            deButton25.Focus();
                            return;
                        }
                    }
                    else
                    {
                        MessageBox.Show(this, "Ooops!!! There is an Error - Record not Saved...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return;
                    }
                }
            }
            else
            {
                MessageBox.Show("You cannot leave District field blank...", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                deComboBox4.Focus();
                return;
            }
        }

        private void deTextBox25_Leave(object sender, EventArgs e)
        {
            string currDate = DateTime.Now.ToString("yyyy-MM-dd");
            string curYear = DateTime.Now.ToString("yyyy");
            int curIntYear = Convert.ToInt32(curYear);

            if (deTextBox25.Text != "")
            {

                bool res = System.Text.RegularExpressions.Regex.IsMatch(deTextBox25.Text, "[^0-9]");
                if (res != true && Convert.ToInt32(deTextBox25.Text) <= curIntYear && deTextBox25.Text.Length == 4 && deTextBox25.Text.Substring(0, 1) != "0")
                {
                   
                }
                else
                {
                   
                    MessageBox.Show("Please input Valid Lower Court Case Year...");
                    deTextBox25.Focus();
                    return;
                }
            }
            
        }

        private void deTextBox32_Leave(object sender, EventArgs e)
        {
            string currDate = DateTime.Now.ToString("yyyy-MM-dd");
            string curYear = DateTime.Now.ToString("yyyy");
            int curIntYear = Convert.ToInt32(curYear);
            if (deTextBox32.Text != "")
            {

                bool res = System.Text.RegularExpressions.Regex.IsMatch(deTextBox32.Text, "[^0-9]");
                if (res != true && Convert.ToInt32(deTextBox32.Text) <= curIntYear && deTextBox32.Text.Length == 4 && deTextBox32.Text.Substring(0, 1) != "0")
                {
                   
                }
                else
                {
                   
                    MessageBox.Show("Please input Valid Connected Application Case Year...");
                    deTextBox32.Focus();
                    return;
                }
            }
           
        }

        private void deTextBox36_Leave(object sender, EventArgs e)
        {
            string currDate = DateTime.Now.ToString("yyyy-MM-dd");
            string curYear = DateTime.Now.ToString("yyyy");
            int curIntYear = Convert.ToInt32(curYear);

            if (deTextBox36.Text != "")
            {

                bool res = System.Text.RegularExpressions.Regex.IsMatch(deTextBox36.Text, "[^0-9]");
                if (res != true && Convert.ToInt32(deTextBox36.Text) <= curIntYear && deTextBox36.Text.Length == 4 && deTextBox36.Text.Substring(0, 1) != "0")
                {
                  
                }
                else
                {
                   
                    MessageBox.Show("Please input Valid Connected Main Case Year...");
                    deTextBox36.Focus();
                    return;
                }
            }
            
        }

        private void deTextBox39_Leave(object sender, EventArgs e)
        {
            string currDate = DateTime.Now.ToString("yyyy-MM-dd");
            string curYear = DateTime.Now.ToString("yyyy");
            int curIntYear = Convert.ToInt32(curYear);

            if (deTextBox39.Text != "")
            {

                bool res = System.Text.RegularExpressions.Regex.IsMatch(deTextBox39.Text, "[^0-9]");
                if (res != true && Convert.ToInt32(deTextBox39.Text) <= curIntYear && deTextBox39.Text.Length == 4 && deTextBox39.Text.Substring(0, 1) != "0")
                {
                    
                }
                else
                {
                    
                    MessageBox.Show("Please input Valid Analogous Case Year...");
                    deTextBox39.Focus();
                    return;
                }
            }
            
        }

        private void deTextBox41_Leave(object sender, EventArgs e)
        {
            string currDate = DateTime.Now.ToString("yyyy-MM-dd");
            string curYear = DateTime.Now.ToString("yyyy");
            int curIntYear = Convert.ToInt32(curYear);

            if (deTextBox41.Text != "")
            {

                bool res = System.Text.RegularExpressions.Regex.IsMatch(deTextBox41.Text, "[^0-9]");
                if (res != true && Convert.ToInt32(deTextBox41.Text) <= curIntYear && deTextBox41.Text.Length == 4 && deTextBox41.Text.Substring(0, 1) != "0")
                {
                    
                }
                else
                {
                    
                    MessageBox.Show("Please input Valid Connected Main Case Year...");
                    deTextBox41.Focus();
                    return;
                }
            }
        }

        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            listView1.Select();
            
        }

        private void listView1_KeyUp(object sender, KeyEventArgs e)
        {
            if (listView1.Items.Count > 0)
            {
                if (listView1.SelectedItems.Count > 0)
                {
                    if (e.KeyCode == Keys.F2 || e.KeyCode == Keys.Enter)
                    {
                        listView1_DoubleClick(sender, e);
                    }
                    if(e.KeyCode == Keys.Delete)
                    {
                        deButton1_Click(sender, e);
                    }
                }
                else
                {
                    //listView1.Items[0].Selected = true;
                    //listView1.Items[0].Focused = true;
                    listView1.Select();
                }
            }
        }

        private void listView1_DoubleClick(object sender, EventArgs e)
        {
            
            listView1.Select();
           
            //listView1.SelectedItems[0].Selected = true;
           
            string name1="";
            
            try
            {
                
                string[] split = listView1.SelectedItems[0].SubItems[0].Text.Split(' ');
                
                foreach (string judge in split)
                {
                    Console.WriteLine(judge);
                    if (judge == null || judge == "" || judge == "HON`BLE" || judge == "JUSTICE" || judge == "CHIEF" || judge == "ACTING")
                    {
                    }
                    else
                    {
                        if (name1 == "")
                        {
                            name1 = judge;
                        }
                        else
                        {
                            name1 = name1 + " " + judge;
                        }
                        
                    }
                }
                if(searchJudge(name1).Rows.Count > 0)
                {
                    deComboBox3.Text = name1;
                    deComboBox3.Select();
                }   
                else
                {
                    deComboBox3.Text = "";
                    return;
                }
                
            }
            catch (Exception ex)
            {
                return;
                // MessageBox.Show(ex.Message);
            }
        }

        private void cmdnew_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F2)
            {
                if (deComboBox3.Text != "" && searchJudge(deComboBox3.Text.Trim()).Rows.Count > 0)
                {
                    string judge_name = "HON`BLE " + deComboBox3.SelectedValue.ToString() + " " + deComboBox3.Text;

                    for (int i = 0; i < listView1.Items.Count; i++)
                    {
                        if (listView1.Items[i].SubItems[0].Text == judge_name)
                        {
                            MessageBox.Show("This Judge name is already added...");
                            deComboBox3.Focus();
                            return;
                        }
                        else
                        {
                            continue;
                        }
                    }
                    if (listView1.SelectedItems[0].Selected == true)
                    {
                        listView1.SelectedItems[0].SubItems[0].Text = judge_name;
                        listView1.Select();
                        deComboBox3.Text = "";
                    }
                }
            }
        }

        private void listView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            listView2.Select();
        }

        private void listView2_DoubleClick(object sender, EventArgs e)
        {
            listView2.Select();

            string name1 = "";

            try
            {
                string[] split = listView2.SelectedItems[0].SubItems[0].Text.Split(' ');

                foreach (string petitioner in split)
                {

                    if (petitioner == null || petitioner == "")
                    {
                    }
                    else
                    {
                        if (name1 == "")
                        {
                            name1 = petitioner;
                        }
                        else
                        {
                            name1 = name1 + " " + petitioner;
                        }

                    }
                }

                deTextBox11.Text = name1;
                deTextBox11.Select();
            }
            catch (Exception ex)
            {
                return;
                // MessageBox.Show(ex.Message);
            }
            
            
        }

        private void listView2_KeyUp(object sender, KeyEventArgs e)
        {
            if (listView2.Items.Count > 0)
            {
                if (listView2.SelectedItems.Count > 0)
                {
                    if (e.KeyCode == Keys.F2 || e.KeyCode == Keys.Enter)
                    {
                        listView2_DoubleClick(sender, e);
                    }
                    if (e.KeyCode == Keys.Delete)
                    {
                        deButton2_Click(sender, e);
                    }
                }
                else
                {
                    //listView2.Items[0].Selected = true;
                    //listView2.Items[0].Focused = true;
                    listView2.Select();
                }

            }
        }

        private void deButton3_KeyUp(object sender, KeyEventArgs e)
        {
            if(e.KeyCode == Keys.F2)
            {
                if(deTextBox11.Text != "")
                {
                    for (int i = 0; i < listView2.Items.Count; i++)
                    {
                        if (listView2.Items[i].SubItems[0].Text == deTextBox11.Text)
                        {
                            MessageBox.Show("This Petinioer name is already added...");
                            deTextBox11.Focus();
                            return;
                        }
                        else
                        {
                            continue;
                        }
                    }

                    if (listView2.SelectedItems[0].Selected == true)
                    {
                        listView2.SelectedItems[0].SubItems[0].Text = deTextBox11.Text;
                        listView2.Select();
                        deTextBox11.Text = "";
                    }
                }
            }
        }

        private void listView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            listView3.Select();
        }

        private void listView3_KeyUp(object sender, KeyEventArgs e)
        {
            if (listView3.Items.Count > 0)
            {
                if (listView3.SelectedItems.Count > 0)
                {
                    if (e.KeyCode == Keys.F2 || e.KeyCode == Keys.Enter)
                    {
                        listView3_DoubleClick(sender, e);
                    }
                    if (e.KeyCode == Keys.Delete)
                    {
                        deButton11_Click(sender, e);
                    }
                }
                else
                {
                    //listView2.Items[0].Selected = true;
                    //listView2.Items[0].Focused = true;
                    listView3.Select();
                }

            }
        }

        private void listView3_DoubleClick(object sender, EventArgs e)
        {
            listView3.Select();

            string name1 = "";

            try
            {
                string[] split = listView3.SelectedItems[0].SubItems[0].Text.Split(' ');

                foreach (string respondant in split)
                {

                    if (respondant == null || respondant == "")
                    {
                    }
                    else
                    {
                        if (name1 == "")
                        {
                            name1 = respondant;
                        }
                        else
                        {
                            name1 = name1 + " " + respondant;
                        }

                    }
                }

                deTextBox18.Text = name1;
                deTextBox18.Select();
            }
            catch (Exception ex)
            {
                return;
                // MessageBox.Show(ex.Message);
            }
        }

        private void deButton10_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F2)
            {
                if (deTextBox18.Text != "")
                {
                    for (int i = 0; i < listView3.Items.Count; i++)
                    {
                        if (listView3.Items[i].SubItems[0].Text == deTextBox18.Text)
                        {
                            MessageBox.Show("This Respondant name is already added...");
                            deTextBox18.Focus();
                            return;
                        }
                        else
                        {
                            continue;
                        }
                    }

                    if (listView3.SelectedItems[0].Selected == true)
                    {
                        listView3.SelectedItems[0].SubItems[0].Text = deTextBox18.Text;
                        listView3.Select();
                        deTextBox18.Text = "";
                    }
                }
            }
        }

        private void listView7_SelectedIndexChanged(object sender, EventArgs e)
        {
            listView7.Select();
        }

        private void listView7_KeyUp(object sender, KeyEventArgs e)
        {
            if (listView7.Items.Count > 0)
            {
                if (listView7.SelectedItems.Count > 0)
                {
                    if (e.KeyCode == Keys.F2 || e.KeyCode == Keys.Enter)
                    {
                        listView7_DoubleClick(sender, e);
                    }
                    if (e.KeyCode == Keys.Delete)
                    {
                        deButton4_Click(sender, e);
                    }
                }
                else
                {
                    //listView2.Items[0].Selected = true;
                    //listView2.Items[0].Focused = true;
                    listView7.Select();
                }

            }
        }

        private void listView7_DoubleClick(object sender, EventArgs e)
        {
            listView7.Select();

            string name1 = "";

            try
            {
                string[] split = listView7.SelectedItems[0].SubItems[0].Text.Split(' ');

                foreach (string petcounsel in split)
                {

                    if (petcounsel == null || petcounsel == "")
                    {
                    }
                    else
                    {
                        if (name1 == "")
                        {
                            name1 = petcounsel;
                        }
                        else
                        {
                            name1 = name1 + " " + petcounsel;
                        }

                    }
                }

                deTextBox14.Text = name1;
                deTextBox14.Select();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return;
               
            }
        }

        private void deButton5_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F2)
            {
                if (deTextBox14.Text != "")
                {
                    for (int i = 0; i < listView7.Items.Count; i++)
                    {
                        if (listView7.Items[i].SubItems[0].Text == deTextBox14.Text)
                        {
                            MessageBox.Show("This Petitioner Counsel name is already added...");
                            deTextBox14.Focus();
                            return;
                        }
                        else
                        {
                            continue;
                        }
                    }

                    if (listView7.SelectedItems[0].Selected == true)
                    {
                        listView7.SelectedItems[0].SubItems[0].Text = deTextBox14.Text;
                        listView7.Select();
                        deTextBox14.Text = "";
                    }
                }
            }
        }

        private void listView8_SelectedIndexChanged(object sender, EventArgs e)
        {
            listView8.Select();
        }

        private void listView8_KeyUp(object sender, KeyEventArgs e)
        {
            if (listView8.Items.Count > 0)
            {
                if (listView8.SelectedItems.Count > 0)
                {
                    if (e.KeyCode == Keys.F2 || e.KeyCode == Keys.Enter)
                    {
                        listView8_DoubleClick(sender, e);
                    }
                    if (e.KeyCode == Keys.Delete)
                    {
                        deButton7_Click(sender, e);
                    }
                }
                else
                {
                    //listView2.Items[0].Selected = true;
                    //listView2.Items[0].Focused = true;
                    listView8.Select();
                }

            }
        }

        private void listView8_DoubleClick(object sender, EventArgs e)
        {
            listView8.Select();

            string name1 = "";

            try
            {
                string[] split = listView8.SelectedItems[0].SubItems[0].Text.Split(' ');

                foreach (string rescounsel in split)
                {

                    if (rescounsel == null || rescounsel == "")
                    {
                    }
                    else
                    {
                        if (name1 == "")
                        {
                            name1 = rescounsel;
                        }
                        else
                        {
                            name1 = name1 + " " + rescounsel;
                        }

                    }
                }

                deTextBox16.Text = name1;
                deTextBox16.Select();
            }
            catch (Exception ex)
            {
                return;
                // MessageBox.Show(ex.Message);
            }
        }

        private void deButton6_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F2)
            {
                if (deTextBox16.Text != "")
                {
                    for (int i = 0; i < listView8.Items.Count; i++)
                    {
                        if (listView8.Items[i].SubItems[0].Text == deTextBox16.Text)
                        {
                            MessageBox.Show("This Respondant Counsel name is already added...");
                            deTextBox16.Focus();
                            return;
                        }
                        else
                        {
                            continue;
                        }
                    }

                    if (listView8.SelectedItems[0].Selected == true)
                    {
                        listView8.SelectedItems[0].SubItems[0].Text = deTextBox16.Text;
                        listView8.Select();
                        deTextBox16.Text = "";
                    }
                }
            }
        }

        private void listView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            listView4.Select();
        }

        private void listView4_KeyUp(object sender, KeyEventArgs e)
        {
            if (listView4.Items.Count > 0)
            {
                if (listView4.SelectedItems.Count > 0)
                {
                    if (e.KeyCode == Keys.F2 || e.KeyCode == Keys.Enter)
                    {
                        listView4_DoubleClick(sender, e);
                    }
                    if (e.KeyCode == Keys.Delete)
                    {
                        deButton8_Click(sender, e);
                    }
                }
                else
                {
                    //listView2.Items[0].Selected = true;
                    //listView2.Items[0].Focused = true;
                    listView4.Select();
                }

            }
        }

        private void listView4_DoubleClick(object sender, EventArgs e)
        {
            listView4.Select();

            
            try
            {
                string[] split = listView4.SelectedItems[0].SubItems[0].Text.Split('/');

                for (int i = 0; i < split.Length; i++)
                {
                    if (split[i] == "")
                    {
                        deComboBox5.Text = "";
                        deTextBox24.Text = "";
                        deTextBox25.Text = "";
                        return;
                    }
                    else
                    {
                        if (i == 0 && split[0] != "" && searchLCCaseType(split[0]).Rows.Count >0)
                        {
                            deComboBox5.Text = split[0];
                            deComboBox5.Select();
                        }
                        else if (i== 1 && split[1] != "")
                        {
                            deTextBox24.Text = split[1];
                        }
                        else if (i== 2 && split[2] != "")
                        {
                            deTextBox25.Text = split[2];
                        }
                        else
                        {
                            deComboBox5.Text = "";
                            deTextBox24.Text = "";
                            deTextBox25.Text = "";
                            return;
                        }
                    }
                }

                
            }
            catch (Exception ex)
            {
                return;
                // MessageBox.Show(ex.Message);
            }

            

            }

        private void deButton9_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F2)
            {
                if(deComboBox5.Text != "" && searchLCCaseType(deComboBox5.Text).Rows.Count >0)
                {
                    if(deTextBox24.Text != "" && deTextBox25.Text != "")
                    {
                        string lc_case_number = deComboBox5.Text + "/" + deTextBox24.Text + "/" + deTextBox25.Text;

                        for (int i = 0; i < listView4.Items.Count; i++)
                        {
                            if (listView4.Items[i].SubItems[0].Text == lc_case_number)
                            {
                                MessageBox.Show("This Lower court case number is already added...");
                                deComboBox5.Focus();
                                return;
                            }
                            else
                            {
                                continue;
                            }
                        }

                        if (listView4.SelectedItems[0].Selected == true)
                        {
                            listView4.SelectedItems[0].SubItems[0].Text = lc_case_number;
                            listView4.Select();
                            deComboBox5.Text = "";
                            deTextBox24.Text = "";
                            deTextBox25.Text = "";
                        }
                    }
                }
            }
        }

        private void listView9_SelectedIndexChanged(object sender, EventArgs e)
        {
            listView9.Select();
        }

        private void listView9_KeyUp(object sender, KeyEventArgs e)
        {
            if (listView9.Items.Count > 0)
            {
                if (listView9.SelectedItems.Count > 0)
                {
                    if (e.KeyCode == Keys.F2 || e.KeyCode == Keys.Enter)
                    {
                        listView9_DoubleClick(sender, e);
                    }
                    if (e.KeyCode == Keys.Delete)
                    {
                        deButton12_Click(sender, e);
                    }
                }
                else
                {
                    //listView2.Items[0].Selected = true;
                    //listView2.Items[0].Focused = true;
                    listView9.Select();
                }

            }
        }

        private void listView9_DoubleClick(object sender, EventArgs e)
        {
            listView9.Select();

           
            string name1 = "";

            try
            {

                string[] split = listView9.SelectedItems[0].SubItems[0].Text.Split(' ');

                foreach (string lcjudge in split)
                {
                    Console.WriteLine(lcjudge);
                    if (lcjudge == null || lcjudge == "" || lcjudge == "HON`BLE" || lcjudge == "JUSTICE" || lcjudge == "CHIEF" || lcjudge == "ACTING")
                    {
                    }
                    else
                    {
                        if (name1 == "")
                        {
                            name1 = lcjudge;
                        }
                        else
                        {
                            name1 = name1 + " " + lcjudge;
                        }

                    }
                }
                if (searchJudge(name1).Rows.Count > 0)
                {
                    deComboBox6.Text = name1;
                    deComboBox6.Select();
                }
                else
                {
                    deComboBox6.Text = "";
                    return;
                }

            }
            catch (Exception ex)
            {
                return;
                // MessageBox.Show(ex.Message);
            }
        }

        private void deButton13_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F2)
            {
                if (deComboBox6.Text != "" && searchJudge(deComboBox6.Text.Trim()).Rows.Count > 0)
                {
                    string lc_judge_name = "HON`BLE " + deComboBox6.SelectedValue.ToString() + " " + deComboBox6.Text;

                    for (int i = 0; i < listView9.Items.Count; i++)
                    {
                        if (listView9.Items[i].SubItems[0].Text == lc_judge_name)
                        {
                            MessageBox.Show("This Lower Court Judge name is already added...");
                            deComboBox6.Focus();
                            return;
                        }
                        else
                        {
                            continue;
                        }
                    }
                    if (listView9.SelectedItems[0].Selected == true)
                    {
                        listView9.SelectedItems[0].SubItems[0].Text = lc_judge_name;
                        listView9.Select();
                        deComboBox6.Text = "";
                    }
                }
            }
        }

        private void listView5_SelectedIndexChanged(object sender, EventArgs e)
        {
            listView5.Select();
        }

        private void listView5_KeyUp(object sender, KeyEventArgs e)
        {
            if (listView5.Items.Count > 0)
            {
                if (listView5.SelectedItems.Count > 0)
                {
                    if (e.KeyCode == Keys.F2 || e.KeyCode == Keys.Enter)
                    {
                        listView5_DoubleClick(sender, e);
                    }
                    if (e.KeyCode == Keys.Delete)
                    {
                        deButton14_Click(sender, e);
                    }
                }
                else
                {
                    //listView2.Items[0].Selected = true;
                    //listView2.Items[0].Focused = true;
                    listView5.Select();
                }

            }
        }

        private void listView5_DoubleClick(object sender, EventArgs e)
        {
            listView5.Select();


            try
            {
                string[] split = listView5.SelectedItems[0].SubItems[0].Text.Split('/');

                for (int i = 0; i < split.Length; i++)
                {
                    if (split[i] == "")
                    {
                        deComboBox7.Text = "";
                        deTextBox31.Text = "";
                        deTextBox32.Text = "";
                        return;
                    }
                    else
                    {
                        if (i == 0 && split[0] != "" && searchCaseType(split[0]).Rows.Count > 0)
                        {
                            deComboBox7.Text = split[0];
                            deComboBox7.Select();
                        }
                        else if (i == 1 && split[1] != "")
                        {
                            deTextBox31.Text = split[1];
                        }
                        else if (i == 2 && split[2] != "")
                        {
                            deTextBox32.Text = split[2];
                        }
                        else
                        {
                            deComboBox7.Text = "";
                            deTextBox31.Text = "";
                            deTextBox32.Text = "";
                            return;
                        }
                    }
                }


            }
            catch (Exception ex)
            {
                return;
                // MessageBox.Show(ex.Message);
            }
        }

        private void deButton15_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F2)
            {
                if (deComboBox7.Text != "" && searchCaseType(deComboBox7.Text).Rows.Count > 0)
                {
                    if (deTextBox31.Text != "" && deTextBox32.Text != "")
                    {
                        string conn_app_case_number = deComboBox7.Text + "/" + deTextBox31.Text + "/" + deTextBox32.Text;

                        for (int i = 0; i < listView5.Items.Count; i++)
                        {
                            if (listView5.Items[i].SubItems[0].Text == conn_app_case_number)
                            {
                                MessageBox.Show("This Connected Application case number is already added...");
                                deComboBox7.Focus();
                                return;
                            }
                            else
                            {
                                continue;
                            }
                        }

                        if (listView5.SelectedItems[0].Selected == true)
                        {
                            listView5.SelectedItems[0].SubItems[0].Text = conn_app_case_number;
                            listView5.Select();
                            deComboBox7.Text = "";
                            deTextBox31.Text = "";
                            deTextBox32.Text = "";
                        }
                    }
                }
            }
        }

        private void listView10_SelectedIndexChanged(object sender, EventArgs e)
        {
            listView10.Select();
        }

        private void listView10_KeyUp(object sender, KeyEventArgs e)
        {
            if (listView10.Items.Count > 0)
            {
                if (listView10.SelectedItems.Count > 0)
                {
                    if (e.KeyCode == Keys.F2 || e.KeyCode == Keys.Enter)
                    {
                        listView10_DoubleClick(sender, e);
                    }
                    if (e.KeyCode == Keys.Delete)
                    {
                        deButton16_Click(sender, e);
                    }
                }
                else
                {
                    //listView2.Items[0].Selected = true;
                    //listView2.Items[0].Focused = true;
                    listView10.Select();
                }

            }
        }

        private void listView10_DoubleClick(object sender, EventArgs e)
        {
            listView10.Select();


            try
            {
                string[] split = listView10.SelectedItems[0].SubItems[0].Text.Split('/');

                for (int i = 0; i < split.Length; i++)
                {
                    if (split[i] == "")
                    {
                        deComboBox9.Text = "";
                        deTextBox35.Text = "";
                        deTextBox36.Text = "";
                        return;
                    }
                    else
                    {
                        if (i == 0 && split[0] != "" && searchCaseType(split[0]).Rows.Count > 0)
                        {
                            deComboBox9.Text = split[0];
                            deComboBox9.Select();
                        }
                        else if (i == 1 && split[1] != "")
                        {
                            deTextBox35.Text = split[1];
                        }
                        else if (i == 2 && split[2] != "")
                        {
                            deTextBox36.Text = split[2];
                        }
                        else
                        {
                            deComboBox9.Text = "";
                            deTextBox35.Text = "";
                            deTextBox36.Text = "";
                            return;
                        }
                    }
                }


            }
            catch (Exception ex)
            {
                return;
                // MessageBox.Show(ex.Message);
            }
        }

        private void deButton17_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F2)
            {
                if (deComboBox9.Text != "" && searchCaseType(deComboBox9.Text).Rows.Count > 0)
                {
                    if (deTextBox35.Text != "" && deTextBox36.Text != "")
                    {
                        string conn_main_case_number = deComboBox9.Text + "/" + deTextBox35.Text + "/" + deTextBox36.Text;

                        for (int i = 0; i < listView10.Items.Count; i++)
                        {
                            if (listView10.Items[i].SubItems[0].Text == conn_main_case_number)
                            {
                                MessageBox.Show("This Connected Main case number is already added...");
                                deComboBox9.Focus();
                                return;
                            }
                            else
                            {
                                continue;
                            }
                        }

                        if (listView10.SelectedItems[0].Selected == true)
                        {
                            listView10.SelectedItems[0].SubItems[0].Text = conn_main_case_number;
                            listView10.Select();
                            deComboBox9.Text = "";
                            deTextBox35.Text = "";
                            deTextBox36.Text = "";
                        }
                    }
                }
            }
        }

        private void listView6_SelectedIndexChanged(object sender, EventArgs e)
        {
            listView6.Select();
        }

        private void listView6_KeyUp(object sender, KeyEventArgs e)
        {
            if (listView6.Items.Count > 0)
            {
                if (listView6.SelectedItems.Count > 0)
                {
                    if (e.KeyCode == Keys.F2 || e.KeyCode == Keys.Enter)
                    {
                        listView6_DoubleClick(sender, e);
                    }
                    if (e.KeyCode == Keys.Delete)
                    {
                        deButton18_Click(sender, e);
                    }
                }
                else
                {
                    //listView2.Items[0].Selected = true;
                    //listView2.Items[0].Focused = true;
                    listView6.Select();
                }

            }
        }

        private void listView6_DoubleClick(object sender, EventArgs e)
        {
            listView6.Select();


            try
            {
                string[] split = listView6.SelectedItems[0].SubItems[0].Text.Split('/');

                for (int i = 0; i < split.Length; i++)
                {
                    if (split[i] == "")
                    {
                        deComboBox10.Text = "";
                        deTextBox38.Text = "";
                        deTextBox39.Text = "";
                        return;
                    }
                    else
                    {
                        if (i == 0 && split[0] != "" && searchCaseType(split[0]).Rows.Count > 0)
                        {
                            deComboBox10.Text = split[0];
                            deComboBox10.Select();
                        }
                        else if (i == 1 && split[1] != "")
                        {
                            deTextBox38.Text = split[1];
                        }
                        else if (i == 2 && split[2] != "")
                        {
                            deTextBox39.Text = split[2];
                        }
                        else
                        {
                            deComboBox10.Text = "";
                            deTextBox38.Text = "";
                            deTextBox39.Text = "";
                            return;
                        }
                    }
                }


            }
            catch (Exception ex)
            {
                return;
                // MessageBox.Show(ex.Message);
            }
        }

        private void deButton19_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F2)
            {
                if (deComboBox10.Text != "" && searchCaseType(deComboBox10.Text).Rows.Count > 0)
                {
                    if (deTextBox38.Text != "" && deTextBox39.Text != "")
                    {
                        string analogous_case_number = deComboBox10.Text + "/" + deTextBox38.Text + "/" + deTextBox39.Text;

                        for (int i = 0; i < listView6.Items.Count; i++)
                        {
                            if (listView6.Items[i].SubItems[0].Text == analogous_case_number)
                            {
                                MessageBox.Show("This Analogous case number is already added...");
                                deComboBox10.Focus();
                                return;
                            }
                            else
                            {
                                continue;
                            }
                        }

                        if (listView6.SelectedItems[0].Selected == true)
                        {
                            listView6.SelectedItems[0].SubItems[0].Text = analogous_case_number;
                            listView6.Select();
                            deComboBox10.Text = "";
                            deTextBox38.Text = "";
                            deTextBox39.Text = "";
                        }
                    }
                }
            }
        }

        private void deButton20_Click_1(object sender, EventArgs e)
        {
            //txn = sqlCon.BeginTransaction();
            deButton20_Click(sender, e);
        }

        private void deButton21_Click_1(object sender, EventArgs e)
        {
            //txn = sqlCon.BeginTransaction();
            deButton21_Click(sender, e);
        }

        private void deComboBox3_Leave(object sender, EventArgs e)
        {
            if ((deComboBox3.Text.Trim() == "" || deComboBox3.Text.Trim() == null || String.IsNullOrEmpty(deComboBox3.Text.Trim()) || String.IsNullOrWhiteSpace(deComboBox3.Text.Trim())))
            {
                
            }
            else
            {
                if (searchJudge(deComboBox3.Text.Trim()).Rows.Count > 0)
                {

                }
                else
                {
                    MessageBox.Show("Please Select Proper Judge Name ...");
                    deComboBox3.Focus();
                    return;
                }
            }
        }

        private void deComboBox6_Leave(object sender, EventArgs e)
        {
            if ((deComboBox6.Text.Trim() == "" || deComboBox6.Text.Trim() == null || String.IsNullOrEmpty(deComboBox6.Text.Trim()) || String.IsNullOrWhiteSpace(deComboBox6.Text.Trim())))
            {

            }
            else
            {
                if (searchJudge(deComboBox6.Text.Trim()).Rows.Count > 0)
                {

                }
                else
                {
                    MessageBox.Show("Please Select Proper Judge Name ...");
                    deComboBox6.Focus();
                    return;
                }
            }
        }

      
        private void listView2_MouseHover(object sender, EventArgs e)
        {
            
            try
            {
                if (listView2.Items.Count > 0)
                {
                    toolTip1 = new ToolTip();
                    toolTip1.ShowAlways = true;
                    toolTip1.ToolTipIcon = ToolTipIcon.Info;
                    toolTip1.IsBalloon = true;
                    toolTip1.BackColor = System.Drawing.Color.LightBlue;
                    toolTip1.ForeColor = System.Drawing.Color.Black;
                    toolTip1.ToolTipTitle = "Petitioner Names";

                    string pNames = "";
                    for (int i = 0; i < listView2.Items.Count; i++)
                    {
                        pNames = pNames + "\n" + (i + 1) + " : " + listView2.Items[i].Text;
                    }
                    
                    toolTip1.SetToolTip(this.listView2, "\nTotal Petitioner Names : " + listView2.Items.Count + "\n" + pNames);
                    //toolTip1.Show("\nTotal Judge Names :" + listView1.Items.Count +"\n" +jNames,listView1);
                }
                else
                {
                    toolTip1.ShowAlways = false;
                    toolTip1.RemoveAll();
                    toolTip1.GetLifetimeService();
                    return;
                }
            }
            catch (Exception ex)
            {
            }
        }

      

        private void listView1_MouseHover(object sender, EventArgs e)
        {
            
            try
            {
                if (listView1.Items.Count > 0)
                {
                    toolTip1 = new ToolTip();
                    toolTip1.ShowAlways = true;
                    toolTip1.ToolTipIcon = ToolTipIcon.Info;
                    toolTip1.IsBalloon = true;
                    toolTip1.BackColor = System.Drawing.Color.LightBlue;
                    toolTip1.ForeColor = System.Drawing.Color.Black;
                    toolTip1.ToolTipTitle = "Judge Names";

                    string jNames = "";
                    for (int i = 0; i < listView1.Items.Count; i++)
                    {
                        jNames = jNames + "\n" + (i + 1) + " : " + listView1.Items[i].Text;
                    }

                    toolTip1.SetToolTip(this.listView1, "\nTotal Judge Names : " + listView1.Items.Count + "\n" + jNames);
                    //toolTip1.Show("\nTotal Judge Names :" + listView1.Items.Count +"\n" +jNames,listView1);

                    //helpProvider1.SetHelpString(this.listView1, "\nTotal Judge Names :" + listView1.Items.Count + "\n" + jNames);
                }
                else
                {
                    toolTip1.ShowAlways = false;
                    toolTip1.RemoveAll();
                    toolTip1.GetLifetimeService();
                    return;
                }
            }
            catch (Exception ex)
            {
            }
        }

        private void toolTip1_Draw(object sender, DrawToolTipEventArgs e)
        {
            e.DrawBackground();
            e.DrawBorder();
            e.DrawText();
        }

        private void listView7_MouseHover(object sender, EventArgs e)
        {
            
            try
            {
                if (listView7.Items.Count > 0)
                {
                    toolTip1 = new ToolTip();
                    toolTip1.ShowAlways = true;
                    toolTip1.ToolTipIcon = ToolTipIcon.Info;
                    toolTip1.IsBalloon = true;
                    toolTip1.BackColor = System.Drawing.Color.LightBlue;
                    toolTip1.ForeColor = System.Drawing.Color.Black;
                    toolTip1.ToolTipTitle = "Petitioner Counsel Names";

                    string pNames = "";
                    for (int i = 0; i < listView7.Items.Count; i++)
                    {
                        pNames = pNames + "\n" + (i + 1) + " : " + listView7.Items[i].Text;
                    }

                    toolTip1.SetToolTip(this.listView7, "\nTotal Petitioner Counsel Names : " + listView7.Items.Count + "\n" + pNames);
                   
                }
                else
                {
                    toolTip1.ShowAlways = false;
                    toolTip1.RemoveAll();
                    toolTip1.GetLifetimeService();
                    return;
                }
            }
            catch (Exception ex)
            {
            }
        }

        private void listView3_MouseHover(object sender, EventArgs e)
        {
            
            try
            {
                if (listView3.Items.Count > 0)
                {
                    toolTip1 = new ToolTip();
                    toolTip1.ShowAlways = true;
                    toolTip1.ToolTipIcon = ToolTipIcon.Info;
                    toolTip1.IsBalloon = true;
                    toolTip1.BackColor = System.Drawing.Color.LightBlue;
                    toolTip1.ForeColor = System.Drawing.Color.Black;
                    toolTip1.ToolTipTitle = "Respondant Names";

                    string pNames = "";
                    for (int i = 0; i < listView3.Items.Count; i++)
                    {
                        pNames = pNames + "\n" + (i + 1) + " : " + listView3.Items[i].Text;
                    }

                    toolTip1.SetToolTip(this.listView3, "\nTotal Respondant Names : " + listView3.Items.Count + "\n" + pNames);
                    
                }
                else
                {
                    toolTip1.ShowAlways = false;
                    toolTip1.RemoveAll();
                    toolTip1.GetLifetimeService();
                    return;
                }
            }
            catch (Exception ex)
            {
            }
        }

        private void listView8_MouseHover(object sender, EventArgs e)
        {
            
            try
            {
                if (listView8.Items.Count > 0)
                {
                    toolTip1 = new ToolTip();
                    toolTip1.ShowAlways = true;
                    toolTip1.ToolTipIcon = ToolTipIcon.Info;
                    toolTip1.IsBalloon = true;
                    toolTip1.BackColor = System.Drawing.Color.LightBlue;
                    toolTip1.ForeColor = System.Drawing.Color.Black;
                    toolTip1.ToolTipTitle = "Respondant Counsel Names";

                    string pNames = "";
                    for (int i = 0; i < listView8.Items.Count; i++)
                    {
                        pNames = pNames + "\n" + (i + 1) + " : " + listView8.Items[i].Text;
                    }

                    toolTip1.SetToolTip(this.listView8, "\nTotal Respondant Counsel Names : " + listView8.Items.Count + "\n" + pNames);
                    
                }
                else
                {
                    toolTip1.ShowAlways = false;
                    toolTip1.RemoveAll();
                    toolTip1.GetLifetimeService();
                    return;
                }
            }
            catch (Exception ex)
            {
            }
        }

        private void listView4_MouseHover(object sender, EventArgs e)
        {
            
            try
            {
                if (listView4.Items.Count > 0)
                {
                    toolTip1 = new ToolTip();
                    toolTip1.ShowAlways = true;
                    toolTip1.ToolTipIcon = ToolTipIcon.Info;
                    toolTip1.IsBalloon = true;
                    toolTip1.BackColor = System.Drawing.Color.LightBlue;
                    toolTip1.ForeColor = System.Drawing.Color.Black;
                    toolTip1.ToolTipTitle = "Lower Court Case Numbers";

                    string pNames = "";
                    for (int i = 0; i < listView4.Items.Count; i++)
                    {
                        pNames = pNames + "\n" + (i + 1) + " : " + listView4.Items[i].Text;
                    }

                    toolTip1.SetToolTip(this.listView4, "\nTotal Lower Court Case Numbers : " + listView4.Items.Count + "\n" + pNames);
                    
                }
                else
                {
                    toolTip1.ShowAlways = false;
                    toolTip1.RemoveAll();
                    toolTip1.GetLifetimeService();
                    return;
                }
            }
            catch (Exception ex)
            {
            }
        }

        private void listView9_MouseHover(object sender, EventArgs e)
        {
            try
            {
                if (listView9.Items.Count > 0)
                {
                    toolTip1 = new ToolTip();
                    toolTip1.ShowAlways = true;
                    toolTip1.ToolTipIcon = ToolTipIcon.Info;
                    toolTip1.IsBalloon = true;
                    toolTip1.BackColor = System.Drawing.Color.LightBlue;
                    toolTip1.ForeColor = System.Drawing.Color.Black;
                    toolTip1.ToolTipTitle = "Lower Court Judge Names";

                    string pNames = "";
                    for (int i = 0; i < listView9.Items.Count; i++)
                    {
                        pNames = pNames + "\n" + (i + 1) + " : " + listView9.Items[i].Text;
                    }

                    toolTip1.SetToolTip(this.listView9, "\nTotal Lower Court Judge Names : " + listView9.Items.Count + "\n" + pNames);

                }
                else
                {
                    toolTip1.ShowAlways = false;
                    toolTip1.RemoveAll();
                    toolTip1.GetLifetimeService();
                    return;
                }
            }
            catch (Exception ex)
            {
            }
        }

        private void listView5_MouseHover(object sender, EventArgs e)
        {
            try
            {
                if (listView5.Items.Count > 0)
                {
                    toolTip1 = new ToolTip();
                    toolTip1.ShowAlways = true;
                    toolTip1.ToolTipIcon = ToolTipIcon.Info;
                    toolTip1.IsBalloon = true;
                    toolTip1.BackColor = System.Drawing.Color.LightBlue;
                    toolTip1.ForeColor = System.Drawing.Color.Black;
                    toolTip1.ToolTipTitle = "Connected Application Numbers";

                    string pNames = "";
                    for (int i = 0; i < listView5.Items.Count; i++)
                    {
                        pNames = pNames + "\n" + (i + 1) + " : " + listView5.Items[i].Text;
                    }

                    toolTip1.SetToolTip(this.listView9, "\nTotal Connected Application Numbers : " + listView5.Items.Count + "\n" + pNames);

                }
                else
                {
                    toolTip1.ShowAlways = false;
                    toolTip1.RemoveAll();
                    toolTip1.GetLifetimeService();
                    return;
                }
            }
            catch (Exception ex)
            {
            }
        }

        private void listView10_MouseHover(object sender, EventArgs e)
        {
            try
            {
                if (listView10.Items.Count > 0)
                {
                    toolTip1 = new ToolTip();
                    toolTip1.ShowAlways = true;
                    toolTip1.ToolTipIcon = ToolTipIcon.Info;
                    toolTip1.IsBalloon = true;
                    toolTip1.BackColor = System.Drawing.Color.LightBlue;
                    toolTip1.ForeColor = System.Drawing.Color.Black;
                    toolTip1.ToolTipTitle = "Connected Main Case Numbers";

                    string pNames = "";
                    for (int i = 0; i < listView10.Items.Count; i++)
                    {
                        pNames = pNames + "\n" + (i + 1) + " : " + listView10.Items[i].Text;
                    }

                    toolTip1.SetToolTip(this.listView10, "\nTotal Connected Main Case Numbers : " + listView10.Items.Count + "\n" + pNames);

                }
                else
                {
                    toolTip1.ShowAlways = false;
                    toolTip1.RemoveAll();
                    toolTip1.GetLifetimeService();
                    return;
                }
            }
            catch (Exception ex)
            {
            }
        }

        private void listView6_MouseHover(object sender, EventArgs e)
        {
            try
            {
                if (listView6.Items.Count > 0)
                {
                    toolTip1 = new ToolTip();
                    toolTip1.ShowAlways = true;
                    toolTip1.ToolTipIcon = ToolTipIcon.Info;
                    toolTip1.IsBalloon = true;
                    toolTip1.BackColor = System.Drawing.Color.LightBlue;
                    toolTip1.ForeColor = System.Drawing.Color.Black;
                    toolTip1.ToolTipTitle = "Analogous Case Numbers";

                    string pNames = "";
                    for (int i = 0; i < listView6.Items.Count; i++)
                    {
                        pNames = pNames + "\n" + (i + 1) + " : " + listView6.Items[i].Text;
                    }

                    toolTip1.SetToolTip(this.listView6, "\nTotal Analogous Case Numbers : " + listView6.Items.Count + "\n" + pNames);

                }
                else
                {
                    toolTip1.ShowAlways = false;
                    toolTip1.RemoveAll();
                    toolTip1.GetLifetimeService();
                    return;
                }
            }
            catch (Exception ex)
            {
            }
        }

        private void deTextBox11_Leave(object sender, EventArgs e)
        {
            deTextBox11.BackColor = Color.NavajoWhite;
            deTextBox18.BackColor = Color.NavajoWhite;
        }

        private void deTextBox18_Leave(object sender, EventArgs e)
        {
            deTextBox11.BackColor = Color.NavajoWhite;
            deTextBox18.BackColor = Color.NavajoWhite;
        }
        public void getJudge(List<string> jList)
        {
            JudgesList.Clear();
            for (int i = 0; i < jList.Count; i++)
            {
                Judges plot = new Judges();
                plot.Proj_code = projKey;
                plot.Bundle_code = bundleKey;
                plot.CaseFile = caseFileNo;
                
                plot.Judge_name = jList[i].ToString();
                JudgesList.Add(plot);
            }
        }
        public void getPetitioner(List<string> pList)
        {
            PetitionerList.Clear();
            for (int i = 0; i < pList.Count; i++)
            {
                Petitioner plot = new Petitioner();
                plot.Proj_code = projKey;
                plot.Bundle_code = bundleKey;
                plot.CaseFile = caseFileNo;

                plot.Petitioner_name = pList[i].ToString();
                PetitionerList.Add(plot);
            }
        }
        public void getPetitionerCounsel(List<string> pcList)
        {
            PetitionerCounselList.Clear();
            for (int i = 0; i < pList.Count; i++)
            {
                PetitionerCounsel plot = new PetitionerCounsel();
                plot.Proj_code = projKey;
                plot.Bundle_code = bundleKey;
                plot.CaseFile = caseFileNo;

                plot.Petitioner_counsel_name = pcList[i].ToString();
                PetitionerCounselList.Add(plot);
            }
        }
        public void getRespondant(List<string> rList)
        {
            RespondantList.Clear();
            for (int i = 0; i < rList.Count; i++)
            {
                Respondant plot = new Respondant();
                plot.Proj_code = projKey;
                plot.Bundle_code = bundleKey;
                plot.CaseFile = caseFileNo;

                plot.Respondant_name = rList[i].ToString();
                RespondantList.Add(plot);
            }
        }
        public void getRespondantCounsel(List<string> rcList)
        {
            RespondantCounselList.Clear();
            for (int i = 0; i < rcList.Count; i++)
            {
                RespondantCounsel plot = new RespondantCounsel();
                plot.Proj_code = projKey;
                plot.Bundle_code = bundleKey;
                plot.CaseFile = caseFileNo;

                plot.Respondant_counsel_name = rcList[i].ToString();
                RespondantCounselList.Add(plot);
            }
        }
        public void getLcCase(List<string> lcNList)
        {
            LowerCourtCaselList.Clear();
            for (int i = 0; i < lcNList.Count; i++)
            {
                LowerCourtCase plot = new LowerCourtCase();
                plot.Proj_code = projKey;
                plot.Bundle_code = bundleKey;
                plot.CaseFile = caseFileNo;

                plot.Lc_case_name = lcNList[i].ToString();
                LowerCourtCaselList.Add(plot);
            }
        }
        public void getLcJudge(List<string> lcJList)
        {
            LCJudgesList.Clear();
            for (int i = 0; i < lcJList.Count; i++)
            {
                LCJudges plot = new LCJudges();
                plot.Proj_code = projKey;
                plot.Bundle_code = bundleKey;
                plot.CaseFile = caseFileNo;

                plot.Lc_Judge_name = lcJList[i].ToString();
                LCJudgesList.Add(plot);
            }
        }
        public void getConnApp(List<string> cList)
        {
            ConnAppList.Clear();
            for (int i = 0; i < cList.Count; i++)
            {
                ConnApp plot = new ConnApp();
                plot.Proj_code = projKey;
                plot.Bundle_code = bundleKey;
                plot.CaseFile = caseFileNo;

                plot.Conn_app_case_name = cList[i].ToString();
                ConnAppList.Add(plot);
            }
        }
        public void getAnalogous(List<string> aList)
        {
            AnalogousList.Clear();
            for (int i = 0; i < aList.Count; i++)
            {
                Analogous plot = new Analogous();
                plot.Proj_code = projKey;
                plot.Bundle_code = bundleKey;
                plot.CaseFile = caseFileNo;

                plot.Analogous_case_name = aList[i].ToString();
                AnalogousList.Add(plot);
            }
        }
        public void getConnMain(List<string> cMList)
        {
            ConnMainList.Clear();
            for (int i = 0; i < cMList.Count; i++)
            {
                ConnMain plot = new ConnMain();
                plot.Proj_code = projKey;
                plot.Bundle_code = bundleKey;
                plot.CaseFile = caseFileNo;

                plot.Conn_main_case_name = cMList[i].ToString();
                ConnMainList.Add(plot);
            }
        }
        private void button1_Click(object sender, EventArgs e)
        {
            frmAddJudge frm1 = new frmAddJudge(sqlCon, getJudge, projKey, bundleKey, deTextBox8.Text, jList, _mode,txn);
            frm1.ShowDialog();
            frm1.Activate();
            SendKeys.Send("{Tab}");
        }

        private void deButton22_Click(object sender, EventArgs e)
        {
            deLabel50.Text = "Total Judges : " + jList.Count;
            frmAddJudge frm1 = new frmAddJudge(sqlCon, getJudge, projKey, bundleKey, deTextBox8.Text, jList, _mode,txn);
            frm1.ShowDialog();
            frm1.Activate();
            //SendKeys.Send("{Tab}");
        }

        private void deButton22_Leave(object sender, EventArgs e)
        {
            deLabel50.Text = "Total Judges : " + jList.Count;
        }

        private void deButton22_KeyUp(object sender, KeyEventArgs e)
        {
            deLabel50.Text = "Total Judges : " + jList.Count;
        }

        private void deButton23_Click(object sender, EventArgs e)
        {
            deLabel51.Text = "Total Petitioner : " + pList.Count;
            frmAddPetitioner frm1 = new frmAddPetitioner(sqlCon, getPetitioner, projKey, bundleKey, deTextBox8.Text, pList, _mode,txn);
            frm1.ShowDialog();
            frm1.Activate();
            //SendKeys.Send("{Tab}");
        }

        private void deButton23_Leave(object sender, EventArgs e)
        {
            deLabel51.Text = "Total Petitioner : " + pList.Count;
        }

        private void deButton23_KeyUp(object sender, KeyEventArgs e)
        {
            deLabel51.Text = "Total Petitioner : " + pList.Count;
        }

        private void deButton24_Click(object sender, EventArgs e)
        {
            deLabel52.Text = "Total Petitioner Counsel : " + pcList.Count;
            frmAddPetitionerCounsel frm1 = new frmAddPetitionerCounsel(sqlCon, getPetitionerCounsel, projKey, bundleKey, deTextBox8.Text, pcList, _mode,txn);
            frm1.ShowDialog();
            frm1.Activate();
            //SendKeys.Send("{Tab}");
        }

        private void deButton24_Leave(object sender, EventArgs e)
        {
            deLabel52.Text = "Total Petitioner Counsel : " + pcList.Count;
        }

        private void deButton24_KeyUp(object sender, KeyEventArgs e)
        {
            deLabel52.Text = "Total Petitioner Counsel : " + pcList.Count;
        }

        private void deButton25_Click(object sender, EventArgs e)
        {
            deLabel53.Text = "Total Respondant : " + rList.Count;
            frmAddRespondant frm1 = new frmAddRespondant(sqlCon, getRespondant, projKey, bundleKey, deTextBox8.Text, rList, _mode,txn);
            frm1.ShowDialog();
            frm1.Activate();
            //SendKeys.Send("{Tab}");
        }

        private void deButton25_KeyUp(object sender, KeyEventArgs e)
        {
            deLabel53.Text = "Total Respondant : " + rList.Count;
        }

        private void deButton25_Leave(object sender, EventArgs e)
        {
            deLabel53.Text = "Total Respondant : " + rList.Count;
        }

        private void deButton26_Click(object sender, EventArgs e)
        {
            deLabel54.Text = "Total Respondant Counsel : " + rcList.Count;
            frmAddRespondantCounsel frm1 = new frmAddRespondantCounsel(sqlCon, getRespondantCounsel, projKey, bundleKey, deTextBox8.Text, rcList, _mode,txn);
            frm1.ShowDialog();
            frm1.Activate();
            //SendKeys.Send("{Tab}");
        }

        private void deButton26_KeyUp(object sender, KeyEventArgs e)
        {
            deLabel54.Text = "Total Respondant Counsel : " + rcList.Count;
        }

        private void deButton26_Leave(object sender, EventArgs e)
        {
            deLabel54.Text = "Total Respondant Counsel : " + rcList.Count;
        }

        private void deButton27_Click(object sender, EventArgs e)
        {
            deLabel55.Text = "Total LC Case : " + lcNList.Count;
            frmAddLcCase frm1 = new frmAddLcCase(sqlCon, getLcCase, projKey, bundleKey, deTextBox8.Text, lcNList, _mode,txn);
            frm1.ShowDialog();
            frm1.Activate();
            //SendKeys.Send("{Tab}");
        }

        private void deButton27_KeyUp(object sender, KeyEventArgs e)
        {
            deLabel55.Text = "Total LC Case : " + lcNList.Count;
        }

        private void deButton27_Leave(object sender, EventArgs e)
        {
            deLabel55.Text = "Total LC Case : " + lcNList.Count;
        }

        private void deButton28_Click(object sender, EventArgs e)
        {
            deLabel56.Text = "Total LC Judges : " + lcJList.Count;
            frmAddLcJudge frm1 = new frmAddLcJudge(sqlCon, getLcJudge, projKey, bundleKey, deTextBox8.Text, lcJList, _mode,txn);
            frm1.ShowDialog();
            frm1.Activate();
            //SendKeys.Send("{Tab}");
        }

        private void deButton28_Leave(object sender, EventArgs e)
        {
            deLabel56.Text = "Total LC Judges : " + lcJList.Count;
        }

        private void deButton28_KeyUp(object sender, KeyEventArgs e)
        {
            deLabel56.Text = "Total LC Judges : " + lcJList.Count;
        }

        private void deButton29_Click(object sender, EventArgs e)
        {
            deLabel57.Text = "Total Connected Application : " + cList.Count;
            frmAddConnApp frm1 = new frmAddConnApp(sqlCon, getConnApp, projKey, bundleKey, deTextBox8.Text, cList, _mode,txn);
            frm1.ShowDialog();
            frm1.Activate();
            //SendKeys.Send("{Tab}");
        }

        private void deButton29_Leave(object sender, EventArgs e)
        {
            deLabel57.Text = "Total Connected Application : " + cList.Count;
        }

        private void deButton29_KeyUp(object sender, KeyEventArgs e)
        {
            deLabel57.Text = "Total Connected Application : " + cList.Count;
        }

        private void deButton30_Click(object sender, EventArgs e)
        {
            deLabel58.Text = "Total Connected Main Case : " + cMList.Count;
            frmAddConnMain frm1 = new frmAddConnMain(sqlCon, getConnMain, projKey, bundleKey, deTextBox8.Text, cMList, _mode,txn);
            frm1.ShowDialog();
            frm1.Activate();
            //SendKeys.Send("{Tab}");
        }

        private void deButton30_KeyUp_1(object sender, KeyEventArgs e)
        {
            deLabel58.Text = "Total Connected Main Case : " + cMList.Count;
        }

        private void deButton30_Leave(object sender, EventArgs e)
        {
            deLabel58.Text = "Total Connected Main Case : " + cMList.Count;
        }

        private void deButton31_Click(object sender, EventArgs e)
        {
            deLabel59.Text = "Total Analogous Case : " + aList.Count;
            frmAddAnalogous frm1 = new frmAddAnalogous(sqlCon, getAnalogous, projKey, bundleKey, deTextBox8.Text, aList, _mode,txn);
            frm1.ShowDialog();
            frm1.Activate();
            //SendKeys.Send("{Tab}");
        }

        private void deButton31_KeyUp(object sender, KeyEventArgs e)
        {
            deLabel59.Text = "Total Analogous Case : " + aList.Count;
        }

        private void deButton31_Leave(object sender, EventArgs e)
        {
            deLabel59.Text = "Total Analogous Case : " + aList.Count;
        }

     }
}
