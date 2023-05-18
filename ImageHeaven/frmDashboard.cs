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

namespace ImageHeaven
{
    public partial class frmDashboard : Form
    {
        OdbcConnection sqlCon = null;

        

        public frmDashboard()
        {
            InitializeComponent();
        }

        public frmDashboard(OdbcConnection prmCon)
        {
            InitializeComponent();
            sqlCon = prmCon;
        }

        private void frmDashboard_Load(object sender, EventArgs e)
        {
            

            grdStatus.DataSource = null;
        }

        private void deButton1_Click(object sender, EventArgs e)
        {
            grdStatus.DataSource = null;



            init();
        }
        public System.Data.DataTable _GetBundleEntries()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select count(*) from bundle_master " ;
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public System.Data.DataTable _GetFileEntries()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select count(*) from case_file_master ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public System.Data.DataTable _GetImageEntries()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select count(*) from image_master " +
                         "where status<> 29";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public System.Data.DataTable _GetEntriesScan()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select count(*) from transaction_log where scanned_user <> '' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public System.Data.DataTable _GetEntriesQC()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select count(*) from transaction_log where qc_user <> ''  ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public System.Data.DataTable _GetEntriesIndex()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select count(*) from transaction_log where index_user <> '' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public System.Data.DataTable _GetEntriesFqc()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select count(*) from transaction_log where fqc_user <> '' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public System.Data.DataTable _GetEntriesAudit()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select count(*) from lic_qa_log a, bundle_master b " +
                         "where (a.qa_status = 0 or a.qa_status = 1 or a.qa_status = 2) and " +
                         "a.proj_key = b.proj_code and a.batch_key = b.bundle_key";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public System.Data.DataTable _GetImagesAudit()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select count(*) from lic_qa_log a, image_master b " +
                         "where (a.qa_status = 0 or a.qa_status = 1 or a.qa_status = 2) and " +
                         "a.proj_key = b.proj_key and a.batch_key = b.batch_key and a.Policy_number = b.policy_number and b.status <> 29";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public System.Data.DataTable _GetEntriesExport()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select count(*) from metadata_entry a, bundle_master b "+
                         "where " +
                         "a.proj_code = b.proj_code and a.bundle_key = b.bundle_key and b.status >= 7 and a.status = 'Exported'";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public System.Data.DataTable _GetImagesExport()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select count(*) from metadata_entry a, bundle_master b, image_master c "+
                         "where " +
                         "a.proj_code = b.proj_code and a.bundle_key = b.bundle_key and b.proj_code = c.proj_key and " +
                         "b.bundle_key = c.batch_key and a.proj_code = c.proj_key and a.bundle_key and c.batch_key "+
                         "and a.filename = c.policy_number and b.status >= 7 and a.status = 'Exported' and c.status <> 29";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public System.Data.DataTable _GetImagesOutward()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select SUM(a.outward_image_count) from case_file_master a, bundle_master b where "+
                         " a.proj_code = b.proj_code and " +
                         "a.bundle_key and b.bundle_key ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }

