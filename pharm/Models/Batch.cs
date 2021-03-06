//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace pharm.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Batch
    {
        public int ID { get; set; }
        public int Batch_ID { get; set; }
        public int Quantity { get; set; }
        public decimal Cost_Price { get; set; }
        public decimal Sell_Price { get; set; }
        public System.DateTime Production_Date { get; set; }
        public System.DateTime Expire_Date { get; set; }
        public string Purchase_ID { get; set; }
        public int Medicine_ID { get; set; }
    
        public virtual Medicine_Information Medicine_Information { get; set; }
        public virtual Purchase Purchase { get; set; }
    }
}
