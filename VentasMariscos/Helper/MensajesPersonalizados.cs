using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;
using System.Web.UI;
using VentasMariscos.Db;

namespace VentasMariscos.Helper
{
    public class MensajesPersonalizados
    {
        public static void MensajeGrabar(Page pagina)
        {
            try
            {
                ScriptManager.RegisterStartupScript(pagina, pagina.GetType(), "Pop", "RegistroGrabadoToasTR();", true);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void Mensaje(Page pagina, string Mensaje)
        {
            try
            {
                ScriptManager.RegisterStartupScript(pagina, pagina.GetType(), "Pop", "Mensaje('" + Mensaje + "');", true);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static bool ValidarTextBox(ref TextBox control)
        {
            try
            {
                if (control.Text.Equals(""))
                {
                    control.Focus();
                    return false;
                }
            }
            catch (Exception)
            {
                throw;
            }
            return true;
        }

        public static bool ValidarCombo(ref DropDownList control)
        {
            try
            {
                if (control.SelectedValue.Equals("0"))
                {
                    return false;
                }
            }
            catch (Exception)
            {
                throw;
            }
            return true;
        }

       
    }
}