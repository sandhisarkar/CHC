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
    public partial class frmDetailDashboard : Form
    {
        OdbcConnection sqlCon = null;

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
        }

        private void deButton1_Click(object sender, EventArgs e)
        {
            grdStatus.DataSource = null;

            init();
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
        public System.Data.DataTable _GetBundleEntries()
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            string sql = "select proj_code, bundle_key, date_format(inward_date,'%M-%Y'), bundle_name, bundle_no from bundle_master";
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(dt);
            return dt;
        }
        private void init()
        {
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
    }
}
