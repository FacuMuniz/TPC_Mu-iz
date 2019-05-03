using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TPC_Muñiz
{
    public partial class frmMesas : Form
    {
        public frmMesas()
        {
            InitializeComponent();

            SqlConnection DB = new SqlConnection("Server=localhost/SQLEXPRESS;Integrated security=SSPI;database=DB_MUÑIZ");

            SqlCommand myCommand = new SqlCommand("auth_login", DB);
            using (SqlConnection con = new SqlConnection("data source=localhost\\SQLEXPRESS;initial catalog=DB_MUÑIZ; Integrated security=SSPI;"))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Mesas", con))
                {
                    cmd.CommandType = CommandType.Text;
                    

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();

                    con.Open();
                    da.Fill(ds);

                    dgvMesas.DataSource = ds.Tables[0];

                    con.Close();

                }
            }

        }
    }
}
