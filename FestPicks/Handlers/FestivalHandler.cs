using FestPicks.DataLayer;
using FestPicks.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FestPicks.Handlers
{
    public class FestivalHandler
    {
        /// <summary>
        /// Get the all banner of festival
        /// </summary>
        /// <returns></returns>
        public List<FestivalBannerModel> GetFestivalBanner()
        {
            List<FestivalBannerModel> bannerDetails = new List<FestivalBannerModel>();
            using(var repo = new filmfestivaldbEntities())
            {
                var list = repo.festivaldetails.ToList();
                foreach(var obj in list)
                {
                    bannerDetails.Add(new FestivalBannerModel() { FestivalArtUrl = obj.FestivalArtUrl, Id = obj.Id });
                }
            }
            return bannerDetails;
        }

        /// <summary>
        /// Get the list of lat and long to show marker on map
        /// </summary>
        /// <returns></returns>
        public List<FestivalMapModel> GetLatLongForMap()
        {
            List<FestivalMapModel> festivalDetails = new List<FestivalMapModel>();
            using(var repo = new filmfestivaldbEntities())
            {
                var list = repo.festivaldetails.ToList();
                foreach(var obj in list)
                {
                    festivalDetails.Add(new FestivalMapModel() { Id = obj.Id,Lat = obj.Lat.ToString(), Long = obj.Lng.ToString(), FestivalName = obj.FestivalName, Country = obj.Country,FestUrl = obj.FestivalArtUrl });
                }
            }
            return festivalDetails;
        }

        /// <summary>
        /// Get the details of the festival by the festival id 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public FestivalDetailsModel GetDetailsById(int id)
        {
            FestivalDetailsModel details = null;
            using(var repo = new filmfestivaldbEntities())
            {
                details = new FestivalDetailsModel();
                if (details != null)
                {
                    var festival = repo.festivaldetails.Where(x => x.Id == id).FirstOrDefault();
                    details.About = System.Text.Encoding.Default.GetString(festival.About);
                    details.Address = festival.City + ", " + festival.State + " " + festival.Country;
                    details.FestivalArtUrl = festival.FestivalArtUrl;
                    details.Name = festival.FestivalName;
                    details.Website = festival.Website;
                    details.NextFestivalDate = festival.NextFestival;
                }
            }
            return details;
        }
    }
}