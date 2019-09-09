using System;

namespace CinemaWeb_DNP1
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogOut(object sender, EventArgs e)
        {
            Session["username"] = null;
            Session["email"] = null;
            Session["fname"] = null;
            Session["lname"] = null;
            Session["id"] = null;
            Session["admin"] = null;
            Response.Redirect("Default.aspx");
        }
    }
}