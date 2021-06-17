using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_VentasBeta3.Pages
{
    public partial class FAQ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Inicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Principal.aspx");
        }
    }
}