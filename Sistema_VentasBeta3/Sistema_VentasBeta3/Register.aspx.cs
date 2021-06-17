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


namespace Sistema_VentasBeta3.Pages
{
    public partial class Register : System.Web.UI.Page
    {
        public string ConexString = (ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //error.Visible = false;
            //Image1.Visible = false;
            if (Session.Count==1)
            {
                Response.Redirect("~/Principal.aspx");
            }

        }

        protected void Registrarse_btn_Click(object sender, EventArgs e)
        {
            if (Password.Text!=Password2.Text)
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "Swal.fire", "Swal.fire({ icon: 'error', title: 'Contraseñas no Iguales', text: 'Intenta de Nuevo'", true);
                ClientScript.RegisterStartupScript(this.GetType(), "Swal.fire", "Swal.fire({ icon: 'error', title: 'Contraseña no Iguales', text: 'Intenta de Nuevo'})", true);
            }

            else if (Password.Text == Password2.Text)
            {
                try
                {
                    SqlConnection conex = new SqlConnection(ConexString);
                    conex.Open();
                    SqlCommand cmd = new SqlCommand("sp_ValidarRegister", conex);
                    cmd.Parameters.Add("@user", SqlDbType.VarChar).Value = user.Text;
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    DataTable tb = new DataTable();
                    tb.Load(rd);

                    if (tb.Rows[0][0].ToString()== "0")
                    {
                        Insertar_NuevoUser();
                    }

                    else if(tb.Rows[0][0].ToString() == "1")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "Swal.fire", "Swal.fire({ icon: 'error', title: 'User already taken', text: 'Intenta de Nuevo'})", true);
                    }
                    conex.Close();
                }
                catch (Exception ex)
                {

                    error.Text = ex.ToString();
                }
            }
        }

        protected void Insertar_NuevoUser()
        {
            try
            {
                SqlConnection conex = new SqlConnection(ConexString);


                int img_le = Image1.ImageUrl.Length;
                byte[] imagenOriginal = new byte[img_le];


                conex.Open();
                SqlCommand cmd2 = new SqlCommand("SP_InsertarUSer", conex);
                cmd2.Parameters.Add("@Nombres", SqlDbType.VarChar).Value = name.Text;
                cmd2.Parameters.Add("@Apellidos", SqlDbType.VarChar).Value = lastname.Text;
                cmd2.Parameters.Add("@Correo", SqlDbType.VarChar).Value = mail.Text;
                cmd2.Parameters.Add("@Nombre_Usuario", SqlDbType.VarChar).Value = user.Text;
                cmd2.Parameters.Add("@Contraseña", SqlDbType.VarChar).Value = Password.Text;
                cmd2.Parameters.Add("@Direccion", SqlDbType.VarChar).Value = adress.Text;
                cmd2.Parameters.Add("@Pais", SqlDbType.VarChar).Value = pais.Text;
                cmd2.Parameters.Add("@Provincia", SqlDbType.VarChar).Value = estado.Text;
                cmd2.Parameters.Add("@Zip", SqlDbType.VarChar).Value = zip.Text;
                cmd2.Parameters.Add("@profile_img", SqlDbType.Image).Value = imagenOriginal;
                cmd2.Parameters.Add("@estado", SqlDbType.VarChar).Value = 1;
                cmd2.CommandType = CommandType.StoredProcedure;
                SqlDataReader rd2 = cmd2.ExecuteReader(CommandBehavior.CloseConnection);
                ClientScript.RegisterStartupScript(this.GetType(), "Swal.fire", "Swal.fire('Registro con Exito', '', 'success')", true);
                conex.Close();
            }
            catch (Exception ex)
            {

                error.Text = ex.ToString();
            }
        }
    }
}

/*
            try
            {
                SqlConnection conex = new SqlConnection(ConexString);
                conex.Open();
                SqlCommand cmd = new SqlCommand("SP_InsertarUSer2", conex);
                cmd.Parameters.Add("@Nombres", SqlDbType.VarChar).Value = name.Text;
                cmd.Parameters.Add("@Apellidos", SqlDbType.VarChar).Value = lastname.Text;
                cmd.Parameters.Add("@Correo", SqlDbType.VarChar).Value = mail.Text;
                cmd.Parameters.Add("@Nombre_Usuario", SqlDbType.VarChar).Value = user.Text;
                cmd.Parameters.Add("@Contraseña", SqlDbType.VarChar).Value = Password.Text;
                cmd.Parameters.Add("@Direccion", SqlDbType.VarChar).Value = adress.Text;
                cmd.Parameters.Add("@Pais", SqlDbType.VarChar).Value = pais.Text;
                cmd.Parameters.Add("@Provincia", SqlDbType.VarChar).Value = estado.Text;
                cmd.Parameters.Add("@Zip", SqlDbType.VarChar).Value = zip.Text;
                cmd.Parameters.Add("@estado", SqlDbType.VarChar).Value = 1;
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                conex.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "Swal.fire", "Swal.fire('Registro con Exito', '', 'success')", true);
            }
            catch (Exception ex)
            {

                error.Text= ex.ToString();
            }
     */
