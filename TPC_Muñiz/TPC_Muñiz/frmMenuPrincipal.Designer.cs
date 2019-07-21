namespace TPC_Muñiz
{
    partial class frmMenuPrincipal
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
            this.btnMostrarmMesas = new System.Windows.Forms.Button();
            this.btnConsultarPedidos = new System.Windows.Forms.Button();
            this.btnConsultarStocks = new System.Windows.Forms.Button();
            this.btnSalir = new System.Windows.Forms.Button();
            this.lblID = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnMostrarmMesas
            // 
            this.btnMostrarmMesas.Location = new System.Drawing.Point(80, 24);
            this.btnMostrarmMesas.Name = "btnMostrarmMesas";
            this.btnMostrarmMesas.Size = new System.Drawing.Size(157, 40);
            this.btnMostrarmMesas.TabIndex = 0;
            this.btnMostrarmMesas.Text = "Mostrar Mesas";
            this.btnMostrarmMesas.UseVisualStyleBackColor = true;
            this.btnMostrarmMesas.Click += new System.EventHandler(this.btnMostrarmMesas_Click);
            // 
            // btnConsultarPedidos
            // 
            this.btnConsultarPedidos.Location = new System.Drawing.Point(80, 120);
            this.btnConsultarPedidos.Name = "btnConsultarPedidos";
            this.btnConsultarPedidos.Size = new System.Drawing.Size(157, 40);
            this.btnConsultarPedidos.TabIndex = 1;
            this.btnConsultarPedidos.Text = "Consultar Pedidos";
            this.btnConsultarPedidos.UseVisualStyleBackColor = true;
            this.btnConsultarPedidos.Click += new System.EventHandler(this.btnConsultarPedidos_Click);
            // 
            // btnConsultarStocks
            // 
            this.btnConsultarStocks.Location = new System.Drawing.Point(80, 74);
            this.btnConsultarStocks.Name = "btnConsultarStocks";
            this.btnConsultarStocks.Size = new System.Drawing.Size(157, 40);
            this.btnConsultarStocks.TabIndex = 2;
            this.btnConsultarStocks.Text = "Consultar Stocks";
            this.btnConsultarStocks.UseVisualStyleBackColor = true;
            this.btnConsultarStocks.Click += new System.EventHandler(this.btnConsultarStocks_Click);
            // 
            // btnSalir
            // 
            this.btnSalir.Location = new System.Drawing.Point(80, 218);
            this.btnSalir.Name = "btnSalir";
            this.btnSalir.Size = new System.Drawing.Size(157, 40);
            this.btnSalir.TabIndex = 4;
            this.btnSalir.Text = "Salir";
            this.btnSalir.UseVisualStyleBackColor = true;
            this.btnSalir.Click += new System.EventHandler(this.btnSalir_Click);
            // 
            // lblID
            // 
            this.lblID.AutoSize = true;
            this.lblID.Location = new System.Drawing.Point(13, 74);
            this.lblID.Name = "lblID";
            this.lblID.Size = new System.Drawing.Size(35, 13);
            this.lblID.TabIndex = 6;
            this.lblID.Text = "label1";
            this.lblID.Visible = false;
            // 
            // frmMenuPrincipal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(322, 263);
            this.Controls.Add(this.lblID);
            this.Controls.Add(this.btnSalir);
            this.Controls.Add(this.btnConsultarStocks);
            this.Controls.Add(this.btnConsultarPedidos);
            this.Controls.Add(this.btnMostrarmMesas);
            this.Name = "frmMenuPrincipal";
            this.Text = "Menu Principal";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.frmMenuPrincipal_FormClosed);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnMostrarmMesas;
        private System.Windows.Forms.Button btnConsultarPedidos;
        private System.Windows.Forms.Button btnConsultarStocks;
        private System.Windows.Forms.Button btnSalir;
        private System.Windows.Forms.Label lblID;
    }
}