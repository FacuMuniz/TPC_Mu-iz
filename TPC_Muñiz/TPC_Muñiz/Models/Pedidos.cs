using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TPC_Muñiz.Models
{
    class Pedidos
    {
        public int Id { get; set; }
        public int Idmesero { get; set; }
        public int Idmesa { get; set; }
        public int Idcomida { get; set; }
        public string Descripcion { get; set; }
        public DateTime Hora { get; set; }
        public float Precio { get; set; }
    }
}
