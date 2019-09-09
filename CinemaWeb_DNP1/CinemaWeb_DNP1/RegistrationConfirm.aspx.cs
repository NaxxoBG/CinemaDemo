using System;
using System.Web.UI;

namespace CinemaWeb_DNP1
{
    public partial class RegistrationConfirm : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.AddHeader("REFRESH", "5;URL=Default.aspx");
        }
    }
}