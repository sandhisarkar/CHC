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
    public partial class frmAddRespondantCounsel : Form
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

        public frmAddRespondantCounsel(OdbcConnection pCon, MyCallback pCallBack)
        {
            InitializeComponent();
            sqlCon = pCon;
            init();
            //AppendRow();
            m_callback = pCallBack;
        }
        public frmAddRespondantCounsel(OdbcConnection pCon, MyCallback pCallBack, string projkey, string batchkey, string casefileno, List<string> item, DataLayerDefs.Mode mode,OdbcTransaction pTxn)
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

        public frmAddRespondantCounsel()
        {
            InitializeComponent();
        }

        private void frmAddRespondantCounsel_Load(object sender, EventArgs e)
        {
            deTextBox16.Text = string.Empty;
            if (_mode == DataLayerDefs.Mode._Add)
            {
                if (_item.Count > 0)
                {
                    for (int i = 0; i < _item.Count; i++)
                    {
                        //lstVwPlKh.Items.Add((i + 1).ToString());
                        //lstVwPlKh.Items[i].SubItems.Add(_item[i]);
                        listView8.Items.Add(_item[i]);
                    }
                }

            }
            if (_mode == DataLayerDefs.Mode._Edit)
            {

                listView8.Items.Clear();
                if (_item.Count > 0)
                {
                    for (int i = 0; i < _item.Count; i++)
                    {
                        //lstVwPlKh.Items.Add((i + 1).ToString());
                        //lstVwPlKh.Items[i].SubItems.Add(_item[i]);
                        listView8.Items.Add(_item[i]);
                    }
                }

            }
        }

        private void frmAddRespondantCounsel_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Delete && e.Modifiers == Keys.Control)
            {
                if (listView8.SelectedItems.Count > 0)
                {
                    listView8.SelectedItems[0].Remove();
                    // AppendRow();
                }
            }
        }

        private void frmAddRespondantCounsel_KeyUp(object sender, KeyEventArgs e)
        {
            //if (e.KeyCode == Keys.Escape)
            //    this.Close();
            if (e.KeyCode == Keys.Enter || e.KeyCode == Keys.Space)
            {
                if (this.ActiveControl == listView8)
                {
                    if (listView8.SelectedItems.Count > 0 && _isEditing == false)
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
                    listView8.Select();
                }
            }
        }

        private void cmdDelete_Click(object sender, EventArgs e)
        {
            //frmAddJudge_KeyDown(sender, e);
            if (listView8.SelectedItems.Count > 0)
            {
                listView8.SelectedItems[0].Remove();
                // AppendRow();
            }
        }

        private void cmdClr_Click(object sender, EventArgs e)
        {
            listView8.Items.Clear();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void cmdDone_Click(object sender, EventArgs e)
        {
            List<string> retItem = new List<string>();
            if (listView8.Items.Count > 0)
            {
                for (int i = 0; i < listView8.Items.Count; i++)
                {
                    string g = listView8.Items[i].Text;
                    if (listView8.Items[i].Text.Trim().Length > 0)
                    {
                        // retItem.Add(lstVwPlKh.Items[i].ToString().Trim());
                        retItem.Add(listView8.Items[i].Text.ToString().Trim());

                    }
                }
            }
            //m_callback.Invoke(retItem);
            EntryForm.rcList = retItem;
            //jCount = EntryForm.jList.Count.ToString();
            this.Close();
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
                if (deTextBox16.Text.Contains("'"))
                {
                    deTextBox16.Focus();
                    return;
                }
                else
                {
                    for (int i = 0; i < listView8.Items.Count; i++)
                    {
                        if (listView8.Items[i].SubItems[0].Text == deTextBox16.Text.Trim())
                        {
                            //MessageBox.Show("This Respondant Counsel name is already added...");
                            //deTextBox16.Focus();
                            //return;
                        }
                        else
                        {
                            continue;
                        }
                    }
                }
                
                string[] row = { deTextBox16.Text.Trim() };
                var listItem = new ListViewItem(row);
                listView8.Items.Add(listItem);
                deTextBox16.Text = string.Empty;
                deTextBox16.Focus();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (deTextBox16.Text != "")
            {
                for (int i = 0; i < listView8.Items.Count; i++)
                {
                    if (listView8.Items[i].SubItems[0].Text == deTextBox16.Text)
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

                if (listView8.SelectedItems[0].Selected == true)
                {
                    listView8.SelectedItems[0].SubItems[0].Text = deTextBox16.Text;
                    listView8.Select();
                    deTextBox16.Text = "";
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

                deTextBox16.Text = name1;
                deTextBox16.Select();
            }
            catch (Exception ex)
            {
                return;
                // MessageBox.Show(ex.Message);
            }
        }
    }
}
