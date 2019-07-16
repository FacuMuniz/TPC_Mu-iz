using ACCESO_DATOS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TPC_Muñiz.Managers;
using TPC_Muñiz.Models;

namespace TPC_Muñiz
{
    public partial class frmPedidosMesa : Form
    {

        PedidosManager manager = new PedidosManager();
        float total = 0;
        BindingList<Comida> lista = new BindingList<Comida>();

        BindingList<Comida> lista2 = new BindingList<Comida>();

        List<Pedidos> pedidos = new List<Pedidos>();
        List<float> precios = new List<float>();
        int aux = 0;

        public frmPedidosMesa(int id,int idmesero)
        {
            try
            {

            
            InitializeComponent();
            lblidmesero.Text = idmesero.ToString();
            lblid.Text = id.ToString();
            lbltotal.Text = total.ToString();
            lista = manager.TraerComidas();
            cmbcomidas.DataSource = lista;
            cmbcomidas.DisplayMember = "Descripcion";
            cmbcomidas.ValueMember = "id";
            for(int x = 0; x < lista.Count(); x++)
            {

                precios.Add(lista[x].Precio);

            }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        public frmPedidosMesa(int id, int idmesero,DateTime hora)
        {
            try
            {

                lista2 =  manager.ListarPedidosxAbertura(id, hora);
                for(int x=0; x<lista2.Count();x++)
                {
                    total += int.Parse(lista2[x].Precio.ToString());
                }
                InitializeComponent();
                lblidmesero.Text = idmesero.ToString();
                lblid.Text = id.ToString();
                lbltotal.Text = total.ToString();
                lista = manager.TraerComidas();
                cmbcomidas.DataSource = lista;
                cmbcomidas.DisplayMember = "Descripcion";
                cmbcomidas.ValueMember = "id";
                for (int x = 0; x < lista.Count(); x++)
                {

                    precios.Add(lista[x].Precio);

                }

                dgvPedidos.DataSource = lista2;
                dgvPedidos.Refresh();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {


                Comida nuevo = new Comida();
                nuevo.Id = int.Parse(cmbcomidas.SelectedValue.ToString());
                nuevo.Descripcion = cmbcomidas.Text;
                nuevo.Precio = precios[nuevo.Id-1];
                Pedidos pedido = new Pedidos();
                pedido.Idmesa = int.Parse(lblid.Text);
                pedido.Idmesero = int.Parse(lblidmesero.Text);
                pedido.Idcomida = int.Parse(cmbcomidas.SelectedValue.ToString());
                pedido.Descripcion = cmbcomidas.Text;
                pedido.Precio = precios[nuevo.Id-1];

                List<int> ingredientes = manager.CargarPedidos(pedido);
                for (int x = 0; x < ingredientes.Count(); x++)
                {

                    manager.RestarStock(ingredientes[x]);

                }


                //se carga nuevamente el combo box para eliminar las comidas que ya no presenten ingredientes en stock.
                lista = manager.TraerComidas();
                cmbcomidas.DataSource = lista;
                cmbcomidas.DisplayMember = "Descripcion";
                cmbcomidas.ValueMember = "id";

                lista2.Add(nuevo);
                dgvPedidos.DataSource = lista2;
                dgvPedidos.Refresh();
                total += nuevo.Precio;

                lbltotal.Text = total.ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void btnCerrar_Click(object sender, EventArgs e)
        {
            AccesoDatosManager accesoDatos = new AccesoDatosManager();
            try
            {



                accesoDatos.setearSP("Cerrarmesa");//SETEO EL SP

                SqlParameter[] VectorParam = new SqlParameter[2]; //no funciona con lista, aqui se debe agregar la cantidad de parametros totales

                accesoDatos.agregarParametroSP(VectorParam, 0, "@id", System.Data.SqlDbType.Int, int.Parse(lblid.Text)); // AGREGO UN PARAMETRO AL VECTOR EN ESA POSICION
                accesoDatos.agregarParametroSP(VectorParam, 1, "@monto", System.Data.SqlDbType.Float, float.Parse(lbltotal.Text)); // AGREGO UN PARAMETRO AL VECTOR EN ESA POSICION



                accesoDatos.Comando.Parameters.AddRange(VectorParam);//AGREGO LA MATRIZ DE PARAMETROS A LOS PARAMETROS DEL COMANDO

                accesoDatos.abrirConexion(); // abro conexion   
                accesoDatos.ejecutarConsulta();//EJECUTO EL SP

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                accesoDatos.cerrarConexion();//CIERRO CONEXION
            }

            this.Close();
        }

       



    }
}
