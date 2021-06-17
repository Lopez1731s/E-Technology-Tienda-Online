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

namespace Sistema_VentasBeta3.E_Tecnology.Categories
{
    public partial class Storage : System.Web.UI.Page
    {
        public string ConexString = (ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            Cargar_SDD();
            Cargar_HDD();
            Cargar_Extraible();
            Cargar_M2();
        }

        protected void inicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Principal.aspx");
        }

        protected void productos_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/E-Tecnology/Products.aspx");
        }

        protected void Cargar_SDD()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_SearchSDD", conex);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);
            conex.Close();


            Repeater1.DataSource = tb;
            Repeater1.DataBind();
        }

        protected void Cargar_HDD()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_SearchHDD", conex);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);
            conex.Close();

            Repeater2.DataSource = tb;
            Repeater2.DataBind();
        }
        
        protected void Cargar_Extraible()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_SearchExtraible", conex);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);
            conex.Close();

            Repeater3.DataSource = tb;
            Repeater3.DataBind();
        }
        
        protected void Cargar_M2()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_SearchM2", conex);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);
            conex.Close();

            Repeater4.DataSource = tb;
            Repeater4.DataBind();
        }

        public void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            /*switch (e.CommandName)
            {
                case "Click":
                    producto_selected = Convert.ToString(e.CommandArgument);
                    id_producto.Text = producto_selected.ToString();
                    break;
            }*/
        }

        
        protected void ver_detalles_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string result = btn.CommandArgument;
            Response.Redirect("~/E-Tecnology/Categories/Product_details.aspx?id=" + result);

        }


        protected void agregar_carrito_Click(object sender, EventArgs e)
        {
            validar_session();

            try
            {
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

                if (tb.Rows[0][0].ToString() == "0")
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
            }
            catch (Exception ex)
            {
                error.Text = ex.ToString();
            }
            Response.Redirect("~/E-Tecnology/Cart.aspx");
        }

        protected void validar_session()
        {
            if (Session.Count == 0)
            {
                Response.Redirect("~/E-Tecnology/Session_validation.aspx");
            }
        }

        protected void CrearNuevo_Carro()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_CrearNuevoCarrito", conex);
            cmd.Parameters.Add("@nombretabla", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }

        protected void ir_carrito_Click(object sender, EventArgs e)
        {
            validar_session();
            Response.Redirect("~/E-Tecnology/Cart.aspx");
        }
    }
}