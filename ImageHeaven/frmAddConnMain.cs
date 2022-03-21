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
    public partial class frmAddConnMain : Form
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

        public frmAddConnMain(OdbcConnection pCon, MyCallback pCallBack)
        {
            InitializeComponent();
            sqlCon = pCon;
            init();
            //AppendRow();
            m_callback = pCallBack;
        }
        public frmAddConnMain(OdbcConnection pCon, MyCallback pCallBack, string projkey, string batchkey, string casefileno, List<string> item, DataLayerDefs.Mode mode,OdbcTransaction pTxn)
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

        public frmAddConnMain()
        {
            InitializeComponent();
        }

        private void frmAddConnMain_Load(object sender, EventArgs e)
        {
            populateConnMainCaseType();
            deComboBox9.Text = string.Empty;
            if (_mode == DataLayerDefs.Mode._Add)
            {
                if (_item.Count > 0)
                {
                    for (int i = 0; i < _item.Count; i++)
                    {
                        //lstVwPlKh.Items.Add((i + 1).ToString());
                        //lstVwPlKh.Items[i].SubItems.Add(_item[i]);
                        listView10.Items.Add(_item[i]);
                    }
                }

            }
            if (_mode == DataLayerDefs.Mode._Edit)
            {

                listView10.Items.Clear();
                if (_item.Count > 0)
                {
                    for (int i = 0; i < _item.Count; i++)
                    {
                        //lstVwPlKh.Items.Add((i + 1).ToString());
                        //lstVwPlKh.Items[i].SubItems.Add(_item[i]);
                        listView10.Items.Add(_item[i]);
                    }
                }

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

        private void frmAddConnMain_KeyUp(object sender, KeyEventArgs e)
        {
            //if (e.KeyCode == Keys.Escape)
            //    this.Close();
            if (e.KeyCode == Keys.Enter || e.KeyCode == Keys.Space)
            {
                if (this.ActiveControl == listView10)
                {
                    if (listView10.SelectedItems.Count > 0 && _isEditing == false)
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

        private void frmAddConnMain_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Delete && e.Modifiers == Keys.Control)
            {
                if (listView10.SelectedItems.Count > 0)
                {
                    listView10.SelectedItems[0].Remove();
                    // AppendRow();
                }
            }
        }

        private void listView10_KeyUp(object sender, KeyEventArgs e)
        {
            if (listView10.Items.Count > 0)
            {
                if (listView10.SelectedItems.Count > 0)
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
                    listView10.Select();
                }
            }
        }

        private void listView10_SelectedIndexChanged(object sender, EventArgs e)
        {
            listView10.Select();
        }

        private void cmdDelete_Click(object sender, EventArgs e)
        {
            //frmAddJudge_KeyDown(sender, e);
            if (listView10.SelectedItems.Count > 0)
            {
                listView10.SelectedItems[0].Remove();
                // AppendRow();
            }
        }

        private void cmdClr_Click(object sender, EventArgs e)
        {
            listView10.Items.Clear();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void cmdDone_Click(object sender, EventArgs e)
        {
            List<string> retItem = new List<string>();
            if (listView10.Items.Count > 0)
            {
                for (int i = 0; i < listView10.Items.Count; i++)
                {
                    string g = listView10.Items[i].Text;
                    if (listView10.Items[i].Text.Trim().Length > 0)
                    {
                        // retItem.Add(lstVwPlKh.Items[i].ToString().Trim());
                        retItem.Add(listView10.Items[i].Text.ToString().Trim());

                    }
                }
            }
            //m_callback.Invoke(retItem);
            EntryForm.cMList = retItem;
            //jCount = EntryForm.jList.Count.ToString();
            this.Close();
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
    }
}
