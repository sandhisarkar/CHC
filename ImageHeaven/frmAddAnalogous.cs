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
    public partial class frmAddAnalogous : Form
    {
        public static List<string> _item = new List<string>();
        public delegate void MyCallback(List<string> PlotKhaitan);
        bool _isEditing;
        MyCallback m_callback;
        OdbcConnection sqlCon = null;
        public static string projKey;
        public static string bundleKey;
        OdbcTransaction txn;
        public static string caseFileNo;

        // public static string jCount;

        public static DataLayerDefs.Mode _mode = DataLayerDefs.Mode._Edit;

        public frmAddAnalogous(OdbcConnection pCon, MyCallback pCallBack)
        {
            InitializeComponent();
            sqlCon = pCon;
            init();
            //AppendRow();
            m_callback = pCallBack;
        }
        public frmAddAnalogous(OdbcConnection pCon, MyCallback pCallBack, string projkey, string batchkey, string casefileno, List<string> item, DataLayerDefs.Mode mode, OdbcTransaction pTxn)
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

        public frmAddAnalogous()
        {
            InitializeComponent();
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

        private void frmAddAnalogous_Load(object sender, EventArgs e)
        {
            analogousCaseType();
            deComboBox10.Text = string.Empty;
            if (_mode == DataLayerDefs.Mode._Add)
            {
                if (_item.Count > 0)
                {
                    for (int i = 0; i < _item.Count; i++)
                    {
                        //lstVwPlKh.Items.Add((i + 1).ToString());
                        //lstVwPlKh.Items[i].SubItems.Add(_item[i]);
                        listView6.Items.Add(_item[i]);
                    }
                }

            }
            if (_mode == DataLayerDefs.Mode._Edit)
            {

                listView6.Items.Clear();
                if (_item.Count > 0)
                {
                    for (int i = 0; i < _item.Count; i++)
                    {
                        //lstVwPlKh.Items.Add((i + 1).ToString());
                        //lstVwPlKh.Items[i].SubItems.Add(_item[i]);
                        listView6.Items.Add(_item[i]);
                    }
                }

            }
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

        private void frmAddAnalogous_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Delete && e.Modifiers == Keys.Control)
            {
                if (listView6.SelectedItems.Count > 0)
                {
                    listView6.SelectedItems[0].Remove();
                    // AppendRow();
                }
            }
        }

        private void frmAddAnalogous_KeyUp(object sender, KeyEventArgs e)
        {
            //if (e.KeyCode == Keys.Escape)
            //    this.Close();
            if (e.KeyCode == Keys.Enter || e.KeyCode == Keys.Space)
            {
                if (this.ActiveControl == listView6)
                {
                    if (listView6.SelectedItems.Count > 0 && _isEditing == false)
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
                    listView6.Select();
                }
            }
        }

        private void cmdDelete_Click(object sender, EventArgs e)
        {
            //frmAddJudge_KeyDown(sender, e);
            if (listView6.SelectedItems.Count > 0)
            {
                listView6.SelectedItems[0].Remove();
                // AppendRow();
            }
        }

        private void cmdClr_Click(object sender, EventArgs e)
        {
           // listView6.Items.Clear();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void cmdDone_Click(object sender, EventArgs e)
        {
            List<string> retItem = new List<string>();
            if (listView6.Items.Count > 0)
            {
                for (int i = 0; i < listView6.Items.Count; i++)
                {
                    string g = listView6.Items[i].Text;
                    if (listView6.Items[i].Text.Trim().Length > 0)
                    {
                        // retItem.Add(lstVwPlKh.Items[i].ToString().Trim());
                        retItem.Add(listView6.Items[i].Text.ToString().Trim());

                    }
                }
            }
            //m_callback.Invoke(retItem);
            EntryForm.aList = retItem;
            //jCount = EntryForm.jList.Count.ToString();
            this.Close();
        }
    }
}
