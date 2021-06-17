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

namespace Sistema_VentasBeta3.Pages
{
    public partial class Producto : System.Web.UI.Page
    {
        public string ConexString = (ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            contenedor_productos_repeter1.Visible = true;
            Validar_producto.Visible = false;
        }

        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Principal.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/E-Tecnology/SP/Details_Product.aspx");
        }

        protected void btn_almacenamiento_Click(object sender, EventArgs e)
        {
            Response.Redirect("Categories/Storage.aspx");
        }

        protected void btn_componentes_Click(object sender, EventArgs e)
        {
            Response.Redirect("Categories/Components.aspx");
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            contenedor_productos_repeter1.Visible = false;
            try
            {
                SqlConnection conex = new SqlConnection(ConexString);
                conex.Open();
                SqlCommand cmd = new SqlCommand("SP_BuscarProductKeyWord", conex);
                cmd.Parameters.Add("@nombreProducto", SqlDbType.VarChar).Value = busqueda_rapida.Text;
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                DataTable tb = new DataTable();
                tb.Load(rd);
                conex.Close();
                if (tb.Rows[0][0].ToString()=="0")
                {
                    Validar_producto.Visible = true;
                    Repeater1.Visible = false;
                }
                else
                {
                    Repeater1.DataSource = tb;
                    Repeater1.DataBind();
                    Repeater1.Visible = true;
                    Validar_producto.Visible = false;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void more_details_Click(object sender, EventArgs e)
        {
            LinkButton more_details = (LinkButton)(sender);
            string result = more_details.CommandArgument;
            Response.Redirect("~/E-Tecnology/Categories/Product_details.aspx?id=" + result);
        }

        protected void agregar_carrito_Click(object sender, EventArgs e)
        {
            validar_session();


            LinkButton agregar_carrito = (LinkButton)(sender);
            string idproducto = agregar_carrito.CommandArgument;
            
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_validar_cart", conex);
            cmd.Parameters.Add("@tabla", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);
            conex.Close();

            if (tb.Rows[0][0].ToString()=="0")
            {
                CrearNuevo_Carro();
                conex.Open();
                SqlCommand cmd2 = new SqlCommand("SP_InsertarCarrito", conex);
                cmd2.Parameters.Add("@idProducto", SqlDbType.VarChar).Value = idproducto;
                cmd2.Parameters.Add("@tabla", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
                cmd2.CommandType = CommandType.StoredProcedure;
                SqlDataReader rd2 = cmd2.ExecuteReader(CommandBehavior.CloseConnection);
                conex.Close();
            }
            else if (tb.Rows[0][0].ToString() == "a")
            {
                conex.Open();
                SqlCommand cmd3 = new SqlCommand("SP_InsertarCarrito", conex);
                cmd3.Parameters.Add("@idProducto", SqlDbType.VarChar).Value = idproducto;
                cmd3.Parameters.Add("@tabla", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
                cmd3.CommandType = CommandType.StoredProcedure;
                SqlDataReader rd3 = cmd3.ExecuteReader(CommandBehavior.CloseConnection);
                conex.Close();
            }

            Response.Redirect("~/E-Tecnology/Cart.aspx");


        }

        protected void validar_session()
        {
            if (Session.Count==0)
            {
                Response.Redirect("~/E-Tecnology/Session_validation.aspx");
            }
        }

        protected void CrearNuevo_Carro()
        {
            try
            {
                SqlConnection conex = new SqlConnection(ConexString);
                conex.Open();
                SqlCommand cmd = new SqlCommand("SP_CrearNuevoCarrito", conex);
                cmd.Parameters.Add("@nombretabla", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            }
            catch (Exception ex)
            {

                error.Text = ex.ToString();
            }
        }

        protected void ir_carrito_Click(object sender, EventArgs e)
        {
            validar_session();
            Response.Redirect("~/E-Tecnology/Cart.aspx");
        }

        protected void btn_enframiento_Click(object sender, EventArgs e)
        {
            Response.Redirect("Categories/cooling.aspx");
        }

        protected void btn_monitores_Click(object sender, EventArgs e)
        {
            Response.Redirect("Categories/Monitors.aspx");
        }

        protected void btn_perifericos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Categories/Peripherals.aspx");
        }

        protected void btn_redes_Click(object sender, EventArgs e)
        {
            Response.Redirect("Categories/Network.aspx");
        }
    }
}