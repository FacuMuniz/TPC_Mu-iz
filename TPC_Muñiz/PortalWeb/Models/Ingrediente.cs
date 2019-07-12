using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TPC_Muñiz.Models
{
    class Ingrediente
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public float Cantidad { get; set; }
        public string Tipocant { get; set; }
    }

    class Item
    {
        public int item { get; set; }
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public float Cantidad { get; set; }
    }
}
