using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TPC_Muñiz.Models;

namespace TPC_Muñiz.Managers
{
    class StockManager
    {

        private static string getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DBM"].ConnectionString;
        }


        public BindingList<Ingrediente> ListarStock(string param)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    BindingList<Ingrediente> lista = new BindingList<Ingrediente>();
                    DataTable dt = null;
                    int x = 0;
                    var ds = new DataSet();
                    var cmd = new SqlCommand("listar_stock", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.AddWithValue("@param", param);

                    var da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);

                    dt = ds.Tables[0];

                    for (x = 0; x < dt.Rows.Count; x++)
                    {

                        Ingrediente data = new Ingrediente();

                        data.Id = int.Parse(dt.Rows[x].ItemArray[0].ToString());
                        data.Descripcion = dt.Rows[x].ItemArray[1].ToString();
                        data.Cantidad = float.Parse(dt.Rows[x].ItemArray[2].ToString());
                        data.Tipocant = dt.Rows[x].ItemArray[3].ToString();
                       
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


        public BindingList<Ingrediente> Cargarstocks(int id, int cant)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    DataTable dt = null;

                    var ds = new DataSet();
                    var cmd = new SqlCommand("cargar_stocks", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@id", id);

                    cmd.Parameters.AddWithValue("@cant", cant);

                    var da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);

                    dt = ds.Tables[0];

                    BindingList<Ingrediente> lista = new BindingList<Ingrediente>();

                    Ingrediente data = new Ingrediente();

                    data.Id = int.Parse(dt.Rows[0].ItemArray[0].ToString());
                    data.Descripcion = dt.Rows[0].ItemArray[1].ToString();
                    data.Cantidad = float.Parse(dt.Rows[0].ItemArray[2].ToString());
                    data.Tipocant = dt.Rows[0].ItemArray[3].ToString();

                    lista.Add(data);





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




        public void modstocks(int id,string desc, float cant,string tipo)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    DataTable dt = null;

                    var ds = new DataSet();
                    var cmd = new SqlCommand("Mod_ing", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@id", id);

                    cmd.Parameters.AddWithValue("@desc", desc);


                    cmd.Parameters.AddWithValue("@cant", cant);


                    cmd.Parameters.AddWithValue("@tipocant", tipo);

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

        public void AddNewstocks(string desc, int cant, string tipo)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    DataTable dt = null;

                    var ds = new DataSet();
                    var cmd = new SqlCommand("agregaring", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.AddWithValue("@desc", desc);


                    cmd.Parameters.AddWithValue("@cant", cant);


                    cmd.Parameters.AddWithValue("@tipo", tipo);

                    var da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);

                    dt = ds.Tables[0];






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
                    var cmd = new SqlCommand("eliminaring", cn)
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
