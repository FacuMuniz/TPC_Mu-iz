using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
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
                    MessageBox.Show(ex.Message);

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
                    MessageBox.Show(ex.Message);

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
                    MessageBox.Show(ex.Message);

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
                    
                   





                    cn.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);

                    cn.Close();
                }
            }
        }

        public BindingList<Comida> ListarPedidosxAbertura(int mesa, DateTime hora)
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    BindingList<Comida> lista = new BindingList<Comida>();
                    DataTable dt = null;
                    int x = 0;
                    var ds = new DataSet();
                    var cmd = new SqlCommand("TraerPedidos", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };


                    cmd.Parameters.AddWithValue("@idmesa", mesa);

                    cmd.Parameters.AddWithValue("@hora", hora);


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
                    MessageBox.Show(ex.Message);

                    cn.Close();
                    return null;
                }
            }


        }

    }
}
