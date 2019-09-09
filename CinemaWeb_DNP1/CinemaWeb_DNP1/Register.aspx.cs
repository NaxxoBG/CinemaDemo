using System;
using System.Web.UI;

namespace CinemaWeb_DNP1
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (Input_validation())
            {
                if (!Database.Register(user.Text, pass.Text, email.Text, fname.Text, lname.Text))
                {
                    errMSG.InnerHtml = "Username or Email already in use!";
                }
                else
                {
                    Response.Redirect("RegistrationConfirm.aspx");
                }
            }
        }

        private bool Input_validation()
        {
            if (!(email.Text.Contains("@") && email.Text.Contains(".") && email.Text.Length > 8))
            {
                errMSG.InnerHtml = "Invalid email format!";
                return false;
            }

            if (fname.Text.Equals("") || fname.Text.Equals("First Name") || fname.Text.Length > 25)
            {
                errMSG.InnerHtml = "Invalid first name (Max 25 characters)!";
                return false;
            }

            if (lname.Text.Equals("") || lname.Text.Equals("Last Name") || lname.Text.Length > 25)
            {
                errMSG.InnerHtml = "Invalid last name (Max 25 characters)!";
                return false;
            }

            if (user.Text.Equals("User Name") || user.Text.Length < 3 || user.Text.Length > 15)
            {
                errMSG.InnerHtml = "Invalid username (Min 3 and Max 15 characters)!";
                return false;
            }

            if (pass.Text.Length < 4 || pass.Text.Length > 20 || pass.Text.Contains(" "))
            {
                errMSG.InnerHtml = "Invalid password (Min 4 Max 20 characters, No spaces)!";
                return false;
            }

            if (!pass.Text.Equals(pass2.Text))
            {
                errMSG.InnerHtml = "Passwords do not match!";
                return false;
            }

            return true;
        }
    }
}