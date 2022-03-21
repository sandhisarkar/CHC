using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.Odbc;

namespace ImageHeaven
{
    public partial class frmAddJudge : Form
    {
        public static List<string> _item = new List<string>();
        public delegate void MyCallback(List<string> PlotKhaitan);
        bool _isEditing;
        MyCallback m_callback;
        OdbcConnection sqlCon = null;
        public static string projKey;
        public static string bundleKey;

        public static string caseFileNo;
        OdbcTransaction txn;
       // public static string jCount;

        public static DataLayerDefs.Mode _mode = DataLayerDefs.Mode._Edit;

        public frmAddJudge(OdbcConnection pCon, MyCallback pCallBack)
        {
            InitializeComponent();
            sqlCon = pCon;
            init();
            //AppendRow();
            m_callback = pCallBack;
        }
        public frmAddJudge(OdbcConnection pCon, MyCallback pCallBack, string projkey, string batchkey, string casefileno, List<string> item, DataLayerDefs.Mode mode,OdbcTransaction pTxn)
        {
            InitializeComponent();
            sqlCon = pCon;        
            _item = item;
            m_callback = pCallBack;
            init();
            projKey = projkey;
            bundleKey = batchkey;
            caseFileNo = casefileno;
            _mode = mode;
            txn = pTxn;
        }
        private void AppendRow()
        {
            // string strText = "Test";
            // ListViewItem x = new ListViewItem(strText,0);
            
            //ListViewItem x = new ListViewItem();
            //listView1.Items.Add(x);
            //x.BeginEdit();
        }
        private void init()
        {
            _isEditing = false;
        }
        private DataTable searchJudge(string judge_name)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select judge_designation, judge_name from judge_master where judge_name = '" + judge_name + "' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);

            return dt;

        }
        public frmAddJudge()
        {
            InitializeComponent();
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
        private DataTable metadata_details(string projkey, string bundlekey, string casefileno, string item_no)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select proj_code, bundle_key, item_no,case_file_no, case_status, case_type, case_nature, case_year, disposal_date, judge_name, district,petitioner_name,petitioner_counsel_name,respondant_name, respondant_counsel_name, case_filling_date, ps_name, ps_case_no, lc_case_no,lc_order_date,lc_judge_name, conn_app_case_no, conn_disposal_type,conn_main_case_no, analogous_case_no, old_case_type,old_case_no,old_case_year,file_move_history,dept_remark from metadata_entry where proj_code = '" + projkey + "' and bundle_key = '" + bundlekey + "' and case_file_no = '" + casefileno + "' and item_no = '" + item_no + "' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);

            return dt;

        }
        public DataTable _GetFileCaseDetails(string proj, string bundle, string casefileno)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct proj_code, bundle_Key,item_no,case_file_no,case_status, case_nature, case_type, case_year from case_file_master where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' and case_file_no = '" + casefileno + "'";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        private void frmAddJudge_Load(object sender, EventArgs e)
        {
            populateJudge();
            deComboBox3.Text = string.Empty;
            if (_mode == DataLayerDefs.Mode._Add)
            {
                if (_item.Count > 0)
                {
                    for (int i = 0; i < _item.Count; i++)
                    {
                        //lstVwPlKh.Items.Add((i + 1).ToString());
                        //lstVwPlKh.Items[i].SubItems.Add(_item[i]);
                        listView1.Items.Add(_item[i]);
                    }
                }
               
            }
            if (_mode == DataLayerDefs.Mode._Edit)
            {
                
                listView1.Items.Clear();
                if (_item.Count > 0)
                {
                    for (int i = 0; i < _item.Count; i++)
                    {
                        //lstVwPlKh.Items.Add((i + 1).ToString());
                        //lstVwPlKh.Items[i].SubItems.Add(_item[i]);
                        listView1.Items.Add(_item[i]);
                    }
                }
                
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

        private void frmAddJudge_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Delete && e.Modifiers == Keys.Control)
            {
                if (listView1.SelectedItems.Count > 0)
                {
                    listView1.SelectedItems[0].Remove();
                    // AppendRow();
                }
            }
        }

        private void cmdDelete_Click(object sender, EventArgs e)
        {
            //frmAddJudge_KeyDown(sender, e);
            if (listView1.SelectedItems.Count > 0)
            {
                listView1.SelectedItems[0].Remove();
                // AppendRow();
            }
        }

        private void cmdClr_Click(object sender, EventArgs e)
        {
            listView1.Items.Clear();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void cmdDone_Click(object sender, EventArgs e)
        {
            List<string> retItem = new List<string>();
            if (listView1.Items.Count > 0)
            {
                for (int i = 0; i < listView1.Items.Count; i++)
                {
                    string g = listView1.Items[i].Text;
                    if (listView1.Items[i].Text.Trim().Length > 0)
                    {
                        // retItem.Add(lstVwPlKh.Items[i].ToString().Trim());
                        retItem.Add(listView1.Items[i].Text.ToString().Trim());

                    }
                }
            }
            //m_callback.Invoke(retItem);
            EntryForm.jList = retItem;
            //jCount = EntryForm.jList.Count.ToString();
            this.Close();
        }

        private void frmAddJudge_KeyUp(object sender, KeyEventArgs e)
        {
            //if (e.KeyCode == Keys.Escape)
            //    this.Close();
            if (e.KeyCode == Keys.Enter || e.KeyCode == Keys.Space)
            {
                if (this.ActiveControl == listView1)
                {
                    if (listView1.SelectedItems.Count > 0 && _isEditing == false)
                    {
                        //_isEditing = true;
                        //listView1.SelectedItems[0].BeginEdit();
                    }
                }
                else
                {
                    //SendKeys.Send("{Tab}");
                }
            }
            if (e.KeyCode == Keys.R && e.Control == true)
            {
                cmdClr_Click(sender, e);
            }
            if (e.KeyCode == Keys.D && e.Control == true)
            {
                cmdDone_Click(sender, e);
            }
            if (e.KeyCode == Keys.E && e.Control == true)
            {
                button2_Click(sender, e);
            }
            if (e.KeyCode == Keys.L && e.Control == true)
            {
                cmdDelete_Click(sender, e);
            }

            if (e.KeyCode == Keys.R && e.Alt == true)
            {

            }
            if (e.KeyCode == Keys.D && e.Alt == true)
            {

            }
            if (e.KeyCode == Keys.E && e.Alt == true)
            {

            }
            if (e.KeyCode == Keys.L && e.Alt == true)
            {

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
                        //listView1_DoubleClick(sender, e);
                    }
                    if (e.KeyCode == Keys.Delete)
                    {
                        //deButton1_Click(sender, e);
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
    }
}
