namespace TPC_Muñiz
{
    partial class frmMesas
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
            this.dgvMesas = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dgvMesas)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvMesas
            // 
            this.dgvMesas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvMesas.Location = new System.Drawing.Point(12, 12);
            this.dgvMesas.Name = "dgvMesas";
            this.dgvMesas.ReadOnly = true;
            this.dgvMesas.Size = new System.Drawing.Size(776, 426);
            this.dgvMesas.TabIndex = 0;
            // 
            // frmMesas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.dgvMesas);
            this.Name = "frmMesas";
            this.Text = "Formulario Mesas";
            ((System.ComponentModel.ISupportInitialize)(this.dgvMesas)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvMesas;
    }
}