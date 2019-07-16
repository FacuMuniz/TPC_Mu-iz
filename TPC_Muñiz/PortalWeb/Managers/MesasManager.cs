using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TPC_Muñiz.Models;
using ACCESO_DATOS;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.ComponentModel;

namespace TPC_Muñiz.Managers
{
    public class MesasManager
    {
        private static string getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DBM"].ConnectionString;
        }


        public BindingList<Mesas> TraerMesas()
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    BindingList<Mesas> lista = new BindingList<Mesas>();
                    DataTable dt = null;
                    int x = 0;
                    var ds = new DataSet();
                    var cmd = new SqlCommand("listar_mesa", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };


                    var da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);

                    dt = ds.Tables[0];

                    for (x = 0; x < dt.Rows.Count; x++)
                    {

                        Mesas data = new Mesas();

                        data.Id = int.Parse(dt.Rows[x].ItemArray[0].ToString());
                        data.Mesero = int.Parse(dt.Rows[x].ItemArray[1].ToString());

                        data.Nombre = dt.Rows[x].ItemArray[2].ToString();
                        data.Sillas = int.Parse(dt.Rows[x].ItemArray[3].ToString());
                        data.Salon = int.Parse(dt.Rows[x].ItemArray[4].ToString());
                        data.Habilitada = bool.Parse(dt.Rows[x].ItemArray[5].ToString());
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


        public void AddNewstocks(int desc, bool x)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    DataTable dt = null;

                    var ds = new DataSet();
                    var cmd = new SqlCommand("agregarmesa", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.AddWithValue("@salon", desc);


                    cmd.Parameters.AddWithValue("@habilitada", x);

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
                    var cmd = new SqlCommand("eliminarmesa", cn)
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


        public DataTable TraerAperturas()
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    DataTable dt = null;
                    int x = 0;
                    var ds = new DataSet();
                    var cmd = new SqlCommand("listar_aperturas", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };


                    var da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);

                    dt = ds.Tables[0];




                    cn.Close();
                    return dt;
                }
                catch (Exception ex)
                {

                    cn.Close();
                    return null;
                }
            }


        }

        public List<int> TraerMesasxMesero(int id)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    List<int> lista = new List<int>();
                    DataTable dt = null;
                    int x = 0;
                    var ds = new DataSet();
                    var cmd = new SqlCommand("Mesaxmesero", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };


                    var da = new SqlDataAdapter(cmd);
                    cmd.Parameters.AddWithValue("@id", id);

                    cn.Open();
                    da.Fill(ds);

                    dt = ds.Tables[0];

                    for (x = 0; x < dt.Rows.Count; x++)
                    {
                        
                        lista.Add(int.Parse(dt.Rows[x].ItemArray[0].ToString()));
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



        public string CargarMesas (Mesas mesa)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    DataTable dt = null;
                    
                    var ds = new DataSet();
                    var cmd = new SqlCommand("cargar_mesa", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@idmesa", mesa.Id);

                    cmd.Parameters.AddWithValue("@idmesero", mesa.Mesero);

                    cmd.Parameters.AddWithValue("@cantsillas", mesa.Sillas);


                    cmd.Parameters.AddWithValue("@habilitada", mesa.Habilitada);



                    var da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);

                    dt = ds.Tables[0];

                    string result = "";

                    result = dt.Rows[0].ItemArray[0].ToString();





                    cn.Close();
                    return result;
                }
                catch (Exception ex)
                {
                   
                    cn.Close();
                    return null;
                }
            }
        }


        public string abrirmesa(int id,int mesero)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    string lista = "";
                    DataTable dt = null;
                    int x = 0;
                    var ds = new DataSet();
                    var cmd = new SqlCommand("abrir_Mesa", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };


                    var da = new SqlDataAdapter(cmd);
                    cmd.Parameters.AddWithValue("@id", id);

                    cmd.Parameters.AddWithValue("@idmesero", mesero);

                    cn.Open();
                    da.Fill(ds);

                    dt = ds.Tables[0];

                    for (x = 0; x < dt.Rows.Count; x++)
                    {

                        lista=dt.Rows[x].ItemArray[0].ToString();
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


        public string verificarmesa(int id)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    string lista = "";
                    DataTable dt = null;
                    int x = 0;
                    var ds = new DataSet();
                    var cmd = new SqlCommand("Verificarmesa", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };


                    var da = new SqlDataAdapter(cmd);
                    cmd.Parameters.AddWithValue("@idmesa", id);

                    cn.Open();
                    da.Fill(ds);

                    dt = ds.Tables[0];

                    for (x = 0; x < dt.Rows.Count; x++)
                    {

                        lista = dt.Rows[x].ItemArray[0].ToString();
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


    }
}

