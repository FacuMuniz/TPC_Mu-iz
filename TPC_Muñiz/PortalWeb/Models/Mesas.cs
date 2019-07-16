using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TPC_Muñiz.Models
{
    public   class Mesas
    {
        public int Id { get; set; }
        public int Mesero { get; set; }
        public string Nombre { get; set; }
        public int Sillas { get; set; }
        public int Salon { get; set; }
        public bool Habilitada { get; set; }
    }
}
