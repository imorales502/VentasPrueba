using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using VentasMariscos.Db;

namespace VentasMariscos.Entidad
{
    public class Cliente
    {
        public static int ID { get; set; }
        public string Nit { get; set; }
        public string Nombre { get; set; }
        public string Direccíon { get; set; }

    }
}