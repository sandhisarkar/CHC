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

namespace ImageHeaven
{
    public partial class frmBundleUpload : Form
    {

        Credentials crd = new Credentials();

        NovaNet.Utils.dbCon dbcon;
        OdbcConnection sqlCon = null;
        private OdbcDataAdapter sqlAdap = null;
        eSTATES[] state;
        DataSet dsdeed = null;
        public static string projKey;
        public static string bundleKey;
        public static NovaNet.Utils.exLog.Logger exMailLog = new NovaNet.Utils.exLog.emailLogger("./errLog.log", NovaNet.Utils.exLog.LogLevel.Dev, Constants._MAIL_TO, Constants._MAIL_FROM, Constants._SMTP);
        public static NovaNet.Utils.exLog.Logger exTxtLog = new NovaNet.Utils.exLog.txtLogger("./errLog.log", NovaNet.Utils.exLog.LogLevel.Dev);

        iTextSharp.text.Image i2;
        System.Drawing.Image image3;
        int j;
        Paragraph para;
        Paragraph para1;
        Paragraph para2;
        int flag = 0;
        int flag1 = 0;
        int flag2 = 0;

        public Bitmap ConvertTextToImage(string txt, string fontname, int fontsize, Color bgcolor, Color fcolor, int width, int Height)
        {
            Bitmap bmp = new Bitmap(width, Height);
            using (Graphics graphics = Graphics.FromImage(bmp))
            {

                System.Drawing.Font font = new System.Drawing.Font(fontname, fontsize);
                graphics.FillRectangle(new SolidBrush(bgcolor), 0, 0, bmp.Width, bmp.Height);
                graphics.DrawString(txt, font, new SolidBrush(fcolor), 0, 0);
                graphics.Flush();
                font.Dispose();
                graphics.Dispose();


            }
            return bmp;
        }



        public frmBundleUpload()
        {
            InitializeComponent();
        }

        public frmBundleUpload(OdbcConnection prmCon,Credentials prmCrd)
		{
			//
			// The InitializeComponent() call is required for Windows Forms designer support.
			//
			InitializeComponent();
            sqlCon = prmCon;
            crd = prmCrd; 
			this.Text = "B'Zer - Calcutta High Court - Bundle Upload";
			
			//
			// TODO: Add constructor code after the InitializeComponent() call.
			//
		}

        private void frmBundleUpload_Load(object sender, EventArgs e)
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

            string sql = "select a.bundle_key, a.bundle_code from bundle_master a, project_master b where a.proj_code = b.proj_key and a.proj_code = '" + cmbProject.SelectedValue.ToString() + "' and a.status = '0'";

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

        private DataSet ReadDatabase()
        {
            DataSet ds = new DataSet();
            dsdeed = new DataSet();
            try
            {

                string sql = "select case_file_no,filename,case_status,case_nature,case_type,case_year from case_file_master where proj_code = '" + cmbProject.SelectedValue.ToString() + "' and bundle_key = '" + cmbBundle.SelectedValue.ToString() + "' ";


                OdbcDataAdapter odap = new OdbcDataAdapter(sql, sqlCon);
                odap.Fill(ds);
                odap.Fill(dsdeed);

            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message.ToString());
                statusStrip1.Text = ex.Message.ToString();
            }
            return ds;
        }
        public string GetBundleName(int prmProjectKey, int prmBundleKey)
        {
            string sqlStr = null;
            string projName = null;

            DataSet projDs = new DataSet();

            try
            {
                sqlStr = "select bundle_code,bundle_no from bundle_master where proj_code= '" + prmProjectKey + "' and bundle_key = '" + prmBundleKey + "' ";
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(projDs);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();
                
                exMailLog.Log(ex);
            }
            if (projDs.Tables[0].Rows.Count > 0)
            {
                projName = projDs.Tables[0].Rows[0]["bundle_code"].ToString();
            }
            else
                projName = string.Empty;
            return projName;
        }
        private void cmdsearch_Click(object sender, EventArgs e)
        {
            if(cmbProject.Text != "" && cmbBundle.Text != "")
            {
                grdCsv.DataSource = null;
                grdCsv.DataSource = ReadDatabase().Tables[0];
                if (grdCsv.Rows.Count > 0)
                {
                    //FormatDataGridView();
                    cmdExport.Enabled = true;
                    for (int i = 0; i < grdCsv.Rows.Count; i++)
                    {
                        lstImage.Items.Add(ReadDatabase().Tables[0].Rows[i][1]);
                    }
                }
                else
                {
                    cmdExport.Enabled = false;
                }
            }
        }

        private bool insertIntoDB(string pk, string bk, string bn)
        {
            bool commitBol = true;




            string sqlStr = string.Empty;

            OdbcCommand sqlCmd = new OdbcCommand();

            sqlStr = @"insert into barcode_log(proj_key,bundle_key,bundle_no,created_dttm,created_by) values('" + pk + "','" + bk + "','" + bn + "','" + crd.created_dttm + "','" + crd.created_by + "')";

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

        public DataTable GetFileDetails(string proj, string bundle, string fileName)
        {
            string sql = "select b.case_type,b.case_file_no,b.case_year,a.establishment from bundle_master a, case_file_master b where a.proj_code = b.proj_code and a.bundle_key = b.bundle_key and b.proj_code = '" + proj + "' and b.bundle_key = '" + bundle + "' and b.filename = '" + fileName + "'";
            DataTable ds = new DataTable();
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(ds);
            return ds;
        }
        public string GetFileCount(int prmProjectKey, int prmBundleKey)
        {
            string sqlStr = null;
            string projName = null;

            DataSet projDs = new DataSet();

            try
            {
                sqlStr = "select Count(*) from case_file_master where proj_code= '" + prmProjectKey + "' and bundle_key = '" + prmBundleKey + "' ";
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(projDs);
            }
            catch (Exception ex)
            {
                sqlAdap.Dispose();
                
                exMailLog.Log(ex);
            }
            if (projDs.Tables[0].Rows.Count > 0)
            {
                projName = projDs.Tables[0].Rows[0][0].ToString();
            }
            else
                projName = string.Empty;
            return projName;
        }

        
        public DataTable pendingBundle()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            string sql = "select distinct bundle_key, bundle_code from bundle_master where status <> '0' and bundle_key NOT IN (select distinct bundle_key from barcode_log)";

            OdbcDataAdapter odap = new OdbcDataAdapter(sql, sqlCon);
            odap.Fill(dt);

            return dt;
        }
        private void FormatDataGridView()
        {
            //Format the Data Grid View
            grdCsv.Columns[0].Visible = false;
            grdCsv.Columns[1].Visible = false;
            grdCsv.Columns[2].Visible = false;            
            grdCsv.Columns[9].Visible = false;
            grdCsv.Columns[10].Visible = false;
            grdCsv.Columns[11].Visible = false;
            grdCsv.Columns[12].Visible = false;
            grdCsv.Columns[13].Visible = false;
            //dtGrdVol.Columns[2].Visible = false;
            //Format Colors


        }

        private void cmbProject_Leave(object sender, EventArgs e)
        {
            populateBundle();
        }

        public DataTable _GetGenCount(string proj, string bundle)
        {
            string sql = "select * from barcode_log  where proj_key = '" + proj + "' and bundle_key = '" + bundle + "' ";
            DataTable ds = new DataTable();
            OdbcCommand cmd = new OdbcCommand(sql, sqlCon);
            OdbcDataAdapter odap = new OdbcDataAdapter(cmd);
            odap.Fill(ds);
            return ds;
        }

