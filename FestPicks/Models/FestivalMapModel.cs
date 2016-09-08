using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FestPicks.Models
{
    public class FestivalMapModel
    {
        public int Id { get; set; }
        public string Lat { get; set; }
        public string Long { get; set; }
        public string FestivalName { get; set; }
        public string Country { get; set; }
        public string FestUrl { get; set; }
    }
}