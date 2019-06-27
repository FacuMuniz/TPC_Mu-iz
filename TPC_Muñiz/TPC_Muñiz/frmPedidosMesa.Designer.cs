namespace TPC_Muñiz
{
    partial class frmPedidosMesa
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
            this.lblid = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.cmbcomidas = new System.Windows.Forms.ComboBox();
            this.btnAgregar = new System.Windows.Forms.Button();
            this.dgvPedidos = new System.Windows.Forms.DataGridView();
            this.label3 = new System.Windows.Forms.Label();
            this.lbltotal = new System.Windows.Forms.Label();
            this.lblidmesero = new System.Windows.Forms.Label();
            this.btnCerrar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPedidos)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 13);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(36, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Mesa:";
            // 
            // lblid
            // 
            this.lblid.AutoSize = true;
            this.lblid.Location = new System.Drawing.Point(67, 13);
            this.lblid.Name = "lblid";
            this.lblid.Size = new System.Drawing.Size(35, 13);
            this.lblid.TabIndex = 1;
            this.lblid.Text = "label2";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(13, 44);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(43, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Pedido:";
            // 
            // cmbcomidas
            // 
            this.cmbcomidas.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbcomidas.FormattingEnabled = true;
            this.cmbcomidas.Location = new System.Drawing.Point(63, 44);
            this.cmbcomidas.Name = "cmbcomidas";
            this.cmbcomidas.Size = new System.Drawing.Size(168, 21);
            this.cmbcomidas.TabIndex = 3;
            // 
            // btnAgregar
            // 
            this.btnAgregar.Location = new System.Drawing.Point(353, 35);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(137, 31);
            this.btnAgregar.TabIndex = 4;
            this.btnAgregar.Text = "Agregar";
            this.btnAgregar.UseVisualStyleBackColor = true;
            this.btnAgregar.Click += new System.EventHandler(this.btnAgregar_Click);
            // 
            // dgvPedidos
            // 
            this.dgvPedidos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvPedidos.Location = new System.Drawing.Point(13, 86);
            this.dgvPedidos.Name = "dgvPedidos";
            this.dgvPedidos.ReadOnly = true;
            this.dgvPedidos.Size = new System.Drawing.Size(477, 234);
            this.dgvPedidos.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(350, 346);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(45, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "TOTAL:";
            // 
            // lbltotal
            // 
            this.lbltotal.AutoSize = true;
            this.lbltotal.Location = new System.Drawing.Point(412, 346);
            this.lbltotal.Name = "lbltotal";
            this.lbltotal.Size = new System.Drawing.Size(35, 13);
            this.lbltotal.TabIndex = 7;
            this.lbltotal.Text = "label4";
            // 
            // lblidmesero
            // 
            this.lblidmesero.AutoSize = true;
            this.lblidmesero.Location = new System.Drawing.Point(251, 12);
            this.lblidmesero.Name = "lblidmesero";
            this.lblidmesero.Size = new System.Drawing.Size(35, 13);
            this.lblidmesero.TabIndex = 8;
            this.lblidmesero.Text = "label4";
            this.lblidmesero.Visible = false;
            // 
            // btnCerrar
            // 
            this.btnCerrar.Location = new System.Drawing.Point(16, 336);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(171, 33);
            this.btnCerrar.TabIndex = 9;
            this.btnCerrar.Text = "Cerrar Mesa";
            this.btnCerrar.UseVisualStyleBackColor = true;
            this.btnCerrar.Click += new System.EventHandler(this.btnCerrar_Click);
            // 
            // frmPedidosMesa
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(503, 374);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.lblidmesero);
            this.Controls.Add(this.lbltotal);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.dgvPedidos);
            this.Controls.Add(this.btnAgregar);
            this.Controls.Add(this.cmbcomidas);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.lblid);
            this.Controls.Add(this.label1);
            this.Name = "frmPedidosMesa";
            this.Text = "frmPedidosMesa";
            ((System.ComponentModel.ISupportInitialize)(this.dgvPedidos)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblid;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cmbcomidas;
        private System.Windows.Forms.Button btnAgregar;
        private System.Windows.Forms.DataGridView dgvPedidos;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label lbltotal;
        private System.Windows.Forms.Label lblidmesero;
        private System.Windows.Forms.Button btnCerrar;
    }
}