namespace ImageHeaven
{
    partial class frmAddConnMain
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmAddConnMain));
            this.listView10 = new System.Windows.Forms.ListView();
            this.columnHeader10 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.deButton17 = new nControls.deButton();
            this.deTextBox35 = new nControls.deTextBox();
            this.deTextBox36 = new nControls.deTextBox();
            this.deLabel38 = new nControls.deLabel();
            this.deLabel39 = new nControls.deLabel();
            this.deComboBox9 = new nControls.deComboBox();
            this.deLabel40 = new nControls.deLabel();
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
            // listView10
            // 
            this.listView10.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader10});
            this.listView10.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listView10.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.listView10.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.listView10.FullRowSelect = true;
            this.listView10.GridLines = true;
            this.listView10.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
            this.listView10.HideSelection = false;
            this.listView10.Location = new System.Drawing.Point(0, 0);
            this.listView10.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.listView10.MultiSelect = false;
            this.listView10.Name = "listView10";
            this.listView10.Size = new System.Drawing.Size(358, 210);
            this.listView10.TabIndex = 5;
            this.listView10.UseCompatibleStateImageBehavior = false;
            this.listView10.View = System.Windows.Forms.View.Details;
            this.listView10.SelectedIndexChanged += new System.EventHandler(this.listView10_SelectedIndexChanged);
            this.listView10.KeyUp += new System.Windows.Forms.KeyEventHandler(this.listView10_KeyUp);
            // 
            // columnHeader10
            // 
            this.columnHeader10.Text = "Connected Main Case ";
            this.columnHeader10.Width = 349;
            // 
            // deButton17
            // 
            this.deButton17.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("deButton17.BackgroundImage")));
            this.deButton17.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.deButton17.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.deButton17.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.deButton17.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deButton17.Location = new System.Drawing.Point(296, 48);
            this.deButton17.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deButton17.Name = "deButton17";
            this.deButton17.Size = new System.Drawing.Size(67, 33);
            this.deButton17.TabIndex = 4;
            this.deButton17.Text = "&Add";
            this.deButton17.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.deButton17.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.deButton17.UseCompatibleTextRendering = true;
            this.deButton17.UseVisualStyleBackColor = true;
            this.deButton17.Click += new System.EventHandler(this.deButton17_Click);
            // 
            // deTextBox35
            // 
            this.deTextBox35.BackColor = System.Drawing.Color.White;
            this.deTextBox35.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deTextBox35.ForeColor = System.Drawing.Color.Black;
            this.deTextBox35.Location = new System.Drawing.Point(93, 33);
            this.deTextBox35.Mandatory = true;
            this.deTextBox35.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deTextBox35.Name = "deTextBox35";
            this.deTextBox35.Size = new System.Drawing.Size(195, 22);
            this.deTextBox35.TabIndex = 2;
            // 
            // deTextBox36
            // 
            this.deTextBox36.BackColor = System.Drawing.Color.White;
            this.deTextBox36.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.deTextBox36.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deTextBox36.ForeColor = System.Drawing.Color.Black;
            this.deTextBox36.Location = new System.Drawing.Point(93, 59);
            this.deTextBox36.Mandatory = true;
            this.deTextBox36.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deTextBox36.MaxLength = 4;
            this.deTextBox36.Name = "deTextBox36";
            this.deTextBox36.Size = new System.Drawing.Size(195, 22);
            this.deTextBox36.TabIndex = 3;
            this.deTextBox36.Leave += new System.EventHandler(this.deTextBox36_Leave);
            // 
            // deLabel38
            // 
            this.deLabel38.AutoSize = true;
            this.deLabel38.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel38.Location = new System.Drawing.Point(6, 39);
            this.deLabel38.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.deLabel38.Name = "deLabel38";
            this.deLabel38.Size = new System.Drawing.Size(81, 13);
            this.deLabel38.TabIndex = 64;
            this.deLabel38.Text = "Case Number :";
            // 
            // deLabel39
            // 
            this.deLabel39.AutoSize = true;
            this.deLabel39.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel39.Location = new System.Drawing.Point(27, 63);
            this.deLabel39.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.deLabel39.Name = "deLabel39";
            this.deLabel39.Size = new System.Drawing.Size(60, 13);
            this.deLabel39.TabIndex = 65;
            this.deLabel39.Text = "Case Year :";
            // 
            // deComboBox9
            // 
            this.deComboBox9.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.deComboBox9.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.deComboBox9.BackColor = System.Drawing.Color.White;
            this.deComboBox9.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deComboBox9.ForeColor = System.Drawing.Color.Black;
            this.deComboBox9.FormattingEnabled = true;
            this.deComboBox9.Location = new System.Drawing.Point(93, 8);
            this.deComboBox9.Mandatory = false;
            this.deComboBox9.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deComboBox9.Name = "deComboBox9";
            this.deComboBox9.Size = new System.Drawing.Size(195, 21);
            this.deComboBox9.TabIndex = 1;
            // 
            // deLabel40
            // 
            this.deLabel40.AutoSize = true;
            this.deLabel40.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel40.Location = new System.Drawing.Point(24, 14);
            this.deLabel40.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.deLabel40.Name = "deLabel40";
            this.deLabel40.Size = new System.Drawing.Size(63, 13);
            this.deLabel40.TabIndex = 63;
            this.deLabel40.Text = "Case Type :";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.panel1);
            this.groupBox1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(0, 88);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(364, 232);
            this.groupBox1.TabIndex = 71;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Connected Main Case List :";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.listView10);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(3, 19);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(358, 210);
            this.panel1.TabIndex = 0;
            // 
            // grpSave
            // 
            this.grpSave.Controls.Add(this.button2);
            this.grpSave.Controls.Add(this.cmdDone);
            this.grpSave.Location = new System.Drawing.Point(161, 320);
            this.grpSave.Name = "grpSave";
            this.grpSave.Size = new System.Drawing.Size(115, 43);
            this.grpSave.TabIndex = 73;
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
            this.grpDelete.Location = new System.Drawing.Point(89, 320);
            this.grpDelete.Name = "grpDelete";
            this.grpDelete.Size = new System.Drawing.Size(66, 42);
            this.grpDelete.TabIndex = 72;
            this.grpDelete.TabStop = false;
            // 
            // cmdDelete
            // 
            this.cmdDelete.Location = new System.Drawing.Point(6, 12);
            this.cmdDelete.Name = "cmdDelete";
            this.cmdDelete.Size = new System.Drawing.Size(52, 23);
            this.cmdDelete.TabIndex = 8;
            this.cmdDelete.Text = "De&lete";
            this.cmdDelete.UseVisualStyleBackColor = true;
            this.cmdDelete.Click += new System.EventHandler(this.cmdDelete_Click);
            // 
            // frmAddConnMain
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.ClientSize = new System.Drawing.Size(365, 365);
            this.ControlBox = false;
            this.Controls.Add(this.grpSave);
            this.Controls.Add(this.grpDelete);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.deButton17);
            this.Controls.Add(this.deTextBox35);
            this.Controls.Add(this.deTextBox36);
            this.Controls.Add(this.deLabel38);
            this.Controls.Add(this.deLabel39);
            this.Controls.Add(this.deComboBox9);
            this.Controls.Add(this.deLabel40);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmAddConnMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Add Connected Main";
            this.Load += new System.EventHandler(this.frmAddConnMain_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.frmAddConnMain_KeyDown);
            this.KeyUp += new System.Windows.Forms.KeyEventHandler(this.frmAddConnMain_KeyUp);
            this.groupBox1.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.grpSave.ResumeLayout(false);
            this.grpDelete.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListView listView10;
        private System.Windows.Forms.ColumnHeader columnHeader10;
        private nControls.deButton deButton17;
        private nControls.deTextBox deTextBox35;
        private nControls.deTextBox deTextBox36;
        private nControls.deLabel deLabel38;
        private nControls.deLabel deLabel39;
        private nControls.deComboBox deComboBox9;
        private nControls.deLabel deLabel40;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.GroupBox grpSave;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button cmdDone;
        private System.Windows.Forms.GroupBox grpDelete;
        private System.Windows.Forms.Button cmdDelete;
    }
}