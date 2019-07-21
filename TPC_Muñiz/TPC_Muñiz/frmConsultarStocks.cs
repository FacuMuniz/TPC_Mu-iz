using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TPC_Muñiz.Managers;
using TPC_Muñiz.Models;

namespace TPC_Muñiz
{
    public partial class frmConsultarStocks : Form
    {
        public frmConsultarStocks()
        {
            StockManager manager = new StockManager();
            InitializeComponent();

            BindingList<Ingrediente> lista = manager.ListarStock(txtsearch.Text);
            lista = manager.ListarStock("");
            cmbIngrediente.DataSource = lista;
            cmbIngrediente.DisplayMember = "Descripcion";
            cmbIngrediente.ValueMember = "Id";
        }

        private void btnbuscar_Click(object sender, EventArgs e)
        {
            StockManager manager = new StockManager();
            BindingList <Ingrediente> lista = manager.ListarStock(txtsearch.Text);
            dgvstock.DataSource = lista;
            dgvstock.Refresh();
        
        }

        private void btnCagar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtCant.Text[0] == ',')
                {
                    txtCant.Text = "0" + txtCant.Text;
                }
                if (txtCant.Text == ",")
                {
                    txtCant.Text = "0";
                }
                if (txtCant.Text == "")
                {
                    MessageBox.Show("Por favor inserte un numero valido.");
                }
                else
                {
                    StockManager stock = new StockManager();
                    txtCant.Text.Replace(',', '.');
                    BindingList<Ingrediente> lista = stock.Cargarstocks(int.Parse(cmbIngrediente.SelectedValue.ToString()), float.Parse(txtCant.Text));
                    lista = stock.ListarStock(txtsearch.Text);

                    dgvstock.DataSource = lista;
                    dgvstock.Refresh();
                    
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void txtPurchasePrice_KeyPress(object sender, KeyPressEventArgs e)
        {
            Validate(e);
        }

        private void Validate(KeyPressEventArgs E)
        {
            if (!char.IsNumber(E.KeyChar) & (Keys)E.KeyChar != Keys.Back
            & E.KeyChar != ',')
            {
                E.Handled = true;
            }
        }

    }
}
