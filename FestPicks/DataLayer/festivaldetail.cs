//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FestPicks.DataLayer
{
    using System;
    using System.Collections.Generic;
    
    public partial class festivaldetail
    {
        public festivaldetail()
        {
            this.moviesdetails = new HashSet<moviesdetail>();
            this.festival_held = new HashSet<festival_held>();
        }
    
        public int Id { get; set; }
        public string FestivalName { get; set; }
        public decimal Lat { get; set; }
        public decimal Lng { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public string Website { get; set; }
        public string FestivalArtUrl { get; set; }
        public string NextFestival { get; set; }
        public byte[] About { get; set; }
        public string FestivalYear { get; set; }
        public sbyte HighlightFestival { get; set; }
        public string Region { get; set; }
    
        public virtual ICollection<moviesdetail> moviesdetails { get; set; }
        public virtual ICollection<festival_held> festival_held { get; set; }
    }
}
