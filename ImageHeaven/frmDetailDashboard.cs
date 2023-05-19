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
using Microsoft.Office;
using Microsoft.Office.Interop.Excel;
using System.Linq;
using System.Collections.Generic;
using System.Diagnostics;

namespace ImageHeaven
{
    public partial class frmDetailDashboard : Form
    {
        OdbcConnection sqlCon = null;
        private INIReader rd = null;
        private KeyValueStruct udtKeyValue;
        public string location = "";

        public frmDetailDashboard()
        {
            InitializeComponent();
        }

        public frmDetailDashboard(OdbcConnection prmCon)
        {
            InitializeComponent();
            sqlCon = prmCon;
        }

        private void frmDetailDashboard_Load(object sender, EventArgs e)
        {
            grdStatus.DataSource = null;
            
            deLabel2.Text = "Maximum running serail no : " +_GetTotalBundleEntries().Rows.Count.ToString();
            INIFile ini = new INIFile();
            string iniPath = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Remove(0, 6) + "\\" + "IhConfiguration.ini";
            location = ini.ReadINI("LOCCONFIG", "LOC", string.Empty, iniPath);
        }

        private void deButton1_Click(object sender, EventArgs e)
        {
            grdStatus.DataSource = null;
            validateFrom();
            validateTo();
            if (Convert.ToInt32(deTextBox1.Text) >= Convert.ToInt32(deTextBox29.Text))
            {
                init();
            }
            else
            {
                MessageBox.Show("No record found...");
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
        public System.Data.DataTable _GetTotalBundleEntries()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select a.proj_code, a.bundle_key, date_format(a.inward_date,'%M-%Y'), a.bundle_name, a.bundle_no, b.filename, " +
                         "date_format(a.outward_date,'%M-%Y') , b.status, b.running_serial " +
                         "from bundle_master a, metadata_entry b where " +
                         "a.proj_code = b.proj_code and  " +
                         " a.bundle_key = b.bundle_key order by b.running_serial";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public System.Data.DataTable _GetBundleEntries()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select a.proj_code, a.bundle_key, date_format(a.inward_date,'%M-%Y'), a.bundle_name, a.bundle_no, b.filename, " +
                         "date_format(a.outward_date,'%M-%Y') , b.status, b.running_serial " +
                         "from bundle_master a, metadata_entry b where " +
                         "a.proj_code = b.proj_code and b.running_serial >='"+ deTextBox29.Text + "' and b.running_serial <= '"+ deTextBox1.Text + "' and " +
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

        private void grdStatus_MouseClick(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                if (grdStatus.Rows.Count > 0)
                {
                    cmsDeeds.Show(Cursor.Position);
                }
            }
        }
        private void SaveDataGridData(string strData, string strFileName)
        {
            FileStream fs;
            TextWriter tw = null;
            try
            {
                if (File.Exists(strFileName))
                {
                    fs = new FileStream(strFileName, FileMode.Open);
                }
                else
                {
                    fs = new FileStream(strFileName, FileMode.Create);
                }
                tw = new StreamWriter(fs);
                tw.Write(strData);
            }
            finally
            {
                if (tw != null)
                {
                    tw.Flush();
                    tw.Close();
                }
            }
        }
        private string TableToString(System.Data.DataTable dt)
        {
            string strData = string.Empty;
            string sep = string.Empty;
            if (dt.Rows.Count > 0)
            {
                foreach (DataColumn c in dt.Columns)
                {
                    if (c.DataType != typeof(System.Guid) &&
                    c.DataType != typeof(System.Byte[]))
                    {
                        strData += sep + c.ColumnName;
                        sep = ",";
                    }
                }
                strData += "\r\n";
                foreach (DataRow r in dt.Rows)
                {
                    sep = string.Empty;
                    foreach (DataColumn c in dt.Columns)
                    {
                        if (c.DataType != typeof(System.Guid) &&
                        c.DataType != typeof(System.Byte[]))
                        {
                            if (!Convert.IsDBNull(r[c.ColumnName]))

                                strData += sep +
                                '"' + r[c.ColumnName].ToString().Replace("\n", " ").Replace(",", "-") + '"';

                            else

                                strData += sep + "";
                            sep = ",";

                        }
                    }
                    strData += "\r\n";

                }
            }
            else
            {
                //strData += "\r\n---> Table was empty!";
                foreach (DataColumn c in dt.Columns)
                {
                    if (c.DataType != typeof(System.Guid) &&
                    c.DataType != typeof(System.Byte[]))
                    {
                        strData += sep + c.ColumnName;
                        sep = ",";
                    }
                }
                strData += "\r\n";
            }
            return strData;
        }
        private void tabTextFile(DataGridView dg, string filename)
        {
            DataSet ds = new DataSet();
            System.Data.DataTable dtSource = null;
            System.Data.DataTable dt = new System.Data.DataTable();
            DataRow dr;
            if (dg.DataSource != null)
            {
                if (dg.DataSource.GetType() == typeof(DataSet))
                {
                    DataSet dsSource = (DataSet)dg.DataSource;
                    if (dsSource.Tables.Count > 0)
                    {
                        string strTables = string.Empty;
                        foreach (System.Data.DataTable dt1 in dsSource.Tables)
                        {
                            strTables += TableToString(dt1);
                            strTables += "\r\n\r\n";
                        }
                        if (strTables != string.Empty)
                            SaveDataGridData(strTables, filename);
                    }
                }
                else
                {
                    if (dg.DataSource.GetType() == typeof(System.Data.DataTable))
                        dtSource = (System.Data.DataTable)dg.DataSource;
                    if (dtSource != null)

                        SaveDataGridData(TableToString(dtSource), filename);
                }
            }
        }
        private void updateDeedToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (grdStatus.Rows.Count > 0)
            {
                GC.Collect();
                GC.WaitForPendingFinalizers();
                System.Windows.Forms.Application.DoEvents();

                Microsoft.Office.Interop.Excel._Application app = new Microsoft.Office.Interop.Excel.Application();
                Microsoft.Office.Interop.Excel._Workbook workbook = app.Workbooks.Add(Type.Missing);

                Microsoft.Office.Interop.Excel._Worksheet worksheet = null;

                app.Visible = false;

                worksheet = (Microsoft.Office.Interop.Excel._Worksheet)workbook.Sheets["Sheet1"];


                worksheet = (Microsoft.Office.Interop.Excel._Worksheet)workbook.ActiveSheet;

                worksheet.Name = "Detailed Dashboard Report";

                worksheet.Cells[1, 9] = "Detailed Dashboard Report";
                Range range44 = worksheet.get_Range("I1");
                range44.Interior.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.YellowGreen);

                worksheet.Rows.AutoFit();
                worksheet.Columns.AutoFit();




                Range range1 = worksheet.get_Range("B3", "AC3");
                range1.Borders.Color = ColorTranslator.ToOle(Color.Black);

                for (int i = 1; i < grdStatus.Columns.Count + 1; i++)
                {


                    Range range2 = worksheet.get_Range("B3", "AC3");
                    range2.Borders.Color = ColorTranslator.ToOle(Color.Black);
                    range2.EntireRow.AutoFit();
                    range2.EntireColumn.AutoFit();
                    worksheet.Cells[3, i + 1] = grdStatus.Columns[i - 1].HeaderText;
                }
                using (Process p = Process.GetCurrentProcess())
                {
                    for (int i = 0; i < grdStatus.Rows.Count; i++)
                    {
                        GC.Collect();
                        GC.WaitForPendingFinalizers();
                        System.Windows.Forms.Application.DoEvents();

                        for (int j = 0; j < grdStatus.Columns.Count; j++)
                        {
                            Range range3 = worksheet.Cells;
                            //range3.Borders.Color = ColorTranslator.ToOle(Color.Black);
                            range3.EntireRow.AutoFit();
                            range3.EntireColumn.AutoFit();
                            worksheet.Cells[i + 4, j + 2] = grdStatus.Rows[i].Cells[j].Value.ToString();
                            worksheet.Cells[i + 4, j + 2].Borders.Color = ColorTranslator.ToOle(Color.Black);

                        }
                        System.Windows.Forms.Application.DoEvents();

                    }
                }

                string namexls = "Detailed_Dashboard_Report" + ".xls";
                string path = Path.GetDirectoryName(System.Windows.Forms.Application.ExecutablePath);
                sfdUAT.Filter = "Xls files (*.xls)|*.xls";
                sfdUAT.FilterIndex = 2;
                sfdUAT.RestoreDirectory = true;
                sfdUAT.FileName = namexls;
                sfdUAT.ShowDialog();

                workbook.SaveAs(sfdUAT.FileName, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlExclusive, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                //tabTextFile(grdStatus, sfdUAT.FileName);

                app.Quit();
            }
        }
        public bool validateFrom()
        {
            bool retval = false;
            if (deTextBox29.Text != "")
            {

                bool res = System.Text.RegularExpressions.Regex.IsMatch(deTextBox29.Text, "[^0-9]");
                if (res != true && deTextBox29.Text.Substring(0, 1) != "0")
                {
                    retval = true;
                }
                else
                {
                    retval = false;
                    MessageBox.Show("Please input Valid no...");
                    deTextBox29.Focus();
                    return retval;
                }
            }
            else
            {
                retval = false;
                MessageBox.Show("Please input Valid no...");
                deTextBox29.Focus();
                return retval;
            }
            return retval;
        }
        public bool validateTo()
        {
            bool retval = false;
            if (deTextBox1.Text != "")
            {

                bool res = System.Text.RegularExpressions.Regex.IsMatch(deTextBox1.Text, "[^0-9]");
                if (res != true && deTextBox1.Text.Substring(0, 1) != "0")
                {
                    retval = true;
                }
                else
                {
                    retval = false;
                    MessageBox.Show("Please input Valid no...");
                    deTextBox1.Focus();
                    return retval;
                }
            }
            else
            {
                retval = false;
                MessageBox.Show("Please input Valid no...");
                deTextBox1.Focus();
                return retval;
            }
            return retval;
        }
        private void deTextBox29_Leave(object sender, EventArgs e)
        {
            validateFrom();
        }

        private void deTextBox1_Leave(object sender, EventArgs e)
        {
            validateTo();
        }
    }
}
