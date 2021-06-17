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
    public partial class PaginaMaestra : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Validar_Session();
            if (!IsPostBack)
            {
                Page.DataBind();
            }
        }

        protected void btn_registrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Register.aspx");
        }

        protected void btn_Productos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/E-Tecnology/Products.aspx");
        }

        protected void btn_Contact_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/E-Tecnology/Contact.aspx");
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void Inicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Principal.aspx");
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

        protected void profile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Profile.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect(Request.Url.ToString());
        }

        protected void Validar_Session()
        {

            logout.Visible = false;
            Nombre_usuario.Visible = false;
            profile.Visible = false;
            if (Session.Count == 0)
            {
                Nombre_usuario.Text = "";
            }
            else if (Session.Count == 1)
            {
                btn_registrar.Visible = false;
                btn_login.Visible = false;
                Nombre_usuario.Visible = true;
                logout.Visible = true;
                profile.Visible = true;
                Nombre_usuario.Text = "Usuario: " + Session["Nombre_usuario"].ToString();
            }
        }
    }
}

/*
 * const Toast = Swal.mixin({toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true, onOpen: (toast) => {toast.addEventListener('mouseenter', Swal.stopTimer) toast.addEventListener('mouseleave', Swal.resumeTimer)}})Toast.fire({icon: 'success', title: 'Signed in successfully'})
     */
