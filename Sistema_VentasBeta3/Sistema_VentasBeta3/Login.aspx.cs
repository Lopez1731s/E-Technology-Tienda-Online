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

namespace Sistema_VentasBeta3
{
    public partial class Default : System.Web.UI.Page
    {
        public string ConexString = (ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count == 1)
            {
                Response.Redirect("Principal.aspx");
            }

        }

        protected void login_Click(object sender, EventArgs e)
        {
            if (user_text.Text == "" || password_text.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Swal.fire", "Swal.fire({ icon: 'error', title: 'Usuario Invalido', text: 'Intenta de Nuevo', footer: '<a href>¿Olvidaste tu Contraseña?</a>'})", true);
            }
            else
            {
                try
                {
                    SqlConnection conex = new SqlConnection(ConexString);
                    conex.Open();
                    SqlCommand cmd = new SqlCommand("SP_Login", conex);
                    cmd.Parameters.Add("@Nombre_Usuario", SqlDbType.VarChar).Value = user_text.Text;
                    cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = password_text.Text;
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader rd = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    DataTable tb = new DataTable();
                    tb.Load(rd);
                    conex.Close();

                    if (tb.Rows[0][0].ToString() == "1")
                    {
                        Session["Nombre_Usuario"] = tb.Rows[0][1].ToString();
                        string result = Session["Nombre_Usuario"].ToString();
                        //ClientScript.RegisterStartupScript(this.GetType(), "Swal.fire", "Swal.fire('Bienvenido', '" + result.ToString() + "', 'success')", true);
                        Response.Redirect("Principal.aspx");
                    }
                    else if (tb.Rows[0][0].ToString() == "0")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "Swal.fire", "Swal.fire({ icon: 'error', title: 'Usuario Invalido', text: 'Intenta de Nuevo', footer: '<a href=>¿Olvidaste tu Contraseña?</a>'})", true);
                    }
                }
                catch (Exception ex)
                {

                    test.Text = ex.ToString();
                }
            }
        }

        protected void btn_registrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Register.aspx");
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void btn_Productos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/E-Tecnology/Products.aspx");
        }

        protected void btn_Servicios_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/E-Tecnology/Services.aspx");
        }

        protected void btn_Ofertas_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/E-Tecnology/Deals.aspx");
        }

        protected void btn_faq_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/E-Tecnology/FAQ.aspx");
        }

        protected void btn_Contact_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/E-Tecnology/Contact.aspx");
        }
    }
}