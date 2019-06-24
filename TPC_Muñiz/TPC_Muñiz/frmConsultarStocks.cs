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
            InitializeComponent();
        }

        private void btnbuscar_Click(object sender, EventArgs e)
        {
            StockManager manager = new StockManager();
            BindingList <Ingrediente> lista = manager.ListarStock(txtsearch.Text);
            dgvstock.DataSource = lista;
            dgvstock.Refresh();
        }
    }
}
