using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Windows.Forms;
using System.Drawing.Drawing2D;
using System.Drawing.Text;
using System.ComponentModel;
using WeifenLuo.WinFormsUI.Docking;
using System.Runtime.InteropServices;
using DockSample.Customization;
using System.IO;
using DockSample;
using NovaNet.Utils;
using NovaNet.wfe;
using System.Data;
using System.Data.Odbc;
using System.Collections;
using LItems;
//using AForge.Imaging;
//using AForge;
//using AForge.Imaging.Filters;
using TwainLib;
using Inlite.ClearImageNet;
//using System.Drawing.Bitmap;
//using System.Drawing.Graphics;
//using Graphics.DrawImage;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using Microsoft;
using System.Linq;
using System.Collections.Generic;
using System.Diagnostics;

namespace ImageHeaven
{
    public partial class frmStatusUpdate : Form
    {
        OdbcConnection sqlCon = null;
        private INIReader rd = null;
        private KeyValueStruct udtKeyValue;
        public string location = "";

        public frmStatusUpdate()
        {
            InitializeComponent();
        }

        public frmStatusUpdate(OdbcConnection prmCon)
        {
            InitializeComponent();
            sqlCon = prmCon;
            INIFile ini = new INIFile();
            string iniPath = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Remove(0, 6) + "\\" + "IhConfiguration.ini";
            location = ini.ReadINI("LOCCONFIG", "LOC", string.Empty, iniPath);
        }

        private void deButton21_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void frmStatusUpdate_Load(object sender, EventArgs e)
        {
            populateProject();
        }

        private void populateProject()
        {

            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select proj_key, proj_code from project_master  ";

            OdbcDataAdapter odap = new OdbcDataAdapter(sql, sqlCon);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                cmbProject.DataSource = dt;
                cmbProject.DisplayMember = "proj_code";
                cmbProject.ValueMember = "proj_key";

                populateBundle();
            }
            else
            {
                cmbProject.DataSource = null;
                // cmbProject.Text = "";
                MessageBox.Show("Add one project first...");
                this.Close();
            }


        }
        private void populateBundle()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            string sql = "select a.bundle_key, a.bundle_code from bundle_master a, project_master b where a.proj_code = b.proj_key and a.proj_code = '" + cmbProject.SelectedValue.ToString() + "' ";

