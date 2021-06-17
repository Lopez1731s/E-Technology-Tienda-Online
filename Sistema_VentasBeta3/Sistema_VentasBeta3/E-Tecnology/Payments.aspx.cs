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
    public partial class Payments : System.Web.UI.Page
    {
        public string ConexString = (ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Mostrar_Productos();
            Calcular_PrecioVenta();
            Total_Productos();
            CargarIDCliente();
        }

        protected void CargarIDCliente()
        {
            idclienteusuario.Visible = false;
            SqlConnection conex = new SqlConnection(ConexString);

            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_ValidarIdClienteUser", conex);
            cmd.Parameters.Add("@Clienteusuario", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);
            conex.Close();

            idclienteusuario.Text = tb.Rows[0][0].ToString();
        }

        protected void Mostrar_Productos()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_Buscar_cart", conex);
            cmd.Parameters.Add("@tabla", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);
            conex.Close();

            Repeater1.DataSource = tb;
            Repeater1.DataBind();

        }

        protected void Calcular_PrecioVenta()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_CalcularPrecio_Venta", conex);
            cmd.Parameters.Add("@tabla", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);
            conex.Close();

            total_venta.Text = tb.Rows[0][0].ToString();
        }

        protected void Total_Productos()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_CalcularCount_Productos", conex);
            cmd.Parameters.Add("@tabla", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);
            conex.Close();

            total_productos.Text = tb.Rows[0][0].ToString();
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

        protected void cargar_inform_Click(object sender, EventArgs e)
        {
            cargar_info();
        }

        protected void EliminarCarrito()
        {
            try
            {
                SqlConnection conex = new SqlConnection(ConexString);
                conex.Open();
                SqlCommand cmd = new SqlCommand("SP_EliminarCarrito", conex);
                cmd.Parameters.Add("@nombreTabla", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                conex.Close();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void confirmar_compra__Click(object sender, EventArgs e)
        {

            Insertar_VentaOnline();
            Terminar_Comrpra();
            NewStockCart();
            EliminarCarrito();//ultimo paso
            Response.Redirect("~/Profile.aspx");
        }

        protected void Insertar_VentaOnline()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_InsertarVentaOnline", conex);
            cmd.Parameters.Add("@Usuario", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            conex.Close();
        }

        protected void Terminar_Comrpra()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd2 = new SqlCommand("SP_BuscarIDsVentaOnline", conex);
            cmd2.Parameters.Add("@idClienteUsuario", SqlDbType.VarChar).Value = idclienteusuario.Text;
            cmd2.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd2 = cmd2.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb2 = new DataTable();
            tb2.Load(rd2);
            conex.Close();

            int idventaonline = Convert.ToInt32(tb2.Rows[0][0]);


            conex.Open();
            SqlCommand cmd3 = new SqlCommand("SP_UpdateIDenCarrito", conex);
            cmd3.Parameters.Add("@idventaonline", SqlDbType.VarChar).Value = idventaonline;
            cmd3.Parameters.Add("@tabla", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd3.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd3 = cmd3.ExecuteReader(CommandBehavior.CloseConnection);
            conex.Close();

            conex.Open();
            SqlCommand cmd4 = new SqlCommand("SP_InsertDetalleVentaOnlineCarrito", conex);
            cmd4.Parameters.Add("@tabla", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd4.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd4 = cmd4.ExecuteReader(CommandBehavior.CloseConnection);
            conex.Close();
        }

        protected void NewStockCart()
        {
            //SP_NewStockCarrito
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_NewStockCarrito", conex);
            cmd.Parameters.Add("@tabla", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            conex.Close();
        }
    }
}