using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TPC_Muñiz
{
    public partial class frmMenuPrincipal : Form
    {
        public frmMenuPrincipal()
        {
            InitializeComponent();
        }

        private void btnMostrarmMesas_Click(object sender, EventArgs e)
        {
            frmMesas Mesas = new frmMesas();
            Mesas.Show();
        }

        private void frmMenuPrincipal_FormClosed(object sender, FormClosedEventArgs e)
        {
            Environment.Exit(0);
        }

        private void btnConsultarPedidos_Click(object sender, EventArgs e)
        {
            frmConsultarPedidos ConsultarPedidos = new frmConsultarPedidos();
            ConsultarPedidos.Show();
        }

        private void btnConsultarStocks_Click(object sender, EventArgs e)
        {
            frmConsultarStocks ConsultarStocks = new frmConsultarStocks();
            ConsultarStocks.Show();
        }

        private void btnAbrirDia_Click(object sender, EventArgs e)
        {
            frmAbrirDia AbrirDia = new frmAbrirDia();
            AbrirDia.Show();
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            Environment.Exit(0);
        }
    }
}
