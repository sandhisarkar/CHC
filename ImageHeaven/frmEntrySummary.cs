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
using System.Collections;

namespace ImageHeaven
{
    public partial class frmEntrySummary : Form
    {
        public string name = frmMain.name;
        //OdbcConnection sqlCon = null;
        NovaNet.Utils.GetProfile pData;
        NovaNet.Utils.ChangePassword pCPwd;
        NovaNet.Utils.Profile p;
        public static NovaNet.Utils.IntrRBAC rbc;
        //public Credentials crd;
        static wItem wi;
        public static string projKey;
        public static string bundleKey;
        public static string bundleNo;
        public Credentials crd = new Credentials();
        private OdbcConnection sqlCon;
        OdbcTransaction txn;

        public static string delpath;
        eSTATES[] state;
        frmEntrySummary entrySum;
        public frmEntrySummary()
        {
            InitializeComponent();
        }

        //public frmEntrySummary(OdbcConnection pCon)
        //{
        //    InitializeComponent();

        //    sqlCon = pCon;

        //    init();
        //}

        public frmEntrySummary(OdbcConnection pCon,Credentials pcrd, eSTATES[] prmState)
        {
            InitializeComponent();

            sqlCon = pCon;

            crd = pcrd;

            state = prmState;

            init();
        }
        private void init()
        {
            DataTable Dt = new DataTable();
            Dt = _GetEntries();

            //Dt.Columns.Add("Number of Files");
            //Dt.Columns.Add("No of Entries");

            //for (int i = 0; i < Dt.Rows.Count; i++)
            //{
            //    Dt.Rows[i][4] = _GetFileCount(Dt.Rows[i][0].ToString(), Dt.Rows[i][1].ToString());
            //    Dt.Rows[i][5] = _GetEntryCount(Dt.Rows[i][0].ToString(),Dt.Rows[i][1].ToString());
            //}

            dtGrdVol.DataSource = Dt;
                

            FormatDataGridView();

            this.dtGrdVol.Refresh();
            this.textBox1.Text = "";
            this.textBox2.Text = "";
            this.textBox1.Focus();

            ArrayList lst = GetTotalDaily(crd.created_by);
            for (int i = 0; i < lst.Count; i++)
            {
                deLabel1.Text = "Today You Have Entered: " + lst[0].ToString() + " Files";
            }
        }

        public DataTable _GetEntries()
        {
            DataTable dt = new DataTable();
            string sql = "select distinct a.proj_code,a.bundle_key,a.bundle_name as 'Bundle Name',a.bundle_no as 'Bundle Number',count(*) as 'Number of Files' from bundle_master a,case_file_master b where a.proj_code = b.proj_code and a.bundle_key = b.bundle_key group by a.proj_code,a.bundle_key";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        public string _GetFileCount(string proj_code, string bundle_key)
        {
            DataTable dt = new DataTable();
            string sql = "select COUNT(*) from case_file_master where proj_code = '" + proj_code + "' and bundle_key = '" + bundle_key + "' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt.Rows[0][0].ToString();
        }

        public string _GetEntryCount(string proj_code, string bundle_key)
        {
            DataTable dt = new DataTable();
            string sql = "select COUNT(*) from metadata_entry where proj_code = '"+proj_code+"' and bundle_key = '"+bundle_key+"' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt.Rows[0][0].ToString();
        }

        private void FormatDataGridView()
        {
            //Format the Data Grid View
            dtGrdVol.Columns[0].Visible = false;
            dtGrdVol.Columns[1].Visible = false;
            //dtGrdVol.Columns[2].Visible = false;
            //Format Colors

            
            //Set Autosize on for all the columns
            for (int i = 0; i < dtGrdVol.Columns.Count; i++)
            {
                dtGrdVol.Columns[i].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill; 
            }

            
        }

        private void frmEntrySummary_Load(object sender, EventArgs e)
        {
            this.textBox1.AutoCompleteCustomSource = GetSuggestions("bundle_master", "establishment");
            this.textBox1.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.textBox1.AutoCompleteSource = AutoCompleteSource.CustomSource;

            this.textBox2.AutoCompleteCustomSource = GetSuggestions("bundle_master", "bundle_no");
            this.textBox2.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            this.textBox2.AutoCompleteSource = AutoCompleteSource.CustomSource;

            ArrayList lst = GetTotalDaily(crd.created_by);
            for (int i = 0; i < lst.Count; i++)
            {
                deLabel1.Text = "Today You Have Entered: " + lst[0].ToString() + " Files";
            }
            
        }

        public ArrayList GetTotalDaily(string name)
        {
            ArrayList totList = new ArrayList();
            string sql = "Select proj_code from metadata_entry where date_format(created_DTTM,'%Y-%m-%d')=date_format(now(),'%Y-%m-%d') and created_by = '" + name + "'";
            //string sql = "Select district_code from deed_details where created_DTTM like now() and created_by = '" + crd.created_by + "'";
            DataSet ds = new DataSet();
            OdbcDataAdapter odap = new OdbcDataAdapter(sql, sqlCon);
            odap.Fill(ds);
            if (ds.Tables.Count > 0)
            { totList.Add(ds.Tables[0].Rows.Count); }
            else { totList.Add("0"); }



            return totList;
        }

        public AutoCompleteStringCollection GetSuggestions(string tblName, string fldName)
        {
            AutoCompleteStringCollection x = new AutoCompleteStringCollection();
            string sql = "Select distinct " + fldName + " from " + tblName;
            DataSet ds = new DataSet();
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    x.Add(ds.Tables[0].Rows[i][0].ToString().Trim());
                }
            }
            //x.Add("Others");
            //x.Add("NA");
            return x;
        }

