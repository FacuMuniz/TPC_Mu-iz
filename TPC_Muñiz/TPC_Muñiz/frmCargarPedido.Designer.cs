namespace TPC_Muñiz
{
    partial class frmCargarPedido
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
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.cmbMesas = new System.Windows.Forms.ComboBox();
            this.btnAbrirMesa = new System.Windows.Forms.Button();
            this.btnFinalizar = new System.Windows.Forms.Button();
            this.lblid = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 13);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(48, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Mesero: ";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(16, 46);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(39, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Mesa :";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(68, 13);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(35, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "label3";
            // 
            // cmbMesas
            // 
            this.cmbMesas.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbMesas.FormattingEnabled = true;
            this.cmbMesas.Location = new System.Drawing.Point(71, 46);
            this.cmbMesas.Name = "cmbMesas";
            this.cmbMesas.Size = new System.Drawing.Size(121, 21);
            this.cmbMesas.TabIndex = 3;
            // 
            // btnAbrirMesa
            // 
            this.btnAbrirMesa.Location = new System.Drawing.Point(71, 104);
            this.btnAbrirMesa.Name = "btnAbrirMesa";
            this.btnAbrirMesa.Size = new System.Drawing.Size(121, 29);
            this.btnAbrirMesa.TabIndex = 4;
            this.btnAbrirMesa.Text = "Abrir Mesa";
            this.btnAbrirMesa.UseVisualStyleBackColor = true;
            this.btnAbrirMesa.Click += new System.EventHandler(this.btnAbrirMesa_Click);
            // 
            // btnFinalizar
            // 
            this.btnFinalizar.Location = new System.Drawing.Point(71, 154);
            this.btnFinalizar.Name = "btnFinalizar";
            this.btnFinalizar.Size = new System.Drawing.Size(121, 29);
            this.btnFinalizar.TabIndex = 5;
            this.btnFinalizar.Text = "Finalizar Turno";
            this.btnFinalizar.UseVisualStyleBackColor = true;
            this.btnFinalizar.Click += new System.EventHandler(this.btnFinalizar_Click);
            // 
            // lblid
            // 
            this.lblid.AutoSize = true;
            this.lblid.Location = new System.Drawing.Point(206, 13);
            this.lblid.Name = "lblid";
            this.lblid.Size = new System.Drawing.Size(35, 13);
            this.lblid.TabIndex = 6;
            this.lblid.Text = "label4";
            this.lblid.Visible = false;
            // 
            // frmCargarPedido
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(268, 195);
            this.Controls.Add(this.lblid);
            this.Controls.Add(this.btnFinalizar);
            this.Controls.Add(this.btnAbrirMesa);
            this.Controls.Add(this.cmbMesas);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "frmCargarPedido";
            this.Text = "frmCargarPedido";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmCargarPedido_FormClosing);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cmbMesas;
        private System.Windows.Forms.Button btnAbrirMesa;
        private System.Windows.Forms.Button btnFinalizar;
        private System.Windows.Forms.Label lblid;
    }
}