using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FestPicks.Models
{
    public class MovieDetailsModel : MovieModel
    {
        public string About { get; set; }
        public string Location { get; set; }
        public string YoutubeEmbeddedLink { get; set; }
        public string MovieLink { get; set; }
    }
}