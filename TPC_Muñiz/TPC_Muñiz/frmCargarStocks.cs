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
    public partial class frmCargarStocks : Form
    {
        public frmCargarStocks()
        {
            InitializeComponent();
            StockManager stock = new StockManager();
            BindingList<Ingrediente> lista = stock.ListarStock("");
            cmbIngrediente.DataSource = lista;
            cmbIngrediente.DisplayMember = "Descripcion";
            cmbIngrediente.ValueMember = "Id";
        }

        private void btnCagar_Click(object sender, EventArgs e)
        {
            StockManager stock = new StockManager();
            BindingList<Ingrediente> lista = stock.Cargarstocks(int.Parse(cmbIngrediente.SelectedValue.ToString()), int.Parse(txtCant.Text));
            dgvStocks.DataSource = lista;
            dgvStocks.Refresh();
        }
    }
}
