using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace Sistema_VentasBeta3.E_Tecnology
{
    public partial class Payment : System.Web.UI.Page
    {
        public string ConexString = (ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            idproducto.Visible = false;
            if (Request.Params["id"] != null)
            {
                idproducto.Text = Request.Params["id"];
                cargar_producto();
                New_Stock();
            }
            if (Session.Count==0)
            {
                cargar_inform.Visible = false;
            }
            else if (Session.Count == 1)
            {
                cargar_inform.Visible = true;
            }
        }

        protected void cargar_producto()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_Payment", conex);
            cmd.Parameters.Add("@idProducto", SqlDbType.VarChar).Value = idproducto.Text;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);
            conex.Close();

            nombre_producto.Text = tb.Rows[0][1].ToString();
            categoria.Text = tb.Rows[0][2].ToString();
            precio.Text = tb.Rows[0][3].ToString();
            total.Text = tb.Rows[0][3].ToString();
        }

        protected void canjear_Click(object sender, EventArgs e)
        {
            if (codigo_text.Text == "Promocion")
            {
                double descuento = 0.25;
                double precio_producto = Convert.ToDouble(precio.Text);
                double descuento_ = (precio_producto * descuento);
                double result = precio_producto - descuento_;

                porcentaje.Text = "25%";

                total.Text = result.ToString();
                denegado.Visible = false;
            }
            else
            {
                denegado.Visible = true;
                denegado.Text = "Codigo no es aplicable";
            }
        }

        protected void cargar_inform_Click(object sender, EventArgs e)
        {
            cargar_info();
        }

        protected void cargar_info()
        {
            try
            {
                SqlConnection conex = new SqlConnection(ConexString);
                conex.Open();
                SqlCommand cmd = new SqlCommand("SP_CargarUserPayment", conex);
                cmd.Parameters.Add("@user", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                DataTable tb = new DataTable();
                tb.Load(rd);
                conex.Close();

                name.Text = tb.Rows[0][0].ToString();
                lastname.Text = tb.Rows[0][1].ToString();
                mail.Text = tb.Rows[0][2].ToString();
                user.Text = tb.Rows[0][3].ToString();
                address.Text = tb.Rows[0][4].ToString();
                country.Text = tb.Rows[0][5].ToString();
                state.Text = tb.Rows[0][6].ToString();
                zip.Text = tb.Rows[0][7].ToString();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void confrimar_compra_Click(object sender, EventArgs e)
        {
            if (Session.Count==0)
            {
                Response.Redirect("~/E-Tecnology/Session_validation.aspx");
            }
            else if (Session.Count == 1)
            {
                Actualizar_Stock();
                Venta_Online();//Funciona
                TerminarCompra();//arreglar esto, SP_BuscarIDsVentaOnline
                Response.Redirect("~/Profile.aspx");
            }
        }

        protected void TerminarCompra()
        {

            SqlConnection conex = new SqlConnection(ConexString);

            conex.Open();
            SqlCommand cmd3 = new SqlCommand("SP_ValidarIdClienteUser", conex);
            cmd3.Parameters.Add("@Clienteusuario", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd3.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd3 = cmd3.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb3 = new DataTable();
            tb3.Load(rd3);
            conex.Close();

            int idClienteUsuario = Convert.ToInt32(tb3.Rows[0][0]);

            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_BuscarIDsVentaOnline", conex);//esto solucionar
            cmd.Parameters.Add("@idClienteUsuario", SqlDbType.VarChar).Value = idClienteUsuario;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);
            conex.Close();

            int idventaonline = Convert.ToInt32(tb.Rows[0][0]);

            conex.Open();
            SqlCommand cmd2 = new SqlCommand("SP_InsertDetalleVentaOnline", conex);
            cmd2.Parameters.Add("@idVentaonline", SqlDbType.VarChar).Value = idventaonline;
            cmd2.Parameters.Add("@idproducto", SqlDbType.VarChar).Value = idproducto.Text;
            cmd2.Parameters.Add("@cantidad", SqlDbType.VarChar).Value = 1;
            cmd2.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd2 = cmd2.ExecuteReader(CommandBehavior.CloseConnection);
            conex.Close();
        }

        protected void Venta_Online()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_InsertarVentaOnline", conex);
            cmd.Parameters.Add("@Usuario", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            conex.Close();
        }

        protected void New_Stock()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_NuevoStockOneItem", conex);
            cmd.Parameters.Add("@idproducto", SqlDbType.VarChar).Value = idproducto.Text;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);
            conex.Close();

            new_stock.Text = tb.Rows[0][1].ToString();
        }

        protected void Actualizar_Stock()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_ActualizarStock", conex);
            cmd.Parameters.Add("@cantidad", SqlDbType.VarChar).Value = new_stock.Text;
            cmd.Parameters.Add("@idProducto", SqlDbType.VarChar).Value = idproducto.Text;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            conex.Close();
        }

    }
}


/*var viewed = Cookies.get('viewed');console.log(viewed)if (viewed == true) {$(".modal").fadeOut();} else if (viewed == undefined) {Cookies.set('viewed', true);}
var viewed = Cookies.get('viewed');

console.log(viewed)

if (viewed == "true") {
  $(".modal").fadeOut();
} else if (viewed == undefined) {
  $(".modal").fadeIn();
  Cookies.set('viewed', true);
}
 
     */
