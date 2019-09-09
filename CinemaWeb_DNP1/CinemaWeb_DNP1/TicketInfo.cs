using System;
using System.ComponentModel.DataAnnotations;

namespace CinemaWeb_DNP1
{
    public class TicketInfo
    {
        [Key]
        public int UserID { get; set; }
        public char Row { get; set; }
        public int SeatNumber { get; set; }
        public DateTime ScreeningStart { get; set; }
        public String MovieTitle { get; set; }

        public override string ToString()
        {
            return $"UserID: {UserID}, Row: {Row}, Seat Number: {SeatNumber}, ScreeningStart: {ScreeningStart.ToString()}, Movie Title: {MovieTitle};";
        }
    }
}