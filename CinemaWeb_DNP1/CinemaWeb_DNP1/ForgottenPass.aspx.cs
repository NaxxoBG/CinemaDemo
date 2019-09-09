using System;
using System.Web;

namespace CinemaWeb_DNP1
{
    public partial class ForgottenPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Send(object sender, EventArgs e)
        {
            int id = Database.GetIdFromEmail(email.Text);
            if (id != -1)
            {
                Guid randomString = System.Guid.NewGuid();
                Database.db.presets.InsertOnSubmit(new preset()
                {
                    userid = id,
                    code = randomString,
                    timestamp = DateTime.Now
                });
                Database.db.SubmitChanges();
                new MailSender(email.Text, "Password Recovery", MessageGenerator(id + "", randomString.ToString()));
                errMSG.InnerHtml = "If your email is registered in our system you will receive an email.";
            }
            else
            {
                errMSG.InnerHtml = "Email does not exist";
            }
        }

        private String MessageGenerator(String user, String code)
        {
            return "Dear, " + user + "\n" +
                "\n" +
                "You have requested password recovery. " +
                "\nIf that was not you, feel free to ignore this email. No one has access to your account.\n" +
                "If it was you and you want to continue with password reset, please click on this link:" +
                "\nhttps://" + HttpContext.Current.Request.Url.Host + "/reset.aspx?user=" + user + "&code=" + code +
                "\n" +
                "\nBest regards, VIA Cinema Developer Team!";
        }
    }
}