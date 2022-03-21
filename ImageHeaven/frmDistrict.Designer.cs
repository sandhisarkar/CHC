
namespace ImageHeaven
{
    partial class frmDistrict
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmDistrict));
            this.deLabel1 = new nControls.deLabel();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.CmdCancel = new nControls.deButton();
            this.CmdSave = new nControls.deButton();
            this.SuspendLayout();
            // 
            // deLabel1
            // 
            this.deLabel1.AutoSize = true;
            this.deLabel1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deLabel1.Location = new System.Drawing.Point(28, 29);
            this.deLabel1.Name = "deLabel1";
            this.deLabel1.Size = new System.Drawing.Size(85, 15);
            this.deLabel1.TabIndex = 0;
            this.deLabel1.Text = "District Name :";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(124, 27);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(264, 20);
            this.textBox1.TabIndex = 1;
            // 
            // CmdCancel
            // 
            this.CmdCancel.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.CmdCancel.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.CmdCancel.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.CmdCancel.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.CmdCancel.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.CmdCancel.Location = new System.Drawing.Point(224, 77);
            this.CmdCancel.Name = "CmdCancel";
            this.CmdCancel.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.CmdCancel.Size = new System.Drawing.Size(81, 30);
            this.CmdCancel.TabIndex = 10;
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
            this.CmdSave.Location = new System.Drawing.Point(113, 78);
            this.CmdSave.Name = "CmdSave";
            this.CmdSave.Size = new System.Drawing.Size(64, 30);
            this.CmdSave.TabIndex = 9;
            this.CmdSave.Text = "&Save";
            this.CmdSave.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.CmdSave.TextImageRelation = System.Windows.Forms.TextImageRelation.TextBeforeImage;
            this.CmdSave.UseCompatibleTextRendering = true;
            this.CmdSave.UseVisualStyleBackColor = false;
            this.CmdSave.Click += new System.EventHandler(this.CmdSave_Click);
            // 
            // frmDistrict
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(428, 135);
            this.Controls.Add(this.CmdCancel);
            this.Controls.Add(this.CmdSave);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.deLabel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmDistrict";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "frmDistrict";
            this.Load += new System.EventHandler(this.frmDistrict_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private nControls.deLabel deLabel1;
        private System.Windows.Forms.TextBox textBox1;
        private nControls.deButton CmdCancel;
        private nControls.deButton CmdSave;
    }
}