using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TPC_Muñiz.Models;
using ACCESO_DATOS;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
using System.Configuration;

namespace TPC_Muñiz.Managers
{
    public class MesasManager
    {
        private static string getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DBM"].ConnectionString;
        }


        public List<Mesas> TraerMesas()
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    List<Mesas> lista = new List<Mesas>();
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
                        data.Sillas = int.Parse(dt.Rows[x].ItemArray[2].ToString());
                        data.Salon = int.Parse(dt.Rows[x].ItemArray[3].ToString());
                        data.Habilitada = bool.Parse(dt.Rows[x].ItemArray[4].ToString());
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
                    MessageBox.Show(ex.Message);

                    cn.Close();
                    return null;
                }
            }
        }




    }
}

