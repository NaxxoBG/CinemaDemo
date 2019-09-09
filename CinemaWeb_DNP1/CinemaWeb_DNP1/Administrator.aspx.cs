using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using TMDbLib.Objects.General;
using TMDbLib.Objects.Movies;
using TMDbLib.Objects.Search;

namespace CinemaWeb_DNP1
{
    public partial class Administrator : Page
    {
        static List<SearchMovie> res = new List<SearchMovie>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null) Response.Redirect("error.aspx");
            if ((bool)Session["admin"] == false) Response.Redirect("error.aspx");
            GridView1.DataBind();
            this.Form.DefaultButton = this.searchBtn.UniqueID;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            addResult.Text = "";
            GridView1.SelectedIndex = -1;
        }

        private void PrintResultsInTable(Table table)
        {
            DateTime startTime = DateTime.Now;
            int counter = 1;
            if (searchBox.Text.Equals(""))
            {
                resLabel.Text = "No Results!";
                return;
            }
            SearchContainer<SearchMovie> res = TMDbUtils.client.SearchMovieAsync(searchBox.Text).Result;
            foreach (SearchMovie r in res.Results)
            {
                TextBox TextBox2 = new TextBox()
                {
                    TextMode = TextBoxMode.MultiLine
                };

                string image = "No available url";
                try
                {
                    Movie m = TMDbUtils.client.GetMovieAsync(r.Id).Result;
                    if (m != null)
                    {
                        image = $"https://image.tmdb.org/t/p/w185{m.PosterPath}";
                        TextBox2.Text += "ID: " + m.Id + "<br>" + "Title: " + m.Title + "<br>" + "Overview: " + m.Overview + "<br>" +
                        "Release Date: " + m.ReleaseDate + "<br>" + "Duration: " + m.Runtime + "<br>" + "Poster path: " + m.PosterPath + "<br>";
                    }

                    TableCell textCell = new TableCell()
                    {
                        Text = TextBox2.Text
                    };
                    TableCell imageCell = new TableCell();
                    imageCell.Controls.Add(new Image()
                    {
                        ImageUrl = image,
                        ID = counter.ToString(),
                        AlternateText = "Not available"
                    });

                    TableRow tr = new TableRow();
                    tr.Cells.Add(textCell);
                    tr.Cells.Add(imageCell);

                    table.Rows.Add(tr);
                }
                catch (Exception)
                {
                    resLabel.Text = "No results";
                }
                counter++;
            }
            TimeSpan elapsedTime = DateTime.Now - startTime;
            resLabel.Text = "Results: " + res.Results.Count() + "<br>" + "Time: " + elapsedTime.TotalSeconds + "s.";
        }

        private void PopulateGridView(GridView view)
        {
            DateTime startTime = DateTime.Now;
            if (searchBox.Text.Equals(""))
            {
                resLabel.Text = "No Results!";
                return;
            }
            List<SearchMovie> res = TMDbUtils.client.SearchMovieAsync(searchBox.Text).Result.Results;
            view.DataSource = res;
            view.DataBind();
            TimeSpan elapsedTime = DateTime.Now - startTime;
            resLabel.Text = "Results: " + res.Count() + "<br>" + "Time: " + elapsedTime.TotalSeconds + "s.";
        }

        public DataTable GetData()
        {
            DateTime startTime = DateTime.Now;
            int counter = 1;
            if (searchBox.Text.Equals(""))
            {
                resLabel.Text = "No Results!";
                return null;
            }
            res = TMDbUtils.client.SearchMovieAsync(searchBox.Text).Result.Results;

            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("Information", typeof(string)));
            dt.Columns.Add(new DataColumn("Poster", typeof(string)));

            foreach (SearchMovie r in res)
            {
                string movieInfo = "";
                string image = "No available url";
                try
                {
                    Movie m = TMDbUtils.client.GetMovieAsync(r.Id).Result;
                    if (m != null)
                    {
                        image = $"https://image.tmdb.org/t/p/w185{m.PosterPath}";
                        movieInfo = String.Concat("ID: ", m.Id, "\r\n", "Title: ", m.Title, "\r\n", "Overview: ", m.Overview, "\r\n",
                        "Release Date: ", m.ReleaseDate, "\r\n", "Duration: ", m.Runtime, "\r\n", "Poster path: ", m.PosterPath, "\r\n");
                    }

                    DataRow dr = dt.NewRow();
                    dr["Information"] = movieInfo;
                    dr["Poster"] = ResolveUrl(image);
                    dt.Rows.Add(dr);
                }
                catch (Exception)
                {
                    resLabel.Text = "No results";
                }
                counter++;
            }

            TimeSpan elapsedTime = DateTime.Now - startTime;
            resLabel.Text = "Results: " + res.Count() + "<br>" + "Time: " + elapsedTime.TotalSeconds + "s.";
            return dt;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                if (Database.InsertMovie(TMDbUtils.GetMovieById(res.ElementAt(index).Id)))
                {
                    addResult.Text = "Add successful";
                }
                else
                {
                    addResult.Text = "Add failed! The movie has already been added.";
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Text = e.Row.Cells[1].Text.Replace(Environment.NewLine, "<br/>");
        }
    }
}