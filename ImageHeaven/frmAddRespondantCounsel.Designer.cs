namespace ImageHeaven
{
    partial class frmAddRespondantCounsel
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmAddRespondantCounsel));
            this.listView8 = new System.Windows.Forms.ListView();
            this.columnHeader8 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.deButton6 = new nControls.deButton();
            this.deTextBox16 = new nControls.deTextBox();
            this.deLabel18 = new nControls.deLabel();
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
            // listView8
            // 
            this.listView8.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader8});
            this.listView8.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listView8.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.listView8.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.listView8.FullRowSelect = true;
            this.listView8.GridLines = true;
            this.listView8.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
            this.listView8.HideSelection = false;
            this.listView8.Location = new System.Drawing.Point(0, 0);
            this.listView8.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.listView8.MultiSelect = false;
            this.listView8.Name = "listView8";
            this.listView8.Size = new System.Drawing.Size(380, 212);
            this.listView8.TabIndex = 35;
            this.listView8.UseCompatibleStateImageBehavior = false;
            this.listView8.View = System.Windows.Forms.View.Details;
            this.listView8.SelectedIndexChanged += new System.EventHandler(this.listView8_SelectedIndexChanged);
            this.listView8.DoubleClick += new System.EventHandler(this.listView8_DoubleClick);
            this.listView8.KeyUp += new System.Windows.Forms.KeyEventHandler(this.listView8_KeyUp);
            // 
            // columnHeader8
            // 
            this.columnHeader8.Text = "Respondant Counsel Name";
            this.columnHeader8.Width = 375;
            // 
            // deButton6
            // 
            this.deButton6.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("deButton6.BackgroundImage")));
            this.deButton6.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.deButton6.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.deButton6.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.deButton6.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deButton6.Location = new System.Drawing.Point(308, 5);
            this.deButton6.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deButton6.Name = "deButton6";
            this.deButton6.Size = new System.Drawing.Size(73, 32);
            this.deButton6.TabIndex = 34;
            this.deButton6.Text = "&Add";
            this.deButton6.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.deButton6.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.deButton6.UseCompatibleTextRendering = true;
            this.deButton6.UseVisualStyleBackColor = true;
            this.deButton6.Click += new System.EventHandler(this.deButton6_Click);
            // 
            // deTextBox16
            // 
            this.deTextBox16.BackColor = System.Drawing.Color.White;
            this.deTextBox16.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deTextBox16.ForeColor = System.Drawing.Color.Black;
            this.deTextBox16.Location = new System.Drawing.Point(102, 10);
            this.deTextBox16.Mandatory = true;
            this.deTextBox16.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deTextBox16.Name = "deTextBox16";
            this.deTextBox16.Size = new System.Drawing.Size(202, 22);
            this.deTextBox16.TabIndex = 33;
            // 
            // deLabel18
            // 
            this.deLabel18.AutoSize = true;
            this.deLabel18.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel18.Location = new System.Drawing.Point(10, 16);
            this.deLabel18.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.deLabel18.Name = "deLabel18";
            this.deLabel18.Size = new System.Drawing.Size(87, 13);
            this.deLabel18.TabIndex = 32;
            this.deLabel18.Text = "Counsel Name :";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.panel1);
            this.groupBox1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(2, 44);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(386, 234);
            this.groupBox1.TabIndex = 36;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Respondant Counsel List :";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.listView8);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(3, 19);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(380, 212);
            this.panel1.TabIndex = 0;
            // 
            // grpSave
            // 
            this.grpSave.Controls.Add(this.button2);
            this.grpSave.Controls.Add(this.cmdDone);
            this.grpSave.Location = new System.Drawing.Point(198, 281);
            this.grpSave.Name = "grpSave";
            this.grpSave.Size = new System.Drawing.Size(115, 43);
            this.grpSave.TabIndex = 38;
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
            this.grpDelete.Location = new System.Drawing.Point(68, 281);
            this.grpDelete.Name = "grpDelete";
            this.grpDelete.Size = new System.Drawing.Size(124, 42);
            this.grpDelete.TabIndex = 37;
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
            // frmAddRespondantCounsel
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.ClientSize = new System.Drawing.Size(391, 329);
            this.ControlBox = false;
            this.Controls.Add(this.grpSave);
            this.Controls.Add(this.grpDelete);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.deButton6);
            this.Controls.Add(this.deTextBox16);
            this.Controls.Add(this.deLabel18);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmAddRespondantCounsel";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Add Respondant Counsel";
            this.Load += new System.EventHandler(this.frmAddRespondantCounsel_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.frmAddRespondantCounsel_KeyDown);
            this.KeyUp += new System.Windows.Forms.KeyEventHandler(this.frmAddRespondantCounsel_KeyUp);
            this.groupBox1.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.grpSave.ResumeLayout(false);
            this.grpDelete.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListView listView8;
        private System.Windows.Forms.ColumnHeader columnHeader8;
        private nControls.deButton deButton6;
        private nControls.deTextBox deTextBox16;
        private nControls.deLabel deLabel18;
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