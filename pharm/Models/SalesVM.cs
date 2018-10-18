using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace pharm.Models
{
    public class SalesVM
    {
        public int ID { get; set; }
        public int Quantity { get; set; }
        public int Cost { get; set; }
        public decimal Amount { get; set; }
        public int Medicine_ID { get; set; }
        public string Bill_Invoice { get; set; }
      
    }
}