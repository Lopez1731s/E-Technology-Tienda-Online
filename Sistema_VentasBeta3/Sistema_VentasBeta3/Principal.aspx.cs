using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_VentasBeta3
{
    public partial class Principal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count==1)
            {
                //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Swal.fire", "Swal.mixin(const Toast = Swal.mixin({ toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true, onOpen: (toast) => {toast.addEventListener('mouseenter', Swal.stopTimer) toast.addEventListener('mouseleave', Swal.resumeTimer)}})Toast.fire({icon: 'success', title: 'Signed in successfully'}))", true);
            }
        }

        
    }
}

/*
const Toast = Swal.mixin({ toast: true, position: 'top-end', showConfirmButton: false, timer: 3000, timerProgressBar: true, onOpen: (toast) => {toast.addEventListener('mouseenter', Swal.stopTimer) toast.addEventListener('mouseleave', Swal.resumeTimer)}})Toast.fire({icon: 'success', title: 'Signed in successfully'})    */
