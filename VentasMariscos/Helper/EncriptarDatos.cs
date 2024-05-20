using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

namespace VentasMariscos.Helper
{
    public class EncriptarDatos
    {
        public static string EncriptarContraseña(string pass)
        {
            try
            {
                SHA256 cifrar = SHA256Managed.Create();
                ASCIIEncoding encoding = new ASCIIEncoding();
                byte[] stream = null;
                StringBuilder sb = new StringBuilder();
                stream = cifrar.ComputeHash(encoding.GetBytes(pass));
                for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
                return sb.ToString();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}