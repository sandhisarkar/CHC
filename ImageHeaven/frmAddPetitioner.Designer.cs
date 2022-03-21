namespace ImageHeaven
{
    partial class frmAddPetitioner
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmAddPetitioner));
            this.listView2 = new System.Windows.Forms.ListView();
            this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.deButton3 = new nControls.deButton();
            this.deTextBox11 = new nControls.deTextBox();
            this.deLabel16 = new nControls.deLabel();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.grpSave = new System.Windows.Forms.GroupBox();
            this.button2 = new System.Windows.Forms.Button();
            this.cmdDone = new System.Windows.Forms.Button();
            this.grpDelete = new System.Windows.Forms.GroupBox();
            this.button1 = new System.Windows.Forms.Button();
            this.cmdDelete = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.panel1.SuspendLayout();
            this.grpSave.SuspendLayout();
            this.grpDelete.SuspendLayout();
            this.SuspendLayout();
            // 
            // listView2
            // 
            this.listView2.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader2});
            this.listView2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listView2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.listView2.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.listView2.FullRowSelect = true;
            this.listView2.GridLines = true;
            this.listView2.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
            this.listView2.HideSelection = false;
            this.listView2.Location = new System.Drawing.Point(0, 0);
            this.listView2.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.listView2.MultiSelect = false;
            this.listView2.Name = "listView2";
            this.listView2.Size = new System.Drawing.Size(383, 188);
            this.listView2.TabIndex = 3;
            this.listView2.UseCompatibleStateImageBehavior = false;
            this.listView2.View = System.Windows.Forms.View.Details;
            this.listView2.SelectedIndexChanged += new System.EventHandler(this.listView2_SelectedIndexChanged);
            this.listView2.DoubleClick += new System.EventHandler(this.listView2_DoubleClick);
            this.listView2.KeyUp += new System.Windows.Forms.KeyEventHandler(this.listView2_KeyUp);
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "Petitioner Name";
            this.columnHeader2.Width = 375;
            // 
            // deButton3
            // 
            this.deButton3.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("deButton3.BackgroundImage")));
            this.deButton3.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.deButton3.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.deButton3.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.deButton3.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deButton3.Location = new System.Drawing.Point(320, 5);
            this.deButton3.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deButton3.Name = "deButton3";
            this.deButton3.Size = new System.Drawing.Size(76, 32);
            this.deButton3.TabIndex = 2;
            this.deButton3.Text = "&Add";
            this.deButton3.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.deButton3.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.deButton3.UseCompatibleTextRendering = true;
            this.deButton3.UseVisualStyleBackColor = true;
            this.deButton3.Click += new System.EventHandler(this.deButton3_Click);
            // 
            // deTextBox11
            // 
            this.deTextBox11.BackColor = System.Drawing.Color.NavajoWhite;
            this.deTextBox11.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deTextBox11.ForeColor = System.Drawing.Color.Black;
            this.deTextBox11.Location = new System.Drawing.Point(108, 10);
            this.deTextBox11.Mandatory = true;
            this.deTextBox11.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deTextBox11.Name = "deTextBox11";
            this.deTextBox11.Size = new System.Drawing.Size(198, 22);
            this.deTextBox11.TabIndex = 1;
            this.deTextBox11.Leave += new System.EventHandler(this.deTextBox11_Leave);
            // 
            // deLabel16
            // 
            this.deLabel16.AutoSize = true;
            this.deLabel16.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel16.Location = new System.Drawing.Point(4, 15);
            this.deLabel16.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.deLabel16.Name = "deLabel16";
            this.deLabel16.Size = new System.Drawing.Size(95, 13);
            this.deLabel16.TabIndex = 20;
            this.deLabel16.Text = "Petitioner Name :";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.panel1);
            this.groupBox1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(7, 44);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(389, 210);
            this.groupBox1.TabIndex = 24;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Petitioner List :";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.listView2);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(3, 19);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(383, 188);
            this.panel1.TabIndex = 0;
            // 
            // grpSave
            // 
            this.grpSave.Controls.Add(this.button2);
            this.grpSave.Controls.Add(this.cmdDone);
            this.grpSave.Location = new System.Drawing.Point(208, 256);
            this.grpSave.Name = "grpSave";
            this.grpSave.Size = new System.Drawing.Size(115, 43);
            this.grpSave.TabIndex = 26;
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
            this.grpDelete.Location = new System.Drawing.Point(78, 256);
            this.grpDelete.Name = "grpDelete";
            this.grpDelete.Size = new System.Drawing.Size(124, 42);
            this.grpDelete.TabIndex = 25;
            this.grpDelete.TabStop = false;
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
            // frmAddPetitioner
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.ClientSize = new System.Drawing.Size(400, 304);
            this.ControlBox = false;
            this.Controls.Add(this.grpSave);
            this.Controls.Add(this.grpDelete);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.deButton3);
            this.Controls.Add(this.deTextBox11);
            this.Controls.Add(this.deLabel16);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmAddPetitioner";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Add Petitioner";
            this.Load += new System.EventHandler(this.frmAddPetitioner_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.frmAddPetitioner_KeyDown);
            this.KeyUp += new System.Windows.Forms.KeyEventHandler(this.frmAddPetitioner_KeyUp);
            this.groupBox1.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.grpSave.ResumeLayout(false);
            this.grpDelete.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListView listView2;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private nControls.deButton deButton3;
        private nControls.deTextBox deTextBox11;
        private nControls.deLabel deLabel16;
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