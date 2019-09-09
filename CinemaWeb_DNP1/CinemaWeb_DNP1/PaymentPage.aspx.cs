using CinemaWeb_DNP1.CardValidator;
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace CinemaWeb_DNP1
{
    public partial class PaymentPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("error.aspx");
            }
        }

        protected void Pay(object sender, EventArgs e)
        {
            if (Valid())
            {
                CreditCardValidator cardValidator = new CreditCardValidator();
                if (cardValidator.ValidMod10(CardNumber.Text))
                {
                    ErrorMsg.Text = "";
                    int userId = (int)Session["id"];
                    int screeningId = (int)Session["screening_id"];
                    List<int> seats = (List<int>)Session["seats"];
                
                    foreach(int seat in seats)
                    {
                       Database.InsertTicket(screeningId, seat, userId);
                    }
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    ErrorMsg.Text = "Invalid input";
                }
            }
            else
            {
                ErrorMsg.Text = "Invalid input";
            }
        }

        private bool Valid()
        {
            return Regex.IsMatch(CardNumber.Text, @"^-?\d+$");
        }
    }
}