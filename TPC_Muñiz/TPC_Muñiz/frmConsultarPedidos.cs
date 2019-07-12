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
    public partial class frmConsultarPedidos : Form
    {
        public frmConsultarPedidos()
        {
            try
            {


                InitializeComponent();
                MesasManager listmesas = new MesasManager();
                cmbMesas.DataSource = listmesas.TraerMesas();
                cmbMesas.DisplayMember = "Id";
                cmbMesas.ValueMember = "Id";
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {


                PedidosManager lista = new PedidosManager();
                BindingList<Pedidos> pedido = lista.ListarPedidos(dtpdesde.Value, dtphasta.Value, int.Parse(cmbMesas.SelectedValue.ToString()));
                dataGridView1.DataSource = pedido;
                dataGridView1.Refresh();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
