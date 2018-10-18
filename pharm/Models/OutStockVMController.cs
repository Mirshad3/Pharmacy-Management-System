using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace pharm.Models
{
    public class OutStockVM
    {
        public int Medicine_ID { get; set; }
        public string Medicine_Name { get; set; }
        public int SaleQuantity { get; set; }
        public int BatchQuantity { get; set; }
        public int Available { get; set; }
       
        //public List<SalesVM> SalesItems { get; set; }
        //public List<PurchaseItem> PurchaseItem { get; set; }
    }
}