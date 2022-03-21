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
    public partial class frmJudge : Form
    {
        public static string projKey = null;
        public static string bundleKey = null;
        public static string boxNumber = null;
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
        //OdbcDataAdapter sqlAdap;
        public frmJudge()
        {
            InitializeComponent();
        }
        public frmJudge(OdbcConnection prmCon, Credentials prmCrd)
        {
            sqlCon = prmCon;
            //wBox = prmBox;
            //
            // The InitializeComponent() call is required for Windows Forms designer support.
            //
            crd = prmCrd;
            InitializeComponent();

        }
        private void frmJudge_Load(object sender, EventArgs e)
        {
            deComboBox1.Text = string.Empty;
        }

        private void deButton2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void CmdCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private bool insertIntoDB(string des, string name)
        {
            bool commitBol = true;

            string sqlStr = string.Empty;

            OdbcCommand sqlCmd = new OdbcCommand();

            sqlStr = @"insert into judge_master(judge_designation,judge_name) values('" + des + "','" + name + "')";

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


        bool validateDuplicateJudge()
        {
            bool retVal = false;

            DataTable dt1 = new DataTable();
            string sql1 = "select * from judge_master where judge_designation = '" + deComboBox1.Text + "' and judge_name = '" + deTextBox1.Text.Trim() + "'";
            OdbcCommand cmd1 = new OdbcCommand(sql1, sqlCon);
            OdbcDataAdapter odap1 = new OdbcDataAdapter(cmd1);
            odap1.Fill(dt1);

            if(dt1.Rows.Count > 0)
            { retVal = false; }
            else
            { retVal = true; }

            return retVal;
        }

        private void CmdSave_Click(object sender, EventArgs e)
        {
            if (deComboBox1.Text == "" || deComboBox1.Text == null || String.IsNullOrEmpty(deComboBox1.Text) || String.IsNullOrWhiteSpace(deComboBox1.Text))
            {
                MessageBox.Show("You cannot leave designation field blank...", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                deComboBox1.Focus();
                return;
            }
            if (deTextBox1.Text == "" || deTextBox1.Text == null || String.IsNullOrEmpty(deTextBox1.Text) || String.IsNullOrWhiteSpace(deTextBox1.Text))
            {
                MessageBox.Show("You cannot leave judge name field blank...", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                deTextBox1.Focus();
                return;
            }
            if (deComboBox1.Text != "" || deComboBox1.Text != null)
            {
                if (deTextBox1.Text != "" || deTextBox1.Text != null)
                {
                    if(validateDuplicateJudge() == true)
                    {
                        bool insertmeta = insertIntoDB(deComboBox1.Text, deTextBox1.Text);
                        if (insertmeta == true)
                        {
                            MessageBox.Show(this, "Record Saved Successfully...", "Record Management", MessageBoxButtons.OK, MessageBoxIcon.Information);

                            deComboBox1.Text = string.Empty;
                            deTextBox1.Text = string.Empty;
                            deComboBox1.Focus();
                        }
                    }
                    else
                    {
                        MessageBox.Show(this, "This judge already exists...", "Record Management", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return;
                    }
                    
                }
            }
        }

        private void frmJudge_KeyUp(object sender, KeyEventArgs e)
        {
            if(e.KeyCode == Keys.Escape)
            {
                //this.Close();
            }
        }
    }
}
