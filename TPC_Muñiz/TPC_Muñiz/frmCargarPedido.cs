using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms;
using TPC_Muñiz.Managers;
using TPC_Muñiz.Models;
using System.Configuration;
using System.Data.SqlClient;
using ACCESO_DATOS;

namespace TPC_Muñiz
{
    public partial class frmCargarPedido : Form
    {
        public frmCargarPedido(int id, string nombre)
        {
            InitializeComponent();
            MesasManager listmesas = new MesasManager();
            cmbMesas.DataSource = listmesas.TraerMesasxMesero(id);
            cmbMesas.DisplayMember = "Id";
            lblid.Text = id.ToString();
            label3.Text = nombre;
        }

        private void btnAbrirMesa_Click(object sender, EventArgs e)
        {

            MesasManager listmesas = new MesasManager();
            if (listmesas.verificarmesa(int.Parse(cmbMesas.Text.ToString())) == "OK")
            {
                listmesas.abrirmesa(int.Parse(cmbMesas.Text.ToString()), int.Parse(lblid.Text));
                frmPedidosMesa frm = new frmPedidosMesa(int.Parse(cmbMesas.Text.ToString()), int.Parse(lblid.Text));
                frm.Show();
            }
            else
            {
                
                frmPedidosMesa frm = new frmPedidosMesa(int.Parse(cmbMesas.Text.ToString()), int.Parse(lblid.Text), DateTime.Parse(listmesas.verificarmesa(int.Parse(cmbMesas.Text.ToString()))));
                frm.Show();
            }
        }

        private void btnFinalizar_Click(object sender, EventArgs e)
        {
            AccesoDatosManager accesoDatos = new AccesoDatosManager();
            try
            {

            

            accesoDatos.setearSP("Cerrardia");//SETEO EL SP

            SqlParameter[] VectorParam = new SqlParameter[1]; //no funciona con lista, aqui se debe agregar la cantidad de parametros totales

            accesoDatos.agregarParametroSP(VectorParam, 0, "@id", System.Data.SqlDbType.Int, int.Parse(lblid.Text)); // AGREGO UN PARAMETRO AL VECTOR EN ESA POSICION
  


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

        private void frmCargarPedido_FormClosing(object sender, FormClosingEventArgs e)
        {

            Environment.Exit(0);

        }
    }
}
    
