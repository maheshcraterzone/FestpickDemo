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
    
    public partial class festival_held
    {
        public short ID { get; set; }
        public int FestivalId { get; set; }
        public Nullable<sbyte> FromDate { get; set; }
        public Nullable<sbyte> ToDate { get; set; }
        public string FestMonth { get; set; }
        public short Year { get; set; }
    
        public virtual festivaldetail festivaldetail { get; set; }
    }
}
