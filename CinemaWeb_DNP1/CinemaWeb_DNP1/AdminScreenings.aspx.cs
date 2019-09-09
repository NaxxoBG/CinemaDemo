using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CinemaWeb_DNP1
{
    public partial class Screenings : Page
    {
        public movie selectedMovie;
        public List<screening> screenings;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("error.aspx");
            }

            if ((bool)Session["admin"] == false)
            {
                Response.Redirect("error.aspx");
            }

            if (!IsPostBack)
            {
                List<movie> movies = Database.GetSortedMovies();
                if (movies == null) Response.Redirect("error.aspx");
                selectedMovie = Database.GetMovie(movies[0].movie_id);
                screenings = Database.GetFutureScreeningsFromMovieId(selectedMovie.movie_id);
                screeningRepeater.DataSource = screenings;
                screeningRepeater.DataBind();
                ViewState["movieid"] = selectedMovie.movie_id;
                foreach (movie movie in movies)
                {
                    ListItem newItem = new ListItem(movie.title, movie.movie_id + "");
                    selector.Items.Add(newItem);
                }
            }
        }

        protected void onChange(object sender, EventArgs e)
        {
            String idRaw = ((DropDownList)sender).SelectedValue;
            int id = int.Parse(idRaw);
            screenings = Database.GetFutureScreeningsFromMovieId(id);
            selectedMovie = Database.GetMovie(id);
            screeningRepeater.DataSource = screenings;
            screeningRepeater.DataBind();
            ViewState["movieid"] = selectedMovie.movie_id;
        }

        protected void RemoveScreening(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            Database.RemoveScreening(id);
            selectedMovie = Database.GetMovie((int)ViewState["movieid"]);
            screenings = Database.GetFutureScreeningsFromMovieId((int)ViewState["movieid"]);
            screeningRepeater.DataSource = screenings;
            screeningRepeater.DataBind();

        }

        protected void AddScreening(object sender, EventArgs e)
        {
            try
            {
                String[] dates = date.Text.Split('/');
                String[] times = time.Text.Split(':');
                if (int.Parse(times[0]) < 0 || int.Parse(times[0]) > 24)
                {
                    throw new Exception();
                }

                if (int.Parse(times[1]) < 0 || int.Parse(times[1]) > 59)
                {
                    throw new Exception();
                }

                DateTime datetime = new DateTime(int.Parse(dates[2]), int.Parse(dates[0]), int.Parse(dates[1]), int.Parse(times[0]), int.Parse(times[1]), 0);
                Database.InsertScreening((int)ViewState["movieid"], datetime);
            }
            catch (Exception) { }
            selectedMovie = Database.GetMovie((int)ViewState["movieid"]);
            screenings = Database.GetFutureScreeningsFromMovieId((int)ViewState["movieid"]);
            screeningRepeater.DataSource = screenings;
            screeningRepeater.DataBind();
        }
    }
}