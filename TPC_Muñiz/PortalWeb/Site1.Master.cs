using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PortalWeb
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void logout_ServerClick(object sender, EventArgs e)
        {
            try
            {
                var cookie = Request.Cookies["session"];
                cookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(cookie);
                Response.Redirect("Login.aspx", false);
            }
            catch (Exception ex)
            {
                Response.Write("Fallo login");
            }

        }
    }
}