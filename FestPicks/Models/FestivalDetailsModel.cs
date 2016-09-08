using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FestPicks.Models
{
    public class FestivalDetailsModel
    {
        public string FestivalArtUrl { get; set; }
        public string Name { get; set; }
        public string About { get; set; }
        public string Address { get; set; }
        public string Website { get; set; }
        public string NextFestivalDate { get; set; }
    }
}