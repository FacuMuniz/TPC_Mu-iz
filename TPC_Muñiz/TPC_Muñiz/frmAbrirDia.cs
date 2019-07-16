using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TPC_Muñiz.Managers;
using TPC_Muñiz.Models;

namespace TPC_Muñiz
{
    public partial class frmAbrirDia : Form
    {
        BindingList<Mesas> lista = new BindingList<Mesas>();

        public frmAbrirDia()
        {
            InitializeComponent();

            MesasManager listmesas = new MesasManager();
            cmbMesas.DataSource = listmesas.TraerMesas();
            cmbMesas.DisplayMember = "Id";
            cmbMesas.ValueMember = "Salon";

            MeseroManager listmesero = new MeseroManager();
            cmbMeseros.DataSource = listmesero.TraerMeseros();
            cmbMeseros.DisplayMember = "Nombre";
            cmbMeseros.ValueMember = "Id";
        }

        private void gboxSillas_Enter(object sender, EventArgs e)
        {

        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            Mesas nuevo = new Mesas();
            if(checkBox1.Checked)
            {
                if (rbtnselected() != 0)
                {

                    nuevo.Id = int.Parse(cmbMesas.Text);
                    nuevo.Mesero = int.Parse(cmbMeseros.SelectedValue.ToString());
                    nuevo.Nombre = cmbMeseros.SelectedText;
                    nuevo.Sillas = rbtnselected();
                    nuevo.Salon = int.Parse(cmbMesas.SelectedValue.ToString());
                   
                    nuevo.Habilitada = true;
                    


                    lista.Add(nuevo);

                    dgvDia.DataSource = lista;

                    dgvDia.Refresh();
                }
                else
                {
                    MessageBox.Show("POR FAVOR INGRESE DATOS VALIDOS");
                }
            }
            else
            {
                nuevo.Id = int.Parse(cmbMesas.Text);
                nuevo.Mesero = int.Parse(cmbMeseros.SelectedValue.ToString());
                nuevo.Sillas = 0;
                nuevo.Salon = int.Parse(cmbMesas.SelectedValue.ToString());

                nuevo.Habilitada = false;



                lista.Add(nuevo);

                dgvDia.DataSource = lista;

                dgvDia.Refresh();
                MessageBox.Show("SE DESHABILITO LA MESA, PARA HABILITARLA CARGUE NUEVAMENTE LOS DATOS TILDANDO 'HABILITADA' ");
            }
           

        }

        private int rbtnselected()
        {
            if (rdb2.Checked) return 2;

            else if (rdb4.Checked) return 4;

            else if (rdb5.Checked) return 5;

            else if (rdb6.Checked) return 6;

            else if (rdb8.Checked) return 8;

            else if (rdb10.Checked) return 10;

            else return 0;

        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnAbrir_Click(object sender, EventArgs e)
        {
            string result = "";
            MesasManager mesas = new MesasManager();
            int y = lista.Count();
            for (int x = 0; x < y; x++)
            {
                result = mesas.CargarMesas(lista[x]);
                if (result !=  "OK")
                {
                    MessageBox.Show("error al cargar los datos, verifique la conexion a la base de datos");
                    x = y;
                }
            }

            if (result == "OK")
            {
                MessageBox.Show("SE INICIO EL DIA CON EXITO");
            }


        }

    }
}
