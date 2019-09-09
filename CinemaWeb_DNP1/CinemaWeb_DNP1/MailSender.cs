using System;
using System.Net.Mail;
using System.Text;

namespace CinemaWeb_DNP1
{
    public class MailSender
    {
        public MailSender(String email, String subject, String message)
        {
            SmtpClient client = new SmtpClient()
            {
                Port = 587,
                Host = "smtp.gmail.com",
                EnableSsl = true,
                Timeout = 10000,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new System.Net.NetworkCredential("viacinemademo@gmail.com", "viacinemademo123")
            };

            MailMessage mm = new MailMessage("donotreply@viacinema.dk", email, subject, message)
            {
                BodyEncoding = UTF8Encoding.UTF8,
                DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure
            };

            client.Send(mm);
        }
    }
}