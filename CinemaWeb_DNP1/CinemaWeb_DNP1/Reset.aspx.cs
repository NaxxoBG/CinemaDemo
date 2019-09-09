using System;
using System.Web.UI;

namespace CinemaWeb_DNP1
{
    public partial class Reset : Page
    {
        String id;
        String code;

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["user"];
            code = Request.QueryString["code"];
            if (id == null || code == null)
            {
                Response.Redirect("error.aspx");
            }

            Guid guid = new Guid(code);

            if (!Database.CheckGuid(int.Parse(id), guid))
            {
                PointBreak.InnerHtml = "<img src='/images/accessDenied.png' class='img-responsive center-block' />";
            }
        }

        protected void ChangePass(object sender, EventArgs e)
        {
            if (!Password.Text.Equals(Password2.Text))
            {
                errMSG.InnerHtml = "Passwords are not same!";
                return;
            }

            if (Password.Text.Length < 3 || Password.Text.Length > 20 || Password.Text.Equals("Password") || Password.Text.Contains(" "))
            {
                errMSG.InnerHtml = "Invalid password (Min 3 Max 20 cahracters, No spaces)!";
                return;
            }

            Database.ChangePassword(int.Parse(id), Password.Text);
            Response.Redirect("Default.aspx");
        }
    }
}