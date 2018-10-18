using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.Entity;
using pharm.Models;

namespace pharm.Controllers
{
    public class OutStockController : Controller
    {
        private pharmEntities db = new pharmEntities();
        //// GET: out_stock
        //public ActionResult Index(string search)
        //{
        //    List<pharm.Models.Medicine_Information> outStock = new List<pharm.Models.Medicine_Information>();
        //      var availableStock = (from o in db.Batches
        //                 select o.Quantity).Count();
        //    var sellStock = (from o in db.Sales
        //                 select o.Quantity).Count();
        //    if ((availableStock - sellStock) <= 10) {
        //       outStock = (from n in db.Batches select n.Medicine_Information).ToList();
        //    };

        //    //var sales = db.Sales.Include(s => s.Bill_Information).Include(s => s.Medicine_Information);
        //    return View(outStock);

        //}

        public ActionResult Index()
        {
            //int sellStock = Convert.ToInt32(from o in db.Sales
            //                                select o.Quantity);

            //var q = (from t in db.Medicine_Information
            //         join sc in db.Batches on t.ID equals sc.Medicine_ID
            //         join st in db.Sales on t.ID equals st.Medicine_ID
            //         where ((Convert.ToInt32(sc.Quantity) - Convert.ToInt32( st.Quantity)) >= 10)
            //         select new { t.ID, t.Medicine_Name, sc.Quantity, sellStock });
            var purchases = db.Medicine_Information.Include(p => p.Batches).Include(d => d.Sales).Where(m => m.Sales.Any(i => i.Quantity != 0));
            
            List<OutStockVM> stock = new List<OutStockVM>();

            foreach (var t in purchases)
            {
                if (10>(t.Batches.First().Quantity - t.Sales.First().Quantity)) { 
                    stock.Add(new OutStockVM()
                    {
                        Medicine_ID = t.ID,
                        Medicine_Name = t.Medicine_Name,
                        SaleQuantity = t.Sales.First().Quantity,
                        BatchQuantity = t.Batches.First().Quantity,
                        Available = t.Batches.First().Quantity - t.Sales.First().Quantity

                    });
                }

            }

            


            //List<OutStockVM> items = new List<OutStockVM>();


            //return View(items);
            return View(stock.ToList());

        }


        }
}