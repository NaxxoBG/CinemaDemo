using System;
using System.Web.UI;

namespace CinemaWeb_DNP1
{
    public partial class profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("error.aspx");
            }
        }

        protected void ChangePassword(object sender, EventArgs e)
        {
            if (!(password.Text.Length >= 3 && password.Text.Length < 21) || password.Text.Contains(" "))
            {
                errMSG.InnerHtml = "Invalid password (Min 3 Max 20 characters, No spaces)!";
                return;
            }

            if (!password.Text.Equals(passwordRe.Text))
            {
                errMSG.InnerHtml = "Passwords are not same!";
                return;
            }

            if (!Database.CheckPassword((int)Session["id"], currentPass.Text))
            {
                errMSG.InnerHtml = "Current password is invalid!";
                return;
            }

            Database.ChangePassword((int)Session["id"], password.Text);
            errMSG.InnerHtml = "New password is set!";
        }
    }
}