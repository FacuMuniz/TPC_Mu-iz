using PortalWeb.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TPC_Muñiz.Models;

namespace PortalWeb.Managers
{
    public class UserManager
    {
        private static string getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DBM"].ConnectionString;
        }


        public BindingList<Usuario> ListarStock()
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    BindingList<Usuario> lista = new BindingList<Usuario>();
                    DataTable dt = null;
                    int x = 0;
                    var ds = new DataSet();
                    var cmd = new SqlCommand("listarusuarios", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    

                    var da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);

                    dt = ds.Tables[0];

                    for (x = 0; x < dt.Rows.Count; x++)
                    {

                        Usuario data = new Usuario();

                        data.Id = int.Parse(dt.Rows[x].ItemArray[0].ToString());
                        data.User = dt.Rows[x].ItemArray[1].ToString();
                        data.Tipo= int.Parse(dt.Rows[x].ItemArray[2].ToString());
                        data.Pass = dt.Rows[x].ItemArray[3].ToString();
                        data.Nombre = dt.Rows[x].ItemArray[4].ToString();

                        lista.Add(data);
                    }




                    cn.Close();
                    return lista;
                }
                catch (Exception ex)
                {

                    cn.Close();
                    return null;
                }
            }


        }


       



        public void modstocks(int id, string user, int tipo, string contra, string nombre)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    DataTable dt = null;

                    var ds = new DataSet();
                    var cmd = new SqlCommand("Mod_user", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@id", id);

                    cmd.Parameters.AddWithValue("@usuario", user);


                    cmd.Parameters.AddWithValue("@tipo", tipo);


                    cmd.Parameters.AddWithValue("@contra", contra);

                    cmd.Parameters.AddWithValue("@nombre", nombre);

                    var da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);
                    






                    cn.Close();
                }
                catch (Exception ex)
                {

                    cn.Close();
                }
            }
        }

        public void AddNewstocks(string user, int tipo, string contra, string nombre)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    DataTable dt = null;

                    var ds = new DataSet();
                    var cmd = new SqlCommand("AgregarUsuario", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@usuario", user);


                    cmd.Parameters.AddWithValue("@tipo", tipo);


                    cmd.Parameters.AddWithValue("@cont", contra);

                    cmd.Parameters.AddWithValue("@nombre", nombre);

                    var da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);







                    cn.Close();
                }
                catch (Exception ex)
                {

                    cn.Close();
                }
            }
        }



        public void Delstocks(int id)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {

                    var ds = new DataSet();
                    var cmd = new SqlCommand("eliminaruser", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.AddWithValue("@id", id);


                    var da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);







                    cn.Close();
                }
                catch (Exception ex)
                {

                    cn.Close();
                }
            }
        }



    }

}
