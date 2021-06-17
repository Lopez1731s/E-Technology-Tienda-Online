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
using System.Drawing;

namespace Sistema_VentasBeta3
{
    public partial class Profile : System.Web.UI.Page
    {
        public string ConexString = (ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Validad_Sesion();
            Cargar_InfoUser();
            contenedor_2.Visible = false;
            mostrar_Profile_img();
            CargarHistorial();
            CargarTotalGastado();
            CargarTotalProductos();
        }


        protected void Validad_Sesion()
        {
            if (Session.Count==0)
            {
                Response.Redirect("~/Principal.aspx");
            }
        }

        protected void Cargar_InfoUser()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_ProfileSearch", conex);
            cmd.Parameters.Add("@usuario", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);
            conex.Close();

            nombre.Text = tb.Rows[0][1].ToString();
            apellidos.Text = tb.Rows[0][2].ToString();
            correo.Text = tb.Rows[0][3].ToString();
            usuario.Text = tb.Rows[0][4].ToString();
            direccion.Text = tb.Rows[0][6].ToString();
            pais.Text = tb.Rows[0][7].ToString();
            estado.Text = tb.Rows[0][8].ToString();
            zip.Text = tb.Rows[0][9].ToString();
        }

        protected void Cargar_InfoUserText()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_ProfileSearch", conex);
            cmd.Parameters.Add("@usuario", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(rd);
            conex.Close();

            name.Text = tb.Rows[0][1].ToString();
            lastname.Text = tb.Rows[0][2].ToString();
            mail.Text = tb.Rows[0][3].ToString();
            user.Text = tb.Rows[0][4].ToString();
            address.Text = tb.Rows[0][6].ToString();
            country.Text = tb.Rows[0][7].ToString();
            state.Text = tb.Rows[0][8].ToString();
            zip_.Text = tb.Rows[0][9].ToString();
        }

        protected void update_Click(object sender, EventArgs e)
        {
            Cargar_InfoUserText();
            contenedor_1.Visible = false;
            contenedor_2.Visible = true;
        }

        protected void update2_Click(object sender, EventArgs e)
        {
            if (Password.Text!=Password2.Text)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Swal.fire", "Swal.fire({ icon: 'error', title: 'Contraseña no Iguales', text: 'Intenta de Nuevo'})", true);
                contenedor_1.Visible = false;
                contenedor_2.Visible = true;
            }
            else if (Password.Text=="" && Password2.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Swal.fire", "Swal.fire({ icon: 'error', title: 'Contraseña no Iguales', text: 'Intenta de Nuevo'})", true);
                contenedor_1.Visible = false;
                contenedor_2.Visible = true;
            }
            else if(Password.Text == Password2.Text)
            {
                Actualizar_Profile();
                ClientScript.RegisterStartupScript(this.GetType(), "Swal.fire", "Swal.fire('Perfil Actualizado', '', 'success')", true);
                contenedor_1.Visible = true;
                contenedor_2.Visible = false;
                Cargar_InfoUser();

            }
        }

        protected void Actualizar_Profile()
        {
            try
            {
                SqlConnection conex = new SqlConnection(ConexString);
                conex.Open();
                SqlCommand cmd = new SqlCommand("SP_ActualizarProfile", conex);
                cmd.Parameters.Add("@nombreUsuario", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
                cmd.Parameters.Add("@nombres", SqlDbType.VarChar).Value = name.Text;
                cmd.Parameters.Add("@apellidos", SqlDbType.VarChar).Value = lastname.Text;
                cmd.Parameters.Add("@correo", SqlDbType.VarChar).Value = mail.Text;
                cmd.Parameters.Add("@contraseña", SqlDbType.VarChar).Value = Password.Text;
                cmd.Parameters.Add("@direccion", SqlDbType.VarChar).Value = address.Text;
                cmd.Parameters.Add("@pais", SqlDbType.VarChar).Value = country.Text;
                cmd.Parameters.Add("@provincia", SqlDbType.VarChar).Value = state.Text;
                cmd.Parameters.Add("@zip", SqlDbType.VarChar).Value = zip_.Text;
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                conex.Close();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void insertar_ProfileImg()
        {

            if (FileUpload1.HasFile)
            {
                int Tamanio = FileUpload1.PostedFile.ContentLength;
                byte[] imagenOriginal = new byte[Tamanio];
                FileUpload1.PostedFile.InputStream.Read(imagenOriginal, 0, Tamanio);

                Bitmap imagenOriginalBinaria = new Bitmap(FileUpload1.PostedFile.InputStream);
                string imagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(imagenOriginal);

                Image1.ImageUrl = imagenDataURL64;


                SqlConnection conex = new SqlConnection(ConexString);
                conex.Open();
                SqlCommand cmd = new SqlCommand("SP_UploadImage", conex);
                cmd.Parameters.Add("@Profile_img", SqlDbType.Image).Value = imagenOriginal;
                cmd.Parameters.Add("@usuario", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Swal.fire", "Swal.fire({ icon: 'error', title: 'Imagen no valida', text: 'Intenta de Nuevo'})", true);
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            insertar_ProfileImg();
            Response.Redirect(Request.Url.ToString());
        }
        
        protected void mostrar_Profile_img()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_Cargar_ProfielImg", conex);
            cmd.Parameters.Add("@usuario", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(reader);
            conex.Close();
            
            if (DBNull.Value.Equals(tb.Rows[0][1]))
            {
                default_img.Visible = true;
                Image1.Visible = false;
            }
            else if (tb.Rows[0][0].ToString() == "1")
            {
                byte[] img = (byte[])tb.Rows[0][1];

                if (img != null && img.Length > 0)
                {
                    default_img.Visible = false;
                    Image1.ImageUrl = "data:image;base64," + Convert.ToBase64String(img);
                }
            }
        }

        protected void CargarHistorial()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_ComprasHistorial", conex);
            cmd.Parameters.Add("@user", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(reader);
            conex.Close();


            Repeater1.DataSource = tb;
            Repeater1.DataBind();
        }

        protected void CargarTotalGastado()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_BuscarTotalGastado", conex);
            cmd.Parameters.Add("@ClienteUsuario", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(reader);
            conex.Close();

            totalgastado.Text = tb.Rows[0][0].ToString();
        }

        protected void CargarTotalProductos()
        {
            SqlConnection conex = new SqlConnection(ConexString);
            conex.Open();
            SqlCommand cmd = new SqlCommand("SP_BuscarCountComprados", conex);
            cmd.Parameters.Add("@ClienteUsuario", SqlDbType.VarChar).Value = Session["Nombre_usuario"].ToString();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable tb = new DataTable();
            tb.Load(reader);
            conex.Close();

            count.Text = tb.Rows[0][0].ToString();
        }
    }
}