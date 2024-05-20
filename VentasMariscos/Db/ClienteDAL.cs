using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace VentasMariscos.Db
{
    public class ClienteDAL:CadenaDb
    {
        public DataTable ValidaCliente(string Nit, string Nombre, string Direccion)
        {
            DataTable tbl = new DataTable();
            using(SqlConnection cn = new SqlConnection(CadenaConexion))
            {
                try
                {
                    cn.Open();
                    using (SqlCommand cmd = new SqlCommand("SPValidaCliente", cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("PNit", Nit);
                        cmd.Parameters.AddWithValue("PNombre", Nombre);
                        cmd.Parameters.AddWithValue("PDireccion", Direccion);
                        SqlDataReader rd = cmd.ExecuteReader();
                        tbl.Load(rd);
                    }

                    cn.Close();
                }
                catch(Exception)
                {
                    throw;
                }
            }

            return tbl;
        }
    }
}