using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace pharm.Models
{
    public class Bill_InfromationVM
    {
        public string Invoice_No { get; set; }
        public decimal Total_Amount { get; set; }
        public string Discount { get; set; }
        public decimal Discount_Amount { get; set; }
        public decimal Total_Payable { get; set; }
        public decimal Paid { get; set; }
        public decimal Returned { get; set; }
        public System.DateTime Date { get; set; }

        public List<SalesVM> SalesItems { get; set; }
    }
}