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
            this.btnAbrirDia = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvMesas)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvMesas
            // 
            this.dgvMesas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvMesas.Location = new System.Drawing.Point(12, 12);
            this.dgvMesas.Name = "dgvMesas";
            this.dgvMesas.ReadOnly = true;
            this.dgvMesas.Size = new System.Drawing.Size(776, 362);
            this.dgvMesas.TabIndex = 0;
            // 
            // btnAbrirDia
            // 
            this.btnAbrirDia.Location = new System.Drawing.Point(291, 380);
            this.btnAbrirDia.Name = "btnAbrirDia";
            this.btnAbrirDia.Size = new System.Drawing.Size(198, 58);
            this.btnAbrirDia.TabIndex = 4;
            this.btnAbrirDia.Text = "Configurar Mesas";
            this.btnAbrirDia.UseVisualStyleBackColor = true;
            this.btnAbrirDia.Click += new System.EventHandler(this.btnAbrirDia_Click);
            // 
            // frmMesas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnAbrirDia);
            this.Controls.Add(this.dgvMesas);
            this.Name = "frmMesas";
            this.Text = "Formulario Mesas";
            ((System.ComponentModel.ISupportInitialize)(this.dgvMesas)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvMesas;
        private System.Windows.Forms.Button btnAbrirDia;
    }
}