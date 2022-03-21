namespace ImageHeaven
{
    partial class frmAddConnApp
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmAddConnApp));
            this.listView5 = new System.Windows.Forms.ListView();
            this.columnHeader5 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.deButton15 = new nControls.deButton();
            this.deTextBox31 = new nControls.deTextBox();
            this.deTextBox32 = new nControls.deTextBox();
            this.deLabel34 = new nControls.deLabel();
            this.deLabel35 = new nControls.deLabel();
            this.deComboBox7 = new nControls.deComboBox();
            this.deLabel36 = new nControls.deLabel();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.grpSave = new System.Windows.Forms.GroupBox();
            this.button2 = new System.Windows.Forms.Button();
            this.cmdDone = new System.Windows.Forms.Button();
            this.grpDelete = new System.Windows.Forms.GroupBox();
            this.cmdDelete = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.panel1.SuspendLayout();
            this.grpSave.SuspendLayout();
            this.grpDelete.SuspendLayout();
            this.SuspendLayout();
            // 
            // listView5
            // 
            this.listView5.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader5});
            this.listView5.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listView5.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.listView5.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.listView5.FullRowSelect = true;
            this.listView5.GridLines = true;
            this.listView5.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
            this.listView5.HideSelection = false;
            this.listView5.Location = new System.Drawing.Point(0, 0);
            this.listView5.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.listView5.MultiSelect = false;
            this.listView5.Name = "listView5";
            this.listView5.Size = new System.Drawing.Size(411, 191);
            this.listView5.TabIndex = 5;
            this.listView5.UseCompatibleStateImageBehavior = false;
            this.listView5.View = System.Windows.Forms.View.Details;
            this.listView5.SelectedIndexChanged += new System.EventHandler(this.listView5_SelectedIndexChanged);
            this.listView5.KeyUp += new System.Windows.Forms.KeyEventHandler(this.listView5_KeyUp);
            // 
            // columnHeader5
            // 
            this.columnHeader5.Text = "Connected Application Name";
            this.columnHeader5.Width = 404;
            // 
            // deButton15
            // 
            this.deButton15.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("deButton15.BackgroundImage")));
            this.deButton15.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.deButton15.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.deButton15.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.deButton15.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deButton15.Location = new System.Drawing.Point(324, 42);
            this.deButton15.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deButton15.Name = "deButton15";
            this.deButton15.Size = new System.Drawing.Size(89, 33);
            this.deButton15.TabIndex = 4;
            this.deButton15.Text = "&Add";
            this.deButton15.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.deButton15.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.deButton15.UseCompatibleTextRendering = true;
            this.deButton15.UseVisualStyleBackColor = true;
            this.deButton15.Click += new System.EventHandler(this.deButton15_Click);
            // 
            // deTextBox31
            // 
            this.deTextBox31.BackColor = System.Drawing.Color.White;
            this.deTextBox31.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deTextBox31.ForeColor = System.Drawing.Color.Black;
            this.deTextBox31.Location = new System.Drawing.Point(92, 29);
            this.deTextBox31.Mandatory = true;
            this.deTextBox31.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deTextBox31.Name = "deTextBox31";
            this.deTextBox31.Size = new System.Drawing.Size(216, 22);
            this.deTextBox31.TabIndex = 2;
            // 
            // deTextBox32
            // 
            this.deTextBox32.BackColor = System.Drawing.Color.White;
            this.deTextBox32.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.deTextBox32.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deTextBox32.ForeColor = System.Drawing.Color.Black;
            this.deTextBox32.Location = new System.Drawing.Point(92, 53);
            this.deTextBox32.Mandatory = true;
            this.deTextBox32.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deTextBox32.MaxLength = 4;
            this.deTextBox32.Name = "deTextBox32";
            this.deTextBox32.Size = new System.Drawing.Size(216, 22);
            this.deTextBox32.TabIndex = 3;
            this.deTextBox32.Leave += new System.EventHandler(this.deTextBox32_Leave);
            // 
            // deLabel34
            // 
            this.deLabel34.AutoSize = true;
            this.deLabel34.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel34.Location = new System.Drawing.Point(8, 33);
            this.deLabel34.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.deLabel34.Name = "deLabel34";
            this.deLabel34.Size = new System.Drawing.Size(81, 13);
            this.deLabel34.TabIndex = 57;
            this.deLabel34.Text = "Case Number :";
            // 
            // deLabel35
            // 
            this.deLabel35.AutoSize = true;
            this.deLabel35.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel35.Location = new System.Drawing.Point(28, 55);
            this.deLabel35.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.deLabel35.Name = "deLabel35";
            this.deLabel35.Size = new System.Drawing.Size(60, 13);
            this.deLabel35.TabIndex = 58;
            this.deLabel35.Text = "Case Year :";
            // 
            // deComboBox7
            // 
            this.deComboBox7.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.deComboBox7.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.deComboBox7.BackColor = System.Drawing.Color.White;
            this.deComboBox7.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deComboBox7.ForeColor = System.Drawing.Color.Black;
            this.deComboBox7.FormattingEnabled = true;
            this.deComboBox7.ItemHeight = 13;
            this.deComboBox7.Location = new System.Drawing.Point(92, 6);
            this.deComboBox7.Mandatory = false;
            this.deComboBox7.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deComboBox7.Name = "deComboBox7";
            this.deComboBox7.Size = new System.Drawing.Size(216, 21);
            this.deComboBox7.TabIndex = 1;
            // 
            // deLabel36
            // 
            this.deLabel36.AutoSize = true;
            this.deLabel36.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel36.Location = new System.Drawing.Point(26, 12);
            this.deLabel36.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.deLabel36.Name = "deLabel36";
            this.deLabel36.Size = new System.Drawing.Size(63, 13);
            this.deLabel36.TabIndex = 56;
            this.deLabel36.Text = "Case Type :";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.panel1);
            this.groupBox1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(2, 79);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(417, 213);
            this.groupBox1.TabIndex = 64;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Connected Application List :";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.listView5);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(3, 19);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(411, 191);
            this.panel1.TabIndex = 0;
            // 
            // grpSave
            // 
            this.grpSave.Controls.Add(this.button2);
            this.grpSave.Controls.Add(this.cmdDone);
            this.grpSave.Location = new System.Drawing.Point(172, 293);
            this.grpSave.Name = "grpSave";
            this.grpSave.Size = new System.Drawing.Size(115, 43);
            this.grpSave.TabIndex = 66;
            this.grpSave.TabStop = false;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(6, 12);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(52, 23);
            this.button2.TabIndex = 9;
            this.button2.Text = "Canc&el";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // cmdDone
            // 
            this.cmdDone.Location = new System.Drawing.Point(64, 12);
            this.cmdDone.Name = "cmdDone";
            this.cmdDone.Size = new System.Drawing.Size(47, 23);
            this.cmdDone.TabIndex = 7;
            this.cmdDone.Text = "&Done!!";
            this.cmdDone.UseVisualStyleBackColor = true;
            this.cmdDone.Click += new System.EventHandler(this.cmdDone_Click);
            // 
            // grpDelete
            // 
            this.grpDelete.Controls.Add(this.cmdDelete);
            this.grpDelete.Location = new System.Drawing.Point(100, 293);
            this.grpDelete.Name = "grpDelete";
            this.grpDelete.Size = new System.Drawing.Size(66, 42);
            this.grpDelete.TabIndex = 65;
            this.grpDelete.TabStop = false;
            // 
            // cmdDelete
            // 
            this.cmdDelete.Location = new System.Drawing.Point(6, 13);
            this.cmdDelete.Name = "cmdDelete";
            this.cmdDelete.Size = new System.Drawing.Size(52, 23);
            this.cmdDelete.TabIndex = 8;
            this.cmdDelete.Text = "De&lete";
            this.cmdDelete.UseVisualStyleBackColor = true;
            this.cmdDelete.Click += new System.EventHandler(this.cmdDelete_Click);
            // 
            // frmAddConnApp
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.ClientSize = new System.Drawing.Size(419, 336);
            this.ControlBox = false;
            this.Controls.Add(this.grpSave);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.deButton15);
            this.Controls.Add(this.grpDelete);
            this.Controls.Add(this.deTextBox31);
            this.Controls.Add(this.deTextBox32);
            this.Controls.Add(this.deLabel34);
            this.Controls.Add(this.deLabel35);
            this.Controls.Add(this.deComboBox7);
            this.Controls.Add(this.deLabel36);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmAddConnApp";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Add Connected Application";
            this.Load += new System.EventHandler(this.frmAddConnApp_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.frmAddConnApp_KeyDown);
            this.KeyUp += new System.Windows.Forms.KeyEventHandler(this.frmAddConnApp_KeyUp);
            this.groupBox1.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.grpSave.ResumeLayout(false);
            this.grpDelete.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListView listView5;
        private System.Windows.Forms.ColumnHeader columnHeader5;
        private nControls.deButton deButton15;
        private nControls.deTextBox deTextBox31;
        private nControls.deTextBox deTextBox32;
        private nControls.deLabel deLabel34;
        private nControls.deLabel deLabel35;
        private nControls.deComboBox deComboBox7;
        private nControls.deLabel deLabel36;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.GroupBox grpSave;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button cmdDone;
        private System.Windows.Forms.GroupBox grpDelete;
        private System.Windows.Forms.Button cmdDelete;
    }
}