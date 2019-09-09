using AjaxControlToolkit;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CinemaWeb_DNP1
{
    public partial class MainPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CalendarExtender.StartDate = DateTime.Now;
            if (!Page.IsPostBack)
            {
                Date1.Text = DateTime.Now.ToString("MM/dd/yyyy");
            }
        }
        protected void ReserveSeat(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            if (Session["username"] == null)
            {
                Session["previousPage"] = "SeatPicker.aspx?screening=" + b.CommandArgument;
            }

            Response.Redirect("SeatPicker.aspx?screening=" + b.CommandArgument);
        }

        protected void SeeDetails(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            Response.Redirect("DetailPage.aspx?movieId=" + b.CommandArgument);
        }
    }
}