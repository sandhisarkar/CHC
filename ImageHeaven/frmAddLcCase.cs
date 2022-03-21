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
    public partial class frmAddLcCase : Form
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

        public frmAddLcCase(OdbcConnection pCon, MyCallback pCallBack)
        {
            InitializeComponent();
            sqlCon = pCon;
            init();
            //AppendRow();
            m_callback = pCallBack;
        }
        public frmAddLcCase(OdbcConnection pCon, MyCallback pCallBack, string projkey, string batchkey, string casefileno, List<string> item, DataLayerDefs.Mode mode,OdbcTransaction pTxn)
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


        public frmAddLcCase()
        {
            InitializeComponent();
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

        private void frmAddLcCase_Load(object sender, EventArgs e)
        {
            populateLcCaseType();
            deComboBox5.Text = string.Empty;
            if (_mode == DataLayerDefs.Mode._Add)
            {
                if (_item.Count > 0)
                {
                    for (int i = 0; i < _item.Count; i++)
                    {
                        //lstVwPlKh.Items.Add((i + 1).ToString());
                        //lstVwPlKh.Items[i].SubItems.Add(_item[i]);
                        listView4.Items.Add(_item[i]);
                    }
                }

            }
            if (_mode == DataLayerDefs.Mode._Edit)
            {

                listView4.Items.Clear();
                if (_item.Count > 0)
                {
                    for (int i = 0; i < _item.Count; i++)
                    {
                        //lstVwPlKh.Items.Add((i + 1).ToString());
                        //lstVwPlKh.Items[i].SubItems.Add(_item[i]);
                        listView4.Items.Add(_item[i]);
                    }
                }

            }
        }

        private void frmAddLcCase_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Delete && e.Modifiers == Keys.Control)
            {
                if (listView4.SelectedItems.Count > 0)
                {
                    listView4.SelectedItems[0].Remove();
                    // AppendRow();
                }
            }
        }

        private void frmAddLcCase_KeyUp(object sender, KeyEventArgs e)
        {
            //if (e.KeyCode == Keys.Escape)
            //    this.Close();
            if (e.KeyCode == Keys.Enter || e.KeyCode == Keys.Space)
            {
                if (this.ActiveControl == listView4)
                {
                    if (listView4.SelectedItems.Count > 0 && _isEditing == false)
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
                    listView4.Select();
                }
            }
        }

        private void cmdDelete_Click(object sender, EventArgs e)
        {
            //frmAddJudge_KeyDown(sender, e);
            if (listView4.SelectedItems.Count > 0)
            {
                listView4.SelectedItems[0].Remove();
                // AppendRow();
            }
        }

        private void cmdClr_Click(object sender, EventArgs e)
        {
            listView4.Items.Clear();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void cmdDone_Click(object sender, EventArgs e)
        {
            List<string> retItem = new List<string>();
            if (listView4.Items.Count > 0)
            {
                for (int i = 0; i < listView4.Items.Count; i++)
                {
                    string g = listView4.Items[i].Text;
                    if (listView4.Items[i].Text.Trim().Length > 0)
                    {
                        // retItem.Add(lstVwPlKh.Items[i].ToString().Trim());
                        retItem.Add(listView4.Items[i].Text.ToString().Trim());

                    }
                }
            }
            //m_callback.Invoke(retItem);
            EntryForm.lcNList = retItem;
            //jCount = EntryForm.jList.Count.ToString();
            this.Close();
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
    }
}
