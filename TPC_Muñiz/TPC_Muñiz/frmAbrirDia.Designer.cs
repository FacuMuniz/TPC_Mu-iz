namespace TPC_Muñiz
{
    partial class frmAbrirDia
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
            this.cmbMesas = new System.Windows.Forms.ComboBox();
            this.lblMesas = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.cmbMeseros = new System.Windows.Forms.ComboBox();
            this.lblSillas = new System.Windows.Forms.Label();
            this.gboxSillas = new System.Windows.Forms.GroupBox();
            this.rdb10 = new System.Windows.Forms.RadioButton();
            this.rdb6 = new System.Windows.Forms.RadioButton();
            this.rdb4 = new System.Windows.Forms.RadioButton();
            this.rdb8 = new System.Windows.Forms.RadioButton();
            this.rdb5 = new System.Windows.Forms.RadioButton();
            this.rdb2 = new System.Windows.Forms.RadioButton();
            this.btnAceptar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.dgvDia = new System.Windows.Forms.DataGridView();
            this.btnAbrir = new System.Windows.Forms.Button();
            this.checkBox1 = new System.Windows.Forms.CheckBox();
            this.gboxSillas.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDia)).BeginInit();
            this.SuspendLayout();
            // 
            // cmbMesas
            // 
            this.cmbMesas.FormattingEnabled = true;
            this.cmbMesas.Location = new System.Drawing.Point(132, 45);
            this.cmbMesas.Name = "cmbMesas";
            this.cmbMesas.Size = new System.Drawing.Size(175, 21);
            this.cmbMesas.TabIndex = 0;
            // 
            // lblMesas
            // 
            this.lblMesas.AutoSize = true;
            this.lblMesas.Location = new System.Drawing.Point(37, 48);
            this.lblMesas.Name = "lblMesas";
            this.lblMesas.Size = new System.Drawing.Size(36, 13);
            this.lblMesas.TabIndex = 1;
            this.lblMesas.Text = "Mesa:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(37, 89);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(59, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Mesero/a: ";
            // 
            // cmbMeseros
            // 
            this.cmbMeseros.FormattingEnabled = true;
            this.cmbMeseros.Location = new System.Drawing.Point(131, 86);
            this.cmbMeseros.Name = "cmbMeseros";
            this.cmbMeseros.Size = new System.Drawing.Size(176, 21);
            this.cmbMeseros.TabIndex = 3;
            // 
            // lblSillas
            // 
            this.lblSillas.AutoSize = true;
            this.lblSillas.Location = new System.Drawing.Point(40, 132);
            this.lblSillas.Name = "lblSillas";
            this.lblSillas.Size = new System.Drawing.Size(34, 13);
            this.lblSillas.TabIndex = 4;
            this.lblSillas.Text = "Sillas:";
            // 
            // gboxSillas
            // 
            this.gboxSillas.BackColor = System.Drawing.SystemColors.Control;
            this.gboxSillas.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.gboxSillas.Controls.Add(this.rdb10);
            this.gboxSillas.Controls.Add(this.rdb6);
            this.gboxSillas.Controls.Add(this.rdb4);
            this.gboxSillas.Controls.Add(this.rdb8);
            this.gboxSillas.Controls.Add(this.rdb5);
            this.gboxSillas.Controls.Add(this.rdb2);
            this.gboxSillas.Location = new System.Drawing.Point(94, 116);
            this.gboxSillas.Name = "gboxSillas";
            this.gboxSillas.Size = new System.Drawing.Size(213, 95);
            this.gboxSillas.TabIndex = 5;
            this.gboxSillas.TabStop = false;
            this.gboxSillas.Enter += new System.EventHandler(this.gboxSillas_Enter);
            // 
            // rdb10
            // 
            this.rdb10.AutoSize = true;
            this.rdb10.Location = new System.Drawing.Point(128, 60);
            this.rdb10.Name = "rdb10";
            this.rdb10.Size = new System.Drawing.Size(37, 17);
            this.rdb10.TabIndex = 5;
            this.rdb10.TabStop = true;
            this.rdb10.Text = "10";
            this.rdb10.UseVisualStyleBackColor = true;
            // 
            // rdb6
            // 
            this.rdb6.AutoSize = true;
            this.rdb6.Location = new System.Drawing.Point(128, 37);
            this.rdb6.Name = "rdb6";
            this.rdb6.Size = new System.Drawing.Size(31, 17);
            this.rdb6.TabIndex = 4;
            this.rdb6.TabStop = true;
            this.rdb6.Text = "6";
            this.rdb6.UseVisualStyleBackColor = true;
            // 
            // rdb4
            // 
            this.rdb4.AutoSize = true;
            this.rdb4.Location = new System.Drawing.Point(128, 14);
            this.rdb4.Name = "rdb4";
            this.rdb4.Size = new System.Drawing.Size(31, 17);
            this.rdb4.TabIndex = 3;
            this.rdb4.TabStop = true;
            this.rdb4.Text = "4";
            this.rdb4.UseVisualStyleBackColor = true;
            // 
            // rdb8
            // 
            this.rdb8.AutoSize = true;
            this.rdb8.Location = new System.Drawing.Point(37, 60);
            this.rdb8.Name = "rdb8";
            this.rdb8.Size = new System.Drawing.Size(31, 17);
            this.rdb8.TabIndex = 2;
            this.rdb8.TabStop = true;
            this.rdb8.Text = "8";
            this.rdb8.UseVisualStyleBackColor = true;
            // 
            // rdb5
            // 
            this.rdb5.AutoSize = true;
            this.rdb5.Location = new System.Drawing.Point(37, 37);
            this.rdb5.Name = "rdb5";
            this.rdb5.Size = new System.Drawing.Size(31, 17);
            this.rdb5.TabIndex = 1;
            this.rdb5.TabStop = true;
            this.rdb5.Text = "5";
            this.rdb5.UseVisualStyleBackColor = true;
            // 
            // rdb2
            // 
            this.rdb2.AutoSize = true;
            this.rdb2.Location = new System.Drawing.Point(37, 14);
            this.rdb2.Name = "rdb2";
            this.rdb2.Size = new System.Drawing.Size(31, 17);
            this.rdb2.TabIndex = 0;
            this.rdb2.TabStop = true;
            this.rdb2.Text = "2";
            this.rdb2.UseVisualStyleBackColor = true;
            // 
            // btnAceptar
            // 
            this.btnAceptar.Location = new System.Drawing.Point(37, 277);
            this.btnAceptar.Name = "btnAceptar";
            this.btnAceptar.Size = new System.Drawing.Size(125, 35);
            this.btnAceptar.TabIndex = 6;
            this.btnAceptar.Text = "Cargar Mesa";
            this.btnAceptar.UseVisualStyleBackColor = true;
            this.btnAceptar.Click += new System.EventHandler(this.btnAceptar_Click);
            // 
            // btnCancelar
            // 
            this.btnCancelar.Location = new System.Drawing.Point(182, 277);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(125, 35);
            this.btnCancelar.TabIndex = 7;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = true;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            // 
            // dgvDia
            // 
            this.dgvDia.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvDia.Location = new System.Drawing.Point(338, 12);
            this.dgvDia.Name = "dgvDia";
            this.dgvDia.Size = new System.Drawing.Size(403, 402);
            this.dgvDia.TabIndex = 8;
            // 
            // btnAbrir
            // 
            this.btnAbrir.Location = new System.Drawing.Point(94, 352);
            this.btnAbrir.Name = "btnAbrir";
            this.btnAbrir.Size = new System.Drawing.Size(165, 39);
            this.btnAbrir.TabIndex = 9;
            this.btnAbrir.Text = "Cargar Mesas";
            this.btnAbrir.UseVisualStyleBackColor = true;
            this.btnAbrir.Click += new System.EventHandler(this.btnAbrir_Click);
            // 
            // checkBox1
            // 
            this.checkBox1.AutoSize = true;
            this.checkBox1.Checked = true;
            this.checkBox1.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox1.Location = new System.Drawing.Point(131, 234);
            this.checkBox1.Name = "checkBox1";
            this.checkBox1.Size = new System.Drawing.Size(73, 17);
            this.checkBox1.TabIndex = 11;
            this.checkBox1.Text = "Habilitada";
            this.checkBox1.UseVisualStyleBackColor = true;
            // 
            // frmAbrirDia
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(753, 426);
            this.Controls.Add(this.checkBox1);
            this.Controls.Add(this.btnAbrir);
            this.Controls.Add(this.dgvDia);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.btnAceptar);
            this.Controls.Add(this.gboxSillas);
            this.Controls.Add(this.lblSillas);
            this.Controls.Add(this.cmbMeseros);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.lblMesas);
            this.Controls.Add(this.cmbMesas);
            this.Name = "frmAbrirDia";
            this.Text = "frmAbrirDia";
            this.gboxSillas.ResumeLayout(false);
            this.gboxSillas.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDia)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cmbMesas;
        private System.Windows.Forms.Label lblMesas;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cmbMeseros;
        private System.Windows.Forms.Label lblSillas;
        private System.Windows.Forms.GroupBox gboxSillas;
        private System.Windows.Forms.RadioButton rdb10;
        private System.Windows.Forms.RadioButton rdb6;
        private System.Windows.Forms.RadioButton rdb4;
        private System.Windows.Forms.RadioButton rdb8;
        private System.Windows.Forms.RadioButton rdb5;
        private System.Windows.Forms.RadioButton rdb2;
        private System.Windows.Forms.Button btnAceptar;
        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.DataGridView dgvDia;
        private System.Windows.Forms.Button btnAbrir;
        private System.Windows.Forms.CheckBox checkBox1;
    }
}