        public DataTable _GetResult(string est, string bundle_no)
        {
            DataTable dt = new DataTable();

            string sql = "select distinct a.proj_code,a.bundle_key,a.bundle_name as 'Bundle Name',a.bundle_no as 'Bundle Number',count(*) as 'Number of Files' from bundle_master a,case_file_master b where a.proj_code = b.proj_code and a.bundle_key = b.bundle_key and a.establishment like '%" + est + "%' and a.bundle_no like '%" + bundle_no + "%' group by a.proj_code,a.bundle_key";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public DataTable _GetResultEST(string est)
        {
            DataTable dt = new DataTable();
            
            string sql = "select distinct a.proj_code,a.bundle_key,a.bundle_name as 'Bundle Name',a.bundle_no as 'Bundle Number',count(*) as 'Number of Files' from bundle_master a,case_file_master b where a.proj_code = b.proj_code and a.bundle_key = b.bundle_key and a.establishment like '%" + est + "%'  group by a.proj_code,a.bundle_key";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public DataTable _GetResultBundle(string bundle_no)
        {
            DataTable dt = new DataTable();

            string sql = "select distinct a.proj_code,a.bundle_key,a.bundle_name as 'Bundle Name',a.bundle_no as 'Bundle Number',count(*) as 'Number of Files' from bundle_master a,case_file_master b where a.proj_code = b.proj_code and a.bundle_key = b.bundle_key and a.bundle_no like '%" + bundle_no + "%' group by a.proj_code,a.bundle_key";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        private void cmdSearch_Click(object sender, EventArgs e)
        {
            string est = textBox1.Text;
            string bundle_no = textBox2.Text;
            
            dtGrdVol.DataSource = null;
            DataTable Dt = new DataTable();

            if (est != null && bundle_no != null)
            {
                Dt = _GetResult(est,bundle_no);

                //Dt.Columns.Add("Number of Files");
                //Dt.Columns.Add("No of Entries");

                //for (int i = 0; i < Dt.Rows.Count; i++)
                //{
                //    Dt.Rows[i][4] = _GetFileCount(Dt.Rows[i][0].ToString(), Dt.Rows[i][1].ToString());
                //    Dt.Rows[i][5] = _GetEntryCount(Dt.Rows[i][0].ToString(), Dt.Rows[i][1].ToString());
                //}

                dtGrdVol.DataSource = Dt;


                FormatDataGridView();

                this.dtGrdVol.Refresh();
                this.textBox1.Focus();

                if(dtGrdVol.Rows.Count > 0)
                {
                    dtGrdVol.Rows[0].Selected = true;
                    dtGrdVol.Focus();
                    
                    return;

                }
                //else
                //{ dtGrdVol.Rows[0].Selected = false; }

            }
            else if (est == null && bundle_no != null)
            {
                Dt = _GetResultBundle(bundle_no);

                //Dt.Columns.Add("Number of Files");
                //Dt.Columns.Add("No of Entries");

                //for (int i = 0; i < Dt.Rows.Count; i++)
                //{
                //    Dt.Rows[i][4] = _GetFileCount(Dt.Rows[i][0].ToString(), Dt.Rows[i][1].ToString());
                //    Dt.Rows[i][5] = _GetEntryCount(Dt.Rows[i][0].ToString(), Dt.Rows[i][1].ToString());
                //}

                dtGrdVol.DataSource = Dt;


                FormatDataGridView();

                this.dtGrdVol.Refresh();
                this.textBox1.Focus();

                if (dtGrdVol.Rows.Count > 0)
                {
                    dtGrdVol.Rows[0].Selected = true;
                    dtGrdVol.Focus();

                    return;
                }
                //else
                //{ dtGrdVol.Rows[0].Selected = false; }
            }
            else if (est != null && bundle_no == null)
            {
                Dt = _GetResultEST(est);

                //Dt.Columns.Add("Number of Files");
                //Dt.Columns.Add("No of Entries");

                //for (int i = 0; i < Dt.Rows.Count; i++)
                //{
                //    Dt.Rows[i][4] = _GetFileCount(Dt.Rows[i][0].ToString(), Dt.Rows[i][1].ToString());
                //    Dt.Rows[i][5] = _GetEntryCount(Dt.Rows[i][0].ToString(), Dt.Rows[i][1].ToString());
                //}

                dtGrdVol.DataSource = Dt;


                FormatDataGridView();

                this.dtGrdVol.Refresh();
                this.textBox1.Focus();

                if (dtGrdVol.Rows.Count > 0)
                {
                    dtGrdVol.Rows[0].Selected = true;
                    dtGrdVol.Focus();

                    return;
                }
                //else
                //{ dtGrdVol.Rows[0].Selected = false; }
            }
            else
            {
                //init();

                dtGrdVol.DataSource = null;
            }
        }

        private void cmdReset_Click(object sender, EventArgs e)
        {
            init();
        }

        private void frmEntrySummary_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F5)
            {
                init();
            }
            if (e.KeyCode == Keys.Escape)
            {
                this.Close();
            }
            
            if (e.Control == true && e.KeyCode == Keys.N)
            {
                cmdnew_Click(sender, e);
            }
        }

        public DataTable _GetFileCaseDetails(string proj, string bundle)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct proj_code, bundle_Key,item_no,case_file_no,case_status, case_nature, case_type, case_year from case_file_master where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' and case_file_no not in (select case_file_no from metadata_entry where proj_code = '" + proj + "' and bundle_key = '" + bundle + "')";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        public DataTable _GetBundleStatus(string proj, string bundle)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct status from bundle_master where proj_code = '" + proj + "' and bundle_key = '" + bundle + "' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        private void cmdnew_Click(object sender, EventArgs e)
        {

            //this.Hide();
            this.SetTopLevel(false);

            eSTATES[] state = new eSTATES[1];
            state[0] = NovaNet.wfe.eSTATES.METADATA_ENTRY;

            frmBundleSelect frm = new frmBundleSelect(state, sqlCon,txn,crd);
            frm.chkPhotoScan.Visible = false;
            frm.ShowDialog(this);
            
            projKey = frmBundleSelect.projKey;
            bundleKey = frmBundleSelect.bundleKey;

            


            if (projKey != null && bundleKey != null)
            {
                if (_GetBundleStatus(projKey, bundleKey).Rows[0][0].ToString() == "0")
                {
                    //entry count compare with file count
                    //int fileCount = Convert.ToInt32(_GetFileCount(Convert.ToString(projKey), Convert.ToString(bundleKey)).ToString());
                    //int entryCount = Convert.ToInt32(_GetEntryCount(Convert.ToString(projKey), Convert.ToString(bundleKey)).ToString());

                    //if (entryCount == fileCount)
                    //{

                    //    if (fileCount == 0)
                    //    {
                    //        MessageBox.Show(this, "There's no file for this Bundle...", "Record Management - Entry Check !", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    //        frmEntrySummary fm = new frmEntrySummary(sqlCon,crd);
                    //        fm.ShowDialog(this);
                    //        return;
                    //    }
                    //    else
                    //    {
                    //        MessageBox.Show(this, "All files are entered for this Bundle...", "Record Management - Entry Check !", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    //        frmEntrySummary fm = new frmEntrySummary(sqlCon,crd);
                    //        fm.ShowDialog(this);
                    //        return;
                    //    }

                    //}
                    //else
                    //{

                            //frmMain.projKey = projKey;
                            //frmMain.bundleKey = bundleKey;

                            //Form activeChild = this.ActiveMdiChild;
                            //if (activeChild == null)
                            //{
                            //EntryForm frmEntry = new EntryForm(sqlCon, DataLayerDefs.Mode._Add);
                            //txn = sqlCon.BeginTransaction();
                            ////frmEntry.ShowDialog(this);
                            //Files fm = new Files(sqlCon, DataLayerDefs.Mode._Add, txn, crd);

                            //fm.ShowDialog(this);
                            //if (txn == null)
                            //{
                            //    txn = sqlCon.BeginTransaction();
                            //}
                            //igr_deed _mdeed = new igr_deed(sqlCon, txn, crd);
                            //frmDeedsummery ds = new frmDeedsummery(sqlCon, txn, crd, _mdeed, Mode._Add);
                            //ds.ShowDialog();
                            this.SetTopLevel(true);
                            frmNewCase fm = new frmNewCase(projKey, bundleKey, sqlCon, crd, DataLayerDefs.Mode._Add,state);
                            fm.ShowDialog();
                            
                        //}

                    //}
                }
                else
                {
                    MessageBox.Show(this, "This Bundle has been uploaded for the further process...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    //frmEntrySummary fm = new frmEntrySummary(sqlCon,crd);
                    //fm.ShowDialog(this);
                    this.SetTopLevel(true);
                    return;
                }
                
            }
            else
            {
                //frmEntrySummary fm = new frmEntrySummary(sqlCon,crd);
                //fm.ShowDialog(this);
                this.SetTopLevel(true);
                return;
            }
            
        }

        private void dtGrdVol_DoubleClick(object sender, EventArgs e)
        {
            //this.Hide();
            
            if(dtGrdVol.Rows.Count > 0)
            {
                projKey = dtGrdVol.SelectedRows[0].Cells[0].Value.ToString();
                bundleKey = dtGrdVol.SelectedRows[0].Cells[1].Value.ToString();

                //_GetBundleStatus(projKey, bundleKey).Rows[0][0].ToString() == "0" ||---> status check

                if (crd.role == ihConstants._ADMINISTRATOR_ROLE || crd.role == "Supervisor" || crd.role == "Metadata Entry")
                {
                    //int fileCount = Convert.ToInt32(dtGrdVol.SelectedRows[0].Cells[4].Value.ToString());
                    int entryCount = Convert.ToInt32(dtGrdVol.SelectedRows[0].Cells[4].Value.ToString());
                    if (entryCount > 0)
                    {


                        if (projKey != null && bundleKey != null)
                        {

                            Form activeChild = this.ActiveMdiChild;
                            if (activeChild == null)
                            {
                                //txn = sqlCon.BeginTransaction();
                                //if (txn.Connection == null)
                                //{
                                //    txn = sqlCon.BeginTransaction();
                                //}
                                //txn.Commit();

                                Files fm = new Files(sqlCon, DataLayerDefs.Mode._Edit, txn, crd);

                                fm.ShowDialog(this);
                            }
                        }
                        else
                        {
                            //frmEntrySummary fm = new frmEntrySummary(sqlCon,crd);
                            //fm.ShowDialog(this);
                            return;
                        }
                    }
                    else
                    {
                        MessageBox.Show(this, "No file is enterd for this Bundle...", "B'Zer - Calcutta High Court - Entry Check !", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        //frmEntrySummary fm = new frmEntrySummary(sqlCon,crd);
                        //fm.ShowDialog(this);
                        return;
                    }
                }
                else
                {
                    MessageBox.Show(this, "You are not authorized to do so ...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    //MessageBox.Show(this, "This Bundle has been uploaded for the further process...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    //frmEntrySummary fm = new frmEntrySummary(sqlCon,crd);
                    //fm.ShowDialog(this);
                    return;
                }

            }

        }

        private void dtGrdVol_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.Control == true && e.KeyCode == Keys.O)
            {
                dtGrdVol_DoubleClick(sender, e);
            }
            if(e.KeyCode == Keys.Enter)
            {
                //dtGrdVol_DoubleClick(sender, e);
            }

        }

       
        private void dtGrdVol_MouseClick(object sender, MouseEventArgs e)
        {
            if(dtGrdVol.Rows.Count > 0)
            {
                if (crd.role == ihConstants._ADMINISTRATOR_ROLE)
                {
                    projKey = dtGrdVol.SelectedRows[0].Cells[0].Value.ToString();
                    bundleKey = dtGrdVol.SelectedRows[0].Cells[1].Value.ToString();

                    if (_GetBundleStatus(projKey, bundleKey).Rows[0][0].ToString() == "0")
                    {
                        if (e.Button == MouseButtons.Right)
                        {
                            cmsDeeds.Show(Cursor.Position);
                        }
                    }

                }
            }
            
        }

        private void updateDeedToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (dtGrdVol.Rows.Count > 0)
            {
                if (crd.role == ihConstants._ADMINISTRATOR_ROLE)
                {
                    projKey = dtGrdVol.SelectedRows[0].Cells[0].Value.ToString();
                    bundleKey = dtGrdVol.SelectedRows[0].Cells[1].Value.ToString();
                    bundleNo = dtGrdVol.SelectedRows[0].Cells[3].Value.ToString();

                    if (_GetBundleStatus(projKey, bundleKey).Rows[0][0].ToString() == "0")
                    {
                        DialogResult result = MessageBox.Show("Do you want to update this bundle ? ", "B'Zer - Calcutta High Court - Confirmation !", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                        if (result == DialogResult.Yes)
                        {
                            try
                            {
                                frmBatch dispProject;
                                wi = new wfeBatch(sqlCon);
                                dispProject = new frmBatch(wi, sqlCon, DataLayerDefs.Mode._Edit);
                                dispProject.ShowDialog(this);

                                init();
                            }
                            catch (Exception ex)
                            {
                                MessageBox.Show(ex.Message);
                            }
                        }
                        else
                        {
                            return;
                        }
                    }
                }
            }
               
        }
        public DataTable getBundleDetails(string pcode, string bcode)
        {
            DataTable dt = new DataTable();
            string sql = "select distinct bundle_path from bundle_master where proj_code = '" + pcode + "' and bundle_key = '" + bcode + "' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public bool Commit_Bundle_Delete()
        {
            string sqlStr = null;
            OdbcTransaction sqlTrans = null;
            bool commitBol = true;
            OdbcCommand sqlCmd = new OdbcCommand();
            string scanbatchPath = null;

            //errList = new Hashtable();
            

            sqlStr = @"delete from bundle_master where proj_code = '" + frmEntrySummary.projKey + "' and bundle_key = '" + frmEntrySummary.bundleKey + "'";

            //sqlStr = @"insert into bundle_master(proj_code,bundle_code,bundle_name,created_by" +
            //    ",Created_DTTM,establishment,bundle_no,creation_date,handover_date,bundle_path) values(" +
            //    objBatch.proj_code + ",'" + objBatch.batch_code.ToUpper() + "','" + objBatch.batch_name + "'," +
            //    "'" + objBatch.Created_By + "','" + objBatch.Created_DTTM + "','" + establishment + "','" + bundle_no + "','" + createDt + "','" + handoverDt + "','" +
            //    scanbatchPath.Replace("\\", "\\\\") + "')";
            try
            {

                sqlTrans = sqlCon.BeginTransaction();
                sqlCmd.Connection = sqlCon;
                sqlCmd.Transaction = sqlTrans;
                sqlCmd.CommandText = sqlStr;
                sqlCmd.ExecuteNonQuery();

                if(Directory.Exists(delpath))
                {
                    Directory.Delete(delpath, true);
                    commitBol = true;
                    sqlTrans.Commit();
                }
                else
                {
                    commitBol = false;
                    sqlTrans.Rollback();

                    //throw new CreateFolderException(ErrMsg);
                }

                //if (FileorFolder.del(old_path, scanbatchPath) == true)
                //{
                //    commitBol = true;
                //    sqlTrans.Commit();
                //}
                //else
                //{
                //    commitBol = false;
                //    sqlTrans.Rollback();

                //    //throw new CreateFolderException(ErrMsg);
                //}



            }
            catch (Exception ex)
            {
                //errList.Add(Constants.DBERRORTYPE, ex.Message);
                commitBol = false;
                sqlTrans.Rollback();
                sqlCmd.Dispose();

            }
            return commitBol;
        }
        private void deleteDeedToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if(dtGrdVol.Rows.Count > 0)
            {
                if (crd.role == ihConstants._ADMINISTRATOR_ROLE)
                {
                    projKey = dtGrdVol.SelectedRows[0].Cells[0].Value.ToString();
                    bundleKey = dtGrdVol.SelectedRows[0].Cells[1].Value.ToString();
                    bundleNo = dtGrdVol.SelectedRows[0].Cells[3].Value.ToString();

                    if (_GetBundleStatus(projKey, bundleKey).Rows[0][0].ToString() == "0")
                    {
                        DialogResult result = MessageBox.Show("Do you want to delete this bundle ? ", "B'Zer - Calcutta High Court - Confirmation !", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                        if (result == DialogResult.Yes)
                        {
                            delpath = getBundleDetails(projKey, bundleKey).Rows[0][0].ToString();

                            if (Commit_Bundle_Delete() == true)
                            {
                                MessageBox.Show(this, "Bundle Deleted Successfully", "Bundle Deletion", MessageBoxButtons.OK, MessageBoxIcon.Information);

                                init();
                            }
                        }
                        else
                        {
                            return;
                        }

                    }
                }
            }
            
        }
    }
}