            OdbcDataAdapter odap = new OdbcDataAdapter(sql, sqlCon);
            odap.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                cmbBundle.DataSource = dt;
                cmbBundle.DisplayMember = "bundle_code";
                cmbBundle.ValueMember = "bundle_key";
            }
            else
            {

                cmbBundle.Text = string.Empty;
                cmbBundle.DataSource = null;
                cmbBundle.DisplayMember = "";
                cmbBundle.ValueMember = "";
                cmbProject.Select();

            }
        }
        private void FormatDataGridView()
        {
            //Format the Data Grid View
            //grdStatus.Columns[0].Visible = false;
            //grdStatus.Columns[1].Visible = false;
            //dtGrdVol.Columns[2].Visible = false;
            //Format Colors


            //Set Autosize on for all the columns
            for (int i = 0; i < grdStatus.Columns.Count; i++)
            {
                grdStatus.Columns[i].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            }


        }
        public class DataRecord
        {
            public string sl { get; set; }
            public string loc { get; set; }
            public string soft { get; set; }
            public string monthyear { get; set; }
            public string bunName { get; set; }
            public string bunNo { get; set; }
            public string fileNo { get; set; }
            public string scanImageco { get; set; }
            public string scancom { get; set; }
            public string indCom { get; set; }
            public string fqcCom { get; set; }
            public string uatcom { get; set; }
            public string uatIm { get; set; }
            public string uatdoneby { get; set; }
            public string uatdate { get; set; }
            public string ocrf { get; set; }
            public string ocrI { get; set; }
            public string dDMS { get; set; }
            public string dI { get; set; }
            public string dD { get; set; }
            public string dT { get; set; }
            public string uF { get; set; }
            public string uI { get; set; }
            public string uD { get; set; }
            public string oD { get; set; }
            public string rI { get; set; }
            public string challanNo { get; set; }
            public string challanDate { get; set; }
        }
        public System.Data.DataTable _GetBundleEntries()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select a.proj_code, a.bundle_key, date_format(a.inward_date,'%M-%Y'), a.bundle_name, a.bundle_no, b.filename, " +
                         "date_format(a.outward_date,'%M-%Y') , b.status, b.running_serial " +
                         "from bundle_master a, metadata_entry b where " +
                         "a.proj_code = b.proj_code and b.proj_code ='" + cmbProject.SelectedValue.ToString() + "' and b.bundle_key = '" + cmbBundle.SelectedValue.ToString() + "' and " +
                         " a.bundle_key = b.bundle_key order by b.running_serial";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public System.Data.DataTable _GetScanedImage(string pk, string bk, string file)
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select a.proj_key,a.batch_key,a.policy_number, " +
                         "count(*),date_format(a.scanned_dttm,'%M-%Y'),date_format(a.index_dttm,'%M-%Y')," +
                         "date_format(a.fqc_dttm,'%M-%Y') from transaction_log a, image_master b where a.proj_key = b.proj_key and a.batch_key = b.batch_key " +
                         "and a.policy_number = b.policy_number and a.proj_key = '" + pk + "' and a.batch_key = '" + bk + "' and a.policy_number = '" + file + "' group by a.proj_key,a.batch_key,a.policy_number ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public System.Data.DataTable _GetImagesAudit(string pk, string bk, string file)
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select a.proj_key,a.batch_key,a.policy_number,a.created_by, date_format(a.created_dttm,'%M-%Y'),c.status, " +
                         "count(distinct b.page_name) from lic_qa_log a, image_master b, bundle_master c where a.proj_key = b.proj_key and a.batch_key = b.batch_key " +
                         "and a.policy_number = b.policy_number and a.proj_key = '" + pk + "' and a.batch_key = '" + bk + "' and a.policy_number = '" + file + "' and b.status <> 29 " +
                         "group by a.proj_key,a.batch_key,a.policy_number";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public System.Data.DataTable _GetImagesExport(string pk, string bk, string file)
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select count(*) from image_master " +
                         "where " +
                         "proj_key = '" + pk + "' and " +
                         "batch_key = '" + bk + "' " +
                         "and policy_number = '" + file + "' and status <> 29";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        private void init()
        {


            System.Data.DataTable table = new System.Data.DataTable();
            table = _GetBundleEntries();

            System.Data.DataTable DtTemp = new System.Data.DataTable();
            DtTemp.Columns.Add("Sl No.");
            DtTemp.Columns.Add("Location");
            DtTemp.Columns.Add("Software");
            DtTemp.Columns.Add("Month-Year");
            DtTemp.Columns.Add("Inward Bundle Name");
            DtTemp.Columns.Add("Inward Bundle Number");
            DtTemp.Columns.Add("Inward File Name");

            DtTemp.Columns.Add("Scanned Image Count");
            DtTemp.Columns.Add("Scan Completed");
            DtTemp.Columns.Add("Indexing Completed");
            DtTemp.Columns.Add("FQC completed");

            DtTemp.Columns.Add("UAT completed");
            DtTemp.Columns.Add("UAT Images");
            DtTemp.Columns.Add("UAT done by");
            DtTemp.Columns.Add("UAT Done Date");

            DtTemp.Columns.Add("OCR & Exported file count");
            DtTemp.Columns.Add("OCR & Exported Image count");

            DtTemp.Columns.Add("Delivered to CHC for DMS upload");
            DtTemp.Columns.Add("Delivered Images");
            DtTemp.Columns.Add("Delivery Date");
            DtTemp.Columns.Add("Delivered To");
            DtTemp.Columns.Add("Uploaded File count");
            DtTemp.Columns.Add("Uploaded images count");
            DtTemp.Columns.Add("Upload date");

            DtTemp.Columns.Add("Outward date");
            DtTemp.Columns.Add("Raise invoice");   
            DtTemp.Columns.Add("Challan No");
            DtTemp.Columns.Add("Challan Date");

            List<DataRecord> records = new List<DataRecord>();
            using (Process p = Process.GetCurrentProcess())
            {
                p.PriorityClass = ProcessPriorityClass.High;

                for (int i = 0; i < table.Rows.Count; i++)
                {
                    GC.Collect();
                    GC.WaitForPendingFinalizers();
                    System.Windows.Forms.Application.DoEvents();

                    string pk = table.Rows[i][0].ToString();
                    string bk = table.Rows[i][1].ToString();
                    string file = table.Rows[i][5].ToString();
                    string outdate = table.Rows[i][6].ToString();
                    string expStatus = table.Rows[i][7].ToString();
                    string runningSlNo = table.Rows[i][8].ToString();
                    string expImage = "";
                    if (expStatus == "N") { expStatus = "Not Exported"; expImage = ""; }
                    else { expImage = _GetImagesExport(pk, bk, file).Rows[0][0].ToString(); }
                    string totalImageScaned = "";
                    string scanComplete = "";
                    string indexComplete = "";
                    string fqcComplete = "";

                    string uatCom = "";
                    string uatimg = "";
                    string uatby = "";
                    string uatdate = "";

                    System.Data.DataTable table1 = new System.Data.DataTable();
                    table1 = _GetScanedImage(pk, bk, file);
                    if (table1.Rows.Count > 0)
                    {
                        totalImageScaned = table1.Rows[0][3].ToString();
                        scanComplete = table1.Rows[0][4].ToString();
                        indexComplete = table1.Rows[0][5].ToString();
                        fqcComplete = table1.Rows[0][6].ToString();
                    }
                    System.Data.DataTable table2 = new System.Data.DataTable();
                    table2 = _GetImagesAudit(pk, bk, file);
                    if (table2.Rows.Count > 0)
                    {
                        uatCom = "Completed";
                        uatimg = table2.Rows[0][6].ToString();
                        uatby = table2.Rows[0][3].ToString();
                        uatdate = table2.Rows[0][4].ToString();
                    }
                    records.Add(new DataRecord
                    {
                        sl = runningSlNo,
                        loc = location,
                        soft = "Nevaeh",
                        monthyear = table.Rows[i][2].ToString(),
                        bunName = table.Rows[i][3].ToString(),
                        bunNo = table.Rows[i][4].ToString(),
                        fileNo = file,
                        scanImageco = totalImageScaned,
                        scancom = scanComplete,
                        indCom = indexComplete,
                        fqcCom = fqcComplete,
                        uatcom = uatCom,
                        uatIm = uatimg,
                        uatdoneby = uatby,
                        uatdate = uatdate,
                        ocrf = expStatus,
                        ocrI = expImage,
                        dDMS = "",
                        dI = "",
                        dD = "",
                        dT = "",
                        uF = "",
                        uI = "",
                        uD = "",
                        oD = outdate,
                        rI = "",
                        challanNo = "",
                        challanDate = ""
                    });

                    GC.Collect();
                    GC.WaitForPendingFinalizers();
                    System.Windows.Forms.Application.DoEvents();

                    DtTemp.Rows.Add(records[i].sl, records[i].loc, records[i].soft, records[i].monthyear,
                        records[i].bunName, records[i].bunNo, records[i].fileNo, records[i].scanImageco,
                        records[i].scancom, records[i].indCom, records[i].fqcCom, records[i].uatcom,
                        records[i].uatIm, records[i].uatdoneby, records[i].uatdate, records[i].ocrf,
                        records[i].ocrI, records[i].dDMS, records[i].dI, records[i].dD,
                        records[i].dT, records[i].uF, records[i].uI, records[i].uD,
                        records[i].oD, records[i].rI, records[i].challanNo, records[i].challanDate);
                    //DtTemp.Rows.Add(i + 1, "", "Nevaeh", table.Rows[i][2].ToString(), table.Rows[i][3].ToString(), table.Rows[i][4].ToString(), file,
                    //totalImageScaned, scanComplete, indexComplete, fqcComplete,
                    //uatCom, uatimg, uatby, uatdate, expStatus, _GetImagesExport(pk, bk, file).Rows[0][0].ToString(),
                    //"", "", "", "", "", "", "", outdate, "");

                    GC.Collect();
                    GC.WaitForPendingFinalizers();
                    System.Windows.Forms.Application.DoEvents();

                    //Dispose();
                }
            }
            grdStatus.DataSource = DtTemp;
            FormatDataGridView();

            this.grdStatus.Refresh();
        }
        public System.Data.DataTable checkExsist(string serialNo)
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select * from detailed_dashboard_master where slno = '" + serialNo + "'";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        private void deButton1_Click(object sender, EventArgs e)
        {
            if (cmbProject.Text != "" && cmbBundle.Text != "")
            {
                grdStatus.DataSource = null;
                init();
                if (grdStatus.Rows.Count > 0)
                {
                    deButton20.Enabled = true;
                }
                else
                {
                    deButton20.Enabled = false;
                }
            }
        }
        private bool insertIntoDB(string sl, string loc, string software, string monthyr, string bunName, string bundleNo, string file, string scanI,
            string scanCom, string indCom, string fqcCom, string uatCom, string uatIm, string uatDone, string uatDate, string ocrF, string ocrI,
            string delDMS, string delI, string delDate, string delTo, string upFile, string upIm, string upDate, string oDate, string rInv,
            string challanNo,string challanDate)
        {
            bool commitBol = true;




            string sqlStr = string.Empty;

            OdbcCommand sqlCmd = new OdbcCommand();

            sqlStr = @"insert into detailed_dashboard_master(slno,location,software,monthyear,
                      bundle_name,bundle_no,fileNo,scanImageco,scanComplete,indexComplete,fqcComplete,uatComplete,
                      uatImage,uatdoneby,uatdate,ocrfile,ocrImage,deliveryDMS,deliveredImage,
                      deliveryDate,deliveredTo,uploadedFile,uploadedImage,uploadDate,outwardDate,raiseInvoice,challanNo,challanDate) values('" + sl + "'," +
                "'" + loc + "','" + software + "','" + monthyr + "','" + bunName + "', '" + bundleNo + "','" + file + "','" + scanI + "','" + scanCom + "','" + indCom + "'," +
                "'" + fqcCom + "','" + uatCom + "','" + uatIm + "','" + uatDone + "','" + uatDate + "','" + ocrF + "','" + ocrI + "','" + delDMS + "','" + delI + "','" + delDate + "'," +
                "'" + delTo + "','" + upFile + "','" + upIm + "','" + upDate + "','" + oDate + "','" + rInv + "'," +
                "'"+ challanNo + "','"+challanDate+"')";

            sqlCmd.Connection = sqlCon;
            //sqlCmd.Transaction = trans;
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

            return commitBol;
        }


        private bool updateIntoDB(string sl, string loc, string software, string monthyr, string bunName, string bundleNo, string file, string scanI,
            string scanCom, string indCom, string fqcCom, string uatCom, string uatIm, string uatDone, string uatDate, string ocrF, string ocrI,
            string delDMS, string delI, string delDate, string delTo, string upFile, string upIm, string upDate, string oDate, string rInv,
            string challanNo, string challanDate)
        {
            bool commitBol = true;


            string sqlStr = string.Empty;

            OdbcCommand sqlCmd = new OdbcCommand();
            sqlStr = @"update detailed_dashboard_master set location = '" + loc + "',software = '" + software + "',monthyear = '" + monthyr + "', " +
                      "bundle_name = '" + bunName + "',bundle_no = '" + bundleNo + "',fileNo ='" + file + "'," +
                      "scanImageco = '" + scanI + "',scanComplete = '" + scanCom + "',indexComplete ='" + indCom + "',fqcComplete ='" + fqcCom + "'," +
                      "uatComplete = '" + uatCom + "', uatImage ='" + uatIm + "',uatdoneby ='" + uatDone + "',uatdate='" + uatDate + "'," +
                      "ocrfile='" + ocrF + "',ocrImage='" + ocrI + "',deliveryDMS='" + delDMS + "',deliveredImage = '" + delI + "'," +
                      "deliveryDate='" + delDate + "',deliveredTo='" + delTo + "',uploadedFile='" + upFile + "'," +
                      "uploadedImage='" + upIm + "',uploadDate='" + upDate + "',outwardDate='" + oDate + "',raiseInvoice='" + rInv + "'," +
                      "challanNo='" + challanNo + "',challanDate='" + challanDate + "' where slno= '" + sl + "'";

            sqlCmd.Connection = sqlCon;
            //sqlCmd.Transaction = trans;
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

            return commitBol;
        }

        private void deButton20_Click(object sender, EventArgs e)
        {
            deButton20.Enabled = false;
            deButton21.Enabled = false;
            bool retVal = false;
            for (int i = 0; i < grdStatus.Rows.Count; i++)
            {
                string sl = grdStatus.Rows[i].Cells[0].Value.ToString();
                if (checkExsist(sl).Rows.Count > 0)
                {
                    //update
                    bool updatelog = updateIntoDB(sl, grdStatus.Rows[i].Cells[1].Value.ToString(), grdStatus.Rows[i].Cells[2].Value.ToString(),
                        grdStatus.Rows[i].Cells[3].Value.ToString(), grdStatus.Rows[i].Cells[4].Value.ToString(),
                        grdStatus.Rows[i].Cells[5].Value.ToString(), grdStatus.Rows[i].Cells[6].Value.ToString(),
                        grdStatus.Rows[i].Cells[7].Value.ToString(), grdStatus.Rows[i].Cells[8].Value.ToString(),
                        grdStatus.Rows[i].Cells[9].Value.ToString(), grdStatus.Rows[i].Cells[10].Value.ToString(),
                        grdStatus.Rows[i].Cells[11].Value.ToString(), grdStatus.Rows[i].Cells[12].Value.ToString(),
                        grdStatus.Rows[i].Cells[13].Value.ToString(), grdStatus.Rows[i].Cells[14].Value.ToString(),
                        grdStatus.Rows[i].Cells[15].Value.ToString(), grdStatus.Rows[i].Cells[16].Value.ToString(),
                        grdStatus.Rows[i].Cells[17].Value.ToString(), grdStatus.Rows[i].Cells[18].Value.ToString(),
                        grdStatus.Rows[i].Cells[19].Value.ToString(), grdStatus.Rows[i].Cells[20].Value.ToString(),
                        grdStatus.Rows[i].Cells[21].Value.ToString(), grdStatus.Rows[i].Cells[22].Value.ToString(),
                        grdStatus.Rows[i].Cells[23].Value.ToString(), grdStatus.Rows[i].Cells[24].Value.ToString(),
                        grdStatus.Rows[i].Cells[25].Value.ToString(), grdStatus.Rows[i].Cells[26].Value.ToString(),
                        grdStatus.Rows[i].Cells[27].Value.ToString());
                    if (updatelog == true)
                    {
                        retVal = true;
                        continue;
                    }
                    else
                    {
                        retVal = false;
                        return;
                    }

                }
                else
                {
                    //insert
                    bool insertlog = insertIntoDB(sl, grdStatus.Rows[i].Cells[1].Value.ToString(), grdStatus.Rows[i].Cells[2].Value.ToString(),
                        grdStatus.Rows[i].Cells[3].Value.ToString(), grdStatus.Rows[i].Cells[4].Value.ToString(),
                        grdStatus.Rows[i].Cells[5].Value.ToString(), grdStatus.Rows[i].Cells[6].Value.ToString(),
                        grdStatus.Rows[i].Cells[7].Value.ToString(), grdStatus.Rows[i].Cells[8].Value.ToString(),
                        grdStatus.Rows[i].Cells[9].Value.ToString(), grdStatus.Rows[i].Cells[10].Value.ToString(),
                        grdStatus.Rows[i].Cells[11].Value.ToString(), grdStatus.Rows[i].Cells[12].Value.ToString(),
                        grdStatus.Rows[i].Cells[13].Value.ToString(), grdStatus.Rows[i].Cells[14].Value.ToString(),
                        grdStatus.Rows[i].Cells[15].Value.ToString(), grdStatus.Rows[i].Cells[16].Value.ToString(),
                        grdStatus.Rows[i].Cells[17].Value.ToString(), grdStatus.Rows[i].Cells[18].Value.ToString(),
                        grdStatus.Rows[i].Cells[19].Value.ToString(), grdStatus.Rows[i].Cells[20].Value.ToString(),
                        grdStatus.Rows[i].Cells[21].Value.ToString(), grdStatus.Rows[i].Cells[22].Value.ToString(),
                        grdStatus.Rows[i].Cells[23].Value.ToString(), grdStatus.Rows[i].Cells[24].Value.ToString(),
                        grdStatus.Rows[i].Cells[25].Value.ToString(), grdStatus.Rows[i].Cells[26].Value.ToString(),
                        grdStatus.Rows[i].Cells[27].Value.ToString());
                    if (insertlog == true)
                    {
                        retVal = true;
                        continue;
                    }
                    else
                    {
                        retVal = false;
                        return;
                    }
                }
            }
            if (retVal == true)
            {
                MessageBox.Show(this, "Status updated successfully...", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            deButton21.Enabled = true;
        }

        private void cmbProject_Leave(object sender, EventArgs e)
        {
            populateBundle();
        }

        private void cmbProject_MouseLeave(object sender, EventArgs e)
        {
            populateBundle();
        }
    }
}
