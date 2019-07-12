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
using TPC_Muñiz.Managers;

namespace TPC_Muñiz
{
    public partial class frmMesas : Form
    {
        public frmMesas()
        {
            InitializeComponent();
            MesasManager listmesas = new MesasManager();
            dgvMesas.DataSource = listmesas.TraerMesas();


        }
    }
}
