//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CarInsurance.DataBase
{
    using System;
    using System.Collections.Generic;
    
    public partial class Osago
    {
        public int Id { get; set; }
        public int DriverId { get; set; }
        public int RegionId { get; set; }
        public System.DateTime DateStart { get; set; }
        public System.DateTime DateEnd { get; set; }
        public int CarId { get; set; }
        public double Price { get; set; }
    
        public virtual Car Car { get; set; }
        public virtual Driver Driver { get; set; }
        public virtual Region Region { get; set; }
    }
}