using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using VentasMariscos.Db;

namespace VentasMariscos.Entidad
{
    public class Productos
    {
        public static int Id { get; set; }
        public string Nombre { get; set; }
        public decimal precio { get; set; }
        public static DataTable TblProductos { get; set; }

        public DataTable Buscar()
        {
            try
            {
                ProductosDAL pr = new ProductosDAL();
                return pr.Buscar(Id, Nombre);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}