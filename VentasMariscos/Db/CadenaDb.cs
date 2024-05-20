using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace VentasMariscos.Db
{
    public class CadenaDb
    {
        public string CadenaConexion { get; set; }

        public CadenaDb()
        {
            CadenaConexion = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        }
    }
}