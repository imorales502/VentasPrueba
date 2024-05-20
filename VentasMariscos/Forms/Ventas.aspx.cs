using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VentasMariscos.Helper;
using VentasMariscos.Entidad;
using System.Data;

namespace VentasMariscos.Forms
{
    public partial class Ventas : System.Web.UI.Page
    {

        private static DataTable TblProductos;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                MultiView.SetActiveView(ViewIngreso);
            }
        }

        protected void CmdBuscar_Click(object sender, EventArgs e)
        {
            Buscar();
        }

        public void Buscar()
        {
            try
            {
                Productos prd = new Productos();
                Productos.Id = TxtIdProducto.Text.Equals("") ? 0 : Convert.ToInt32(TxtIdProducto.Text);
                prd.Nombre = TxtNombreProducto.Text.Trim();
                TblProductos = prd.Buscar();
                GrdProductos.DataSource = TblProductos;
                GrdProductos.DataBind();
                LblRegistros.Text = "Registros encontrados: " + GrdProductos.Rows.Count.ToString();
            }
            catch (Exception ex)
            {
                MensajesPersonalizados.Mensaje(this, ex.Message);
            }
        }
    }
}