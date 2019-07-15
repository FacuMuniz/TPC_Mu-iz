using ACCESO_DATOS;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PortalWeb
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var cookie = Request.Cookies["session"];
            if (cookie == null)
            {
            }
            else
            {
                Response.Redirect("BandejaPedidos.aspx", false);
            }
        }


        protected void btnLogin_ServerClick(object sender, EventArgs e)
        {

            AccesoDatosManager accesoDatos = new AccesoDatosManager();

            try
            {



                accesoDatos.setearSP("auth_login");//SETEO EL SP

                SqlParameter[] VectorParam = new SqlParameter[2]; //no funciona con lista, aqui se debe agregar la cantidad de parametros totales

                accesoDatos.agregarParametroSP(VectorParam, 0, "@usuario", System.Data.SqlDbType.VarChar, user.Value); // AGREGO UN PARAMETRO AL VECTOR EN ESA POSICION
                accesoDatos.agregarParametroSP(VectorParam, 1, "@contrasenia", System.Data.SqlDbType.VarChar, password.Value); // AGREGO UN PARAMETRO AL VECTOR EN ESA POSICION



                accesoDatos.Comando.Parameters.AddRange(VectorParam);//AGREGO LA MATRIZ DE PARAMETROS A LOS PARAMETROS DEL COMANDO

                accesoDatos.abrirConexion(); // abro conexion   
                accesoDatos.ejecutarConsulta();//EJECUTO EL SP

                while (accesoDatos.Lector.Read())
                {
                    if (accesoDatos.Lector.GetString(0) == "OK")
                    {
                        if (accesoDatos.Lector.GetInt32(1) == 1)
                        {
                            var cookie = new HttpCookie("session");
                            cookie.Values.Add("user", user.Value);
                            cookie.Values.Add("type", accesoDatos.Lector.GetInt32(1).ToString());
                            cookie.Expires = DateTime.Now.AddDays(1);
                            Response.Cookies.Add(cookie);
                            Response.Redirect("BandejaPedidos.aspx",false);
                        }

                    }
                    else
                    {

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