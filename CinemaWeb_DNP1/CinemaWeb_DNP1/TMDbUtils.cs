using System.Collections.Generic;
using System.Linq;
using System.Threading;
using TMDbLib.Client;
using TMDbLib.Objects.General;
using TMDbLib.Objects.Movies;
using TMDbLib.Objects.Search;

namespace CinemaWeb_DNP1
{
    public class TMDbUtils
    {
        public static TMDbClient client = new TMDbClient("22ece408a46d5b66caf8a5b7d6ba68f2");

        public static movie SearchMovieByName(string title)
        {
            return title.Equals("") ? null :
            ConvertMovieObject(client.GetMovieAsync(client.SearchMovieAsync(title).Result.Results.FirstOrDefault().Id).Result);
        }

        public static List<movie> GetPopularMovies()
        {
            SearchContainer<SearchMovie> popular = client.GetMoviePopularListAsync().Result;
            List<movie> popularMovies = null;
            Thread popularMovHandler = new Thread(() =>
            {
                popularMovies = popular.Results.Select(async m => await client.GetMovieAsync(m.Id)).Select(m => m.Result).Select(ConvertMovieObject).ToList();
            });
            popularMovHandler.IsBackground = true;
            popularMovHandler.Start();
            popularMovHandler.Join();
            return popularMovies;
        }

        public static movie GetMovieById(int movieId)
        {
            return ConvertMovieObject(client.GetMovieAsync(movieId).Result);
        }

        private static movie ConvertMovieObject(Movie mov)
        {
            return new movie()
            {
                movie_id = mov.Id,
                title = mov.Title,
                genre = string.Join(", ", mov.Genres.Select(e => e.Name).ToArray()),
                overview = mov.Overview,
                release_date = mov.ReleaseDate.Value,
                duration = mov.Runtime.Value,
                poster = mov.PosterPath,
                backdrop = mov.BackdropPath,
                images = string.Join(", ", client.GetMovieImagesAsync(mov.Id).Result.Backdrops.Select(i => i.FilePath).ToArray()),
                videos = string.Join(", ", client.GetMovieVideosAsync(mov.Id).Result.Results.Select(r => r.Key).ToArray()),
                vote_average = mov.VoteAverage,
                budget = mov.Budget,
                cast = string.Join(", ", client.GetMovieAsync(mov.Id.ToString(), MovieMethods.Credits).Result.Credits.Cast.Select(c => c.Name + " - " + c.Character).Take(5).ToArray())
            };
        }
    }
}