using FestPicks.Handlers;
using FestPicks.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FestPicks.Views
{
    public partial class FilmDetails : System.Web.UI.Page
    {
        MovieHandler movieHandler = new MovieHandler();
        #region Constants
        private const string ID = "Id";
        private const string HOME = "../Views/Home";
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString[ID];
            if (string.IsNullOrEmpty(id))
                Response.Redirect(HOME);
            if (!IsPostBack)
            {
                int movieid = Int32.Parse(id);
                LoadDetails(movieid);
            }
        }

        private void LoadDetails(int id)
        {
            MovieDetailsModel movieDetails =  movieHandler.GetMovieDetailsById(id);
            if (movieDetails != null)
            {
                ltrlAbout.Text = movieDetails.About;
                ltrlActors.Text = movieDetails.Actors;
                ltrlAward.Text = movieDetails.Award;
                ltrlDate.Text = movieDetails.ReleasingDate;
                ltrlDirector.Text = movieDetails.Director;
                ltrlFestival.Text = movieDetails.Festival;
                ltrlLocation.Text = movieDetails.Location;
                ltrlRuntime.Text = movieDetails.RunningTime;
                ltrlTitle.Text = movieDetails.Name;
                movieposter.Src = movieDetails.PosterUrl;
                youtube.Text = movieDetails.YoutubeEmbeddedLink;
                if (!string.IsNullOrEmpty(movieDetails.MovieLink))
                {
                    ancrwatchfilm.HRef = "../Views/WatchMovie";
                }
                else
                    ancrwatchfilm.HRef = "#";                
            }
        }
    }
}