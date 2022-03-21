namespace ImageHeaven
{
    partial class frmAddLcJudge
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmAddLcJudge));
            this.listView9 = new System.Windows.Forms.ListView();
            this.columnHeader9 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.deButton13 = new nControls.deButton();
            this.deComboBox6 = new nControls.deComboBox();
            this.deLabel33 = new nControls.deLabel();
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
            // listView9
            // 
            this.listView9.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader9});
            this.listView9.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listView9.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.listView9.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.listView9.FullRowSelect = true;
            this.listView9.GridLines = true;
            this.listView9.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
            this.listView9.HideSelection = false;
            this.listView9.Location = new System.Drawing.Point(0, 0);
            this.listView9.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.listView9.MultiSelect = false;
            this.listView9.Name = "listView9";
            this.listView9.Size = new System.Drawing.Size(369, 245);
            this.listView9.TabIndex = 3;
            this.listView9.UseCompatibleStateImageBehavior = false;
            this.listView9.View = System.Windows.Forms.View.Details;
            this.listView9.SelectedIndexChanged += new System.EventHandler(this.listView9_SelectedIndexChanged);
            this.listView9.KeyUp += new System.Windows.Forms.KeyEventHandler(this.listView9_KeyUp);
            // 
            // columnHeader9
            // 
            this.columnHeader9.Text = "LC Judge Name";
            this.columnHeader9.Width = 363;
            // 
            // deButton13
            // 
            this.deButton13.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("deButton13.BackgroundImage")));
            this.deButton13.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.deButton13.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.deButton13.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.deButton13.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deButton13.Location = new System.Drawing.Point(290, 6);
            this.deButton13.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deButton13.Name = "deButton13";
            this.deButton13.Size = new System.Drawing.Size(83, 32);
            this.deButton13.TabIndex = 2;
            this.deButton13.Text = "&Add";
            this.deButton13.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.deButton13.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.deButton13.UseCompatibleTextRendering = true;
            this.deButton13.UseVisualStyleBackColor = true;
            this.deButton13.Click += new System.EventHandler(this.deButton13_Click);
            // 
            // deComboBox6
            // 
            this.deComboBox6.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.deComboBox6.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.deComboBox6.BackColor = System.Drawing.Color.White;
            this.deComboBox6.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deComboBox6.ForeColor = System.Drawing.Color.Black;
            this.deComboBox6.FormattingEnabled = true;
            this.deComboBox6.Location = new System.Drawing.Point(110, 12);
            this.deComboBox6.Mandatory = false;
            this.deComboBox6.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deComboBox6.Name = "deComboBox6";
            this.deComboBox6.Size = new System.Drawing.Size(173, 21);
            this.deComboBox6.TabIndex = 1;
            // 
            // deLabel33
            // 
            this.deLabel33.AutoSize = true;
            this.deLabel33.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel33.Location = new System.Drawing.Point(14, 15);
            this.deLabel33.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.deLabel33.Name = "deLabel33";
            this.deLabel33.Size = new System.Drawing.Size(91, 13);
            this.deLabel33.TabIndex = 50;
            this.deLabel33.Text = "LC Judge Name :";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.panel1);
            this.groupBox1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(3, 42);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(375, 267);
            this.groupBox1.TabIndex = 54;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "LC Judge List :";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.listView9);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(3, 19);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(369, 245);
            this.panel1.TabIndex = 0;
            // 
            // grpSave
            // 
            this.grpSave.Controls.Add(this.button2);
            this.grpSave.Controls.Add(this.cmdDone);
            this.grpSave.Location = new System.Drawing.Point(166, 308);
            this.grpSave.Name = "grpSave";
            this.grpSave.Size = new System.Drawing.Size(115, 43);
            this.grpSave.TabIndex = 56;
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
            this.grpDelete.Location = new System.Drawing.Point(94, 308);
            this.grpDelete.Name = "grpDelete";
            this.grpDelete.Size = new System.Drawing.Size(65, 42);
            this.grpDelete.TabIndex = 55;
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
            // frmAddLcJudge
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.ClientSize = new System.Drawing.Size(384, 354);
            this.ControlBox = false;
            this.Controls.Add(this.grpSave);
            this.Controls.Add(this.grpDelete);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.deButton13);
            this.Controls.Add(this.deComboBox6);
            this.Controls.Add(this.deLabel33);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmAddLcJudge";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Add Lower Court Judge";
            this.Load += new System.EventHandler(this.frmAddLcJudge_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.frmAddLcJudge_KeyDown);
            this.KeyUp += new System.Windows.Forms.KeyEventHandler(this.frmAddLcJudge_KeyUp);
            this.groupBox1.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.grpSave.ResumeLayout(false);
            this.grpDelete.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListView listView9;
        private System.Windows.Forms.ColumnHeader columnHeader9;
        private nControls.deButton deButton13;
        private nControls.deComboBox deComboBox6;
        private nControls.deLabel deLabel33;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.GroupBox grpSave;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button cmdDone;
        private System.Windows.Forms.GroupBox grpDelete;
        private System.Windows.Forms.Button cmdDelete;
    }
}