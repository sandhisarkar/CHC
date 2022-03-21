namespace ImageHeaven
{
    partial class frmAddLcCase
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmAddLcCase));
            this.listView4 = new System.Windows.Forms.ListView();
            this.columnHeader4 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.deButton9 = new nControls.deButton();
            this.deTextBox24 = new nControls.deTextBox();
            this.deTextBox25 = new nControls.deTextBox();
            this.deLabel27 = new nControls.deLabel();
            this.deLabel28 = new nControls.deLabel();
            this.deComboBox5 = new nControls.deComboBox();
            this.deLabel26 = new nControls.deLabel();
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
            // listView4
            // 
            this.listView4.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader4});
            this.listView4.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listView4.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.listView4.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.listView4.FullRowSelect = true;
            this.listView4.GridLines = true;
            this.listView4.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
            this.listView4.HideSelection = false;
            this.listView4.Location = new System.Drawing.Point(0, 0);
            this.listView4.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.listView4.MultiSelect = false;
            this.listView4.Name = "listView4";
            this.listView4.Size = new System.Drawing.Size(406, 186);
            this.listView4.TabIndex = 5;
            this.listView4.UseCompatibleStateImageBehavior = false;
            this.listView4.View = System.Windows.Forms.View.Details;
            this.listView4.SelectedIndexChanged += new System.EventHandler(this.listView4_SelectedIndexChanged);
            this.listView4.KeyUp += new System.Windows.Forms.KeyEventHandler(this.listView4_KeyUp);
            // 
            // columnHeader4
            // 
            this.columnHeader4.Text = "LC Case Info";
            this.columnHeader4.Width = 401;
            // 
            // deButton9
            // 
            this.deButton9.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("deButton9.BackgroundImage")));
            this.deButton9.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.deButton9.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.deButton9.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.deButton9.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deButton9.Location = new System.Drawing.Point(315, 45);
            this.deButton9.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deButton9.Name = "deButton9";
            this.deButton9.Size = new System.Drawing.Size(94, 32);
            this.deButton9.TabIndex = 4;
            this.deButton9.Text = "&Add";
            this.deButton9.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.deButton9.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.deButton9.UseCompatibleTextRendering = true;
            this.deButton9.UseVisualStyleBackColor = true;
            this.deButton9.Click += new System.EventHandler(this.deButton9_Click);
            // 
            // deTextBox24
            // 
            this.deTextBox24.BackColor = System.Drawing.Color.White;
            this.deTextBox24.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deTextBox24.ForeColor = System.Drawing.Color.Black;
            this.deTextBox24.Location = new System.Drawing.Point(103, 31);
            this.deTextBox24.Mandatory = true;
            this.deTextBox24.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deTextBox24.Name = "deTextBox24";
            this.deTextBox24.Size = new System.Drawing.Size(208, 22);
            this.deTextBox24.TabIndex = 2;
            // 
            // deTextBox25
            // 
            this.deTextBox25.BackColor = System.Drawing.Color.White;
            this.deTextBox25.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.deTextBox25.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deTextBox25.ForeColor = System.Drawing.Color.Black;
            this.deTextBox25.Location = new System.Drawing.Point(103, 55);
            this.deTextBox25.Mandatory = true;
            this.deTextBox25.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deTextBox25.MaxLength = 4;
            this.deTextBox25.Name = "deTextBox25";
            this.deTextBox25.Size = new System.Drawing.Size(208, 22);
            this.deTextBox25.TabIndex = 3;
            this.deTextBox25.Leave += new System.EventHandler(this.deTextBox25_Leave);
            // 
            // deLabel27
            // 
            this.deLabel27.AutoSize = true;
            this.deLabel27.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel27.Location = new System.Drawing.Point(6, 33);
            this.deLabel27.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.deLabel27.Name = "deLabel27";
            this.deLabel27.Size = new System.Drawing.Size(96, 13);
            this.deLabel27.TabIndex = 44;
            this.deLabel27.Text = "LC Case Number :";
            // 
            // deLabel28
            // 
            this.deLabel28.AutoSize = true;
            this.deLabel28.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel28.Location = new System.Drawing.Point(27, 55);
            this.deLabel28.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.deLabel28.Name = "deLabel28";
            this.deLabel28.Size = new System.Drawing.Size(75, 13);
            this.deLabel28.TabIndex = 45;
            this.deLabel28.Text = "LC Case Year :";
            // 
            // deComboBox5
            // 
            this.deComboBox5.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.deComboBox5.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.deComboBox5.BackColor = System.Drawing.Color.White;
            this.deComboBox5.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deComboBox5.ForeColor = System.Drawing.Color.Black;
            this.deComboBox5.FormattingEnabled = true;
            this.deComboBox5.Location = new System.Drawing.Point(103, 7);
            this.deComboBox5.Mandatory = false;
            this.deComboBox5.Margin = new System.Windows.Forms.Padding(2, 4, 2, 4);
            this.deComboBox5.Name = "deComboBox5";
            this.deComboBox5.Size = new System.Drawing.Size(208, 21);
            this.deComboBox5.TabIndex = 1;
            // 
            // deLabel26
            // 
            this.deLabel26.AutoSize = true;
            this.deLabel26.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel26.Location = new System.Drawing.Point(24, 11);
            this.deLabel26.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.deLabel26.Name = "deLabel26";
            this.deLabel26.Size = new System.Drawing.Size(78, 13);
            this.deLabel26.TabIndex = 43;
            this.deLabel26.Text = "LC Case Type :";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.panel1);
            this.groupBox1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(3, 84);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(412, 208);
            this.groupBox1.TabIndex = 51;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "LC Case List :";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.listView4);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(3, 19);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(406, 186);
            this.panel1.TabIndex = 0;
            // 
            // grpSave
            // 
            this.grpSave.Controls.Add(this.button2);
            this.grpSave.Controls.Add(this.cmdDone);
            this.grpSave.Location = new System.Drawing.Point(176, 295);
            this.grpSave.Name = "grpSave";
            this.grpSave.Size = new System.Drawing.Size(115, 43);
            this.grpSave.TabIndex = 53;
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
            this.grpDelete.Location = new System.Drawing.Point(106, 295);
            this.grpDelete.Name = "grpDelete";
            this.grpDelete.Size = new System.Drawing.Size(65, 42);
            this.grpDelete.TabIndex = 52;
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
            // frmAddLcCase
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.ClientSize = new System.Drawing.Size(416, 341);
            this.ControlBox = false;
            this.Controls.Add(this.grpSave);
            this.Controls.Add(this.grpDelete);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.deButton9);
            this.Controls.Add(this.deTextBox24);
            this.Controls.Add(this.deTextBox25);
            this.Controls.Add(this.deLabel27);
            this.Controls.Add(this.deLabel28);
            this.Controls.Add(this.deComboBox5);
            this.Controls.Add(this.deLabel26);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmAddLcCase";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Add LC Case Information";
            this.Load += new System.EventHandler(this.frmAddLcCase_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.frmAddLcCase_KeyDown);
            this.KeyUp += new System.Windows.Forms.KeyEventHandler(this.frmAddLcCase_KeyUp);
            this.groupBox1.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.grpSave.ResumeLayout(false);
            this.grpDelete.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListView listView4;
        private System.Windows.Forms.ColumnHeader columnHeader4;
        private nControls.deButton deButton9;
        private nControls.deTextBox deTextBox24;
        private nControls.deTextBox deTextBox25;
        private nControls.deLabel deLabel27;
        private nControls.deLabel deLabel28;
        private nControls.deComboBox deComboBox5;
        private nControls.deLabel deLabel26;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.GroupBox grpSave;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button cmdDone;
        private System.Windows.Forms.GroupBox grpDelete;
        private System.Windows.Forms.Button cmdDelete;
    }
}