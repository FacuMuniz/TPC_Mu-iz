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
            SqlConnection DB = new SqlConnection("Server=localhost/SQLEXPRESS;Integrated security=SSPI;database=DB_MUÑIZ");

            SqlCommand myCommand = new SqlCommand("auth_login", DB);
            using (SqlConnection con = new SqlConnection("data source=localhost\\SQLEXPRESS;initial catalog=DB_MUÑIZ; Integrated security=SSPI;"))
            {
                using (SqlCommand cmd = new SqlCommand("auth_login", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@usuario", txtboxUsuario.Text);
                    cmd.Parameters.AddWithValue("@contrasenia", txtboxContrasenia.Text);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();

                    con.Open();
                    da.Fill(ds);


                    if (ds.Tables[0].Rows[0].ItemArray[0].ToString() == "OK")
                    {
                        frmMenuPrincipal MenuPrincipal = new frmMenuPrincipal();
                        MenuPrincipal.Show();
                        con.Close();
                        this.Hide();
                    }
                    else
                    {
                        lblLoginFail.Text = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                    }
                }
            }
        }
    }
}