        private void cmdExport_Click(object sender, EventArgs e)
        {
            cmdExport.Enabled = false;
            DialogResult dlg;
            if ((cmbProject.Text == "" || cmbProject.Text == null) || (cmbBundle.Text == "" || cmbBundle.Text == null))
            {
                MessageBox.Show("Please select proper Project or Bundle...");
                cmbProject.Focus();
                cmbProject.Select();
            }
            else
            {
                
                projKey = cmbProject.SelectedValue.ToString();
                
                bundleKey = cmbBundle.SelectedValue.ToString();

                if(projKey != "" || projKey != null || bundleKey != "" || bundleKey != null)
                {
                    //this.Hide();
                    statusStrip1.Items.Add("Status: Wait While Uploading the Database......");
                    bool updatebundle = updateBundle();
                    bool updatecasefile = updateCaseFile();

                    if (updatebundle == true && updatecasefile == true)
                    {
                        dlg = MessageBox.Show(this, "Are you sure, you want to generate barcode for this bundle?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                        if (dlg == DialogResult.Yes)
                        {

                            if (_GetGenCount(projKey, bundleKey).Rows.Count > 0)
                            {
                                cmdExport.Enabled = false;

                                string expFolder = "C:\\";
                                bool isDeleted = false;
                                //check if folder is exists or not
                                if (Directory.Exists(expFolder + "\\Barcode\\" + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey))) && isDeleted == false)
                                {
                                    Directory.Delete(expFolder + "\\Barcode\\" + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey)), true);
                                }

                                if (lstImage.Items.Count > 0)
                                {
                                    Application.DoEvents();
                                    //bundle folder creation
                                    if (!Directory.Exists(expFolder + "\\Barcode\\" + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey))))
                                    {
                                        Directory.CreateDirectory(expFolder + "\\Barcode\\" + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey)));
                                    }
                                    String[] imageList = new String[lstImage.Items.Count];
                                    //checking each filename
                                    for (int x = 0; x < lstImage.Items.Count; x++)
                                    {
                                        string filename = lstImage.Items[x].ToString();


                                        string str1 = "HIGH COURT OF CALCUTTA";
                                        string casetype = GetFileDetails(projKey, bundleKey, filename).Rows[0][0].ToString();
                                        string caseno = GetFileDetails(projKey, bundleKey, filename).Rows[0][1].ToString();
                                        string caseyear = GetFileDetails(projKey, bundleKey, filename).Rows[0][2].ToString();
                                        string est = GetFileDetails(projKey, bundleKey, filename).Rows[0][3].ToString();
                                        string entity = null;
                                        if (est == "Appellate")
                                        {
                                            entity = "AS";
                                        }
                                        else
                                        {
                                            entity = "OS";
                                        }
                                        string str2 = "File No: " + casetype + "/" + caseno + "/" + caseyear + "/" + entity;
                                        string str3 = casetype + "/" + caseno + "/" + caseyear + "/" + entity;
                                        label2.Text = str2;
                                        label1.Text = str1;
                                        System.Drawing.Image img1 = ConvertTextToImage(str2, "calibri", 9, Color.Transparent, Color.Black, label2.Width, label2.Height);
                                        //Image img4 = ConvertTextToImage("Nevaeh Technology", "calibri", 10, Color.Transparent, Color.Black, textBox1.Width, textBox1.Height);
                                        System.Drawing.Image img4 = ConvertTextToImage(str1, "calibri", 9, Color.Transparent, Color.Black, label1.Width, label1.Height + 5);
                                        //Zen.Barcode.Code128BarcodeDraw barcode = Zen.Barcode.BarcodeDrawFactory.Code128WithChecksum;
                                        Zen.Barcode.Code128BarcodeDraw barcode = Zen.Barcode.BarcodeDrawFactory.Code128WithChecksum;
                                        //pictureBox1.Image = barcode.Draw(dt1.Rows[i][0].ToString(), 60);
                                        System.Drawing.Image img2 = barcode.Draw(str3, 50);

                                        int height = img1.Height + img2.Height + img4.Height;
                                        int width = Math.Max(img1.Width, img2.Width);
                                        Bitmap img3 = new Bitmap(width, height);

                                        Bitmap image1 = new Bitmap(img1);
                                        Bitmap image2 = new Bitmap(img2);
                                        Bitmap image4 = new Bitmap(img4);
                                        int X = image2.Width;

                                        using (Graphics g = Graphics.FromImage(img3))
                                        {


                                            g.DrawImage(image4, (image2.Width - image4.Width) / 2, 0);
                                            g.DrawImage(image2, 0, image4.Height);
                                            g.DrawImage(image1, (image2.Width - image1.Width) / 2, image2.Height + image4.Height);
                                        }

                                        Bitmap bitmap = new Bitmap(img3);

                                        image3 = (System.Drawing.Image)bitmap;
                                        //image3.Save(@"D\image5.tiff", System.Drawing.Imaging.ImageFormat.Tiff);
                                        image3.Save(expFolder + "\\Barcode\\" + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey)) + "\\" + x + ".tiff", System.Drawing.Imaging.ImageFormat.Tiff);

                                        j = x;
                                        string imageURL = expFolder + "\\Barcode\\" + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey)) + "\\" + j + ".tiff";
                                        imageList[x] = imageURL;

                                    }
                                    if (lstImage.Items.Count > 36)
                                    {

                                        sfdUAT.Filter = "Pdf files (*.pdf)|*.pdf";
                                        sfdUAT.FilterIndex = 2;
                                        sfdUAT.RestoreDirectory = true;
                                        sfdUAT.FileName = cmbBundle.Text;
                                        sfdUAT.ShowDialog();

                                        FileStream fs = new FileStream(sfdUAT.FileName, FileMode.Create, FileAccess.Write, FileShare.None);
                                        Document doc = new Document();
                                        PdfWriter writer = PdfWriter.GetInstance(doc, fs);
                                        doc.SetPageSize(iTextSharp.text.PageSize.A4);
                                        PdfPTable table = new PdfPTable(7);
                                        table.TotalWidth = 500f;
                                        table.LockedWidth = true;
                                        float[] widths = new float[] { 4f, 1.66f, 4f, 1.66f, 4f, 1.66f, 4f };

                                        table.SetWidths(widths);
                                        table.HorizontalAlignment = 0;

                                        table.SpacingBefore = 10f;
                                        table.SpacingAfter = 5f;
                                        PdfPTable table1 = new PdfPTable(7);
                                        table1.TotalWidth = 500f;
                                        table1.LockedWidth = true;
                                        float[] widths1 = new float[] { 4f, 1.66f, 4f, 1.66f, 4f, 1.66f, 4f };

                                        table1.SetWidths(widths1);
                                        table1.HorizontalAlignment = 0;

                                        table1.SpacingBefore = 10f;
                                        table1.SpacingAfter = 10f;
                                        doc.Open();
                                        BaseFont bf = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
                                        iTextSharp.text.Font font = new iTextSharp.text.Font(bf, 8, iTextSharp.text.Font.NORMAL);
                                        //DirectoryInfo dir_info = new DirectoryInfo(folderPath);
                                        //string directory = dir_info.Name;
                                        para = new Paragraph("Bundle name: " + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey)) + ", No. of Barcode: " + lstImage.Items.Count + " ,Generated : " + _GetGenCount(projKey, bundleKey).Rows.Count + 1 + " times", font);

                                        para.Alignment = Element.ALIGN_RIGHT;


                                        if (lstImage.Items.Count % 4 == 0)
                                        {
                                            int k = 0;
                                            for (int i = 0; i < lstImage.Items.Count / 4; i++)
                                            {
                                                iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[i]);
                                                jpg1.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar = new PdfPCell(jpg1);
                                                bar.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar);

                                                k++;


                                                PdfPCell empty = new PdfPCell(new Phrase("  "));
                                                empty.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty);


                                                iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[i]);
                                                jpg2.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar1 = new PdfPCell(jpg2);
                                                bar1.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar1);

                                                k++;


                                                PdfPCell empty8 = new PdfPCell(new Phrase("  "));
                                                empty8.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty8);


                                                iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[i]);
                                                jpg3.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar2 = new PdfPCell(jpg3);
                                                bar2.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar2);
                                                k++;


                                                PdfPCell empty9 = new PdfPCell(new Phrase("  "));
                                                empty9.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty9);

                                                iTextSharp.text.Image jpg4 = iTextSharp.text.Image.GetInstance(imageList[i]);
                                                jpg4.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar3 = new PdfPCell(jpg4);
                                                bar3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar3);
                                                k++;

                                                PdfPCell empty14 = new PdfPCell(new Phrase("  "));
                                                empty14.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty14);

                                                PdfPCell empty15 = new PdfPCell(new Phrase("  "));
                                                empty15.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty15);

                                                PdfPCell empty16 = new PdfPCell(new Phrase("  "));
                                                empty16.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty16);


                                                PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                empty3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty3);


                                                PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                empty4.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty4);

                                                PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                empty5.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty5);

                                                PdfPCell empty10 = new PdfPCell(new Phrase("  "));
                                                empty10.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty10);


                                                PdfPCell empty11 = new PdfPCell(new Phrase("  "));
                                                empty11.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty11);

                                                PdfPCell empty12 = new PdfPCell(new Phrase("  "));
                                                empty12.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty12);

                                                PdfPCell empty13 = new PdfPCell(new Phrase("  "));
                                                empty13.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty13);

                                                PdfPCell empty21 = new PdfPCell(new Phrase("  "));
                                                empty21.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty21);

                                                PdfPCell empty22 = new PdfPCell(new Phrase("  "));
                                                empty22.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty22);

                                                PdfPCell empty23 = new PdfPCell(new Phrase("  "));
                                                empty23.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty23);
                                            }
                                        }
                                        else if (lstImage.Items.Count % 4 == 1)
                                        {
                                            int k = 0;
                                            int i;
                                            for (i = 0; i < lstImage.Items.Count / 4; i++)
                                            {
                                                iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg1.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar = new PdfPCell(jpg1);
                                                bar.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar);

                                                k++;


                                                PdfPCell empty = new PdfPCell(new Phrase("  "));
                                                empty.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty);


                                                iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg2.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar1 = new PdfPCell(jpg2);
                                                bar1.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar1);

                                                k++;


                                                PdfPCell empty8 = new PdfPCell(new Phrase("  "));
                                                empty8.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty8);


                                                iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg3.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar2 = new PdfPCell(jpg3);
                                                bar2.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar2);
                                                k++;


                                                PdfPCell empty9 = new PdfPCell(new Phrase("  "));
                                                empty9.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty9);

                                                iTextSharp.text.Image jpg4 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg4.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar3 = new PdfPCell(jpg4);
                                                bar3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar3);
                                                k++;

                                                PdfPCell empty14 = new PdfPCell(new Phrase("  "));
                                                empty14.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty14);

                                                PdfPCell empty15 = new PdfPCell(new Phrase("  "));
                                                empty15.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty15);

                                                PdfPCell empty16 = new PdfPCell(new Phrase("  "));
                                                empty16.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty16);


                                                PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                empty3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty3);


                                                PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                empty4.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty4);

                                                PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                empty5.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty5);

                                                PdfPCell empty10 = new PdfPCell(new Phrase("  "));
                                                empty10.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty10);


                                            }
                                            iTextSharp.text.Image jpg5 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                            jpg5.ScaleAbsolute(110f, 60f);
                                            PdfPCell bar4 = new PdfPCell(jpg5);
                                            bar4.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(bar4);

                                            PdfPCell empty31 = new PdfPCell(new Phrase("  "));
                                            empty31.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty31);

                                            PdfPCell empty32 = new PdfPCell(new Phrase("  "));
                                            empty32.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty32);

                                            PdfPCell empty33 = new PdfPCell(new Phrase("  "));
                                            empty33.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty33);

                                            PdfPCell empty34 = new PdfPCell(new Phrase("  "));
                                            empty34.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty34);

                                            PdfPCell empty35 = new PdfPCell(new Phrase("  "));
                                            empty35.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty35);

                                            PdfPCell empty36 = new PdfPCell(new Phrase("  "));
                                            empty36.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty36);
                                        }
                                        else if (lstImage.Items.Count % 4 == 2)
                                        {
                                            int k = 0;
                                            for (int i = 0; i < lstImage.Items.Count / 4; i++)
                                            {
                                                iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg1.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar = new PdfPCell(jpg1);
                                                bar.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar);

                                                k++;


                                                PdfPCell empty = new PdfPCell(new Phrase("  "));
                                                empty.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty);


                                                iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg2.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar1 = new PdfPCell(jpg2);
                                                bar1.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar1);

                                                k++;


                                                PdfPCell empty8 = new PdfPCell(new Phrase("  "));
                                                empty8.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty8);


                                                iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg3.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar2 = new PdfPCell(jpg3);
                                                bar2.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar2);
                                                k++;


                                                PdfPCell empty9 = new PdfPCell(new Phrase("  "));
                                                empty9.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty9);

                                                iTextSharp.text.Image jpg4 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg4.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar3 = new PdfPCell(jpg4);
                                                bar3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar3);
                                                k++;

                                                PdfPCell empty14 = new PdfPCell(new Phrase("  "));
                                                empty14.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty14);

                                                PdfPCell empty15 = new PdfPCell(new Phrase("  "));
                                                empty15.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty15);

                                                PdfPCell empty16 = new PdfPCell(new Phrase("  "));
                                                empty16.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty16);


                                                PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                empty3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty3);


                                                PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                empty4.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty4);

                                                PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                empty5.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty5);

                                                PdfPCell empty10 = new PdfPCell(new Phrase("  "));
                                                empty10.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty10);



                                            }
                                            iTextSharp.text.Image jpg5 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                            jpg5.ScaleAbsolute(110f, 60f);
                                            PdfPCell bar4 = new PdfPCell(jpg5);
                                            bar4.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(bar4);

                                            k++;

                                            PdfPCell empty31 = new PdfPCell(new Phrase("  "));
                                            empty31.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty31);

                                            iTextSharp.text.Image jpg6 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                            jpg6.ScaleAbsolute(110f, 60f);
                                            PdfPCell bar6 = new PdfPCell(jpg6);
                                            bar6.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(bar6);

                                            PdfPCell empty33 = new PdfPCell(new Phrase("  "));
                                            empty33.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty33);

                                            PdfPCell empty34 = new PdfPCell(new Phrase("  "));
                                            empty34.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty34);

                                            PdfPCell empty35 = new PdfPCell(new Phrase("  "));
                                            empty35.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty35);

                                            PdfPCell empty36 = new PdfPCell(new Phrase("  "));
                                            empty36.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty36);
                                        }
                                        else if (lstImage.Items.Count % 4 == 3)
                                        {

                                            int k = 0;
                                            int i;
                                            for (i = 0; i < lstImage.Items.Count / 4; i++)
                                            {

                                                iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg1.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar = new PdfPCell(jpg1);
                                                bar.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar);

                                                k++;


                                                PdfPCell empty = new PdfPCell(new Phrase("  "));
                                                empty.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty);


                                                iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg2.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar1 = new PdfPCell(jpg2);
                                                bar1.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar1);

                                                k++;


                                                PdfPCell empty8 = new PdfPCell(new Phrase("  "));
                                                empty8.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty8);


                                                iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg3.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar2 = new PdfPCell(jpg3);
                                                bar2.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar2);

                                                k++;


                                                PdfPCell empty9 = new PdfPCell(new Phrase("  "));
                                                empty9.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty9);

                                                iTextSharp.text.Image jpg4 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg4.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar3 = new PdfPCell(jpg4);
                                                bar3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar3);

                                                k++;

                                                PdfPCell empty14 = new PdfPCell(new Phrase("  "));
                                                empty14.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty14);

                                                PdfPCell empty15 = new PdfPCell(new Phrase("  "));
                                                empty15.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty15);

                                                PdfPCell empty16 = new PdfPCell(new Phrase("  "));
                                                empty16.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty16);


                                                PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                empty3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty3);


                                                PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                empty4.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty4);

                                                PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                empty5.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty5);

                                                PdfPCell empty10 = new PdfPCell(new Phrase("  "));
                                                empty10.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty10);



                                            }
                                            iTextSharp.text.Image jpg5 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                            jpg5.ScaleAbsolute(110f, 60f);
                                            PdfPCell bar4 = new PdfPCell(jpg5);
                                            bar4.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(bar4);

                                            k++;

                                            PdfPCell empty31 = new PdfPCell(new Phrase("  "));
                                            empty31.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty31);

                                            iTextSharp.text.Image jpg99 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                            jpg99.ScaleAbsolute(110f, 60f);
                                            PdfPCell bar99 = new PdfPCell(jpg99);
                                            bar99.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(bar99);

                                            k++;

                                            PdfPCell empty33 = new PdfPCell(new Phrase("  "));
                                            empty33.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty33);

                                            iTextSharp.text.Image jpg54 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                            jpg54.ScaleAbsolute(110f, 60f);
                                            PdfPCell bar54 = new PdfPCell(jpg54);
                                            bar54.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(bar54);

                                            PdfPCell empty35 = new PdfPCell(new Phrase("  "));
                                            empty35.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty35);

                                            PdfPCell empty36 = new PdfPCell(new Phrase("  "));
                                            empty36.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty36);
                                        }
                                        else if (lstImage.Items.Count == 1)
                                        {
                                            int k = 0;
                                            iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                            PdfPCell bar = new PdfPCell(jpg1);
                                            bar.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(bar);

                                            PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                            empty3.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty3);
                                            PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                            empty4.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty4);

                                        }
                                        else
                                        {
                                            int k = 0;
                                            for (int i = 0; i < (lstImage.Items.Count) / 2; i++)
                                            {




                                                iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg1.Alignment = iTextSharp.text.Image.ALIGN_MIDDLE;

                                                PdfPCell bar = new PdfPCell(jpg1);
                                                bar.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar);

                                                k++;

                                                PdfPCell empty = new PdfPCell();
                                                empty.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty);
                                                iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                PdfPCell bar1 = new PdfPCell(jpg2);
                                                bar1.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar1);

                                                k++;

                                                PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                empty3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty3);
                                                PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                empty4.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty4);
                                                PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                empty5.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty5);





                                            }
                                            iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                            PdfPCell bar3 = new PdfPCell(jpg3);
                                            bar3.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(bar3);
                                            PdfPCell empty1 = new PdfPCell();
                                            empty1.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty1);
                                            PdfPCell empty2 = new PdfPCell();
                                            empty2.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty2);
                                        }

                                        doc.Add(para);
                                        if (lstImage.Items.Count > 32 && lstImage.Items.Count <= 36)
                                        {
                                            doc.Add(new Paragraph("\n"));

                                            table.SpacingAfter = 70f;
                                        }
                                        doc.Add(table);

                                        //DirectoryInfo dir_info1 = new DirectoryInfo(folderPath1);
                                        //string directory1 = dir_info1.Name;
                                        para1 = new Paragraph("Bundle name: " + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey)) + ", No. of Barcode: " + lstImage.Items.Count + " ,Generated : " + Convert.ToString(Convert.ToInt32(_GetGenCount(projKey, bundleKey).Rows.Count) + 1) + " times", font);

                                        para1.Alignment = Element.ALIGN_RIGHT;
                                        doc.Add(para1);

                                        doc.Add(table1);
                                        doc.Close();


                                        Directory.Delete(expFolder + "\\Barcode", true);
                                        bool insertlog = insertIntoDB(projKey, bundleKey, cmbBundle.Text);
                                        if (insertlog == true)
                                        {

                                            MessageBox.Show(this, "Barcode Generated Successfully...", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                            cmdExport.Enabled = true;

                                            int pendBundle = pendingBundle().Rows.Count;


                                        }


                                    }
                                    else
                                    {
                                        if ((lstImage.Items.Count) > 0)
                                        {
                                            sfdUAT.Filter = "Pdf files (*.pdf)|*.pdf";
                                            sfdUAT.FilterIndex = 2;
                                            sfdUAT.RestoreDirectory = true;
                                            sfdUAT.FileName = cmbBundle.Text;
                                            sfdUAT.ShowDialog();
                                            try
                                            {
                                                FileStream fs = new FileStream(sfdUAT.FileName, FileMode.Create, FileAccess.Write, FileShare.None);
                                                Document doc = new Document();
                                                PdfWriter writer = PdfWriter.GetInstance(doc, fs);
                                                doc.SetPageSize(iTextSharp.text.PageSize.A4);
                                                PdfPTable table = new PdfPTable(7);
                                                table.TotalWidth = 500f;
                                                table.LockedWidth = true;
                                                float[] widths = new float[] { 4f, 1.66f, 4f, 1.66f, 4f, 1.66f, 4f };

                                                table.SetWidths(widths);
                                                table.HorizontalAlignment = 0;

                                                table.SpacingBefore = 10f;
                                                table.SpacingAfter = 5f;
                                                PdfPTable table1 = new PdfPTable(7);
                                                table1.TotalWidth = 500f;
                                                table1.LockedWidth = true;
                                                float[] widths1 = new float[] { 4f, 1.66f, 4f, 1.66f, 4f, 1.66f, 4f };

                                                table1.SetWidths(widths1);
                                                table1.HorizontalAlignment = 0;

                                                table1.SpacingBefore = 5f;
                                                table1.SpacingAfter = 10f;
                                                doc.Open();



                                                //DirectoryInfo dir_info = new DirectoryInfo(folderPath);
                                                //string directory = dir_info.Name;
                                                BaseFont bf = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);

                                                iTextSharp.text.Font font = new iTextSharp.text.Font(bf, 8, iTextSharp.text.Font.NORMAL);
                                                para = new Paragraph("Bundle name: " + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey)) + ", No. of Barcode: " + lstImage.Items.Count + " ,Generated : " + Convert.ToString(Convert.ToInt32(_GetGenCount(projKey, bundleKey).Rows.Count) + 1) + " times", font);
                                                para.Alignment = Element.ALIGN_RIGHT;


                                                if (lstImage.Items.Count % 4 == 0)
                                                {
                                                    int k = 0;
                                                    for (int i = 0; i < lstImage.Items.Count / 4; i++)
                                                    {
                                                        iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg1.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar = new PdfPCell(jpg1);
                                                        bar.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar);

                                                        k++;


                                                        PdfPCell empty = new PdfPCell(new Phrase("  "));
                                                        empty.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty);


                                                        iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg2.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar1 = new PdfPCell(jpg2);
                                                        bar1.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar1);

                                                        k++;


                                                        PdfPCell empty8 = new PdfPCell(new Phrase("  "));
                                                        empty8.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty8);


                                                        iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg3.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar2 = new PdfPCell(jpg3);
                                                        bar2.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar2);

                                                        k++;


                                                        PdfPCell empty9 = new PdfPCell(new Phrase("  "));
                                                        empty9.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty9);

                                                        iTextSharp.text.Image jpg4 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg4.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar3 = new PdfPCell(jpg4);
                                                        bar3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar3);

                                                        k++;

                                                        PdfPCell empty14 = new PdfPCell(new Phrase("  "));
                                                        empty14.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty14);

                                                        PdfPCell empty15 = new PdfPCell(new Phrase("  "));
                                                        empty15.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty15);

                                                        PdfPCell empty16 = new PdfPCell(new Phrase("  "));
                                                        empty16.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty16);


                                                        PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                        empty3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty3);


                                                        PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                        empty4.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty4);

                                                        PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                        empty5.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty5);

                                                        PdfPCell empty10 = new PdfPCell(new Phrase("  "));
                                                        empty10.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty10);


                                                        PdfPCell empty11 = new PdfPCell(new Phrase("  "));
                                                        empty11.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty11);

                                                        PdfPCell empty12 = new PdfPCell(new Phrase("  "));
                                                        empty12.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty12);

                                                        PdfPCell empty13 = new PdfPCell(new Phrase("  "));
                                                        empty13.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty13);

                                                        PdfPCell empty21 = new PdfPCell(new Phrase("  "));
                                                        empty21.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty21);

                                                        PdfPCell empty22 = new PdfPCell(new Phrase("  "));
                                                        empty22.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty22);

                                                        PdfPCell empty23 = new PdfPCell(new Phrase("  "));
                                                        empty23.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty23);
                                                    }
                                                }
                                                else if (lstImage.Items.Count % 4 == 1)
                                                {
                                                    int k = 0;
                                                    int i;
                                                    for (i = 0; i < lstImage.Items.Count / 4; i++)
                                                    {
                                                        iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg1.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar = new PdfPCell(jpg1);
                                                        bar.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar);

                                                        k++;


                                                        PdfPCell empty = new PdfPCell(new Phrase("  "));
                                                        empty.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty);


                                                        iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg2.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar1 = new PdfPCell(jpg2);
                                                        bar1.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar1);

                                                        k++;


                                                        PdfPCell empty8 = new PdfPCell(new Phrase("  "));
                                                        empty8.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty8);


                                                        iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg3.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar2 = new PdfPCell(jpg3);
                                                        bar2.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar2);

                                                        k++;


                                                        PdfPCell empty9 = new PdfPCell(new Phrase("  "));
                                                        empty9.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty9);

                                                        iTextSharp.text.Image jpg4 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg4.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar3 = new PdfPCell(jpg4);
                                                        bar3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar3);

                                                        k++;

                                                        PdfPCell empty14 = new PdfPCell(new Phrase("  "));
                                                        empty14.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty14);

                                                        PdfPCell empty15 = new PdfPCell(new Phrase("  "));
                                                        empty15.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty15);

                                                        PdfPCell empty16 = new PdfPCell(new Phrase("  "));
                                                        empty16.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty16);


                                                        PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                        empty3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty3);


                                                        PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                        empty4.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty4);

                                                        PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                        empty5.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty5);

                                                        PdfPCell empty10 = new PdfPCell(new Phrase("  "));
                                                        empty10.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty10);


                                                    }
                                                    iTextSharp.text.Image jpg5 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                    jpg5.ScaleAbsolute(110f, 60f);
                                                    PdfPCell bar4 = new PdfPCell(jpg5);
                                                    bar4.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(bar4);

                                                    PdfPCell empty31 = new PdfPCell(new Phrase("  "));
                                                    empty31.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty31);

                                                    PdfPCell empty32 = new PdfPCell(new Phrase("  "));
                                                    empty32.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty32);

                                                    PdfPCell empty33 = new PdfPCell(new Phrase("  "));
                                                    empty33.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty33);

                                                    PdfPCell empty34 = new PdfPCell(new Phrase("  "));
                                                    empty34.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty34);

                                                    PdfPCell empty35 = new PdfPCell(new Phrase("  "));
                                                    empty35.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty35);

                                                    PdfPCell empty36 = new PdfPCell(new Phrase("  "));
                                                    empty36.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty36);
                                                }
                                                else if (lstImage.Items.Count % 4 == 2)
                                                {
                                                    int k = 0;
                                                    for (int i = 0; i < lstImage.Items.Count / 4; i++)
                                                    {
                                                        iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg1.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar = new PdfPCell(jpg1);
                                                        bar.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar);

                                                        k++;


                                                        PdfPCell empty = new PdfPCell(new Phrase("  "));
                                                        empty.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty);


                                                        iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg2.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar1 = new PdfPCell(jpg2);
                                                        bar1.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar1);

                                                        k++;


                                                        PdfPCell empty8 = new PdfPCell(new Phrase("  "));
                                                        empty8.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty8);


                                                        iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg3.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar2 = new PdfPCell(jpg3);
                                                        bar2.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar2);

                                                        k++;


                                                        PdfPCell empty9 = new PdfPCell(new Phrase("  "));
                                                        empty9.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty9);

                                                        iTextSharp.text.Image jpg4 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg4.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar3 = new PdfPCell(jpg4);
                                                        bar3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar3);

                                                        k++;

                                                        PdfPCell empty14 = new PdfPCell(new Phrase("  "));
                                                        empty14.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty14);

                                                        PdfPCell empty15 = new PdfPCell(new Phrase("  "));
                                                        empty15.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty15);

                                                        PdfPCell empty16 = new PdfPCell(new Phrase("  "));
                                                        empty16.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty16);


                                                        PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                        empty3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty3);


                                                        PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                        empty4.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty4);

                                                        PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                        empty5.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty5);

                                                        PdfPCell empty10 = new PdfPCell(new Phrase("  "));
                                                        empty10.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty10);


                                                    }
                                                    iTextSharp.text.Image jpg5 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                    jpg5.ScaleAbsolute(110f, 60f);
                                                    PdfPCell bar4 = new PdfPCell(jpg5);
                                                    bar4.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(bar4);

                                                    k++;

                                                    PdfPCell empty31 = new PdfPCell(new Phrase("  "));
                                                    empty31.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty31);

                                                    iTextSharp.text.Image jpg6 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                    jpg6.ScaleAbsolute(110f, 60f);
                                                    PdfPCell bar6 = new PdfPCell(jpg6);
                                                    bar6.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(bar6);

                                                    PdfPCell empty33 = new PdfPCell(new Phrase("  "));
                                                    empty33.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty33);

                                                    PdfPCell empty34 = new PdfPCell(new Phrase("  "));
                                                    empty34.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty34);

                                                    PdfPCell empty35 = new PdfPCell(new Phrase("  "));
                                                    empty35.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty35);

                                                    PdfPCell empty36 = new PdfPCell(new Phrase("  "));
                                                    empty36.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty36);
                                                }
                                                else if (lstImage.Items.Count % 4 == 3)
                                                {

                                                    int k = 0;
                                                    int i;
                                                    for (i = 0; i < lstImage.Items.Count / 4; i++)
                                                    {

                                                        iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg1.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar = new PdfPCell(jpg1);
                                                        bar.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar);

                                                        k++;


                                                        PdfPCell empty = new PdfPCell(new Phrase("  "));
                                                        empty.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty);


                                                        iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg2.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar1 = new PdfPCell(jpg2);
                                                        bar1.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar1);

                                                        k++;


                                                        PdfPCell empty8 = new PdfPCell(new Phrase("  "));
                                                        empty8.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty8);


                                                        iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg3.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar2 = new PdfPCell(jpg3);
                                                        bar2.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar2);

                                                        k++;


                                                        PdfPCell empty9 = new PdfPCell(new Phrase("  "));
                                                        empty9.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty9);

                                                        iTextSharp.text.Image jpg4 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg4.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar3 = new PdfPCell(jpg4);
                                                        bar3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar3);

                                                        k++;

                                                        PdfPCell empty14 = new PdfPCell(new Phrase("  "));
                                                        empty14.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty14);

                                                        PdfPCell empty15 = new PdfPCell(new Phrase("  "));
                                                        empty15.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty15);

                                                        PdfPCell empty16 = new PdfPCell(new Phrase("  "));
                                                        empty16.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty16);


                                                        PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                        empty3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty3);


                                                        PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                        empty4.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty4);

                                                        PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                        empty5.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty5);

                                                        PdfPCell empty10 = new PdfPCell(new Phrase("  "));
                                                        empty10.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty10);

                                                    }
                                                    iTextSharp.text.Image jpg5 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                    jpg5.ScaleAbsolute(110f, 60f);
                                                    PdfPCell bar4 = new PdfPCell(jpg5);
                                                    bar4.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(bar4);

                                                    k++;

                                                    PdfPCell empty31 = new PdfPCell(new Phrase("  "));
                                                    empty31.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty31);

                                                    iTextSharp.text.Image jpg99 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                    jpg99.ScaleAbsolute(110f, 60f);
                                                    PdfPCell bar99 = new PdfPCell(jpg99);
                                                    bar99.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(bar99);

                                                    k++;

                                                    PdfPCell empty33 = new PdfPCell(new Phrase("  "));
                                                    empty33.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty33);

                                                    iTextSharp.text.Image jpg54 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                    jpg54.ScaleAbsolute(110f, 60f);
                                                    PdfPCell bar54 = new PdfPCell(jpg54);
                                                    bar54.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(bar54);


                                                    PdfPCell empty35 = new PdfPCell(new Phrase("  "));
                                                    empty35.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty35);

                                                    PdfPCell empty36 = new PdfPCell(new Phrase("  "));
                                                    empty36.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty36);
                                                }

                                                else if (lstImage.Items.Count == 1)
                                                {
                                                    int k = 0;
                                                    iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                    PdfPCell bar = new PdfPCell(jpg1);
                                                    bar.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(bar);

                                                    PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                    empty3.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty3);
                                                    PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                    empty4.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty4);

                                                }
                                                else
                                                {
                                                    int k = 0;
                                                    for (int i = 0; i < (lstImage.Items.Count) / 2; i++)
                                                    {




                                                        iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg1.Alignment = iTextSharp.text.Image.ALIGN_MIDDLE;

                                                        PdfPCell bar = new PdfPCell(jpg1);
                                                        bar.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar);

                                                        k++;

                                                        PdfPCell empty = new PdfPCell();
                                                        empty.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty);
                                                        iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        PdfPCell bar1 = new PdfPCell(jpg2);
                                                        bar1.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar1);

                                                        k++;

                                                        PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                        empty3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty3);
                                                        PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                        empty4.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty4);
                                                        PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                        empty5.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty5);





                                                    }
                                                    iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                    PdfPCell bar3 = new PdfPCell(jpg3);
                                                    bar3.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(bar3);
                                                    PdfPCell empty1 = new PdfPCell();
                                                    empty1.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty1);
                                                    PdfPCell empty2 = new PdfPCell();
                                                    empty2.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty2);
                                                }

                                                doc.Add(para);
                                                doc.Add(table);
                                                //DirectoryInfo dir_info1 = new DirectoryInfo(folderPath1);
                                                //string directory1 = dir_info1.Name;
                                                //para1 = new Paragraph("Bundle name: " + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey)) + "- No. of Barcode: " + lstImage.Items.Count, font);
                                                //para1.Alignment = Element.ALIGN_RIGHT;
                                                //doc.Add(para1);

                                                doc.Add(table1);
                                                doc.Close();


                                                Directory.Delete(expFolder + "\\Barcode", true);
                                                bool insertlog = insertIntoDB(projKey, bundleKey, cmbBundle.Text);
                                                if (insertlog == true)
                                                {
                                                    MessageBox.Show(this, "Barcode Generated Successfully...", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                                    cmdExport.Enabled = true;

                                                    int pendBundle = pendingBundle().Rows.Count;


                                                }
                                            }
                                            catch (Exception ex)
                                            { }
                                        }
                                    }

                                }
                            }
                            else
                            {
                                cmdExport.Enabled = false;

                                string expFolder = "C:\\";
                                bool isDeleted = false;
                                //check if folder is exists or not
                                if (Directory.Exists(expFolder + "\\Barcode\\" + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey))) && isDeleted == false)
                                {
                                    Directory.Delete(expFolder + "\\Barcode\\" + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey)), true);
                                }

                                if (lstImage.Items.Count > 0)
                                {
                                    Application.DoEvents();
                                    //bundle folder creation
                                    if (!Directory.Exists(expFolder + "\\Barcode\\" + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey))))
                                    {
                                        Directory.CreateDirectory(expFolder + "\\Barcode\\" + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey)));
                                    }
                                    String[] imageList = new String[lstImage.Items.Count];
                                    //checking each filename
                                    for (int x = 0; x < lstImage.Items.Count; x++)
                                    {
                                        string filename = lstImage.Items[x].ToString();

                                        string str1 = "HIGH COURT OF CALCUTTA";
                                        string casetype = GetFileDetails(projKey, bundleKey, filename).Rows[0][0].ToString();
                                        string caseno = GetFileDetails(projKey, bundleKey, filename).Rows[0][1].ToString();
                                        string caseyear = GetFileDetails(projKey, bundleKey, filename).Rows[0][2].ToString();
                                        string est = GetFileDetails(projKey, bundleKey, filename).Rows[0][3].ToString();
                                        string entity = null;
                                        if (est == "Appellate")
                                        {
                                            entity = "AS";
                                        }
                                        else
                                        {
                                            entity = "OS";
                                        }
                                        string str2 = "File No: " + casetype + "/" + caseno + "/" + caseyear + "/" + entity;
                                        string str3 = casetype + "/" + caseno + "/" + caseyear + "/" + entity;
                                        label2.Text = str2;
                                        label1.Text = str1;
                                        System.Drawing.Image img1 = ConvertTextToImage(str2, "calibri", 9, Color.Transparent, Color.Black, label2.Width, label2.Height);
                                        //Image img4 = ConvertTextToImage("Nevaeh Technology", "calibri", 10, Color.Transparent, Color.Black, textBox1.Width, textBox1.Height);
                                        System.Drawing.Image img4 = ConvertTextToImage(str1, "calibri", 9, Color.Transparent, Color.Black, label1.Width, label1.Height + 5);
                                        //Zen.Barcode.Code128BarcodeDraw barcode = Zen.Barcode.BarcodeDrawFactory.Code128WithChecksum;
                                        Zen.Barcode.Code128BarcodeDraw barcode = Zen.Barcode.BarcodeDrawFactory.Code128WithChecksum;
                                        //pictureBox1.Image = barcode.Draw(dt1.Rows[i][0].ToString(), 60);
                                        System.Drawing.Image img2 = barcode.Draw(str3, 50);

                                        int height = img1.Height + img2.Height + img4.Height;
                                        int width = Math.Max(img1.Width, img2.Width);
                                        Bitmap img3 = new Bitmap(width, height);

                                        Bitmap image1 = new Bitmap(img1);
                                        Bitmap image2 = new Bitmap(img2);
                                        Bitmap image4 = new Bitmap(img4);
                                        int X = image2.Width;

                                        using (Graphics g = Graphics.FromImage(img3))
                                        {


                                            g.DrawImage(image4, (image2.Width - image4.Width) / 2, 0);
                                            g.DrawImage(image2, 0, image4.Height);
                                            g.DrawImage(image1, (image2.Width - image1.Width) / 2, image2.Height + image4.Height);
                                        }

                                        Bitmap bitmap = new Bitmap(img3);

                                        image3 = (System.Drawing.Image)bitmap;
                                        //image3.Save(@"D\image5.tiff", System.Drawing.Imaging.ImageFormat.Tiff);
                                        image3.Save(expFolder + "\\Barcode\\" + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey)) + "\\" + x + ".tiff", System.Drawing.Imaging.ImageFormat.Tiff);

                                        j = x;
                                        string imageURL = expFolder + "\\Barcode\\" + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey)) + "\\" + j + ".tiff";
                                        imageList[x] = imageURL;

                                    }
                                    if (lstImage.Items.Count > 36)
                                    {

                                        sfdUAT.Filter = "Pdf files (*.pdf)|*.pdf";
                                        sfdUAT.FilterIndex = 2;
                                        sfdUAT.RestoreDirectory = true;
                                        sfdUAT.FileName = cmbBundle.Text;
                                        sfdUAT.ShowDialog();

                                        FileStream fs = new FileStream(sfdUAT.FileName, FileMode.Create, FileAccess.Write, FileShare.None);
                                        Document doc = new Document();
                                        PdfWriter writer = PdfWriter.GetInstance(doc, fs);
                                        doc.SetPageSize(iTextSharp.text.PageSize.A4);
                                        PdfPTable table = new PdfPTable(7);
                                        table.TotalWidth = 500f;
                                        table.LockedWidth = true;
                                        float[] widths = new float[] { 4f, 1.66f, 4f, 1.66f, 4f, 1.66f, 4f };

                                        table.SetWidths(widths);
                                        table.HorizontalAlignment = 0;

                                        table.SpacingBefore = 10f;
                                        table.SpacingAfter = 5f;
                                        PdfPTable table1 = new PdfPTable(7);
                                        table1.TotalWidth = 500f;
                                        table1.LockedWidth = true;
                                        float[] widths1 = new float[] { 4f, 1.66f, 4f, 1.66f, 4f, 1.66f, 4f };

                                        table1.SetWidths(widths1);
                                        table1.HorizontalAlignment = 0;

                                        table1.SpacingBefore = 10f;
                                        table1.SpacingAfter = 10f;
                                        doc.Open();
                                        BaseFont bf = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
                                        iTextSharp.text.Font font = new iTextSharp.text.Font(bf, 8, iTextSharp.text.Font.NORMAL);
                                        //DirectoryInfo dir_info = new DirectoryInfo(folderPath);
                                        //string directory = dir_info.Name;
                                        para = new Paragraph("Bundle name: " + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey)) + ", No. of Barcode: " + lstImage.Items.Count, font);

                                        para.Alignment = Element.ALIGN_RIGHT;


                                        if (lstImage.Items.Count % 4 == 0)
                                        {
                                            int k = 0;
                                            for (int i = 0; i < lstImage.Items.Count / 4; i++)
                                            {
                                                iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[i]);
                                                jpg1.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar = new PdfPCell(jpg1);
                                                bar.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar);

                                                k++;


                                                PdfPCell empty = new PdfPCell(new Phrase("  "));
                                                empty.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty);


                                                iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[i]);
                                                jpg2.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar1 = new PdfPCell(jpg2);
                                                bar1.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar1);

                                                k++;


                                                PdfPCell empty8 = new PdfPCell(new Phrase("  "));
                                                empty8.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty8);


                                                iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[i]);
                                                jpg3.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar2 = new PdfPCell(jpg3);
                                                bar2.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar2);
                                                k++;


                                                PdfPCell empty9 = new PdfPCell(new Phrase("  "));
                                                empty9.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty9);

                                                iTextSharp.text.Image jpg4 = iTextSharp.text.Image.GetInstance(imageList[i]);
                                                jpg4.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar3 = new PdfPCell(jpg4);
                                                bar3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar3);
                                                k++;

                                                PdfPCell empty14 = new PdfPCell(new Phrase("  "));
                                                empty14.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty14);

                                                PdfPCell empty15 = new PdfPCell(new Phrase("  "));
                                                empty15.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty15);

                                                PdfPCell empty16 = new PdfPCell(new Phrase("  "));
                                                empty16.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty16);


                                                PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                empty3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty3);


                                                PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                empty4.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty4);

                                                PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                empty5.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty5);

                                                PdfPCell empty10 = new PdfPCell(new Phrase("  "));
                                                empty10.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty10);


                                                PdfPCell empty11 = new PdfPCell(new Phrase("  "));
                                                empty11.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty11);

                                                PdfPCell empty12 = new PdfPCell(new Phrase("  "));
                                                empty12.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty12);

                                                PdfPCell empty13 = new PdfPCell(new Phrase("  "));
                                                empty13.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty13);

                                                PdfPCell empty21 = new PdfPCell(new Phrase("  "));
                                                empty21.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty21);

                                                PdfPCell empty22 = new PdfPCell(new Phrase("  "));
                                                empty22.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty22);

                                                PdfPCell empty23 = new PdfPCell(new Phrase("  "));
                                                empty23.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty23);
                                            }
                                        }
                                        else if (lstImage.Items.Count % 4 == 1)
                                        {
                                            int k = 0;
                                            int i;
                                            for (i = 0; i < lstImage.Items.Count / 4; i++)
                                            {
                                                iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg1.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar = new PdfPCell(jpg1);
                                                bar.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar);

                                                k++;


                                                PdfPCell empty = new PdfPCell(new Phrase("  "));
                                                empty.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty);


                                                iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg2.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar1 = new PdfPCell(jpg2);
                                                bar1.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar1);

                                                k++;


                                                PdfPCell empty8 = new PdfPCell(new Phrase("  "));
                                                empty8.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty8);


                                                iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg3.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar2 = new PdfPCell(jpg3);
                                                bar2.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar2);
                                                k++;


                                                PdfPCell empty9 = new PdfPCell(new Phrase("  "));
                                                empty9.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty9);

                                                iTextSharp.text.Image jpg4 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg4.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar3 = new PdfPCell(jpg4);
                                                bar3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar3);
                                                k++;

                                                PdfPCell empty14 = new PdfPCell(new Phrase("  "));
                                                empty14.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty14);

                                                PdfPCell empty15 = new PdfPCell(new Phrase("  "));
                                                empty15.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty15);

                                                PdfPCell empty16 = new PdfPCell(new Phrase("  "));
                                                empty16.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty16);


                                                PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                empty3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty3);


                                                PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                empty4.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty4);

                                                PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                empty5.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty5);

                                                PdfPCell empty10 = new PdfPCell(new Phrase("  "));
                                                empty10.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty10);


                                            }
                                            iTextSharp.text.Image jpg5 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                            jpg5.ScaleAbsolute(110f, 60f);
                                            PdfPCell bar4 = new PdfPCell(jpg5);
                                            bar4.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(bar4);

                                            PdfPCell empty31 = new PdfPCell(new Phrase("  "));
                                            empty31.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty31);

                                            PdfPCell empty32 = new PdfPCell(new Phrase("  "));
                                            empty32.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty32);

                                            PdfPCell empty33 = new PdfPCell(new Phrase("  "));
                                            empty33.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty33);

                                            PdfPCell empty34 = new PdfPCell(new Phrase("  "));
                                            empty34.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty34);

                                            PdfPCell empty35 = new PdfPCell(new Phrase("  "));
                                            empty35.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty35);

                                            PdfPCell empty36 = new PdfPCell(new Phrase("  "));
                                            empty36.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty36);
                                        }
                                        else if (lstImage.Items.Count % 4 == 2)
                                        {
                                            int k = 0;
                                            for (int i = 0; i < lstImage.Items.Count / 4; i++)
                                            {
                                                iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg1.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar = new PdfPCell(jpg1);
                                                bar.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar);

                                                k++;


                                                PdfPCell empty = new PdfPCell(new Phrase("  "));
                                                empty.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty);


                                                iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg2.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar1 = new PdfPCell(jpg2);
                                                bar1.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar1);

                                                k++;


                                                PdfPCell empty8 = new PdfPCell(new Phrase("  "));
                                                empty8.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty8);


                                                iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg3.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar2 = new PdfPCell(jpg3);
                                                bar2.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar2);
                                                k++;


                                                PdfPCell empty9 = new PdfPCell(new Phrase("  "));
                                                empty9.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty9);

                                                iTextSharp.text.Image jpg4 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg4.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar3 = new PdfPCell(jpg4);
                                                bar3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar3);
                                                k++;

                                                PdfPCell empty14 = new PdfPCell(new Phrase("  "));
                                                empty14.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty14);

                                                PdfPCell empty15 = new PdfPCell(new Phrase("  "));
                                                empty15.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty15);

                                                PdfPCell empty16 = new PdfPCell(new Phrase("  "));
                                                empty16.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty16);


                                                PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                empty3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty3);


                                                PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                empty4.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty4);

                                                PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                empty5.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty5);

                                                PdfPCell empty10 = new PdfPCell(new Phrase("  "));
                                                empty10.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty10);



                                            }
                                            iTextSharp.text.Image jpg5 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                            jpg5.ScaleAbsolute(110f, 60f);
                                            PdfPCell bar4 = new PdfPCell(jpg5);
                                            bar4.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(bar4);

                                            k++;

                                            PdfPCell empty31 = new PdfPCell(new Phrase("  "));
                                            empty31.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty31);

                                            iTextSharp.text.Image jpg6 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                            jpg6.ScaleAbsolute(110f, 60f);
                                            PdfPCell bar6 = new PdfPCell(jpg6);
                                            bar6.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(bar6);

                                            PdfPCell empty33 = new PdfPCell(new Phrase("  "));
                                            empty33.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty33);

                                            PdfPCell empty34 = new PdfPCell(new Phrase("  "));
                                            empty34.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty34);

                                            PdfPCell empty35 = new PdfPCell(new Phrase("  "));
                                            empty35.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty35);

                                            PdfPCell empty36 = new PdfPCell(new Phrase("  "));
                                            empty36.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty36);
                                        }
                                        else if (lstImage.Items.Count % 4 == 3)
                                        {

                                            int k = 0;
                                            int i;
                                            for (i = 0; i < lstImage.Items.Count / 4; i++)
                                            {

                                                iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg1.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar = new PdfPCell(jpg1);
                                                bar.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar);

                                                k++;


                                                PdfPCell empty = new PdfPCell(new Phrase("  "));
                                                empty.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty);


                                                iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg2.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar1 = new PdfPCell(jpg2);
                                                bar1.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar1);

                                                k++;


                                                PdfPCell empty8 = new PdfPCell(new Phrase("  "));
                                                empty8.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty8);


                                                iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg3.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar2 = new PdfPCell(jpg3);
                                                bar2.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar2);

                                                k++;


                                                PdfPCell empty9 = new PdfPCell(new Phrase("  "));
                                                empty9.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty9);

                                                iTextSharp.text.Image jpg4 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg4.ScaleAbsolute(110f, 60f);
                                                PdfPCell bar3 = new PdfPCell(jpg4);
                                                bar3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar3);

                                                k++;

                                                PdfPCell empty14 = new PdfPCell(new Phrase("  "));
                                                empty14.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty14);

                                                PdfPCell empty15 = new PdfPCell(new Phrase("  "));
                                                empty15.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty15);

                                                PdfPCell empty16 = new PdfPCell(new Phrase("  "));
                                                empty16.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty16);


                                                PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                empty3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty3);


                                                PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                empty4.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty4);

                                                PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                empty5.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty5);

                                                PdfPCell empty10 = new PdfPCell(new Phrase("  "));
                                                empty10.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty10);



                                            }
                                            iTextSharp.text.Image jpg5 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                            jpg5.ScaleAbsolute(110f, 60f);
                                            PdfPCell bar4 = new PdfPCell(jpg5);
                                            bar4.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(bar4);

                                            k++;

                                            PdfPCell empty31 = new PdfPCell(new Phrase("  "));
                                            empty31.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty31);

                                            iTextSharp.text.Image jpg99 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                            jpg99.ScaleAbsolute(110f, 60f);
                                            PdfPCell bar99 = new PdfPCell(jpg99);
                                            bar99.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(bar99);

                                            k++;

                                            PdfPCell empty33 = new PdfPCell(new Phrase("  "));
                                            empty33.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty33);

                                            iTextSharp.text.Image jpg54 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                            jpg54.ScaleAbsolute(110f, 60f);
                                            PdfPCell bar54 = new PdfPCell(jpg54);
                                            bar54.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(bar54);

                                            PdfPCell empty35 = new PdfPCell(new Phrase("  "));
                                            empty35.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty35);

                                            PdfPCell empty36 = new PdfPCell(new Phrase("  "));
                                            empty36.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty36);
                                        }
                                        else if (lstImage.Items.Count == 1)
                                        {
                                            int k = 0;
                                            iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                            PdfPCell bar = new PdfPCell(jpg1);
                                            bar.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(bar);

                                            PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                            empty3.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty3);
                                            PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                            empty4.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty4);

                                        }
                                        else
                                        {
                                            int k = 0;
                                            for (int i = 0; i < (lstImage.Items.Count) / 2; i++)
                                            {




                                                iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                jpg1.Alignment = iTextSharp.text.Image.ALIGN_MIDDLE;

                                                PdfPCell bar = new PdfPCell(jpg1);
                                                bar.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar);

                                                k++;

                                                PdfPCell empty = new PdfPCell();
                                                empty.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty);
                                                iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                PdfPCell bar1 = new PdfPCell(jpg2);
                                                bar1.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(bar1);

                                                k++;

                                                PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                empty3.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty3);
                                                PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                empty4.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty4);
                                                PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                empty5.Border = PdfPCell.NO_BORDER;
                                                table.AddCell(empty5);





                                            }
                                            iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                            PdfPCell bar3 = new PdfPCell(jpg3);
                                            bar3.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(bar3);
                                            PdfPCell empty1 = new PdfPCell();
                                            empty1.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty1);
                                            PdfPCell empty2 = new PdfPCell();
                                            empty2.Border = PdfPCell.NO_BORDER;
                                            table.AddCell(empty2);
                                        }

                                        doc.Add(para);
                                        if (lstImage.Items.Count > 32 && lstImage.Items.Count <= 36)
                                        {
                                            doc.Add(new Paragraph("\n"));

                                            table.SpacingAfter = 70f;
                                        }
                                        doc.Add(table);

                                        //DirectoryInfo dir_info1 = new DirectoryInfo(folderPath1);
                                        //string directory1 = dir_info1.Name;
                                        para1 = new Paragraph("Bundle name: " + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey)) + ", No. of Barcode: " + lstImage.Items.Count, font);

                                        para1.Alignment = Element.ALIGN_RIGHT;
                                        doc.Add(para1);

                                        doc.Add(table1);
                                        doc.Close();


                                        Directory.Delete(expFolder + "\\Barcode", true);

                                        bool insertlog = insertIntoDB(projKey, bundleKey, cmbBundle.Text);
                                        if (insertlog == true)
                                        {
                                            MessageBox.Show(this, "Barcode Generated Successfully...", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                            cmdExport.Enabled = true;


                                            int pendBundle = pendingBundle().Rows.Count;

                                        }

                                    }
                                    else
                                    {
                                        if ((lstImage.Items.Count) > 0)
                                        {
                                            sfdUAT.Filter = "Pdf files (*.pdf)|*.pdf";
                                            sfdUAT.FilterIndex = 2;
                                            sfdUAT.RestoreDirectory = true;
                                            sfdUAT.FileName = cmbBundle.Text;
                                            sfdUAT.ShowDialog();
                                            try
                                            {
                                                FileStream fs = new FileStream(sfdUAT.FileName, FileMode.Create, FileAccess.Write, FileShare.None);
                                                Document doc = new Document();
                                                PdfWriter writer = PdfWriter.GetInstance(doc, fs);
                                                doc.SetPageSize(iTextSharp.text.PageSize.A4);
                                                PdfPTable table = new PdfPTable(7);
                                                table.TotalWidth = 500f;
                                                table.LockedWidth = true;
                                                float[] widths = new float[] { 4f, 1.66f, 4f, 1.66f, 4f, 1.66f, 4f };

                                                table.SetWidths(widths);
                                                table.HorizontalAlignment = 0;

                                                table.SpacingBefore = 10f;
                                                table.SpacingAfter = 5f;
                                                PdfPTable table1 = new PdfPTable(7);
                                                table1.TotalWidth = 500f;
                                                table1.LockedWidth = true;
                                                float[] widths1 = new float[] { 4f, 1.66f, 4f, 1.66f, 4f, 1.66f, 4f };

                                                table1.SetWidths(widths1);
                                                table1.HorizontalAlignment = 0;

                                                table1.SpacingBefore = 5f;
                                                table1.SpacingAfter = 10f;
                                                doc.Open();



                                                //DirectoryInfo dir_info = new DirectoryInfo(folderPath);
                                                //string directory = dir_info.Name;
                                                BaseFont bf = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);

                                                iTextSharp.text.Font font = new iTextSharp.text.Font(bf, 8, iTextSharp.text.Font.NORMAL);
                                                para = new Paragraph("Bundle name: " + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey)) + ", No. of Barcode: " + lstImage.Items.Count, font);
                                                para.Alignment = Element.ALIGN_RIGHT;


                                                if (lstImage.Items.Count % 4 == 0)
                                                {
                                                    int k = 0;
                                                    for (int i = 0; i < lstImage.Items.Count / 4; i++)
                                                    {
                                                        iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg1.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar = new PdfPCell(jpg1);
                                                        bar.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar);

                                                        k++;


                                                        PdfPCell empty = new PdfPCell(new Phrase("  "));
                                                        empty.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty);


                                                        iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg2.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar1 = new PdfPCell(jpg2);
                                                        bar1.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar1);

                                                        k++;


                                                        PdfPCell empty8 = new PdfPCell(new Phrase("  "));
                                                        empty8.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty8);


                                                        iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg3.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar2 = new PdfPCell(jpg3);
                                                        bar2.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar2);

                                                        k++;


                                                        PdfPCell empty9 = new PdfPCell(new Phrase("  "));
                                                        empty9.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty9);

                                                        iTextSharp.text.Image jpg4 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg4.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar3 = new PdfPCell(jpg4);
                                                        bar3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar3);

                                                        k++;

                                                        PdfPCell empty14 = new PdfPCell(new Phrase("  "));
                                                        empty14.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty14);

                                                        PdfPCell empty15 = new PdfPCell(new Phrase("  "));
                                                        empty15.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty15);

                                                        PdfPCell empty16 = new PdfPCell(new Phrase("  "));
                                                        empty16.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty16);


                                                        PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                        empty3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty3);


                                                        PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                        empty4.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty4);

                                                        PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                        empty5.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty5);

                                                        PdfPCell empty10 = new PdfPCell(new Phrase("  "));
                                                        empty10.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty10);


                                                        PdfPCell empty11 = new PdfPCell(new Phrase("  "));
                                                        empty11.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty11);

                                                        PdfPCell empty12 = new PdfPCell(new Phrase("  "));
                                                        empty12.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty12);

                                                        PdfPCell empty13 = new PdfPCell(new Phrase("  "));
                                                        empty13.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty13);

                                                        PdfPCell empty21 = new PdfPCell(new Phrase("  "));
                                                        empty21.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty21);

                                                        PdfPCell empty22 = new PdfPCell(new Phrase("  "));
                                                        empty22.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty22);

                                                        PdfPCell empty23 = new PdfPCell(new Phrase("  "));
                                                        empty23.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty23);
                                                    }
                                                }
                                                else if (lstImage.Items.Count % 4 == 1)
                                                {
                                                    int k = 0;
                                                    int i;
                                                    for (i = 0; i < lstImage.Items.Count / 4; i++)
                                                    {
                                                        iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg1.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar = new PdfPCell(jpg1);
                                                        bar.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar);

                                                        k++;


                                                        PdfPCell empty = new PdfPCell(new Phrase("  "));
                                                        empty.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty);


                                                        iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg2.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar1 = new PdfPCell(jpg2);
                                                        bar1.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar1);

                                                        k++;


                                                        PdfPCell empty8 = new PdfPCell(new Phrase("  "));
                                                        empty8.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty8);


                                                        iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg3.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar2 = new PdfPCell(jpg3);
                                                        bar2.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar2);

                                                        k++;


                                                        PdfPCell empty9 = new PdfPCell(new Phrase("  "));
                                                        empty9.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty9);

                                                        iTextSharp.text.Image jpg4 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg4.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar3 = new PdfPCell(jpg4);
                                                        bar3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar3);

                                                        k++;

                                                        PdfPCell empty14 = new PdfPCell(new Phrase("  "));
                                                        empty14.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty14);

                                                        PdfPCell empty15 = new PdfPCell(new Phrase("  "));
                                                        empty15.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty15);

                                                        PdfPCell empty16 = new PdfPCell(new Phrase("  "));
                                                        empty16.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty16);


                                                        PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                        empty3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty3);


                                                        PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                        empty4.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty4);

                                                        PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                        empty5.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty5);

                                                        PdfPCell empty10 = new PdfPCell(new Phrase("  "));
                                                        empty10.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty10);


                                                    }
                                                    iTextSharp.text.Image jpg5 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                    jpg5.ScaleAbsolute(110f, 60f);
                                                    PdfPCell bar4 = new PdfPCell(jpg5);
                                                    bar4.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(bar4);

                                                    PdfPCell empty31 = new PdfPCell(new Phrase("  "));
                                                    empty31.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty31);

                                                    PdfPCell empty32 = new PdfPCell(new Phrase("  "));
                                                    empty32.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty32);

                                                    PdfPCell empty33 = new PdfPCell(new Phrase("  "));
                                                    empty33.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty33);

                                                    PdfPCell empty34 = new PdfPCell(new Phrase("  "));
                                                    empty34.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty34);

                                                    PdfPCell empty35 = new PdfPCell(new Phrase("  "));
                                                    empty35.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty35);

                                                    PdfPCell empty36 = new PdfPCell(new Phrase("  "));
                                                    empty36.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty36);
                                                }
                                                else if (lstImage.Items.Count % 4 == 2)
                                                {
                                                    int k = 0;
                                                    for (int i = 0; i < lstImage.Items.Count / 4; i++)
                                                    {
                                                        iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg1.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar = new PdfPCell(jpg1);
                                                        bar.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar);

                                                        k++;


                                                        PdfPCell empty = new PdfPCell(new Phrase("  "));
                                                        empty.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty);


                                                        iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg2.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar1 = new PdfPCell(jpg2);
                                                        bar1.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar1);

                                                        k++;


                                                        PdfPCell empty8 = new PdfPCell(new Phrase("  "));
                                                        empty8.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty8);


                                                        iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg3.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar2 = new PdfPCell(jpg3);
                                                        bar2.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar2);

                                                        k++;


                                                        PdfPCell empty9 = new PdfPCell(new Phrase("  "));
                                                        empty9.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty9);

                                                        iTextSharp.text.Image jpg4 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg4.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar3 = new PdfPCell(jpg4);
                                                        bar3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar3);

                                                        k++;

                                                        PdfPCell empty14 = new PdfPCell(new Phrase("  "));
                                                        empty14.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty14);

                                                        PdfPCell empty15 = new PdfPCell(new Phrase("  "));
                                                        empty15.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty15);

                                                        PdfPCell empty16 = new PdfPCell(new Phrase("  "));
                                                        empty16.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty16);


                                                        PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                        empty3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty3);


                                                        PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                        empty4.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty4);

                                                        PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                        empty5.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty5);

                                                        PdfPCell empty10 = new PdfPCell(new Phrase("  "));
                                                        empty10.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty10);


                                                    }
                                                    iTextSharp.text.Image jpg5 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                    jpg5.ScaleAbsolute(110f, 60f);
                                                    PdfPCell bar4 = new PdfPCell(jpg5);
                                                    bar4.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(bar4);

                                                    k++;

                                                    PdfPCell empty31 = new PdfPCell(new Phrase("  "));
                                                    empty31.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty31);

                                                    iTextSharp.text.Image jpg6 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                    jpg6.ScaleAbsolute(110f, 60f);
                                                    PdfPCell bar6 = new PdfPCell(jpg6);
                                                    bar6.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(bar6);

                                                    PdfPCell empty33 = new PdfPCell(new Phrase("  "));
                                                    empty33.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty33);

                                                    PdfPCell empty34 = new PdfPCell(new Phrase("  "));
                                                    empty34.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty34);

                                                    PdfPCell empty35 = new PdfPCell(new Phrase("  "));
                                                    empty35.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty35);

                                                    PdfPCell empty36 = new PdfPCell(new Phrase("  "));
                                                    empty36.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty36);
                                                }
                                                else if (lstImage.Items.Count % 4 == 3)
                                                {

                                                    int k = 0;
                                                    int i;
                                                    for (i = 0; i < lstImage.Items.Count / 4; i++)
                                                    {

                                                        iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg1.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar = new PdfPCell(jpg1);
                                                        bar.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar);

                                                        k++;


                                                        PdfPCell empty = new PdfPCell(new Phrase("  "));
                                                        empty.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty);


                                                        iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg2.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar1 = new PdfPCell(jpg2);
                                                        bar1.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar1);

                                                        k++;


                                                        PdfPCell empty8 = new PdfPCell(new Phrase("  "));
                                                        empty8.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty8);


                                                        iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg3.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar2 = new PdfPCell(jpg3);
                                                        bar2.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar2);

                                                        k++;


                                                        PdfPCell empty9 = new PdfPCell(new Phrase("  "));
                                                        empty9.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty9);

                                                        iTextSharp.text.Image jpg4 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg4.ScaleAbsolute(110f, 60f);
                                                        PdfPCell bar3 = new PdfPCell(jpg4);
                                                        bar3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar3);

                                                        k++;

                                                        PdfPCell empty14 = new PdfPCell(new Phrase("  "));
                                                        empty14.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty14);

                                                        PdfPCell empty15 = new PdfPCell(new Phrase("  "));
                                                        empty15.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty15);

                                                        PdfPCell empty16 = new PdfPCell(new Phrase("  "));
                                                        empty16.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty16);


                                                        PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                        empty3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty3);


                                                        PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                        empty4.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty4);

                                                        PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                        empty5.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty5);

                                                        PdfPCell empty10 = new PdfPCell(new Phrase("  "));
                                                        empty10.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty10);

                                                    }
                                                    iTextSharp.text.Image jpg5 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                    jpg5.ScaleAbsolute(110f, 60f);
                                                    PdfPCell bar4 = new PdfPCell(jpg5);
                                                    bar4.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(bar4);

                                                    k++;

                                                    PdfPCell empty31 = new PdfPCell(new Phrase("  "));
                                                    empty31.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty31);

                                                    iTextSharp.text.Image jpg99 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                    jpg99.ScaleAbsolute(110f, 60f);
                                                    PdfPCell bar99 = new PdfPCell(jpg99);
                                                    bar99.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(bar99);

                                                    k++;

                                                    PdfPCell empty33 = new PdfPCell(new Phrase("  "));
                                                    empty33.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty33);

                                                    iTextSharp.text.Image jpg54 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                    jpg54.ScaleAbsolute(110f, 60f);
                                                    PdfPCell bar54 = new PdfPCell(jpg54);
                                                    bar54.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(bar54);


                                                    PdfPCell empty35 = new PdfPCell(new Phrase("  "));
                                                    empty35.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty35);

                                                    PdfPCell empty36 = new PdfPCell(new Phrase("  "));
                                                    empty36.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty36);
                                                }

                                                else if (lstImage.Items.Count == 1)
                                                {
                                                    int k = 0;
                                                    iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                    PdfPCell bar = new PdfPCell(jpg1);
                                                    bar.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(bar);

                                                    PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                    empty3.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty3);
                                                    PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                    empty4.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty4);

                                                }
                                                else
                                                {
                                                    int k = 0;
                                                    for (int i = 0; i < (lstImage.Items.Count) / 2; i++)
                                                    {




                                                        iTextSharp.text.Image jpg1 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        jpg1.Alignment = iTextSharp.text.Image.ALIGN_MIDDLE;

                                                        PdfPCell bar = new PdfPCell(jpg1);
                                                        bar.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar);

                                                        k++;

                                                        PdfPCell empty = new PdfPCell();
                                                        empty.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty);
                                                        iTextSharp.text.Image jpg2 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                        PdfPCell bar1 = new PdfPCell(jpg2);
                                                        bar1.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(bar1);

                                                        k++;

                                                        PdfPCell empty3 = new PdfPCell(new Phrase("  "));
                                                        empty3.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty3);
                                                        PdfPCell empty4 = new PdfPCell(new Phrase("  "));
                                                        empty4.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty4);
                                                        PdfPCell empty5 = new PdfPCell(new Phrase("  "));
                                                        empty5.Border = PdfPCell.NO_BORDER;
                                                        table.AddCell(empty5);





                                                    }
                                                    iTextSharp.text.Image jpg3 = iTextSharp.text.Image.GetInstance(imageList[k]);
                                                    PdfPCell bar3 = new PdfPCell(jpg3);
                                                    bar3.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(bar3);
                                                    PdfPCell empty1 = new PdfPCell();
                                                    empty1.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty1);
                                                    PdfPCell empty2 = new PdfPCell();
                                                    empty2.Border = PdfPCell.NO_BORDER;
                                                    table.AddCell(empty2);
                                                }

                                                doc.Add(para);
                                                doc.Add(table);
                                                //DirectoryInfo dir_info1 = new DirectoryInfo(folderPath1);
                                                //string directory1 = dir_info1.Name;
                                                //para1 = new Paragraph("Bundle name: " + GetBundleName(Convert.ToInt32(projKey), Convert.ToInt32(bundleKey)) + "- No. of Barcode: " + lstImage.Items.Count, font);
                                                //para1.Alignment = Element.ALIGN_RIGHT;
                                                //doc.Add(para1);

                                                doc.Add(table1);
                                                doc.Close();


                                                Directory.Delete(expFolder + "\\Barcode", true);
                                                bool insertlog = insertIntoDB(projKey, bundleKey, cmbBundle.Text);
                                                if (insertlog == true)
                                                {
                                                    MessageBox.Show(this, "Barcode Generated Successfully...", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                                    cmdExport.Enabled = true;

                                                    int pendBundle = pendingBundle().Rows.Count;


                                                }
                                            }
                                            catch (Exception ex)
                                            { }
                                        }
                                    }

                                }
                            }






                            statusStrip1.Items.Clear();
                            statusStrip1.Items.Add("Status: Bundle Sucessfully Uploaded");
                            MessageBox.Show("Bundle Sucessfully Uploaded");
                            populateBundle();
                        }
                        else
                        {
                            statusStrip1.Items.Clear();
                            statusStrip1.Items.Add("Status: Bundle Sucessfully Uploaded");
                            MessageBox.Show("Bundle Sucessfully Uploaded");
                            populateBundle();
                            return;
                        }
                    }
                    else
                    {
                        statusStrip1.Items.Clear();
                        statusStrip1.Items.Add("Status: Uploading Cannot be Completed");
                        MessageBox.Show(this, "Uploading Cannot be Completed", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                
            }
        }

        public DataSet GetBundlePath(string prmProjKey, string prmBundleKey)
        {
            string sqlStr = null;
            DataSet bundleDs = new DataSet();

            try
            {
                sqlStr = @"select bundle_path,bundle_code from bundle_master where proj_code = '"+ prmProjKey + "' and bundle_key = '"+prmBundleKey+"' ";
                sqlAdap = new OdbcDataAdapter(sqlStr, sqlCon);
                sqlAdap.Fill(bundleDs);

                //Test whether the path exists or not
                //throw new ValidationException(1234);
            }
            catch (OdbcException ex)
            {
                sqlAdap.Dispose();
                MessageBox.Show(ex.ToString());
            }
            return bundleDs;
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
            System.Diagnostics.Debug.Print(sqlStr);
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);


            if (cmd.ExecuteNonQuery() > 0)
            {
                retVal = true;
            }


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

        public bool KeyCheck(string prmValue)
        {
            string sqlStr = null;
            OdbcCommand cmd = null;
            bool existsBol = true;

            sqlStr = "select bundle_code from bundle_master where batch_code='" + prmValue.ToUpper() + "'";
            cmd = new OdbcCommand(sqlStr, sqlCon);
            existsBol = cmd.ExecuteReader().HasRows;

            return existsBol;
        }

        public bool _UpdateCaseFile()
        {
            string sqlStr = null;
            
            OdbcCommand sqlCmd = new OdbcCommand();

            bool retVal = false;
            string sql = string.Empty;
            

            sqlStr = "UPDATE case_file_master SET status = '1' WHERE proj_code = '" + projKey + "' AND bundle_key = '" + bundleKey + "'";
            System.Diagnostics.Debug.Print(sqlStr);
            OdbcCommand cmd = new OdbcCommand(sqlStr, sqlCon);
            if (cmd.ExecuteNonQuery() > 0)
            {
                retVal = true;
            }


            return retVal;
        }
    }
}
