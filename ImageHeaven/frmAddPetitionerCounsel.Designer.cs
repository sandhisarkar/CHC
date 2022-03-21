namespace ImageHeaven
{
    partial class frmAddPetitionerCounsel
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmAddPetitionerCounsel));
            this.listView7 = new System.Windows.Forms.ListView();
            this.columnHeader7 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.deButton5 = new nControls.deButton();
            this.deTextBox14 = new nControls.deTextBox();
            this.deLabel17 = new nControls.deLabel();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.grpSave = new System.Windows.Forms.GroupBox();
            this.button2 = new System.Windows.Forms.Button();
            this.cmdDone = new System.Windows.Forms.Button();
            this.grpDelete = new System.Windows.Forms.GroupBox();
            this.cmdDelete = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.panel1.SuspendLayout();
            this.grpSave.SuspendLayout();
            this.grpDelete.SuspendLayout();
            this.SuspendLayout();
            // 
            // listView7
            // 
            this.listView7.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader7});
            this.listView7.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listView7.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.listView7.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.listView7.FullRowSelect = true;
            this.listView7.GridLines = true;
            this.listView7.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
            this.listView7.HideSelection = false;
            this.listView7.Location = new System.Drawing.Point(0, 0);
            this.listView7.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.listView7.MultiSelect = false;
            this.listView7.Name = "listView7";
            this.listView7.Size = new System.Drawing.Size(395, 213);
            this.listView7.TabIndex = 4;
            this.listView7.UseCompatibleStateImageBehavior = false;
            this.listView7.View = System.Windows.Forms.View.Details;
            this.listView7.SelectedIndexChanged += new System.EventHandler(this.listView7_SelectedIndexChanged);
            this.listView7.DoubleClick += new System.EventHandler(this.listView7_DoubleClick);
            this.listView7.KeyUp += new System.Windows.Forms.KeyEventHandler(this.listView7_KeyUp);
            // 
            // columnHeader7
            // 
            this.columnHeader7.Text = "Petitioner Counsel Name";
            this.columnHeader7.Width = 390;
            // 
            // deButton5
            // 
            this.deButton5.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("deButton5.BackgroundImage")));
            this.deButton5.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.deButton5.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.deButton5.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.deButton5.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deButton5.Location = new System.Drawing.Point(316, 7);
            this.deButton5.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deButton5.Name = "deButton5";
            this.deButton5.Size = new System.Drawing.Size(77, 31);
            this.deButton5.TabIndex = 2;
            this.deButton5.Text = "&Add";
            this.deButton5.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.deButton5.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.deButton5.UseCompatibleTextRendering = true;
            this.deButton5.UseVisualStyleBackColor = true;
            this.deButton5.Click += new System.EventHandler(this.deButton5_Click);
            // 
            // deTextBox14
            // 
            this.deTextBox14.BackColor = System.Drawing.Color.White;
            this.deTextBox14.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deTextBox14.ForeColor = System.Drawing.Color.Black;
            this.deTextBox14.Location = new System.Drawing.Point(114, 11);
            this.deTextBox14.Mandatory = true;
            this.deTextBox14.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deTextBox14.Name = "deTextBox14";
            this.deTextBox14.Size = new System.Drawing.Size(189, 23);
            this.deTextBox14.TabIndex = 1;
            // 
            // deLabel17
            // 
            this.deLabel17.AutoSize = true;
            this.deLabel17.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel17.Location = new System.Drawing.Point(18, 15);
            this.deLabel17.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.deLabel17.Name = "deLabel17";
            this.deLabel17.Size = new System.Drawing.Size(91, 15);
            this.deLabel17.TabIndex = 25;
            this.deLabel17.Text = "Counsel Name :";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.panel1);
            this.groupBox1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(1, 50);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(401, 235);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Petitioner Counsel List :";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.listView7);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(3, 19);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(395, 213);
            this.panel1.TabIndex = 0;
            // 
            // grpSave
            // 
            this.grpSave.Controls.Add(this.button2);
            this.grpSave.Controls.Add(this.cmdDone);
            this.grpSave.Location = new System.Drawing.Point(208, 288);
            this.grpSave.Name = "grpSave";
            this.grpSave.Size = new System.Drawing.Size(115, 43);
            this.grpSave.TabIndex = 30;
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
            this.grpDelete.Controls.Add(this.button1);
            this.grpDelete.Controls.Add(this.cmdDelete);
            this.grpDelete.Location = new System.Drawing.Point(78, 288);
            this.grpDelete.Name = "grpDelete";
            this.grpDelete.Size = new System.Drawing.Size(124, 42);
            this.grpDelete.TabIndex = 29;
            this.grpDelete.TabStop = false;
            // 
            // cmdDelete
            // 
            this.cmdDelete.Location = new System.Drawing.Point(7, 13);
            this.cmdDelete.Name = "cmdDelete";
            this.cmdDelete.Size = new System.Drawing.Size(52, 23);
            this.cmdDelete.TabIndex = 8;
            this.cmdDelete.Text = "De&lete";
            this.cmdDelete.UseVisualStyleBackColor = true;
            this.cmdDelete.Click += new System.EventHandler(this.cmdDelete_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(65, 13);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(53, 23);
            this.button1.TabIndex = 6;
            this.button1.Text = "Edi&t";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // frmAddPetitionerCounsel
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.ClientSize = new System.Drawing.Size(405, 334);
            this.ControlBox = false;
            this.Controls.Add(this.grpSave);
            this.Controls.Add(this.grpDelete);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.deButton5);
            this.Controls.Add(this.deTextBox14);
            this.Controls.Add(this.deLabel17);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmAddPetitionerCounsel";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Add Petitioner Counsel";
            this.Load += new System.EventHandler(this.frmAddPetitionerCounsel_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.frmAddPetitionerCounsel_KeyDown);
            this.KeyUp += new System.Windows.Forms.KeyEventHandler(this.frmAddPetitionerCounsel_KeyUp);
            this.groupBox1.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.grpSave.ResumeLayout(false);
            this.grpDelete.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListView listView7;
        private System.Windows.Forms.ColumnHeader columnHeader7;
        private nControls.deButton deButton5;
        private nControls.deTextBox deTextBox14;
        private nControls.deLabel deLabel17;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.GroupBox grpSave;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button cmdDone;
        private System.Windows.Forms.GroupBox grpDelete;
        private System.Windows.Forms.Button cmdDelete;
        private System.Windows.Forms.Button button1;
    }
}