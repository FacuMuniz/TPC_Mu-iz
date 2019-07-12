using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TPC_Muñiz.Managers;
using TPC_Muñiz.Models;

namespace PortalWeb
{
    public partial class BandejaPedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }







        protected void btnLimpiarFiltros_Click(object sender, EventArgs e)
        {
            try
            {


                PedidosManager lista = new PedidosManager();
                BindingList<Pedidos> pedido = lista.ListarPedidos(DateTime.Parse(datepickerfrom.Value), DateTime.Parse(datepickerto.Value), int.Parse(txtmesa.Text.ToString()));
                ingredientes4.DataSource = pedido;
                ingredientes4.DataBind();
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }

        }
    }
}