namespace ImageHeaven
{
    partial class frmAddRespondant
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmAddRespondant));
            this.listView3 = new System.Windows.Forms.ListView();
            this.columnHeader3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.deButton10 = new nControls.deButton();
            this.deTextBox18 = new nControls.deTextBox();
            this.deLabel19 = new nControls.deLabel();
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
            // listView3
            // 
            this.listView3.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader3});
            this.listView3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listView3.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.listView3.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.listView3.FullRowSelect = true;
            this.listView3.GridLines = true;
            this.listView3.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
            this.listView3.HideSelection = false;
            this.listView3.Location = new System.Drawing.Point(0, 0);
            this.listView3.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.listView3.MultiSelect = false;
            this.listView3.Name = "listView3";
            this.listView3.Size = new System.Drawing.Size(328, 193);
            this.listView3.TabIndex = 3;
            this.listView3.UseCompatibleStateImageBehavior = false;
            this.listView3.View = System.Windows.Forms.View.Details;
            this.listView3.SelectedIndexChanged += new System.EventHandler(this.listView3_SelectedIndexChanged);
            this.listView3.DoubleClick += new System.EventHandler(this.listView3_DoubleClick);
            this.listView3.KeyUp += new System.Windows.Forms.KeyEventHandler(this.listView3_KeyUp);
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "Respondant Name";
            this.columnHeader3.Width = 320;
            // 
            // deButton10
            // 
            this.deButton10.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("deButton10.BackgroundImage")));
            this.deButton10.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.deButton10.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.deButton10.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.deButton10.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deButton10.Location = new System.Drawing.Point(265, 5);
            this.deButton10.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deButton10.Name = "deButton10";
            this.deButton10.Size = new System.Drawing.Size(70, 32);
            this.deButton10.TabIndex = 2;
            this.deButton10.Text = "&Add";
            this.deButton10.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.deButton10.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.deButton10.UseCompatibleTextRendering = true;
            this.deButton10.UseVisualStyleBackColor = true;
            this.deButton10.Click += new System.EventHandler(this.deButton10_Click);
            // 
            // deTextBox18
            // 
            this.deTextBox18.BackColor = System.Drawing.Color.NavajoWhite;
            this.deTextBox18.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deTextBox18.ForeColor = System.Drawing.Color.Black;
            this.deTextBox18.Location = new System.Drawing.Point(59, 11);
            this.deTextBox18.Mandatory = true;
            this.deTextBox18.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deTextBox18.Name = "deTextBox18";
            this.deTextBox18.Size = new System.Drawing.Size(199, 22);
            this.deTextBox18.TabIndex = 1;
            this.deTextBox18.Leave += new System.EventHandler(this.deTextBox18_Leave);
            // 
            // deLabel19
            // 
            this.deLabel19.AutoSize = true;
            this.deLabel19.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel19.Location = new System.Drawing.Point(10, 13);
            this.deLabel19.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.deLabel19.Name = "deLabel19";
            this.deLabel19.Size = new System.Drawing.Size(45, 15);
            this.deLabel19.TabIndex = 28;
            this.deLabel19.Text = "Name :";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.panel1);
            this.groupBox1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(2, 41);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(334, 215);
            this.groupBox1.TabIndex = 32;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Respondant List :";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.listView3);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(3, 19);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(328, 193);
            this.panel1.TabIndex = 0;
            // 
            // grpSave
            // 
            this.grpSave.Controls.Add(this.button2);
            this.grpSave.Controls.Add(this.cmdDone);
            this.grpSave.Location = new System.Drawing.Point(176, 258);
            this.grpSave.Name = "grpSave";
            this.grpSave.Size = new System.Drawing.Size(115, 43);
            this.grpSave.TabIndex = 34;
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
            this.grpDelete.Location = new System.Drawing.Point(46, 258);
            this.grpDelete.Name = "grpDelete";
            this.grpDelete.Size = new System.Drawing.Size(124, 42);
            this.grpDelete.TabIndex = 33;
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
            // frmAddRespondant
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(338, 304);
            this.ControlBox = false;
            this.Controls.Add(this.grpSave);
            this.Controls.Add(this.grpDelete);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.deButton10);
            this.Controls.Add(this.deTextBox18);
            this.Controls.Add(this.deLabel19);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmAddRespondant";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Add Respondant";
            this.Load += new System.EventHandler(this.frmAddRespondant_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.frmAddRespondant_KeyDown);
            this.KeyUp += new System.Windows.Forms.KeyEventHandler(this.frmAddRespondant_KeyUp);
            this.groupBox1.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.grpSave.ResumeLayout(false);
            this.grpDelete.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListView listView3;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        private nControls.deButton deButton10;
        private nControls.deTextBox deTextBox18;
        private nControls.deLabel deLabel19;
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