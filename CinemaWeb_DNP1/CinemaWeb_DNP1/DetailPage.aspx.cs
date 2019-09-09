using System;
using System.Web.UI;

namespace CinemaWeb_DNP1
{
    public partial class DetailPage : Page
    {
        protected movie movie;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int movieId = int.Parse(Request.QueryString["movieId"]);
                movie = Database.GetMovie(movieId);

                string[] separatingChars = { ", " };
                RepeaterGallery.DataSource = movie.images.Split(separatingChars, System.StringSplitOptions.RemoveEmptyEntries);
                RepeaterGallery.DataBind();

                String[] video= movie.videos.Split(',');
                iFrame.Src = "https://www.youtube.com/embed/" + video[0];
            }
        }
    }
}