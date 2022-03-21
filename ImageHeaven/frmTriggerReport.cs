using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Windows.Forms;
using System.Drawing.Drawing2D;
using System.Drawing.Text;
using System.ComponentModel;
using System.Runtime.InteropServices;
using System.IO;
using NovaNet.Utils;
using NovaNet.wfe;
using System.Data;
using System.Data.Odbc;
using System.Collections;
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
    public partial class frmTriggerReport : Form
    {

        OdbcConnection sqlCon = null;
        public string stDate;
        public string endDate;
        public Credentials crd = new Credentials();

        public frmTriggerReport()
        {
            InitializeComponent();
        }

        public frmTriggerReport(OdbcConnection prmCon, Credentials prmCrd)
        {
            InitializeComponent();

            sqlCon = prmCon;

            crd = prmCrd;
        }

        private void frmTriggerReport_Load(object sender, EventArgs e)
        {
            stDate = DateTime.Now.ToString("yyyy-MM-dd");
            endDate = DateTime.Now.ToString("yyyy-MM-dd");

            dateTimePicker1.Text = stDate;
            dateTimePicker1.Format = DateTimePickerFormat.Custom;
            dateTimePicker1.CustomFormat = "yyyy-MM-dd";
            dateTimePicker1.Value = Convert.ToDateTime(stDate.ToString());

            dateTimePicker2.Text = endDate;
            dateTimePicker2.Format = DateTimePickerFormat.Custom;
            dateTimePicker2.CustomFormat = "yyyy-MM-dd";
            dateTimePicker2.Value = Convert.ToDateTime(endDate.ToString());
        }

        public System.Data.DataTable _GetEntriesTrigger()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select distinct date_format(created_dttm,'%Y-%m-%d') as 'Triggering Date',created_by as 'Triggered By' from tbl_trigger where date_format(created_dttm,'%Y-%m-%d') >= '" + dateTimePicker1.Text + "' and date_format(created_dttm,'%Y-%m-%d') <= '" + dateTimePicker2.Text + "' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        public string _GetFileCountScan(string date, string user)
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select SUM(img_count) from tbl_trigger where date_format(created_dttm,'%Y-%m-%d') = '" + date + "' and created_by = '" + user + "' ";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt.Rows[0][0].ToString();
        }
        private void initScan()
        {
            System.Data.DataTable Dt = new System.Data.DataTable();
            Dt = _GetEntriesTrigger();

            //Dt.Columns.Add("Number of Files");
            Dt.Columns.Add("Number of Images");



            for (int i = 0; i < Dt.Rows.Count; i++)
            {
                Dt.Rows[i][2] = _GetFileCountScan(Dt.Rows[i][0].ToString(), Dt.Rows[i][1].ToString());
                //Dt.Rows[i][5] = _GetEntryCount(Dt.Rows[i][0].ToString(), Dt.Rows[i][1].ToString());
                //Dt.Rows[i][3] = _GetImageCountScan(Dt.Rows[i][0].ToString(), Dt.Rows[i][1].ToString());
            }

            grdStatus.DataSource = Dt;


            FormatDataGridView();

            this.grdStatus.Refresh();

            if (Dt.Rows.Count > 0)
            {
                deButton20.Enabled = true;
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

        private void deButton1_Click(object sender, EventArgs e)
        {
            initScan();
        }

        private void deButton21_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void deButton20_Click(object sender, EventArgs e)
        {
            Microsoft.Office.Interop.Excel._Application app = new Microsoft.Office.Interop.Excel.Application();
            Microsoft.Office.Interop.Excel._Workbook workbook = app.Workbooks.Add(Type.Missing);

            Microsoft.Office.Interop.Excel._Worksheet worksheet = null;

            app.Visible = false;

            worksheet = (Microsoft.Office.Interop.Excel._Worksheet)workbook.Sheets["Sheet1"];


            worksheet = (Microsoft.Office.Interop.Excel._Worksheet)workbook.ActiveSheet;

            worksheet.Name = "Scan Data Transfer Report";

            worksheet.Cells[1, 3] = "Scan Data Transfer Report";
            Range range44 = worksheet.get_Range("C1");
            range44.Interior.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.YellowGreen);

            worksheet.Rows.AutoFit();
            worksheet.Columns.AutoFit();


            //worksheet.Cells[3, 1] = "User Role : " + grdStatus.Columns[1].HeaderText.ToString();
            //Range range43 = worksheet.get_Range("A3");
            //range43.Interior.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Yellow);
            //worksheet.Rows.AutoFit();
            //worksheet.Columns.AutoFit();

            worksheet.Cells[4, 1] = "Time : " + dateTimePicker1.Text + " - " + dateTimePicker2.Text;
            Range range33 = worksheet.get_Range("A4");
            range33.Interior.Color = System.Drawing.ColorTranslator.ToOle(System.Drawing.Color.Yellow);
            worksheet.Rows.AutoFit();
            worksheet.Columns.AutoFit();

            Range range = worksheet.get_Range("A4", "A4");
            range.Borders.Color = ColorTranslator.ToOle(Color.Black);


            Range range1 = worksheet.get_Range("A6", "C6");
            range1.Borders.Color = ColorTranslator.ToOle(Color.Black);

            for (int i = 1; i < grdStatus.Columns.Count + 1; i++)
            {


                Range range2 = worksheet.get_Range("A6", "C6");
                range2.Borders.Color = ColorTranslator.ToOle(Color.Black);
                range2.EntireRow.AutoFit();
                range2.EntireColumn.AutoFit();
                worksheet.Cells[6, i] = grdStatus.Columns[i - 1].HeaderText;
            }

            for (int i = 0; i < grdStatus.Rows.Count; i++)
            {
                for (int j = 0; j < grdStatus.Columns.Count; j++)
                {
                    Range range3 = worksheet.Cells;
                    //range3.Borders.Color = ColorTranslator.ToOle(Color.Black);
                    range3.EntireRow.AutoFit();
                    range3.EntireColumn.AutoFit();
                    worksheet.Cells[i + 7, j + 1] = grdStatus.Rows[i].Cells[j].Value.ToString();
                    worksheet.Cells[i + 7, j + 1].Borders.Color = ColorTranslator.ToOle(Color.Black);

                }

            }

            string namexls = "Scan_Data_Transfer_Report" + ".xls";
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
