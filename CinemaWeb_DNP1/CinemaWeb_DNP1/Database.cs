using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;

namespace CinemaWeb_DNP1
{
    public class Database
    {
        #region
        public static readonly string connectionString =
            "Server=tcp:cinemaweb.database.windows.net,1433;" +
            "Initial Catalog=cinemaDB;" +
            "Persist Security Info=False;" +
            "User ID=cinemauser;" +
            "Password=danoPnak420;" +
            "MultipleActiveResultSets=False" +
            ";Encrypt=True;" +
            "TrustServerCertificate=False;" +
            "Connection Timeout=30;";
        #endregion
        public static DataQueryDataContext db = new DataQueryDataContext(connectionString);

        public static Boolean CheckGuid(int id, Guid guid)
        {
            try
            {
                DateTime time = db.presets.Where(e => e.userid == id && e.code.Equals(guid)).FirstOrDefault().timestamp;
                if (time == null) return false;
                return (DateTime.Now.AddMinutes(-10).CompareTo(time) <= 0);
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static Boolean CheckPassword(int id, String password)
        {
            String passRaw = db.users.Where(e => e.user_id == id).FirstOrDefault().pass;
            String pass = passRaw.Replace(" ", "");
            return pass.Equals(password);
        }

        public static int GetIdFromEmail(String emailAdd)
        {
            try
            {
                return db.users.Single(e => e.email.Equals(emailAdd)).user_id;
            }
            catch (Exception)
            {
                return -1;
            }
        }

        public static void ChangePassword(int userId, string newPassword)
        {
            db.users.FirstOrDefault(e => e.user_id == userId).pass = newPassword;
            db.SubmitChanges();
        }

        public static Boolean Register(String user, String pass, String email, String fname, String lname)
        {
            if (!db.users.Any(e => e.user1.Equals(user) || e.email.Equals(email)))
            {
                db.users.InsertOnSubmit(new user()
                {
                    user1 = user,
                    pass = pass,
                    email = email,
                    first_name = fname,
                    last_name = lname
                });
                db.SubmitChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        public static int GetSeatId(char row, int number)
        {
            return db.seats.Where(e => e.row.Equals(row) && e.number == number).First().seat_id;
        }

        public static user LogIn(string user, string pass)
        {
            return db.users.SingleOrDefault(e => e.user1.Equals(user) && e.pass.Equals(pass));
        }

        public static bool InsertMovie(movie movie)
        {
            try
            {
                db.movies.InsertOnSubmit(movie);
                db.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public static void InsertScreening(int movieId, DateTime start)
        {
            db.screenings.InsertOnSubmit(new screening()
            {
                movie_id = movieId,
                start = start
            });
            db.SubmitChanges();
        }

        public static void InsertTicket(int screeningId, int seatId, int userId)
        {
            db.tickets.InsertOnSubmit(new ticket()
            {
                screen_id = screeningId,
                seat_id = seatId,
                user_id = userId
            });
            db.SubmitChanges();
        }

        public static movie GetMovie(int id)
        {
            return db.movies.Single(e => e.movie_id == id);
        }

        public static List<movie> GetMovies()
        {
            return db.movies.ToList();
        }

        public static List<movie> GetSortedMovies()
        {
            return db.movies.AsEnumerable().OrderBy(m => m.title).ToList();
        }

        public static List<movie> GetMoviesWithFutureScreenings()
        {
            return db.screenings.Where(e => e.start.CompareTo(DateTime.Now) >= 0).Select(r => GetMovie(r.movie_id)).ToList();
        }

        public static List<seat> GetTakenSeatsForScreening(int screeningId)
        {
            return db.tickets
                .Where(t => t.screen_id == screeningId)
                .SelectMany(s => db.seats.Where(r => r.seat_id == s.seat_id))
                .ToList();
        }

        public static void RemoveScreening(int id)
        {
            var screening = db.screenings.Where(s => s.screening_id == id).ToList();
            db.screenings.DeleteAllOnSubmit(screening);
            db.SubmitChanges();
        }

        public static SqlDataAdapter GetAdapter()
        {
            SqlConnection conn = new SqlConnection()
            {
                ConnectionString = connectionString
            };
            conn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT poster, title, genre, duration, overview FROM movie", conn);
            return adapter;
        }

        public static screening GetScreening(int id)
        {
            return db.screenings.SingleOrDefault(scr => scr.screening_id == id);
        }

        public static List<screening> GetFutureScreeningsFromMovieId(int id)
        {
            return db.screenings.Where(scr => scr.movie_id == id && scr.start.CompareTo(DateTime.Now) >= 0).ToList();
        }

        public static List<TicketInfo> GetSeatAndMovieInfo(int Id)
        {
            return db.tickets.Join(db.seats, t => t.seat_id, s => s.seat_id, (t, s) => new { t, s })
               .Join(db.screenings, tse => tse.t.screen_id, scr => scr.screening_id, (tse, scr) => new { tse, scr })
               .Join(db.movies, tsescr => tsescr.scr.movie_id, mov => mov.movie_id, (tsescr, mov) => new { tsescr, mov })
               .Select(r => new TicketInfo
               {
                   UserID = r.tsescr.tse.t.user_id,
                   Row = r.tsescr.tse.s.row,
                   SeatNumber = r.tsescr.tse.s.number,
                   ScreeningStart = r.tsescr.scr.start,
                   MovieTitle = r.mov.title
               }).Where(endr => endr.UserID == Id).ToList();
        }
    }
}