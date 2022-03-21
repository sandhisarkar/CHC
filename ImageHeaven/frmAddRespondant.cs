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
    public partial class frmAddRespondant : Form
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

        public frmAddRespondant(OdbcConnection pCon, MyCallback pCallBack)
        {
            InitializeComponent();
            sqlCon = pCon;
            init();
            //AppendRow();
            m_callback = pCallBack;
        }
        public frmAddRespondant(OdbcConnection pCon, MyCallback pCallBack, string projkey, string batchkey, string casefileno, List<string> item, DataLayerDefs.Mode mode,OdbcTransaction pTxn)
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
        public frmAddRespondant()
        {
            InitializeComponent();
        }

        private void frmAddRespondant_Load(object sender, EventArgs e)
        {
            deTextBox18.Text = string.Empty;
            if (_mode == DataLayerDefs.Mode._Add)
            {
                if (_item.Count > 0)
                {
                    for (int i = 0; i < _item.Count; i++)
                    {
                        //lstVwPlKh.Items.Add((i + 1).ToString());
                        //lstVwPlKh.Items[i].SubItems.Add(_item[i]);
                        listView3.Items.Add(_item[i]);
                    }
                }

            }
            if (_mode == DataLayerDefs.Mode._Edit)
            {

                listView3.Items.Clear();
                if (_item.Count > 0)
                {
                    for (int i = 0; i < _item.Count; i++)
                    {
                        //lstVwPlKh.Items.Add((i + 1).ToString());
                        //lstVwPlKh.Items[i].SubItems.Add(_item[i]);
                        listView3.Items.Add(_item[i]);
                    }
                }

            }
        }

        private void frmAddRespondant_KeyUp(object sender, KeyEventArgs e)
        {
            //if (e.KeyCode == Keys.Escape)
            //    this.Close();
            if (e.KeyCode == Keys.Enter || e.KeyCode == Keys.Space)
            {
                if (this.ActiveControl == listView3)
                {
                    if (listView3.SelectedItems.Count > 0 && _isEditing == false)
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

        private void frmAddRespondant_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Delete && e.Modifiers == Keys.Control)
            {
                if (listView3.SelectedItems.Count > 0)
                {
                    listView3.SelectedItems[0].Remove();
                    // AppendRow();
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
                    listView3.Select();
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
                if (deTextBox18.Text.Contains("'"))
                {
                    deTextBox18.Focus();
                    return;
                }
                else
                {
                    for (int i = 0; i < listView3.Items.Count; i++)
                    {
                        if (listView3.Items[i].SubItems[0].Text == deTextBox18.Text.Trim())
                        {
                            //MessageBox.Show("This Respondant name is already added...");
                            //deTextBox18.Focus();
                            //return;
                        }
                        else
                        {
                            continue;
                        }
                    }
                }
                
                string[] row = { deTextBox18.Text.Trim() };
                var listItem = new ListViewItem(row);
                listView3.Items.Add(listItem);
                deTextBox18.Text = string.Empty;
                deTextBox18.Focus();
            }
        }

        private void cmdDelete_Click(object sender, EventArgs e)
        {
            //frmAddJudge_KeyDown(sender, e);
            if (listView3.SelectedItems.Count > 0)
            {
                listView3.SelectedItems[0].Remove();
                // AppendRow();
            }
        }

        private void cmdClr_Click(object sender, EventArgs e)
        {
            listView3.Items.Clear();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void cmdDone_Click(object sender, EventArgs e)
        {
            List<string> retItem = new List<string>();
            if (listView3.Items.Count > 0)
            {
                for (int i = 0; i < listView3.Items.Count; i++)
                {
                    string g = listView3.Items[i].Text;
                    if (listView3.Items[i].Text.Trim().Length > 0)
                    {
                        // retItem.Add(lstVwPlKh.Items[i].ToString().Trim());
                        retItem.Add(listView3.Items[i].Text.ToString().Trim());

                    }
                }
            }
            //m_callback.Invoke(retItem);
            EntryForm.rList = retItem;
            //jCount = EntryForm.jList.Count.ToString();
            this.Close();
        }

        private void deTextBox18_Leave(object sender, EventArgs e)
        {
            deTextBox18.BackColor = Color.NavajoWhite;
        }

        private void listView3_DoubleClick(object sender, EventArgs e)
        {
            listView3.Select();

            string name1 = "";

            try
            {
                string[] split = listView3.SelectedItems[0].SubItems[0].Text.Split(' ');

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

                deTextBox18.Text = name1;
                deTextBox18.Select();
            }
            catch (Exception ex)
            {
                return;
                // MessageBox.Show(ex.Message);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (deTextBox18.Text != "")
            {
                for (int i = 0; i < listView3.Items.Count; i++)
                {
                    if (listView3.Items[i].SubItems[0].Text == deTextBox18.Text)
                    {
                        //MessageBox.Show("This Petitioner Counsel name is already added...");
                        //deTextBox18.Focus();
                        //return;
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
}
