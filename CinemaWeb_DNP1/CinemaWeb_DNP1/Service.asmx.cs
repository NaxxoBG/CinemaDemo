using System.Collections.Generic;
using System.Web.Services;

namespace CinemaWeb_DNP1
{
    /// <summary>
    /// The service provides several methods that extract movie data from TMDB
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Service : WebService
    {

        [WebMethod(Description = "Returns a list from the movies that are currently popular on tmdb.org.")]
        public List<movie> GetPopularMovies()
        {
            return TMDbUtils.GetPopularMovies();
        }

        [WebMethod(Description = "Returns a movie object which the name passed to the method.")]
        public movie SearchMovieByName(string movieName)
        {
            return TMDbUtils.SearchMovieByName(movieName);
        }
    }
}