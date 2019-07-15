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
    class PedidosManager
    {

        private static string getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DBM"].ConnectionString;
        }


        public BindingList<Pedidos> ListarPedidos(DateTime start, DateTime end, int mesa)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    BindingList<Pedidos> lista = new BindingList
<Pedidos>();
                    DataTable dt = null;
                    int x = 0;
                    var ds = new DataSet();
                    var cmd = new SqlCommand("listar_pedidos", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.AddWithValue("@datestart", start);

                    cmd.Parameters.AddWithValue("@dateend", end);

                    cmd.Parameters.AddWithValue("@mesa", mesa);

                    var da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);

                    dt = ds.Tables[0];

                    for (x = 0; x < dt.Rows.Count; x++)
                    {

                        Pedidos data = new Pedidos();

                        data.Id = int.Parse(dt.Rows[x].ItemArray[0].ToString());
                        data.Idmesero = int.Parse(dt.Rows[x].ItemArray[1].ToString());
                        data.Idmesa = int.Parse(dt.Rows[x].ItemArray[2].ToString());
                        data.Idcomida = int.Parse(dt.Rows[x].ItemArray[3].ToString());
                        data.Descripcion = dt.Rows[x].ItemArray[4].ToString();
                        data.Hora = DateTime.Parse(dt.Rows[x].ItemArray[5].ToString());
                        data.Precio = float.Parse(dt.Rows[x].ItemArray[6].ToString());
                        
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



        public BindingList<Comida> TraerComidas()
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    BindingList<Comida> lista = new BindingList<Comida>();
                    DataTable dt = null;
                    int x = 0;
                    var ds = new DataSet();
                    var cmd = new SqlCommand("listarcomidas", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };


                    var da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);

                    dt = ds.Tables[0];

                    for (x = 0; x < dt.Rows.Count; x++)
                    {

                        Comida data = new Comida();

                        data.Id = int.Parse(dt.Rows[x].ItemArray[0].ToString());
                        data.Descripcion = dt.Rows[x].ItemArray[1].ToString();
                        data.Precio = float.Parse(dt.Rows[x].ItemArray[2].ToString());
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

        public BindingList<Item> TraerCxi(int id)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    BindingList<Item> lista = new BindingList<Item>();
                    DataTable dt = null;
                    int x = 0;
                    var ds = new DataSet();
                    var cmd = new SqlCommand("listarcxi", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@id", id);

                    var da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);

                    dt = ds.Tables[0];

                    for (x = 0; x < dt.Rows.Count; x++)
                    {

                        Item data = new Item();
                        data.Id = int.Parse(dt.Rows[x].ItemArray[0].ToString());
                        data.Descripcion = dt.Rows[x].ItemArray[1].ToString();
                        data.Cantidad = float.Parse(dt.Rows[x].ItemArray[2].ToString());

                        data.tipo = dt.Rows[x].ItemArray[3].ToString();
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

        public BindingList<Item> Traeraux()
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    BindingList<Item> lista = new BindingList<Item>();
                    DataTable dt = null;
                    int x = 0;
                    var ds = new DataSet();
                    var cmd = new SqlCommand("listaraux", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    var da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);

                    dt = ds.Tables[0];

                    for (x = 0; x < dt.Rows.Count; x++)
                    {

                        Item data = new Item();
                        data.Id = int.Parse(dt.Rows[x].ItemArray[0].ToString());
                        data.Descripcion = dt.Rows[x].ItemArray[1].ToString();
                        data.Cantidad = float.Parse(dt.Rows[x].ItemArray[2].ToString());

                        data.tipo = dt.Rows[x].ItemArray[3].ToString();
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


        public List<int> CargarPedidos(Pedidos pedido)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    DataTable dt = null;

                    var ds = new DataSet();
                    var cmd = new SqlCommand("Cargar_Pedido", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@idmesa", pedido.Idmesa);

                    cmd.Parameters.AddWithValue("@idmesero", pedido.Idmesero);

                    cmd.Parameters.AddWithValue("@idcomida", pedido.Idcomida);

                    cmd.Parameters.AddWithValue("@descripcion", pedido.Descripcion);

                    cmd.Parameters.AddWithValue("@precio", pedido.Precio);



                    var da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);

                    dt = ds.Tables[0];

                    List<int> result = new List<int>();

                    for(int x= 0; x < dt.Rows.Count; x++)
                    {

                        result.Add( int.Parse(dt.Rows[x].ItemArray[0].ToString()));
                    }





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


        public void RestarStock(int id)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    DataTable dt = null;

                    var ds = new DataSet();
                    var cmd = new SqlCommand("RestarStock", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@id", id);



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

        public void modComida(int id, string desc, float cant)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    DataTable dt = null;

                    var ds = new DataSet();
                    var cmd = new SqlCommand("Mod_comida", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@id", id);

                    cmd.Parameters.AddWithValue("@descripcion", desc);


                    cmd.Parameters.AddWithValue("@precio", cant);

                    

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

        public void cargaaux(int id, string desc, float cant, string tipo)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    DataTable dt = null;

                    var ds = new DataSet();
                    var cmd = new SqlCommand("cargaraux", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@id", id);

                    cmd.Parameters.AddWithValue("@desc", desc);


                    cmd.Parameters.AddWithValue("@cant", cant);

                    cmd.Parameters.AddWithValue("@tipo", tipo);



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

        public int AddNewcomida(string desc, float cant)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    DataTable dt = null;

                    var ds = new DataSet();
                    var cmd = new SqlCommand("agregarCom", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.AddWithValue("@desc", desc);


                    cmd.Parameters.AddWithValue("@precio", cant);

                    

                    var da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);

                    dt = ds.Tables[0];

                    return int.Parse(dt.Rows[0].ItemArray[0].ToString());




                    cn.Close();
                }
                catch (Exception ex)
                {
                    return 0;
                    cn.Close();
                }
            }
        }

        public void AddNewcxi(int desc, float cant, int idcomida, string tipo)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    DataTable dt = null;

                    var ds = new DataSet();
                    var cmd = new SqlCommand("agregarCxI", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.AddWithValue("@id", desc);


                    cmd.Parameters.AddWithValue("@cant", cant);


                    cmd.Parameters.AddWithValue("@idcomida", idcomida);

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



        public void DelComida(int id)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {

                    var ds = new DataSet();
                    var cmd = new SqlCommand("eliminarcomida", cn)
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

        public void DelCxi(int id, int idcom)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {

                    var ds = new DataSet();
                    var cmd = new SqlCommand("eliminarcxi", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.AddWithValue("@iding", id);

                    cmd.Parameters.AddWithValue("@idcom", idcom);

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



        public void DelallCxi(int idcom)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {

                    var ds = new DataSet();
                    var cmd = new SqlCommand("eliminarcxi", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    

                    cmd.Parameters.AddWithValue("@idcom", idcom);

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
