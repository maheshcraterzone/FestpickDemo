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
    public partial class ExploreFestival : System.Web.UI.Page
    {
        FestivalHandler exploreFestivalHandler = new FestivalHandler();
        #region Constants
        private const string BANNER_DATA1 = "<div class=\"inner\"><div class=\"item_inner\"><a href=\"FestivalDetails.aspx?Id=";
        private const string BANNER_DATA2 = "\"><img class=\"img_res\" runat=\"server\" src=\"";
        private const string BANNER_DATA3 = "\" alt=\"img\" ></a></div></div>";
        private const string FEST_URL = "../Content/images/preview2.png";
        private const string DIV = "div";
        private const string CSS_CLASS = "class";
        private const string CSS_CLASS_NAME = "item";
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetDataForMap();
                LoadRegion();
                LoadMonth();
            }
            CreateBannerDiv();
        }

        private void CreateBannerDiv()
        {
            HtmlGenericControl newdiv = null;
            string festUrl = string.Empty;

            List<FestivalBannerModel> list = exploreFestivalHandler.GetFestivalBanner();
            foreach (var obj in list)
            {
                string id = string.Empty;
                if (string.IsNullOrEmpty(obj.FestivalArtUrl))
                {
                    festUrl = FEST_URL;
                }
                else
                {
                    festUrl = obj.FestivalArtUrl;
                    id = obj.Id.ToString();
                }

                newdiv = new HtmlGenericControl(DIV);
                newdiv.Attributes.Add(CSS_CLASS, CSS_CLASS_NAME);
                newdiv.InnerHtml = BANNER_DATA1 + id + BANNER_DATA2 + festUrl + BANNER_DATA3;
                divbanner.Controls.Add(newdiv);
            }
        }

        private void GetDataForMap()
        {
            List<Models.FestivalMapModel> festivallist = exploreFestivalHandler.GetLatLongForMap();
            rptMarkers.DataSource = festivallist;
            rptMarkers.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            MapSearchModel mapSearchModel = new MapSearchModel();
            if (!string.IsNullOrEmpty(txtboxCity.Text))
                mapSearchModel.City = txtboxCity.Text;
            if (!string.IsNullOrEmpty(txtboxCountry.Text))
                mapSearchModel.Country = txtboxCountry.Text;
            if (!string.IsNullOrEmpty(txtboxName.Text))
                mapSearchModel.FestivalName = txtboxName.Text;
            if (ddlRegion.SelectedValue != "-1")
                mapSearchModel.Region = ddlRegion.SelectedValue;
            if (ddlMonth.SelectedValue != "-1")
            {
                if (ddlMonth.SelectedValue.Equals("TM"))
                    mapSearchModel.Month = DateTime.UtcNow.ToString("MMMM");
                else if (ddlMonth.SelectedValue.Equals("NM"))
                    mapSearchModel.Month = DateTime.UtcNow.AddMonths(1).ToString("MMMM");
                else
                    mapSearchModel.Month = ddlMonth.SelectedValue;
            }
            List<FestivalMapModel> list = exploreFestivalHandler.SearchDataForMap(mapSearchModel);
            rptMarkers.DataSource = null;
            rptMarkers.DataSource = list;
            rptMarkers.DataBind();
        }

        private void LoadRegion()
        {
            DataSet DSRegion = new DataSet();
            DSRegion.ReadXml(Server.MapPath("~/Content/Region.xml"));
            DataView dv = DSRegion.Tables[0].DefaultView;
            // Set the DataTextField and DataValueField
            dv.Sort = "value";
            ddlRegion.DataTextField = "key";
            ddlRegion.DataValueField = "value";
            ddlRegion.DataSource = dv;
            ddlRegion.DataBind();
        }

        private void LoadMonth()
        {
            DataSet DSFestMonth = new DataSet();
            DSFestMonth.ReadXml(Server.MapPath("~/Content/FestMonth.xml"));
            DataView dv = DSFestMonth.Tables[0].DefaultView;
            // Set the DataTextField and DataValueField
            ddlMonth.DataTextField = "key";
            ddlMonth.DataValueField = "value";
            ddlMonth.DataSource = dv;
            ddlMonth.DataBind();
        }

    }
}