        private void init()
        {

            System.Data.DataTable DtTemp = new System.Data.DataTable();
            DtTemp.Columns.Add("Row Labels");
            DtTemp.Columns.Add("Distinct Count of Bundle Number");
            DtTemp.Columns.Add("Count of File Name");
            DtTemp.Columns.Add("Sum of Image Count");
            DtTemp.Columns.Add("Count of Scan Completed");
            DtTemp.Columns.Add("Count of QC Completed");
            DtTemp.Columns.Add("Count of Indexing Completed");
            DtTemp.Columns.Add("Count of FQC Completed");
            DtTemp.Columns.Add("Count of UAT Completed");
            DtTemp.Columns.Add("Sum of UAT Images");
            DtTemp.Columns.Add("Count of OCR & Exported file");
            DtTemp.Columns.Add("Sum of OCR & Exported Images");
            DtTemp.Columns.Add("Count of Delivered to CHC for DMS upload");
            DtTemp.Columns.Add("Count of Delivered Images");
            DtTemp.Columns.Add("Count of Uploaded Files");
            DtTemp.Columns.Add("Count of Uploaded Images");
            DtTemp.Columns.Add("Count of Outward Images");
            DtTemp.Columns.Add("Count of Rise invoice");

            DtTemp.Rows.Add(" ", _GetBundleEntries().Rows[0][0].ToString(), _GetFileEntries().Rows[0][0].ToString(),
                _GetImageEntries().Rows[0][0].ToString(), _GetEntriesScan().Rows[0][0].ToString(), _GetEntriesQC().Rows[0][0].ToString(),
                _GetEntriesIndex().Rows[0][0].ToString(), _GetEntriesFqc().Rows[0][0].ToString(), _GetEntriesAudit().Rows[0][0].ToString(),
                _GetImagesAudit().Rows[0][0].ToString(), _GetEntriesExport().Rows[0][0].ToString(), _GetImagesExport().Rows[0][0].ToString(),
                "","","","", _GetImagesOutward().Rows[0][0].ToString(),"");



            grdStatus.DataSource = DtTemp;

            FormatDataGridView();

            this.grdStatus.Refresh();

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

        private void updateDeedToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (grdStatus.Rows.Count > 0)
            {
                Microsoft.Office.Interop.Excel._Application app = new Microsoft.Office.Interop.Excel.Application();
                Microsoft.Office.Interop.Excel._Workbook workbook = app.Workbooks.Add(Type.Missing);

                Microsoft.Office.Interop.Excel._Worksheet worksheet = null;

                app.Visible = false;

                worksheet = (Microsoft.Office.Interop.Excel._Worksheet)workbook.Sheets["Sheet1"];


                worksheet = (Microsoft.Office.Interop.Excel._Worksheet)workbook.ActiveSheet;

                worksheet.Name = "Summary Dashboard Report";

                worksheet.Cells[1, 4] = "Summary Dashboard Report";
                Range range44 = worksheet.get_Range("D1");
                range44.Interior.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.YellowGreen);

                worksheet.Rows.AutoFit();
                worksheet.Columns.AutoFit();




                Range range1 = worksheet.get_Range("B3", "S3");
                range1.Borders.Color = ColorTranslator.ToOle(Color.Black);

                for (int i = 1; i < grdStatus.Columns.Count + 1; i++)
                {


                    Range range2 = worksheet.get_Range("B3", "S3");
                    range2.Borders.Color = ColorTranslator.ToOle(Color.Black);
                    range2.EntireRow.AutoFit();
                    range2.EntireColumn.AutoFit();
                    worksheet.Cells[3, i + 1] = grdStatus.Columns[i - 1].HeaderText;
                }

                for (int i = 0; i < grdStatus.Rows.Count; i++)
                {
                    for (int j = 0; j < grdStatus.Columns.Count; j++)
                    {
                        Range range3 = worksheet.Cells;
                        //range3.Borders.Color = ColorTranslator.ToOle(Color.Black);
                        range3.EntireRow.AutoFit();
                        range3.EntireColumn.AutoFit();
                        worksheet.Cells[i + 4, j + 2] = grdStatus.Rows[i].Cells[j].Value.ToString();
                        worksheet.Cells[i + 4, j + 2].Borders.Color = ColorTranslator.ToOle(Color.Black);

                    }
                }


                string namexls = "Summary_Dashboard_Report" + ".xls";
                string path = Path.GetDirectoryName(System.Windows.Forms.Application.ExecutablePath);
                sfdUAT.Filter = "Xls files (*.xls)|*.xls";
                sfdUAT.FilterIndex = 2;
                sfdUAT.RestoreDirectory = true;
                sfdUAT.FileName = namexls;
                sfdUAT.ShowDialog();

                workbook.SaveAs(sfdUAT.FileName, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlExclusive, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);

                app.Quit();
            }
        }
    }
}
