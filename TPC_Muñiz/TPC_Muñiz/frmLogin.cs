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

    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {

            AccesoDatosManager accesoDatos = new AccesoDatosManager();
           
            try
            {



                accesoDatos.setearSP("auth_login");//SETEO EL SP

                SqlParameter[] VectorParam = new SqlParameter[2]; //no funciona con lista, aqui se debe agregar la cantidad de parametros totales

                accesoDatos.agregarParametroSP(VectorParam, 0, "@usuario", System.Data.SqlDbType.VarChar, txtboxUsuario.Text); // AGREGO UN PARAMETRO AL VECTOR EN ESA POSICION
                accesoDatos.agregarParametroSP(VectorParam, 1, "@contrasenia", System.Data.SqlDbType.VarChar, txtboxContrasenia.Text); // AGREGO UN PARAMETRO AL VECTOR EN ESA POSICION
               


                accesoDatos.Comando.Parameters.AddRange(VectorParam);//AGREGO LA MATRIZ DE PARAMETROS A LOS PARAMETROS DEL COMANDO

                accesoDatos.abrirConexion(); // abro conexion   
                accesoDatos.ejecutarConsulta();//EJECUTO EL SP

                while(accesoDatos.Lector.Read())
                {
                    if (accesoDatos.Lector.GetString(0) == "OK")
                    {
                       
                        if(accesoDatos.Lector.GetInt32(1) == 1)
                        {
                            frmMenuPrincipal MenuPrincipal = new frmMenuPrincipal(accesoDatos.Lector.GetInt32(2));

                            MenuPrincipal.Show();
                            this.Hide();
                        }
                        else
                        {
                            frmCargarPedido frmCargarPedido = new frmCargarPedido(accesoDatos.Lector.GetInt32(2), accesoDatos.Lector.GetString(3));
                            frmCargarPedido.Show();
                            this.Hide();
                        }
                        
                    }
                    else
                    {
                        lblLoginFail.Text = accesoDatos.Lector.GetString(0);
                    }
                }
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();//CIERRO CONEXION
            }

        }
    }
}
