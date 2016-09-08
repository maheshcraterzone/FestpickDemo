using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FestPicks.Models
{
    public class MovieWithFestivalDetails : MovieDetailsModel
    {
        public string FestivalBannerUrl { get; set; }
        public string AmazonLinkRent { get; set; }
    }
}