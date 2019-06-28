using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PortalWeb.Models
{
    public class Usuario
    {
        public int Id { get; set; }
        public string User { get; set; }
        public int Tipo { get; set; }
        public string Pass { get; set; }
        public string Nombre { get; set; }
    }
}