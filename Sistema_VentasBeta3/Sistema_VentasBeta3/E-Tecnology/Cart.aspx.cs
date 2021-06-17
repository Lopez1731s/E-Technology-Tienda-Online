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
    public partial class Cart : System.Web.UI.Page
    {
        public string ConexString = (ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            validar_Session();
            Mostrar_Productos();
        }

        protected void Mostrar_Productos()
        {
            cantidad_.Visible = false;
            cantidad_selected.Visible = false;
            cantidad_stock.Visible = false;
            idproducto_.Visible = false;
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_Buscar_cart", conex);
            cmd.Parameters.Add("@tabla", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);
            conex.Close();

            if (tb.Rows[0][0].ToString()=="0")
            {
                container_cart.Visible = false;
                noitemscart.Visible = true;
            }
            else if (tb.Rows[0][0].ToString() == "1")
            {
                container_cart.Visible = true;
                noitemscart.Visible = false;
                Repeater1.DataSource = tb;
                Repeater1.DataBind();
            }


        }

        protected void eliminar_item_Click(object sender, EventArgs e)
        {
            LinkButton agregar_carrito = (LinkButton)(sender);
            string idproducto = agregar_carrito.CommandArgument;

            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_EliminarItemCarrito", conex);
            cmd.Parameters.Add("@idProducto", SqlDbType.VarChar).Value = idproducto;
            cmd.Parameters.Add("@tabla", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            conex.Close();

            Response.Redirect(Request.Url.ToString());
        }

        protected void validar_Session()
        {
            idproducto_.Visible = false;
            cantidad_.Visible = false;
            if (Session.Count==0)
            {
                Response.Redirect("~/Principal.aspx");
            }
        }


        protected void actualizar_Click(object sender, EventArgs e)
        {
            LinkButton actualizar = (LinkButton)(sender);
            string result = actualizar.CommandArgument;
            idproducto_.Text = result;

            CalcularCantidad_Precio();


            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_ValidarCantidadStock", conex);
            cmd.Parameters.Add("@tabla", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.Parameters.Add("@idProducto", SqlDbType.VarChar).Value = idproducto_.Text;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);
            conex.Close();

            int cantidad1 = Convert.ToInt32(tb.Rows[0][0]);
            int cantidad2 = Convert.ToInt32(tb.Rows[0][1]);

            if (cantidad1 > cantidad2)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Swal.fire", "Swal.fire({ icon: 'error', title: 'Cantidad no disponible', text: 'Por el momento no contamos con esa cantidad de producto'})", true);
            }

            /*foreach (RepeaterItem rptItem in Repeater1.Items)
            {
                TextBox cantidadfind = (TextBox)rptItem.FindControl("cantidad");
                test.Text = cantidadfind.Text;
            }
            //TextBox cantidadfind = (TextBox)Repeater1.Items[0].FindControl("cantidad");
            //test.Text = cantidadfind.Text;

            //Label lb = (Label)e.Item.FindControl("IdLabel");TextBox txtName= (TextBox)item.FindControl("txtName");*/
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            foreach (RepeaterItem rptItem in Repeater1.Items)
            {
                TextBox cantidadfind = (TextBox)e.Item.FindControl("cantidad");
                cantidad_.Text = cantidadfind.Text;
            }
        }


        protected void CalcularCantidad_Precio()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_CalcularCantidad_Precio", conex);
            cmd.Parameters.Add("@tabla", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.Parameters.Add("@idProducto", SqlDbType.VarChar).Value = idproducto_.Text;
            cmd.Parameters.Add("@cantidad", SqlDbType.VarChar).Value = cantidad_.Text;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            conex.Close();
        }

        protected void Refresh()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_Buscar_cart", conex);
            cmd.Parameters.Add("@tabla", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            conex.Close();
        }

        protected void terminar_compra_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/E-tecnology/Payments.aspx");
        }

    }
}