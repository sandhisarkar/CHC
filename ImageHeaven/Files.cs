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
   
    public partial class Files : Form
    {

        public static int index;

        Credentials crd = new Credentials();
        //Credentials crd = new Credentials();
        //private OdbcConnection sqlCon;
        OdbcTransaction txn;
        string name = frmMain.name;
        OdbcConnection sqlCon = null;
        public static bool _modeBool;
        
        public static DataLayerDefs.Mode _mode = DataLayerDefs.Mode._Edit;

        public static string projKey;
        public static string bundleKey;
        public static string casefileNo;
        public static string filename;
        

        public static string item;

        public Files()
        {
            InitializeComponent();
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

        public DataTable _GetFileCaseDetails(string proj, string bundle)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct proj_code, bundle_Key,item_no,case_file_no,case_status, case_nature, case_type, case_year from case_file_master where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' and case_file_no not in (select case_file_no from metadata_entry where proj_code = '" + proj + "' and bundle_key = '" + bundle + "')";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon,txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        public DataTable _GetFileCaseInDetails(string proj, string bundle)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct proj_code, bundle_Key,item_no,case_file_no,case_status, case_nature, case_type, case_year,filename from case_file_master where proj_code = '" + proj + "' and bundle_key = '" + bundle + "'";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon,txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        public DataTable _GetFileCaseDetailsIndividual(string proj, string bundle, string casefileno, string item)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct proj_code, bundle_Key,item_no,case_file_no,case_status, case_nature, case_type, case_year from case_file_master where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' and case_file_no = '"+casefileno+"' and item_no = '"+item+"' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon,txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        public DataTable _GetFileCaseDetailsIndividual(string proj, string bundle, string fileName)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct proj_code, bundle_Key,item_no,case_file_no,case_status, case_nature, case_type, case_year from case_file_master where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' and filename = '"+fileName+"' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        public Files(OdbcConnection pCon, DataLayerDefs.Mode mode, OdbcTransaction pTxn, Credentials prmCrd)
        {
            InitializeComponent();
            sqlCon = pCon;
            crd = prmCrd;
            
            txn = pTxn;
            if (mode == DataLayerDefs.Mode._Add)
            {
                projKey = frmEntrySummary.projKey;
                bundleKey = frmEntrySummary.bundleKey;

                deLabel3.Text = _GetBundleDetails(projKey, bundleKey).Rows[0][3].ToString();
                deLabel5.Text = _GetBundleDetails(projKey, bundleKey).Rows[0][4].ToString();
                deLabel7.Text = _GetBundleDetails(projKey, bundleKey).Rows[0][2].ToString();
                deLabel9.Text = _GetBundleDetails(projKey, bundleKey).Rows[0][5].ToString();

                int count = _GetFileCaseDetails(projKey, bundleKey).Rows.Count;

                for (int i = 0; i < count; i++)
                {
                    
                    string casefileno = _GetFileCaseDetails(projKey, bundleKey).Rows[i][3].ToString();
                    

                    //add row
                    string[] row = { casefileno };
                    var listItem = new ListViewItem(row);

                    lstDeeds.Items.Add(listItem);
                }
                if (lstDeeds.Items.Count == 0)
                {
                   
                    bool updatebundle = updateBundle();
                    bool updatecasefile = updateCaseFile();

                    if (updatebundle == true && updatecasefile == true)
                    {
                        if (txn == null)
                        {
                            txn = sqlCon.BeginTransaction();
                        }
                        txn.Commit();
                        txn.Dispose();
                        MessageBox.Show(this, "No More files present for this bundle ...", "B'Zer - Calcutta High Court !", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                    if (txn == null)
                    {
                        txn = sqlCon.BeginTransaction();
                    }
                    txn.Dispose();
                    //this.Hide();
                    //frmEntrySummary fm = new frmEntrySummary(sqlCon,crd);
                    //fm.ShowDialog(this);
                }
                _mode = mode;
            }

            if (mode == DataLayerDefs.Mode._Edit)
            {
                projKey = frmEntrySummary.projKey;
                bundleKey = frmEntrySummary.bundleKey;

                deLabel3.Text = _GetBundleDetails(projKey, bundleKey).Rows[0][3].ToString();
                deLabel5.Text = _GetBundleDetails(projKey, bundleKey).Rows[0][4].ToString();
                deLabel7.Text = _GetBundleDetails(projKey, bundleKey).Rows[0][2].ToString();
                deLabel9.Text = _GetBundleDetails(projKey, bundleKey).Rows[0][5].ToString();

                int count = _GetFileCaseInDetails(projKey, bundleKey).Rows.Count;

                for (int i = 0; i < count; i++)
                {

                    string filename = _GetFileCaseInDetails(projKey, bundleKey).Rows[i][8].ToString();
                    string fileno = _GetFileCaseInDetails(projKey, bundleKey).Rows[i][3].ToString();
                    //string item_no_file = _GetFileCaseInDetails(projKey, bundleKey).Rows[i][2].ToString();

                    //add row
                    string[] row = { filename, fileno };
                    var listItem = new ListViewItem(row);

                    lstDeeds.Items.Add(listItem);
                }

                if(lstDeeds.Items.Count == 0)
                {
                   
                    bool updatebundle = updateBundle();
                    bool updatecasefile = updateCaseFile();

                    if (updatebundle == true && updatecasefile == true)
                    {
                        if (txn == null)
                        {
                            txn = sqlCon.BeginTransaction();
                        }
                        txn.Commit();
                        txn.Dispose();
                        MessageBox.Show(this, "No More files present for this bundle ...", "B'Zer - Calcutta High Court !", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                    if (txn == null)
                    {
                        txn = sqlCon.BeginTransaction();
                    }
                    txn.Dispose();
                    //this.Hide();
                    //frmEntrySummary fm = new frmEntrySummary(sqlCon,crd);
                    //fm.ShowDialog(this);
                }

                _mode = mode;
            }
        }

        public bool updateBundle()
        {
            bool ret = false;
            if (ret == false)
            {
                _UpdateBundle();

                ret = true;
            }
            return ret;
        }

        public bool _UpdateBundle()
        {
            bool retVal = false;
            string sql = string.Empty;
            string sqlStr = null;

            OdbcCommand sqlCmd = new OdbcCommand();


            sqlStr = "UPDATE bundle_master SET status = '1' WHERE proj_code = '" + projKey + "' AND bundle_key = '" + bundleKey + "'";
            sqlCmd.Connection = sqlCon;
            sqlCmd.Transaction = txn;
            sqlCmd.CommandText = sqlStr;
            int j = sqlCmd.ExecuteNonQuery();
            if (j > 0)
            {
                retVal = true;
            }
            else
            {
                retVal = false;
            }
            //OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon,txn);
            //cmd.Connection = sqlCon;
            //cmd.CommandText = sqlStr;
            //if (cmd.ExecuteNonQuery() > 0)
            //{
            //    retVal = true;
            //    txn.Commit();
            //}
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

            return retVal;
        }

        public bool deleteCaseFile(string proj, string bundle, string fileName)
        {
            bool ret = false;
            if (ret == false)
            {
                _deleteCaseFile(fileName);

                ret = true;
            }
            return ret;
        }

        public bool _deleteCaseFile(string fileName)
        {
            string sqlStr = null;

            OdbcCommand sqlCmd = new OdbcCommand();

            bool retVal = false;
            string sql = string.Empty;


            sqlStr = "DELETE from case_file_master WHERE proj_code = '" + projKey + "' AND bundle_key = '" + bundleKey + "' and filename = '"+fileName+"' ";
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
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            //cmd.Connection = sqlCon;
            //cmd.CommandText = sqlStr;
            if (cmd.ExecuteNonQuery() > 0)
            {
                retVal = true;
                //txn.Commit();
            }
            //return retVal;
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

            return retVal;
        }

        public bool deleteMeta(string proj, string bundle, string fileName)
        {
            bool ret = false;
            if (ret == false)
            {
                _deleteMeta(fileName);

                ret = true;
            }
            return ret;
        }

        public bool _deleteMeta(string fileName)
        {
            string sqlStr = null;

            OdbcCommand sqlCmd = new OdbcCommand();

            bool retVal = false;
            string sql = string.Empty;


            sqlStr = "DELETE from metadata_entry WHERE proj_code = '" + projKey + "' AND bundle_key = '" + bundleKey + "' and filename = '" + fileName + "' ";
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
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            //cmd.Connection = sqlCon;
            //cmd.CommandText = sqlStr;
            if (cmd.ExecuteNonQuery() > 0)
            {
                retVal = true;
                //txn.Commit();
            }
            //return retVal;
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

            return retVal;
        }
        public bool updateCaseFile()
        {
            bool ret = false;
            if (ret == false)
            {
                _UpdateCaseFile();

                ret = true;
            }
            return ret;
        }


        public bool _UpdateCaseFile()
        {
            string sqlStr = null;

            OdbcCommand sqlCmd = new OdbcCommand();

            bool retVal = false;
            string sql = string.Empty;


            sqlStr = "UPDATE case_file_master SET status = '1' WHERE proj_code = '" + projKey + "' AND bundle_key = '" + bundleKey + "'";
            sqlCmd.Connection = sqlCon;
            sqlCmd.Transaction = txn;
            sqlCmd.CommandText = sqlStr;
            int j = sqlCmd.ExecuteNonQuery();
            if (j > 0)
            {
                retVal = true;
            }
            else
            {
                retVal = false;
            }
            //return retVal;
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

            return retVal;
        }

        private void Files_KeyUp(object sender, KeyEventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed || sqlCon.State == ConnectionState.Broken)
            {
                sqlCon.Open();
            }
            if (e.KeyCode == Keys.Escape)
            {
                //this.Hide();
                //if(txn == null)
                //{
                //    txn = sqlCon.BeginTransaction();
                //}
                //txn.Dispose();
                //frmEntrySummary fm = new frmEntrySummary(sqlCon,crd);
                //fm.ShowDialog(this);
                this.Close();
            }
            
        }

        public AutoCompleteStringCollection GetSuggestions(string tblName, string fldName, string projKey, string bundleKey)
        {
            AutoCompleteStringCollection x = new AutoCompleteStringCollection();
            string sql = "Select distinct " + fldName + " from " + tblName + " where proj_code = '"+projKey+"' AND bundle_key = '"+bundleKey+"'";
            DataSet ds = new DataSet();
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon,txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    x.Add(ds.Tables[0].Rows[i][0].ToString().Trim());
                }
            }
            
            return x;
        }

        private void formatForm()
        {
           
            this.deTextBox1.AutoCompleteCustomSource = GetSuggestions("case_file_master", "case_file_no",projKey,bundleKey);
            this.deTextBox1.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.deTextBox1.AutoCompleteSource = AutoCompleteSource.CustomSource;

        }

        private void formatEntryForm()
        {

            this.deTextBox1.AutoCompleteCustomSource = GetSuggestions("metadata_entry", "case_file_no", projKey, bundleKey);
            this.deTextBox1.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.deTextBox1.AutoCompleteSource = AutoCompleteSource.CustomSource;

        }

        private void Files_Load(object sender, EventArgs e)
        {
            if(sqlCon.State == ConnectionState.Closed || sqlCon.State == ConnectionState.Broken)
            {
                sqlCon.Open();
            }
            if (_mode == DataLayerDefs.Mode._Add)
            {
                formatForm();
                if(lstDeeds.Items.Count > 0)
                {
                    lstDeeds.Items[0].Selected = true;
                    lstDeeds.Items[0].Focused = true;
                    lstDeeds.Select();
                    lstDeeds.Items[0].EnsureVisible();
                }
            }
            if (_mode == DataLayerDefs.Mode._Edit)
            {
                formatEntryForm();
                if (lstDeeds.Items.Count > 0)
                {
                    lstDeeds.Items[0].Selected = true;
                    lstDeeds.Items[0].Focused = true;
                    lstDeeds.Select();
                    lstDeeds.Items[0].EnsureVisible();
                }
            }
        }

        private void cmdSearch_Click(object sender, EventArgs e)
        {
            string text = deTextBox1.Text;

            for (int i = 0; i < lstDeeds.Items.Count; i++)
            {
                if (lstDeeds.Items[i].SubItems[1].Text.Equals(text))
                {
                    
                    lstDeeds.Items[i].Selected = true;
                    lstDeeds.Items[i].Focused = true;
                    lstDeeds.Select();
                    lstDeeds.Items[i].EnsureVisible();
                    return;
                }
                else
                {
                    lstDeeds.Items[i].Selected = false;
                }

            }
           
        }

        private void lstDeeds_SelectedIndexChanged(object sender, EventArgs e)
        {
            //index = lstDeeds.FocusedItem.Index;


            if (lstDeeds.SelectedItems.Count > 0)
            {
                //string casefileno = lstDeeds.SelectedItems[0].SubItems[0].Text;
                //string item = lstDeeds.SelectedItems[0].SubItems[1].Text;

                string filename = lstDeeds.SelectedItems[0].SubItems[0].Text;

                string casefileno = _GetFileCaseDetailsIndividual(projKey, bundleKey, filename).Rows[0][3].ToString();
                string case_status = _GetFileCaseDetailsIndividual(projKey, bundleKey, filename).Rows[0][4].ToString();
                string case_nature = _GetFileCaseDetailsIndividual(projKey, bundleKey, filename).Rows[0][5].ToString();
                string case_type = _GetFileCaseDetailsIndividual(projKey, bundleKey, filename).Rows[0][6].ToString();
                string case_year = _GetFileCaseDetailsIndividual(projKey, bundleKey, filename).Rows[0][7].ToString();

                fileRemarks.Text = "Case / File Number : " + casefileno + "\n\nCase Status : " + case_status + "\n\nCase Nature : " + case_nature + "\n\nCase Type : " + case_type + "\n\nCase Year : " + case_year;
            }
            else
            {
                fileRemarks.Text = "";
            }
            

        }

        private void lstDeeds_DoubleClick(object sender, EventArgs e)
        {
            if(lstDeeds.SelectedItems.Count > 0)
            {
                index = lstDeeds.FocusedItem.Index;

                filename = lstDeeds.Items[index].SubItems[0].Text;
                //item = lstDeeds.Items[index].SubItems[1].Text;

                if (_mode == DataLayerDefs.Mode._Add)
                {
                    //this.Hide();
                    EntryForm frm = new EntryForm(sqlCon, _mode, filename, txn, crd);
                    frm.ShowDialog(this);

                }

                if (_mode == DataLayerDefs.Mode._Edit)
                {
                    //this.Hide();
                    EntryForm frm = new EntryForm(sqlCon, _mode, filename, txn , crd);
                    frm.ShowDialog(this);
                }
            }
            
        }

        private void lstDeeds_KeyUp(object sender, KeyEventArgs e)
        {
            if (lstDeeds.Items.Count > 0)
            {
                if (lstDeeds.SelectedItems.Count > 0)
                {
                    if (e.Control == true && e.KeyCode == Keys.O)
                    {
                        lstDeeds_DoubleClick(sender, e);
                    }
                    if(e.KeyCode == Keys.Enter)
                    {
                        //lstDeeds_DoubleClick(sender, e);
                    }
                    if (e.KeyCode == Keys.Space)
                    {
                        lstDeeds_DoubleClick(sender, e);
                    }
                }
            }
        }

        private void deTextBox1_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                if (!string.IsNullOrEmpty(deTextBox1.Text.ToUpper().Trim()))
                {
                    for (int i = 0; i < lstDeeds.Items.Count; i++)
                    {
                        if (lstDeeds.Items[i].ToString().Contains(deTextBox1.Text.ToUpper().Trim()))
                        {
                            lstDeeds.Items[i].Selected = true;
                            lstDeeds.Items[i].Focused = true;
                            lstDeeds.Select();
                            lstDeeds.Items[i].EnsureVisible();
                            //lstDeeds.SetSelected(i, true);
                        }
                    }
                }
            }
        }

        private void deTextBox1_Enter(object sender, EventArgs e)
        {
            deTextBox1.SelectAll();
        }

        //public DataTable _GetFileCaseDetailsIndividualStatus(string proj, string bundle, string casefileno, string itemNo)
        //{
        //    DataTable dt = new DataTable();
        //    string sql = "select distinct status from case_file_master where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' and case_file_no = '" + casefileno + "' and item_no = '"+itemNo+"' ";
        //    OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
        //    OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
        //    odap.Fill(dt);
        //    return dt;
        //}

        public DataTable _GetFileCaseDetailsIndividualStatus(string proj, string bundle, string fileName)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct status from case_file_master where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' and filename = '" + fileName + "'  ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        public DataTable _GetBundleStatus(string proj, string bundle)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct status from bundle_master where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon, txn);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        private void lstDeeds_MouseClick(object sender, MouseEventArgs e)
        {
            if(crd.role == ihConstants._ADMINISTRATOR_ROLE)
            {
                if(_GetFileCaseDetailsIndividualStatus(projKey,bundleKey,lstDeeds.SelectedItems[0].Text).Rows[0][0].ToString() == "0")
                {
                    if (e.Button == MouseButtons.Right)
                    {
                        if (lstDeeds.FocusedItem.Bounds.Contains(e.Location) == true)
                        {
                            cmsDeeds.Show(Cursor.Position);
                        }
                    }
                }
            }
        }

        private void updateDeedToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if(crd.role == ihConstants._ADMINISTRATOR_ROLE)
            {
                if (_GetFileCaseDetailsIndividualStatus(projKey, bundleKey, lstDeeds.SelectedItems[0].Text).Rows[0][0].ToString() == "0")
                {
                    casefileNo = lstDeeds.SelectedItems[0].SubItems[1].Text;
                    //item = lstDeeds.SelectedItems[0].SubItems[1].Text;

                    filename = lstDeeds.SelectedItems[0].Text;

                    frmNewCase frm = new frmNewCase(projKey, bundleKey, sqlCon, crd, DataLayerDefs.Mode._Edit,filename);
                    frm.ShowDialog();

                    lstDeeds.Items.Clear();

                    int count = _GetFileCaseInDetails(projKey, bundleKey).Rows.Count;

                    for (int i = 0; i < count; i++)
                    {

                        string filename = _GetFileCaseInDetails(projKey, bundleKey).Rows[i][8].ToString();
                        string fileno = _GetFileCaseInDetails(projKey, bundleKey).Rows[i][3].ToString();
                        //string item_no_file = _GetFileCaseInDetails(projKey, bundleKey).Rows[i][2].ToString();

                        //add row
                        string[] row = { filename, fileno };
                        var listItem = new ListViewItem(row);

                        lstDeeds.Items.Add(listItem);
                    }
                }
             }
        }

        public int _GetTotalCaseCount()
        {
            DataTable dt = new DataTable();
            string sql = "select Count(*) from case_file_master where proj_code = '"+projKey+"' and bundle_key = '"+bundleKey+"'";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            int count = Convert.ToInt32(dt.Rows[0][0].ToString());
            return count;
        }
        public int _GetTotalMetaCount()
        {
            DataTable dt = new DataTable();
            string sql = "select Count(*) from metadata_entry where proj_code = '" + projKey + "' and bundle_key = '" + bundleKey + "'";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            int count = Convert.ToInt32(dt.Rows[0][0].ToString());
            return count;
        }
        private bool updateCaseSl(int x, int y)
        {
            bool commitBol = true;

            string sqlStr = string.Empty;

            OdbcCommand sqlCmd = new OdbcCommand();

            sqlStr = @"update case_file_master set sl_no = '" + x + "',item_no = '" + x + "' where sl_no = '" + y + "'";
            //sqlCmd.Connection = sqlCon;
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
            System.Diagnostics.Debug.Print(sqlStr);
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            //cmd.Connection = sqlCon;
            //cmd.CommandText = sqlStr;
            if (cmd.ExecuteNonQuery() > 0)
            {
                commitBol = true;
                //txn.Commit();
            }

            return commitBol;
        }

        private bool updateMetaSl(int x, int y)
        {
            bool commitBol = true;

            string sqlStr = string.Empty;

            OdbcCommand sqlCmd = new OdbcCommand();

            sqlStr = @"update metadata_entry set item_no = '" + x + "' where item_no = '" + y + "'";
            //sqlCmd.Connection = sqlCon;
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
            System.Diagnostics.Debug.Print(sqlStr);
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            //cmd.Connection = sqlCon;
            //cmd.CommandText = sqlStr;
            if (cmd.ExecuteNonQuery() > 0)
            {
                commitBol = true;
                //txn.Commit();
            }

            return commitBol;
        }

        public DataTable _getSlCaseNO()
        {
            DataTable dt = new DataTable();
            string sql = "select sl_no from case_file_master where proj_code = '"+projKey+"' and bundle_key = '"+bundleKey+"'";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        public DataTable _getSlMetaNO()
        {
            DataTable dt = new DataTable();
            string sql = "select item_no from metadata_entry where proj_code = '" + projKey + "' and bundle_key = '" + bundleKey + "'";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public string GetPath(int prmProjKey, int prmBatchKey)
        {
            string sqlStr = null;
            DataSet projDs = new DataSet();
            string Path;
            OdbcDataAdapter sqlAdap;
            try
            {
                sqlStr = @"select bundle_path from bundle_master where proj_code=" + prmProjKey + " and bundle_key=" + prmBatchKey;
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(projDs);
            }
            catch (Exception ex)
            {
                
            }
            if (projDs.Tables[0].Rows.Count > 0)
            {
                Path = projDs.Tables[0].Rows[0]["bundle_path"].ToString();
            }
            else
                Path = string.Empty;

            return Path;
        }
        public bool deleteImage(string proj, string bundle, string fileName)
        {
            bool ret = false;
            if (ret == false)
            {
                _deleteImage(fileName);

                ret = true;
            }
            return ret;
        }
        public bool deleteTrans(string proj, string bundle, string fileName)
        {
            bool ret = false;
            if (ret == false)
            {
                _deleteTrans(fileName);

                ret = true;
            }
            return ret;
        }
        public bool _deleteImage(string fileName)
        {
            string sqlStr = null;

            OdbcCommand sqlCmd = new OdbcCommand();

            bool retVal = false;
            string sql = string.Empty;


            sqlStr = "DELETE from image_master WHERE proj_key = '" + projKey + "' AND batch_key = '" + bundleKey + "' and policy_number = '" + fileName + "' ";
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
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            //cmd.Connection = sqlCon;
            //cmd.CommandText = sqlStr;
            if (cmd.ExecuteNonQuery() > 0)
            {
                retVal = true;
                //txn.Commit();
            }
            //return retVal;
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

            return retVal;
        }
        public bool _deleteTrans(string fileName)
        {
            string sqlStr = null;

            OdbcCommand sqlCmd = new OdbcCommand();

            bool retVal = false;
            string sql = string.Empty;


            sqlStr = "DELETE from transaction_log WHERE proj_key = '" + projKey + "' AND batch_key = '" + bundleKey + "' and policy_number = '" + fileName + "' ";
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
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            //cmd.Connection = sqlCon;
            //cmd.CommandText = sqlStr;
            if (cmd.ExecuteNonQuery() > 0)
            {
                retVal = true;
                //txn.Commit();
            }
            //return retVal;
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

            return retVal;
        }
        public bool deleteCusEx(string proj, string bundle, string fileName)
        {
            bool ret = false;
            if (ret == false)
            {
                _deleteCusEx(fileName);

                ret = true;
            }
            return ret;
        }
        public bool _deleteCusEx(string fileName)
        {
            string sqlStr = null;

            OdbcCommand sqlCmd = new OdbcCommand();

            bool retVal = false;
            string sql = string.Empty;


            sqlStr = "DELETE from custom_exception WHERE proj_key = '" + projKey + "' AND batch_key = '" + bundleKey + "' and policy_number = '" + fileName + "' ";
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
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            //cmd.Connection = sqlCon;
            //cmd.CommandText = sqlStr;
            if (cmd.ExecuteNonQuery() > 0)
            {
                retVal = true;
                //txn.Commit();
            }
            //return retVal;
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

            return retVal;
        }
        public bool deleteQa(string proj, string bundle, string fileName)
        {
            bool ret = false;
            if (ret == false)
            {
                _deleteQa(fileName);

                ret = true;
            }
            return ret;
        }
        public bool _deleteQa(string fileName)
        {
            string sqlStr = null;

            OdbcCommand sqlCmd = new OdbcCommand();

            bool retVal = false;
            string sql = string.Empty;


            sqlStr = "DELETE from lic_qa_log WHERE proj_key = '" + projKey + "' AND batch_key = '" + bundleKey + "' and policy_number = '" + fileName + "' ";

            System.Diagnostics.Debug.Print(sqlStr);
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            //cmd.Connection = sqlCon;
            //cmd.CommandText = sqlStr;
            if (cmd.ExecuteNonQuery() > 0)
            {
                retVal = true;
                //txn.Commit();
            }

            return retVal;
        }
        private void deleteDeedToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if(crd.role == ihConstants._ADMINISTRATOR_ROLE)
            {

                if (_GetFileCaseDetailsIndividualStatus(projKey, bundleKey, lstDeeds.SelectedItems[0].Text).Rows[0][0].ToString() == "0")
                {
                    DialogResult dr = MessageBox.Show(this, "Do you want to delete this file ? ", "B'Zer - Calcutta High Court ", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (dr == DialogResult.Yes)
                    {
                        bool deletemeta = deleteMeta(projKey, bundleKey, lstDeeds.SelectedItems[0].Text);
                        bool deletecasefile = deleteCaseFile(projKey, bundleKey, lstDeeds.SelectedItems[0].Text);

                        if (deletemeta == true && deletecasefile == true)
                        {
                            //    if (txn == null)
                            //    {
                            //        txn = sqlCon.BeginTransaction();
                            //    }
                            //    txn.Commit();
                            //    txn.Dispose();
                            //for (int j = 0; j < _GetTotalCaseCount(); j++)
                            //{
                            //    updateCaseSl(j + 1, Convert.ToInt32(_getSlCaseNO().Rows[j][0].ToString()));
                            //}
                            //for (int j = 0; j < _GetTotalMetaCount(); j++)
                            //{
                            //    updateMetaSl(j + 1, Convert.ToInt32(_getSlMetaNO().Rows[j][0].ToString()));
                            //}


                            bool delImg = deleteImage(projKey, bundleKey, lstDeeds.SelectedItems[0].Text);
                            bool delTran = deleteTrans(projKey, bundleKey, lstDeeds.SelectedItems[0].Text);
                            bool delCusEx = deleteCusEx(projKey, bundleKey, lstDeeds.SelectedItems[0].Text);
                            bool delQa = deleteQa(projKey, bundleKey, lstDeeds.SelectedItems[0].Text);

                            if (delImg == true && delTran == true && delCusEx == true && delQa == true)
                            {
                                string path1 = GetPath(Convert.ToInt32(projKey),Convert.ToInt32(bundleKey));
                                string path = path1 + "\\" + lstDeeds.SelectedItems[0].Text;
                                if (Directory.Exists(path))
                                {
                                    Directory.Delete(path, true);
                                }
                            }

                            lstDeeds.Items.Clear();

                            int count = _GetFileCaseInDetails(projKey, bundleKey).Rows.Count;

                            for (int i = 0; i < count; i++)
                            {

                                string filename = _GetFileCaseInDetails(projKey, bundleKey).Rows[i][8].ToString();
                                string fileno = _GetFileCaseInDetails(projKey, bundleKey).Rows[i][3].ToString();
                                //string item_no_file = _GetFileCaseInDetails(projKey, bundleKey).Rows[i][2].ToString();

                                //add row
                                string[] row = { filename, fileno };
                                var listItem = new ListViewItem(row);

                                lstDeeds.Items.Add(listItem);
                            }
                            MessageBox.Show(this, "Case file deleted successfully ...", "B'Zer - Calcutta High Court !", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        }
                       

                    }

                }
                else 
                {
                    MessageBox.Show(this,"This Case File is proceed for further process","",MessageBoxButtons.OK,MessageBoxIcon.Information);
                    return;
                }
            }
        }
    }
}
