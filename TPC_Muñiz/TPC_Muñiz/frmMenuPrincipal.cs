using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using System.Data.SqlClient;
using ACCESO_DATOS;

namespace TPC_Muñiz
{
    public partial class frmMenuPrincipal : Form
    {
        public frmMenuPrincipal(int id)
        {
            InitializeComponent();
            lblID.Text = id.ToString();
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
            AccesoDatosManager accesoDatos = new AccesoDatosManager();
            try
            {



                accesoDatos.setearSP("Cerrardia");//SETEO EL SP

                SqlParameter[] VectorParam = new SqlParameter[2]; //no funciona con lista, aqui se debe agregar la cantidad de parametros totales

                accesoDatos.agregarParametroSP(VectorParam, 0, "@id", System.Data.SqlDbType.Int, int.Parse(lblID.Text)); // AGREGO UN PARAMETRO AL VECTOR EN ESA POSICION



                accesoDatos.Comando.Parameters.AddRange(VectorParam);//AGREGO LA MATRIZ DE PARAMETROS A LOS PARAMETROS DEL COMANDO

                accesoDatos.abrirConexion(); // abro conexion   
                accesoDatos.ejecutarConsulta();//EJECUTO EL SP

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();//CIERRO CONEXION
            }
            Environment.Exit(0);
        }

        private void btnCargarStock_Click(object sender, EventArgs e)
        {
            frmCargarStocks CargarStocks = new frmCargarStocks();
            CargarStocks.Show();
        }
    }
}
