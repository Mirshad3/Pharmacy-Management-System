using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using pharm.Models;

namespace pharm.Controllers
{
    public class SalesHistoryController : Controller
    {
        private pharmEntities db = new pharmEntities();

        //
        // GET: /SalesHistory/

        //public ActionResult Index()
        //{
        //    var count = (from o in db.Sales
        //                 select o).FirstOrDefault();
        //    //var sales = db.Sales.Include(s => s.Bill_Information).Include(s => s.Medicine_Information);
        //    return View(count.ToList());
        //}
        public ActionResult Index( )
        {
            //var purchases = db.Sales.Include(p => p.Medicine_Information);

          
                return View(db.Sales.ToList());
          

        }
        //
        // GET: /SalesHistory/Details/5

        public ActionResult Details( )
        {
            return View(db.Purchases.ToList());
        }


        public ActionResult Edit( )
        {
            var purchases = db.Medicine_Information.Include(p => p.Batches).Include(d => d.Sales).Where(m => m.Sales.Any(i => i.Quantity != 0));

            List<OutStockVM> stock = new List<OutStockVM>();

            foreach (var t in purchases)
            {

                stock.Add(new OutStockVM()
                {
                    Medicine_ID = t.ID,
                    Medicine_Name = t.Medicine_Name,
                    SaleQuantity = t.Sales.First().Quantity,
                    BatchQuantity = t.Batches.First().Quantity,
                    Available = t.Batches.First().Quantity - t.Sales.First().Quantity

                });

            }


            return View(stock.ToList());
        }
        //
        // GET: /SalesHistory/Create

        public ActionResult Create()
        {
            return View(db.Expenses.ToList());
        }

        //
        // POST: /SalesHistory/Create

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create(Sale sale)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Sales.Add(sale);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    ViewBag.Bill_Invoice = new SelectList(db.Bill_Information, "Invoice_No", "Discount", sale.Bill_Invoice);
        //    ViewBag.Medicine_ID = new SelectList(db.Medicine_Information, "ID", "Medicine_Name", sale.Medicine_ID);
        //    return View(sale);
        //}

        //
        // GET: /SalesHistory/Edit/5


        //
        // POST: /SalesHistory/Edit/5

        ////[HttpPost]
        ////[ValidateAntiForgeryToken]
        ////public ActionResult Edit(Sale sale)
        ////{
        ////    if (ModelState.IsValid)
        ////    {
        ////        db.Entry(sale).State = EntityState.Modified;
        ////        db.SaveChanges();
        ////        return RedirectToAction("Index");
        ////    }
        ////    ViewBag.Bill_Invoice = new SelectList(db.Bill_Information, "Invoice_No", "Discount", sale.Bill_Invoice);
        ////    ViewBag.Medicine_ID = new SelectList(db.Medicine_Information, "ID", "Medicine_Name", sale.Medicine_ID);
        ////    return View(sale);
        ////}

        //////
        ////// GET: /SalesHistory/Delete/5

        ////public ActionResult Delete(int id = 0)
        ////{
        ////    Sale sale = db.Sales.Find(id);
        ////    if (sale == null)
        ////    {
        ////        return HttpNotFound();
        ////    }
        ////    return View(sale);
        ////}

        //////
        ////// POST: /SalesHistory/Delete/5

        ////[HttpPost, ActionName("Delete")]
        ////[ValidateAntiForgeryToken]
        ////public ActionResult DeleteConfirmed(int id)
        ////{
        ////    Sale sale = db.Sales.Find(id);
        ////    db.Sales.Remove(sale);
        ////    db.SaveChanges();
        ////    return RedirectToAction("Index");
        ////}

        ////protected override void Dispose(bool disposing)
        ////{
        ////    db.Dispose();
        ////    base.Dispose(disposing);
        ////}
    }
}