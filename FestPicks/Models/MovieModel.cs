using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FestPicks.Models
{
    public class MovieModel
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string ReleasingDate { get; set; }
        public string Award { get; set; }
        public string Director { get; set; }
        public string Actors { get; set; }
        public string Festival { get; set; }
        public string PosterUrl { get; set; }
        public string RunningTime { get; set; }
    }
}