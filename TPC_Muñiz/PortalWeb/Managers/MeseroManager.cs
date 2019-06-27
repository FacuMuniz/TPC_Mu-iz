using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using TPC_Muñiz.Models;

namespace TPC_Muñiz.Managers
{
    class MeseroManager
    {
        private static string getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["DBM"].ConnectionString;
        }

        public List<mesero> TraerMeseros()
        {
            using (var cn = new SqlConnection(getConnectionString()))
            {
                try
                {
                    List<mesero> lista = new List<mesero>();
                    DataTable dt = null;
                    int x = 0;
                    var ds = new DataSet();
                    var cmd = new SqlCommand("listar_meseros", cn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };


                    var da = new SqlDataAdapter(cmd);
                    cn.Open();
                    da.Fill(ds);

                    dt = ds.Tables[0];

                    for (x = 0; x < dt.Rows.Count; x++)
                    {

                        mesero data = new mesero();
                        data.Id = int.Parse(dt.Rows[x].ItemArray[0].ToString());
                        data.Nombre = dt.Rows[x].ItemArray[1].ToString();

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



    }
}
