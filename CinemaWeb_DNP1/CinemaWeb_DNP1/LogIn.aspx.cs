using System;
using System.Web.UI;

namespace CinemaWeb_DNP1
{
    public partial class LogIn2 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["previousPage"] != null)
            {
                ViewState["previousPage"] = Session["previousPage"];
                Session["previousPage"] = null;
            }

            string savedUsername = (string)(Session["userTemp"]);
            if (savedUsername != null)
            {
                username.Text = savedUsername;
            }
            Session["userTemp"] = null;
        }

        protected void LogIn(object sender, EventArgs e)
        {
            user data = Database.LogIn(username.Text, password.Text);
            if (data != null)
            {
                Session["username"] = data.user1;
                Session["email"] = data.email;
                Session["fname"] = data.first_name;
                Session["lname"] = data.last_name;
                Session["id"] = data.user_id;
                Session["admin"] = data.admin;
                if (ViewState["previousPage"] != null)
                {
                    Response.Redirect((String)ViewState["previousPage"]);
                    return;
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                errMSG.InnerHtml = "Wrong username/password";
            }
        }
    }
}