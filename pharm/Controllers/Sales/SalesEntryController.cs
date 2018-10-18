﻿using pharm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.Entity;
 

namespace pharm.Controllers.Sales
{
    public class SalesEntryController : Controller
    {
        pharmEntities db = new pharmEntities();
        //
        // GET: /SalesEntry/

        public ActionResult Index(string search)
        {
            //var purchases = db.Medicine_Information.Include(p => p.Batches).Include(d => d.Sales);
            return View(db.Batches.Where(x => x.Medicine_Information.Medicine_Name.Contains(search) || search == null).ToList());
            //return View(db.Batches.ToList());
        }

        public ActionResult View(string search)
        {
            //var purchases = db.Medicine_Information.Include(p => p.Batches).Include(d => d.Sales);
            return View(db.Batches.Where(x => x.Medicine_Information.Medicine_Name.Contains(search) || search == null).ToList());
            //return View(db.Batches.ToList());
        }
        public JsonResult SaveSales(Bill_InfromationVM b)
        {
            bool status = false;

            if (b != null)
            {
                //new purchase object using the data from the viewmodel : PurchaseEntryVM
                var billInfo = new pharm.Models.Bill_Information
                {
                    Invoice_No = b.Invoice_No,
                    Total_Amount = b.Total_Amount,
                    Discount = b.Discount,
                    Discount_Amount = b.Discount_Amount,
                    Total_Payable = b.Total_Payable,
                    Paid = b.Paid,
                    Returned = b.Returned,
                    Date = b.Date,
                };

                var sales = b.SalesItems.Select(i => new pharm.Models.Sale
                {

                    Quantity = i.Quantity,
                    Cost = i.Cost,
                    Amount = i.Amount,
                    Medicine_ID = i.Medicine_ID,
                    Bill_Invoice = i.Bill_Invoice,
                }).ToList();

                //db.Purchases.Attach(purchase);
                db.Bill_Information.Add(billInfo);

                foreach (var c in sales)
                {
                    
                    db.Sales.Add(c);
                }

  
                    db.SaveChanges();

                status = true;
            }

            // return the status in form of Json
            return new JsonResult { Data = new { status = status } };
        } 

    }
}

