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
    public partial class frmAddLcJudge : Form
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

        public frmAddLcJudge(OdbcConnection pCon, MyCallback pCallBack)
        {
            InitializeComponent();
            sqlCon = pCon;
            init();
            //AppendRow();
            m_callback = pCallBack;
        }
        public frmAddLcJudge(OdbcConnection pCon, MyCallback pCallBack, string projkey, string batchkey, string casefileno, List<string> item, DataLayerDefs.Mode mode,OdbcTransaction pTxn)
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


        public frmAddLcJudge()
        {
            InitializeComponent();
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
        private void frmAddLcJudge_Load(object sender, EventArgs e)
        {
            populateLCJudge();
            deComboBox6.Text = string.Empty;
            if (_mode == DataLayerDefs.Mode._Add)
            {
                if (_item.Count > 0)
                {
                    for (int i = 0; i < _item.Count; i++)
                    {
                        //lstVwPlKh.Items.Add((i + 1).ToString());
                        //lstVwPlKh.Items[i].SubItems.Add(_item[i]);
                        listView9.Items.Add(_item[i]);
                    }
                }

            }
            if (_mode == DataLayerDefs.Mode._Edit)
            {

                listView9.Items.Clear();
                if (_item.Count > 0)
                {
                    for (int i = 0; i < _item.Count; i++)
                    {
                        //lstVwPlKh.Items.Add((i + 1).ToString());
                        //lstVwPlKh.Items[i].SubItems.Add(_item[i]);
                        listView9.Items.Add(_item[i]);
                    }
                }

            }
        }

        private void frmAddLcJudge_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Delete && e.Modifiers == Keys.Control)
            {
                if (listView9.SelectedItems.Count > 0)
                {
                    listView9.SelectedItems[0].Remove();
                    // AppendRow();
                }
            }
        }

        private void frmAddLcJudge_KeyUp(object sender, KeyEventArgs e)
        {
            //if (e.KeyCode == Keys.Escape)
            //    this.Close();
            if (e.KeyCode == Keys.Enter || e.KeyCode == Keys.Space)
            {
                if (this.ActiveControl == listView9)
                {
                    if (listView9.SelectedItems.Count > 0 && _isEditing == false)
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
                    listView9.Select();
                }
            }
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

        private void cmdDelete_Click(object sender, EventArgs e)
        {
            //frmAddJudge_KeyDown(sender, e);
            if (listView9.SelectedItems.Count > 0)
            {
                listView9.SelectedItems[0].Remove();
                // AppendRow();
            }
        }

        private void cmdClr_Click(object sender, EventArgs e)
        {
            listView9.Items.Clear();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void cmdDone_Click(object sender, EventArgs e)
        {
            List<string> retItem = new List<string>();
            if (listView9.Items.Count > 0)
            {
                for (int i = 0; i < listView9.Items.Count; i++)
                {
                    string g = listView9.Items[i].Text;
                    if (listView9.Items[i].Text.Trim().Length > 0)
                    {
                        // retItem.Add(lstVwPlKh.Items[i].ToString().Trim());
                        retItem.Add(listView9.Items[i].Text.ToString().Trim());

                    }
                }
            }
            //m_callback.Invoke(retItem);
            EntryForm.lcJList = retItem;
            //jCount = EntryForm.jList.Count.ToString();
            this.Close();
        }
    }
}
