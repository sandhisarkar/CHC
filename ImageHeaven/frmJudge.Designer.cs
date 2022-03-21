namespace ImageHeaven
{
    partial class frmJudge
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmJudge));
            this.deLabel1 = new nControls.deLabel();
            this.deComboBox1 = new nControls.deComboBox();
            this.deLabel2 = new nControls.deLabel();
            this.deTextBox1 = new nControls.deTextBox();
            this.CmdCancel = new nControls.deButton();
            this.CmdSave = new nControls.deButton();
            this.SuspendLayout();
            // 
            // deLabel1
            // 
            this.deLabel1.AutoSize = true;
            this.deLabel1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel1.Location = new System.Drawing.Point(32, 39);
            this.deLabel1.Name = "deLabel1";
            this.deLabel1.Size = new System.Drawing.Size(76, 15);
            this.deLabel1.TabIndex = 0;
            this.deLabel1.Text = "Designation :";
            // 
            // deComboBox1
            // 
            this.deComboBox1.BackColor = System.Drawing.Color.White;
            this.deComboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.deComboBox1.ForeColor = System.Drawing.Color.Black;
            this.deComboBox1.FormattingEnabled = true;
            this.deComboBox1.Items.AddRange(new object[] {
            "JUSTICE",
            "CHIEF JUSTICE",
            "ADDITIONAL CHIEF JUSTICE"});
            this.deComboBox1.Location = new System.Drawing.Point(115, 37);
            this.deComboBox1.Mandatory = true;
            this.deComboBox1.Name = "deComboBox1";
            this.deComboBox1.Size = new System.Drawing.Size(287, 21);
            this.deComboBox1.TabIndex = 1;
            // 
            // deLabel2
            // 
            this.deLabel2.AutoSize = true;
            this.deLabel2.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel2.Location = new System.Drawing.Point(29, 88);
            this.deLabel2.Name = "deLabel2";
            this.deLabel2.Size = new System.Drawing.Size(79, 15);
            this.deLabel2.TabIndex = 2;
            this.deLabel2.Text = "Judge Name :";
            // 
            // deTextBox1
            // 
            this.deTextBox1.BackColor = System.Drawing.Color.White;
            this.deTextBox1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deTextBox1.ForeColor = System.Drawing.Color.Black;
            this.deTextBox1.Location = new System.Drawing.Point(115, 83);
            this.deTextBox1.Mandatory = true;
            this.deTextBox1.Name = "deTextBox1";
            this.deTextBox1.Size = new System.Drawing.Size(290, 23);
            this.deTextBox1.TabIndex = 3;
            // 
            // CmdCancel
            // 
            this.CmdCancel.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.CmdCancel.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.CmdCancel.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.CmdCancel.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.CmdCancel.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.CmdCancel.Location = new System.Drawing.Point(242, 134);
            this.CmdCancel.Name = "CmdCancel";
            this.CmdCancel.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.CmdCancel.Size = new System.Drawing.Size(81, 30);
            this.CmdCancel.TabIndex = 8;
            this.CmdCancel.Text = "Clos&e";
            this.CmdCancel.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.CmdCancel.TextImageRelation = System.Windows.Forms.TextImageRelation.TextBeforeImage;
            this.CmdCancel.UseCompatibleTextRendering = true;
            this.CmdCancel.UseVisualStyleBackColor = false;
            this.CmdCancel.Click += new System.EventHandler(this.CmdCancel_Click);
            // 
            // CmdSave
            // 
            this.CmdSave.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.CmdSave.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.CmdSave.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.CmdSave.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.CmdSave.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.CmdSave.ForeColor = System.Drawing.SystemColors.ControlText;
            this.CmdSave.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.CmdSave.Location = new System.Drawing.Point(131, 135);
            this.CmdSave.Name = "CmdSave";
            this.CmdSave.Size = new System.Drawing.Size(64, 30);
            this.CmdSave.TabIndex = 7;
            this.CmdSave.Text = "&Save";
            this.CmdSave.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.CmdSave.TextImageRelation = System.Windows.Forms.TextImageRelation.TextBeforeImage;
            this.CmdSave.UseCompatibleTextRendering = true;
            this.CmdSave.UseVisualStyleBackColor = false;
            this.CmdSave.Click += new System.EventHandler(this.CmdSave_Click);
            // 
            // frmJudge
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(438, 197);
            this.Controls.Add(this.CmdCancel);
            this.Controls.Add(this.CmdSave);
            this.Controls.Add(this.deTextBox1);
            this.Controls.Add(this.deLabel2);
            this.Controls.Add(this.deComboBox1);
            this.Controls.Add(this.deLabel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmJudge";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Add Judge";
            this.Load += new System.EventHandler(this.frmJudge_Load);
            this.KeyUp += new System.Windows.Forms.KeyEventHandler(this.frmJudge_KeyUp);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private nControls.deLabel deLabel1;
        private nControls.deComboBox deComboBox1;
        private nControls.deLabel deLabel2;
        private nControls.deTextBox deTextBox1;
        private nControls.deButton CmdCancel;
        private nControls.deButton CmdSave;
    }
}