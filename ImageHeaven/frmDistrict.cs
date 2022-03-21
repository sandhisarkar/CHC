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
    public partial class frmDistrict : Form
    {
        OdbcDataAdapter sqlAdap;
        private Credentials crd = new Credentials();
        MemoryStream stateLog;
        byte[] tmpWrite;
        private OdbcConnection sqlCon = null;
        private bool m_bSaveLayout = true;
        private DeserializeDockContent m_deserializeDockContent;
        private FloatToolbox m_toolbox = new FloatToolbox();
        //private MagickNet.Image imgQc;
        private string imgFileName = null;
        NovaNet.Utils.ImageManupulation delImage;
        private wfeBox wBox = null;
        private CtrlPolicy pPolicy = null;
        private CtrlImage pImage = null;
        private CtrlBox pBox = null;
        NovaNet.Utils.dbCon dbcon = new NovaNet.Utils.dbCon();
        private int indexCount = 0;
        private eSTATES[] currState;
        private eSTATES[] imageCurrState;
        public static NovaNet.Utils.exLog.Logger exMailLog = new NovaNet.Utils.exLog.emailLogger("./errLog.log", NovaNet.Utils.exLog.LogLevel.Dev, Constants._MAIL_TO, Constants._MAIL_FROM, Constants._SMTP);
        public static NovaNet.Utils.exLog.Logger exTxtLog = new NovaNet.Utils.exLog.txtLogger("./errLog.log", NovaNet.Utils.exLog.LogLevel.Dev);
        //public static string projKey = null;
        //public static string bundleKey = null;
        //public static string boxNumber = null;

        public frmDistrict()
        {
            InitializeComponent();
        }

        public frmDistrict(OdbcConnection prmCon, Credentials prmCrd)
        {
            InitializeComponent();
            sqlCon = prmCon;
            crd = prmCrd;
            this.Text = "Add District";
        }

        private void frmDistrict_Load(object sender, EventArgs e)
        {
            textBox1.Text = string.Empty;
            textBox1.Focus();
            textBox1.Select();
        }

        private void CmdCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }


        bool validateDuplicateDistrict()
        {
            bool retVal = false;

            DataTable dt1 = new DataTable();
            string sql1 = "select * from district where district_name = '" + textBox1.Text + "'";
            OdbcCommand cmd1 = new OdbcCommand(sql1, sqlCon);
            OdbcDataAdapter odap1 = new OdbcDataAdapter(cmd1);
            odap1.Fill(dt1);

            if (dt1.Rows.Count > 0)
            { retVal = false; }
            else
            { retVal = true; }

            return retVal;
        }


        private bool insertIntoDB(string name)
        {
            bool commitBol = true;


            DataTable dt1 = new DataTable();
            string sql1 = "select Count(*) from district where district_code <> '99' ";
            OdbcCommand cmd1 = new OdbcCommand(sql1, sqlCon);
            OdbcDataAdapter odap1 = new OdbcDataAdapter(cmd1);
            odap1.Fill(dt1);

            string codeCount = dt1.Rows[0][0].ToString();
            if(codeCount.Length ==1)
            {
                codeCount = codeCount.PadLeft(2, '0');
            }

            string sqlStr = string.Empty;

            OdbcCommand sqlCmd = new OdbcCommand();

            sqlStr = @"insert into district(district_code,district_name,zone_code) values('" + codeCount + "','" + name + "','1')";

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

        private void CmdSave_Click(object sender, EventArgs e)
        {
            
            if (textBox1.Text == "" || textBox1.Text == null || String.IsNullOrEmpty(textBox1.Text) || String.IsNullOrWhiteSpace(textBox1.Text))
            {
                MessageBox.Show("You cannot leave district name field blank...", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                textBox1.Focus();
                return;
            }

            if (textBox1.Text != "" || textBox1.Text != null)
            {
                if (validateDuplicateDistrict() == true)
                {
                    bool insertmeta = insertIntoDB(textBox1.Text.Trim());
                    if (insertmeta == true)
                    {
                        MessageBox.Show(this, "Record Saved Successfully...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        textBox1.Text = string.Empty;

                        textBox1.Focus();
                    }
                }
                else
                {
                    MessageBox.Show(this, "This district name already exists...", "B'Zer - Calcutta High Court", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;
                }

            }

        }
    }
}
