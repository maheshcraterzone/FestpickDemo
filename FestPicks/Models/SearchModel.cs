using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FestPicks.Models
{
    public class SearchModel
    {
        public string Genre { get; set; }
        public string FilmTitle { get; set; }
        public string Year { get; set; }
        public string Director { get; set; }
        public string Actor { get; set; }
        public string Festival { get; set; }
        public string Award { get; set; }
    }
}