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
    public partial class Product_details : System.Web.UI.Page
    {
        public string ConexString = (ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session.Count==1)
            {
                Cargar_idUser();
            }

            idcliente.Visible = false;
            idproducto.Visible = false;
            idcliente.Visible = false;

            if (Request.Params["id"] != null)
            {
                idproducto.Text = Request.Params["id"];
                Detalle_Prodcuto();
                Cargar_Comentario();

            }
            else
            {
                Response.Redirect("~/Principal.aspx");
            }

        }

        protected void inicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/E-Tecnology/Products.aspx");
        }

        protected void productos_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/E-Tecnology/Categories/Storage.aspx");
        }

        protected void Detalle_Prodcuto()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_DetalleProducto", conex);
            cmd.Parameters.Add("@idProducto", SqlDbType.VarChar).Value = idproducto.Text;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);
            conex.Close();

            nombreProducto.Text = tb.Rows[0][1].ToString();
            descipcionProducto.Text = tb.Rows[0][2].ToString();
            precio.Text = tb.Rows[0][4].ToString();

            byte[] img = (byte[])tb.Rows[0][5];

            if (img != null && img.Length > 0)
            {
                Image1.ImageUrl = "data:image;base64," + Convert.ToBase64String(img);
            }
        }
        

        protected void comentario_Click(object sender, EventArgs e)
        {
            if (Session.Count==0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Swal.fire", "Swal.fire( 'E-Tecnology', 'Inicia sesión para dejar tu comentario', 'info')", true);
            }
            else if (Session.Count==1)
            {
                Insertar_Comentario();
            }
        }

        protected void Cargar_idUser()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_BuscaridUser", conex);
            cmd.Parameters.Add("@user", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);

            idcliente.Text = tb.Rows[0][0].ToString();
            conex.Close();
        }

        protected void Cargar_Comentario()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_BuscarComentario", conex);
            cmd.Parameters.Add("@idproducto", SqlDbType.VarChar).Value = idproducto.Text;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);

            Repeater1.DataSource = tb;
            Repeater1.DataBind();
        }

        protected void Insertar_Comentario()
        {
            try
            {
                SqlConnection conex = new SqlConnection(ConexString);
                conex.Open();
                SqlCommand cmd = new SqlCommand("SP_InsertComentario", conex);
                cmd.Parameters.Add("@idClienteUsuario", SqlDbType.VarChar).Value = idcliente.Text;
                cmd.Parameters.Add("@idProducto", SqlDbType.VarChar).Value = idproducto.Text;
                cmd.Parameters.Add("@descripcion", SqlDbType.VarChar).Value = text_coment.Text;
                cmd.Parameters.Add("@estado", SqlDbType.VarChar).Value = 1;
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                conex.Close();

                Response.Redirect(Request.Url.ToString());
                ClientScript.RegisterStartupScript(this.GetType(), "Swal.fire", "Swal.fire('Gracias por tu Comentario','El comentario se ingreso correctamente', 'success')", true);
            }
            catch (Exception ex)
            {

                error.Text= ex.ToString();
            }
        }

        protected void comprar_ahora_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/E-Tecnology/Payment.aspx?id=" + idproducto.Text);
        }
    }
}

/*
 Swal.fire( 'The Internet?', 'That thing is still around?', 'question')
 
     
    						<img class="d-flex mr-3 rounded-circle" src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem, "Profile_img")); %>" alt="" style="position: relative; width: 50px !important; height: 50px !important;"> 
     
     */
