using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using pharm.Models;

namespace pharm.Controllers.Purchase
{
    public class SupplierController : Controller
    {
        private pharmEntities db = new pharmEntities();

        //
        // GET: /Supplier/

        public ActionResult Index()
        {
            
            //if (searchBy == "Supplier_Name")
            //{
            //    return View(db.Suppliers.Where(x => x.Supplier_Name.Contains(search) || search == null).ToList());
            //}
            //else if (searchBy == "Contact")
            //{
            //    return View(db.Suppliers.Where(x => x.Contact.Contains(search) || search == null).ToList());
            //}
            //else
            
                return View(db.Suppliers.ToList());
            

            //return View(db.Suppliers.ToList());
        }

        //
        // GET: /Supplier/Details/5

        public ActionResult Details(int id = 0)
        {
            Supplier supplier = db.Suppliers.Find(id);
            if (supplier == null)
            {
                return HttpNotFound();
            }
            return View(supplier);
        }

        //
        // GET: /Supplier/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Supplier/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Supplier supplier)
        {
            try
            {
                if (ModelState.IsValid == false)
                {

                }
                else
                {
                    db.Suppliers.Add(supplier);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                ViewBag.result1 =  ex;

               
            }
            return View(supplier);
        }

        [System.Web.Services.WebMethod]
        public static string DeleteClick()
        {
            //Do your Stuff Here.
            return "ButtonClicked";
        }
        //
        // GET: /Supplier/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Supplier supplier = db.Suppliers.Find(id);
            if (supplier == null)
            {
                return HttpNotFound();
            }
            return View(supplier);
        }

        //
        // POST: /Supplier/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Supplier supplier)
        {
            if (ModelState.IsValid)
            {
                db.Entry(supplier).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(supplier);
        }

        //
        // GET: /Supplier/Delete/5

        public ActionResult Delete(int id)
        {
            Supplier supplier = db.Suppliers.Find(id);
            if (supplier == null)
            {
                return HttpNotFound();
            }
          
            db.Suppliers.Remove(supplier);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //
        // POST: /Supplier/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
             
            try
            {
                Supplier supplier = db.Suppliers.Find(id);
                db.Suppliers.Remove(supplier);
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                ViewBag.result1 = "Error" + ex;
               
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }


        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}