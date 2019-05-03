using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TPC_Muñiz.Models
{
    class PedidoComida
    {
        string Comida { get; set; }
        float Precio { get; set; }
        int Mesa { get; set; }
        int Mesero { get; set; }
        DateTime Hora { get; set; }
    }
}
