using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace VentasMariscos.Db
{
    public class ProductosDAL:CadenaDb
    {
        public DataTable Buscar(int? IdBoleto, string Nombre)
        {
            DataTable tbl = new DataTable();
            using(SqlConnection cn = new SqlConnection(CadenaConexion))
            {
                try
                {
                    cn.Open();
                    using (SqlCommand cmd = new SqlCommand("SPConsultaProductos", cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("PIdProducto", IdBoleto == 0? null : IdBoleto);
                        cmd.Parameters.AddWithValue("PNombre", Nombre == ""? null : Nombre);
                        SqlDataReader datos = cmd.ExecuteReader();
                        tbl.Load(datos);
                    }

                    cn.Close();
                }
                catch (Exception)
                {
                    throw;
                }

                return tbl;
            }
        } 
    }
}