using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CinemaWeb_DNP1
{
    public partial class SeatPicker : Page
    {
        int screening_id;
        List<seat> seats;
        char[] rows;
        List<String> selected = new List<String>();
        List<String> taken;
        List<PlaceHolder> holders;
        protected screening screening;
        protected movie movie;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            LoadPlaceholders();
            if (ViewState["selected"] == null)
            {
                ViewState["selected"] = selected;
            }
            else
            {
                selected = ((List<String>)ViewState["selected"]);
            }

            rows = "ABCDEFGHI".ToCharArray();
            screening_id = int.Parse(Request.QueryString["screening"]);
            screening = Database.GetScreening(screening_id);
            seats = Database.GetTakenSeatsForScreening(screening_id);
            taken = CreateTakenList();
            movie = screening.movie;
            SeatBuilder();
        }

        private void LoadPlaceholders()
        {
            holders = new List<PlaceHolder>();
            holders.Add(this.A);
            holders.Add(this.B);
            holders.Add(this.C);
            holders.Add(this.D);
            holders.Add(this.E);
            holders.Add(this.F);
            holders.Add(this.G);
            holders.Add(this.H);
            holders.Add(this.I);
        }

        private List<String> CreateTakenList()
        {
            if (seats == null)
            {
                return null;
            }

            taken = new List<String>();
            foreach (seat s in seats)
            {
                taken.Add(s.row + "" + s.number);
            }

            return taken;
        }

        protected void buttonClicked(object sender, ImageClickEventArgs e)
        {
            ImageButton box = (ImageButton)sender;
            System.Diagnostics.Debug.WriteLine("clicked " + box.ID);
            if (box.Attributes["selected"] == null)
            {
                box.ImageUrl = "/images/seat/seat_selected.png";
                box.Attributes["selected"] = "1";
                selected.Add(box.ID);
                ViewState["selected"] = selected;
            }
            else
            {
                box.ImageUrl = "/images/seat/seat_available.png";
                box.Attributes["selected"] = null;
                selected.Remove(box.ID);
                ViewState["selected"] = selected;
            }
            UpdatePrice();
        }

        private void UpdatePrice()
        {
            int total = selected.Count * 70;
            price.InnerHtml = total + "";
        }


        private void SeatBuilder()
        {
            PlaceHolder holder;
            for (int i = 0; i < rows.Length; i++)
            {
                holder = holders[i];
                for (int j = 1; j <= 10; j++)
                {
                    String id = rows[i] + "" + j; ;
                    ImageButton button = new ImageButton();
                    button.CssClass = "seat col-xs-1";
                    button.ID = id;
                    button.Click += new ImageClickEventHandler(buttonClicked);
                    if (taken != null && taken.Contains(id))
                    {
                        button.ImageUrl = "/images/seat/seat_taken.png";
                        button.Enabled = false;
                    }
                    else
                    {
                        button.ImageUrl = "/images/seat/seat_available.png";
                    }

                    holder.Controls.Add(button);
                }
            }
        }

        protected void Pay(object sender, EventArgs e)
        {
            Session["screening_id"] = screening_id;
            Session["seats"] = GetSeatsIds();
            Response.Redirect("PaymentPage.aspx");
        }

        private List<int> GetSeatsIds()
        {
            List<int> seatIds = new List<int>();
            for (int i = 0; i < selected.Count; i++)
            {
                char row = selected.ElementAt(i)[0];
                int number = int.Parse(selected.ElementAt(i).Remove(0, 1));
                int id = Database.GetSeatId(row, number);
                seatIds.Add(id);
            }
            return seatIds;
        }
    }
}