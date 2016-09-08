using FestPicks.Handlers;
using FestPicks.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace FestPicks.Views
{
    public partial class FestivalDetails : System.Web.UI.Page
    {
        #region Constants
        private const string BANNER_DATA1 = "<div class=\"inner\"><div class=\"item_inner\"><a href=\"FilmDetails?Id=";
        private const string BANNER_DATA2 = "\"><img runat=\"server\" src=\"";
        private const string BANNER_DATA3 = "\" alt=\"img\" >";
        private const string BANNER_DATA4 = "<div class=\"detail\"><h3>";
        private const string BANNER_DATA5 = "</h3><br><p><strong>Released:  </strong>";
        private const string BANNER_DATA6 = "<br><strong>Director:  </strong>";
        private const string BANNER_DATA7 = "<br><strong>Award:  </strong>";
        private const string BANNER_DATA8 = "<br><strong>Festival:  </strong>";
        private const string BANNER_DATA9 = "<br><strong>Actors:  </strong>";
        private const string BANNER_DATA10 = "</p><div class=\"time\"><i class=\"fa fa-clock-o\"></i> RunTime:  ";
        private const string BANNER_DATA11 = "</div></div></a></div></div>";
        private const string FID = "Id";
        private const string EXPLORE_FESTIVAL = "../Views/ExploreFestival";
        private const string DIV = "div";
        private const string CSS_CLASS = "class";
        private const string CSS_CLASS_NAME = "item big";
        #endregion

        FestivalHandler exploreFestivalHandler = new FestivalHandler();
        MovieHandler movieHandler = new MovieHandler();

        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString[FID];
            if (string.IsNullOrEmpty(id))
                Response.Redirect(EXPLORE_FESTIVAL);
            if (!IsPostBack)
            {
                string festName = LoadFetivalDetails(Int32.Parse(id));
                Session["FestIndex"] = 0;
                Session["MovieList"] = null;
                Session["FestName"] = null;
                LoadMovies(festName);
            }
        }

        private string LoadFetivalDetails(int id)
        {
            string FestivalName = string.Empty;
            FestivalDetailsModel festival = exploreFestivalHandler.GetDetailsById(id);
            if (festival != null)
            {
                lblTitle.Text = festival.Name;
                lblWebsite.Text = festival.Website;
                ltrlAbout.Text = festival.About;
                ltrlLocation.Text = festival.Address;
                festimage.Src = festival.FestivalArtUrl;
                lblNextFestival.Text = festival.NextFestivalDate;
                FestivalName = festival.Name;
            }
            return FestivalName;
        }

        private void CreateTiles(List<MovieModel> movieList)
        {
            HtmlGenericControl div = null;
            foreach (var obj in movieList)
            {
                div = new HtmlGenericControl(DIV);
                div.Attributes.Add(CSS_CLASS, CSS_CLASS_NAME);
                div.InnerHtml = BANNER_DATA1 + obj.Id + BANNER_DATA2 + obj.PosterUrl + BANNER_DATA3 + BANNER_DATA4 + obj.Name + BANNER_DATA5 + obj.ReleasingDate + BANNER_DATA6 + obj.Director + BANNER_DATA7 + obj.Award + BANNER_DATA8 + obj.Festival + BANNER_DATA9 + obj.Actors + BANNER_DATA10 + obj.RunningTime + BANNER_DATA11;
                //div.InnerHtml = BANNER_DATA1 + obj.Id + BANNER_DATA2 + obj.PosterUrl + BANNER_DATA3 + BANNER_DATA11;
                divtiles.Controls.Add(div);
            }

        }

        private void LoadMovies(string festivalName)
        {
            MovieHandler movieHandler = new MovieHandler();
            List<MovieModel> movieList = movieHandler.GetAllMoviesByFestivalName(festivalName, 0);
            if (movieList.Count > 0)
            {
                Session["FestIndex"] = 1;
                Session["MovieList"] = movieList;
                Session["FestName"] = festivalName;
                btnLoadMore.Enabled = true;
                CreateTiles(movieList);
            }
        }

        protected void btnLoadMore_Click(object sender, EventArgs e)
        {
            int index = 0;
            if (Session["FestIndex"] != null)
            {
                index = (int)Session["FestIndex"];
                if (index > 0)
                {
                    string festname = Session["FestName"] as string;
                    List<MovieModel> newlist = movieHandler.GetAllMoviesByFestivalName(festname, index);
                    if (newlist != null)
                    {
                        List<MovieModel> oldlist = Session["MovieList"] as List<MovieModel>;
                        oldlist.AddRange(newlist);
                        Session["MovieList"] = oldlist;
                        Session["FestIndex"] = ++index;
                        CreateTiles(oldlist);
                    }
                }
            }
        }
    }
}