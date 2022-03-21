namespace ImageHeaven
{
    partial class frmAddAnalogous
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmAddAnalogous));
            this.listView6 = new System.Windows.Forms.ListView();
            this.columnHeader6 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.deButton19 = new nControls.deButton();
            this.deTextBox38 = new nControls.deTextBox();
            this.deTextBox39 = new nControls.deTextBox();
            this.deLabel41 = new nControls.deLabel();
            this.deLabel42 = new nControls.deLabel();
            this.deComboBox10 = new nControls.deComboBox();
            this.deLabel43 = new nControls.deLabel();
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
            // listView6
            // 
            this.listView6.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader6});
            this.listView6.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listView6.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.listView6.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.listView6.FullRowSelect = true;
            this.listView6.GridLines = true;
            this.listView6.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
            this.listView6.HideSelection = false;
            this.listView6.Location = new System.Drawing.Point(0, 0);
            this.listView6.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.listView6.MultiSelect = false;
            this.listView6.Name = "listView6";
            this.listView6.Size = new System.Drawing.Size(396, 166);
            this.listView6.TabIndex = 76;
            this.listView6.UseCompatibleStateImageBehavior = false;
            this.listView6.View = System.Windows.Forms.View.Details;
            this.listView6.SelectedIndexChanged += new System.EventHandler(this.listView6_SelectedIndexChanged);
            this.listView6.KeyUp += new System.Windows.Forms.KeyEventHandler(this.listView6_KeyUp);
            // 
            // columnHeader6
            // 
            this.columnHeader6.Text = "Analogous Case Name";
            this.columnHeader6.Width = 390;
            // 
            // deButton19
            // 
            this.deButton19.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("deButton19.BackgroundImage")));
            this.deButton19.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.deButton19.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.deButton19.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.deButton19.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deButton19.Location = new System.Drawing.Point(322, 52);
            this.deButton19.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deButton19.Name = "deButton19";
            this.deButton19.Size = new System.Drawing.Size(75, 31);
            this.deButton19.TabIndex = 75;
            this.deButton19.Text = "&Add";
            this.deButton19.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.deButton19.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.deButton19.UseCompatibleTextRendering = true;
            this.deButton19.UseVisualStyleBackColor = true;
            this.deButton19.Click += new System.EventHandler(this.deButton19_Click);
            // 
            // deTextBox38
            // 
            this.deTextBox38.BackColor = System.Drawing.Color.White;
            this.deTextBox38.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deTextBox38.ForeColor = System.Drawing.Color.Black;
            this.deTextBox38.Location = new System.Drawing.Point(107, 37);
            this.deTextBox38.Mandatory = true;
            this.deTextBox38.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deTextBox38.Name = "deTextBox38";
            this.deTextBox38.Size = new System.Drawing.Size(201, 22);
            this.deTextBox38.TabIndex = 73;
            // 
            // deTextBox39
            // 
            this.deTextBox39.BackColor = System.Drawing.Color.White;
            this.deTextBox39.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.deTextBox39.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deTextBox39.ForeColor = System.Drawing.Color.Black;
            this.deTextBox39.Location = new System.Drawing.Point(107, 61);
            this.deTextBox39.Mandatory = true;
            this.deTextBox39.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deTextBox39.MaxLength = 4;
            this.deTextBox39.Name = "deTextBox39";
            this.deTextBox39.Size = new System.Drawing.Size(201, 22);
            this.deTextBox39.TabIndex = 74;
            this.deTextBox39.Leave += new System.EventHandler(this.deTextBox39_Leave);
            // 
            // deLabel41
            // 
            this.deLabel41.AutoSize = true;
            this.deLabel41.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel41.Location = new System.Drawing.Point(15, 38);
            this.deLabel41.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.deLabel41.Name = "deLabel41";
            this.deLabel41.Size = new System.Drawing.Size(85, 15);
            this.deLabel41.TabIndex = 70;
            this.deLabel41.Text = "Case Number :";
            // 
            // deLabel42
            // 
            this.deLabel42.AutoSize = true;
            this.deLabel42.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel42.Location = new System.Drawing.Point(37, 64);
            this.deLabel42.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.deLabel42.Name = "deLabel42";
            this.deLabel42.Size = new System.Drawing.Size(63, 15);
            this.deLabel42.TabIndex = 71;
            this.deLabel42.Text = "Case Year :";
            // 
            // deComboBox10
            // 
            this.deComboBox10.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.deComboBox10.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.deComboBox10.BackColor = System.Drawing.Color.White;
            this.deComboBox10.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deComboBox10.ForeColor = System.Drawing.Color.Black;
            this.deComboBox10.FormattingEnabled = true;
            this.deComboBox10.Location = new System.Drawing.Point(107, 13);
            this.deComboBox10.Mandatory = false;
            this.deComboBox10.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deComboBox10.Name = "deComboBox10";
            this.deComboBox10.Size = new System.Drawing.Size(201, 21);
            this.deComboBox10.TabIndex = 72;
            // 
            // deLabel43
            // 
            this.deLabel43.AutoSize = true;
            this.deLabel43.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel43.Location = new System.Drawing.Point(35, 14);
            this.deLabel43.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.deLabel43.Name = "deLabel43";
            this.deLabel43.Size = new System.Drawing.Size(65, 15);
            this.deLabel43.TabIndex = 69;
            this.deLabel43.Text = "Case Type :";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.panel1);
            this.groupBox1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(2, 90);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(402, 188);
            this.groupBox1.TabIndex = 77;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Analogous Case List :";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.listView6);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(3, 19);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(396, 166);
            this.panel1.TabIndex = 0;
            // 
            // grpSave
            // 
            this.grpSave.Controls.Add(this.button2);
            this.grpSave.Controls.Add(this.cmdDone);
            this.grpSave.Location = new System.Drawing.Point(173, 281);
            this.grpSave.Name = "grpSave";
            this.grpSave.Size = new System.Drawing.Size(115, 43);
            this.grpSave.TabIndex = 79;
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
            this.grpDelete.Location = new System.Drawing.Point(104, 281);
            this.grpDelete.Name = "grpDelete";
            this.grpDelete.Size = new System.Drawing.Size(62, 42);
            this.grpDelete.TabIndex = 78;
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
            // frmAddAnalogous
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.ClientSize = new System.Drawing.Size(405, 330);
            this.ControlBox = false;
            this.Controls.Add(this.grpSave);
            this.Controls.Add(this.grpDelete);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.deButton19);
            this.Controls.Add(this.deTextBox38);
            this.Controls.Add(this.deTextBox39);
            this.Controls.Add(this.deLabel41);
            this.Controls.Add(this.deLabel42);
            this.Controls.Add(this.deComboBox10);
            this.Controls.Add(this.deLabel43);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmAddAnalogous";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Add Analogous Case ";
            this.Load += new System.EventHandler(this.frmAddAnalogous_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.frmAddAnalogous_KeyDown);
            this.KeyUp += new System.Windows.Forms.KeyEventHandler(this.frmAddAnalogous_KeyUp);
            this.groupBox1.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.grpSave.ResumeLayout(false);
            this.grpDelete.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListView listView6;
        private System.Windows.Forms.ColumnHeader columnHeader6;
        private nControls.deButton deButton19;
        private nControls.deTextBox deTextBox38;
        private nControls.deTextBox deTextBox39;
        private nControls.deLabel deLabel41;
        private nControls.deLabel deLabel42;
        private nControls.deComboBox deComboBox10;
        private nControls.deLabel deLabel43;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.GroupBox grpSave;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button cmdDone;
        private System.Windows.Forms.GroupBox grpDelete;
        private System.Windows.Forms.Button cmdDelete;
    }
}