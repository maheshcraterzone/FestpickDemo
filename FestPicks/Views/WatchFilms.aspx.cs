using FestPicks.Handlers;
using FestPicks.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace FestPicks.Views
{
    public partial class WatchFilms : System.Web.UI.Page
    {
        #region Constants
        private const string ENABLE = "Enable";
        private const string DISABLE = "Disable";
        private const string ENABLE_METHOD = "javascript:Enable();";
        private const string DISABLE_METHOD = "javascript:Disable();";
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
        #endregion
        MovieHandler movieHandler = new MovieHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnLoadMore.Enabled = false;
                LoadFestival();
                LoadGenre();
            }
        }

        private void LoadGenre()
        {
            DataSet DSGenre = new DataSet();
            DSGenre.ReadXml(Server.MapPath("~/Content/Genre.xml"));
            DataView dv = DSGenre.Tables[0].DefaultView;
            // Set the DataTextField and DataValueField
            dv.Sort = "value";
            ddlGenre.DataTextField = "key";
            ddlGenre.DataValueField = "value";
            ddlGenre.DataSource = dv;
            ddlGenre.DataBind();
        }

        private void LoadFestival()
        {
            DataSet DSFestival = new DataSet();
            DSFestival.ReadXml(Server.MapPath("~/Content/Festival.xml"));
            DataView dv = DSFestival.Tables[0].DefaultView;
            // Set the DataTextField and DataValueField
            ddlFilmFestival.DataTextField = "key";
            ddlFilmFestival.DataValueField = "value";
            ddlFilmFestival.DataSource = dv;
            ddlFilmFestival.DataBind();
        }

        private void LoadAwardByFestivalName(string festivalName)
        {
            DataSet DSAward = new DataSet();
            if(festivalName.Equals("-1"))
            {
                ddlAward.Items.Clear();
                ddlAward.Items.Add(new ListItem() { Text = "Select Award", Value = "-1" });
                return;
            }
            else if (festivalName.Equals("Toronto International Film Festival"))
            DSAward.ReadXml(Server.MapPath("~/Content/TIFF.xml"));
            else if(festivalName.Equals("Santa Barbara International Film Festival"))
            DSAward.ReadXml(Server.MapPath("~/Content/SBIFF.xml"));
            else if (festivalName.Equals("Vienna International Film Festival"))
                DSAward.ReadXml(Server.MapPath("~/Content/VIFF.xml"));
            else if (festivalName.Equals("Telluride Film Festival"))
                DSAward.ReadXml(Server.MapPath("~/Content/TFF2.xml"));
            else if (festivalName.Equals("Tribeca Film Festival"))
                DSAward.ReadXml(Server.MapPath("~/Content/TFF.xml"));
            else if (festivalName.Equals("Cannes Film Festival"))
                DSAward.ReadXml(Server.MapPath("~/Content/CFF.xml"));
            else if (festivalName.Equals("Sydney Film Festival"))
                DSAward.ReadXml(Server.MapPath("~/Content/SFF.xml"));
            else if (festivalName.Equals("Cairo International Film Festival"))
                DSAward.ReadXml(Server.MapPath("~/Content/CIFF.xml"));
            else if (festivalName.Equals("Dubai International Film Festival"))
                DSAward.ReadXml(Server.MapPath("~/Content/DIFF.xml"));
            else if (festivalName.Equals("Vancouver International Film Festival"))
                DSAward.ReadXml(Server.MapPath("~/Content/VIFF2.xml"));

            if (DSAward.Tables.Count > 0)
            {
                DataView dv = DSAward.Tables[0].DefaultView;

                dv.Sort = "value";
                // Set the DataTextField and DataValueField
                ddlAward.DataTextField = "key";
                ddlAward.DataValueField = "value";
                ddlAward.DataSource = dv;
                ddlAward.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Session["Index"] = 0;
            Session["Search"] = null;
            Session["List"] = null;
            SearchModel searchModel = new SearchModel();
            if (ddlGenre.SelectedValue != "-1")
                searchModel.Genre = ddlGenre.SelectedValue;
            if (!string.IsNullOrEmpty(txtboxTitle.Text))
                searchModel.FilmTitle = txtboxTitle.Text;
            if (!string.IsNullOrEmpty(txtboxYear.Text))
                searchModel.Year = txtboxYear.Text;
            if (!string.IsNullOrEmpty(txtboxDirectorName.Text))
                searchModel.Director = txtboxDirectorName.Text;
            if (!string.IsNullOrEmpty(txtboxActorName.Text))
                searchModel.Actor = txtboxActorName.Text;
            if (ddlFilmFestival.SelectedValue != "-1")
                searchModel.Festival = ddlFilmFestival.SelectedValue;
            if (ddlAward.SelectedValue != "-1")
                searchModel.Award = ddlAward.SelectedValue;
            Session["Search"] = searchModel;
            if (IsSearchActive(searchModel))
            {
                List<MovieDetailsModel> list = movieHandler.GetMoviesBySearchCriteria(searchModel, 0);
                if (list.Count > 0)
                {
                    Session["Index"] = 1;
                    Session["List"] = list;
                    btnLoadMore.Enabled = true;
                }
                CreateTiles(list);
            }
        }

        protected void ddlFilmFestival_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList list = (DropDownList)sender;
            string value = (string)list.SelectedValue;
            LoadAwardByFestivalName(value);
        }

        private void CreateTiles(List<MovieDetailsModel> movielist)
        {
            HtmlGenericControl div = null;
            foreach (var obj in movielist)
            {
                div = new HtmlGenericControl("div");
                div.Attributes.Add("class", "item big");
                //div.InnerHtml = BANNER_DATA1 + obj.Id + BANNER_DATA2 + posterimage + BANNER_DATA3 + BANNER_DATA4 + obj.ReleasingDate + BANNER_DATA5 + obj.Name + BANNER_DATA6 + obj.Director + BANNER_DATA7 + obj.Award + BANNER_DATA8 + obj.Festival + BANNER_DATA9 + obj.Actors + BANNER_DATA10 + obj.RunningTime + BANNER_DATA11;
                div.InnerHtml = BANNER_DATA1 + obj.Id + BANNER_DATA2 + obj.PosterUrl + BANNER_DATA3 + BANNER_DATA4 + obj.Name + BANNER_DATA5 + obj.ReleasingDate + BANNER_DATA6 + obj.Director + BANNER_DATA7 + obj.Award + BANNER_DATA8 + obj.Festival + BANNER_DATA9 + obj.Actors + BANNER_DATA10 + obj.RunningTime + BANNER_DATA11;
                //div.InnerHtml = BANNER_DATA1 + obj.Id + BANNER_DATA2 + obj.PosterUrl + BANNER_DATA3 + BANNER_DATA11;
                dynamicdiv.Controls.Add(div);
            }

        }

        private bool IsSearchActive(SearchModel searchModel)
        {
            bool IsActive = true;
            if((string.IsNullOrEmpty(searchModel.Actor) && string.IsNullOrEmpty(searchModel.Award) && string.IsNullOrEmpty(searchModel.Director) && string.IsNullOrEmpty(searchModel.Festival) && string.IsNullOrEmpty(searchModel.FilmTitle) && string.IsNullOrEmpty(searchModel.Genre) && string.IsNullOrEmpty(searchModel.Year)))
            {
                IsActive = false;
            }
            return IsActive;
        }

        protected void btnLoadMore_Click(object sender, EventArgs e)
        {
            int index = 0;
            if (Session["Index"] != null)
            {
                index = (int)Session["Index"];
                if (index > 0)
                {
                    SearchModel search = (SearchModel)Session["Search"];
                    List<MovieDetailsModel> newlist = movieHandler.GetMoviesBySearchCriteria(search, index);
                    if (newlist != null)
                    {
                        List<MovieDetailsModel> oldlist = Session["List"] as List<MovieDetailsModel>;
                        oldlist.AddRange(newlist);
                        Session["List"] = oldlist;
                        Session["Index"] = ++index;
                        CreateTiles(oldlist);
                    }
                }
            }
        }

    }
}