using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using pharm.Models;
using PagedList;
using PagedList.Mvc;
using System.Net;
using System.Data.Entity.Validation;
using System.Diagnostics;
using Microsoft.Reporting.WebForms;
using System.IO;
 using CrystalDecisions.CrystalReports.Engine;



namespace pharm
{
    public class PurchaseHistoryController : Controller
    {
        private pharmEntities db = new pharmEntities();

        //
        // GET: /PurchaseHistory/

        public ActionResult Index(string searchBy, string search)
        {
            var purchases = db.Purchases.Include(p => p.Supplier);

            if (searchBy == "Purchase_ID")
            {
                return View(db.Purchases.Where(x => x.Purchase_ID.Contains(search) || search == null).ToList());
            }
            else
            {
                return View(db.Purchases.Where(x => x.Supplier.Supplier_Name.Contains(search) || search == null).ToList());
            }

            //return View(purchases.ToList());
        }

        //
        // GET: /PurchaseHistory/Details/5

        public ActionResult Details(string id)
        {
             var purchasedItem = (from n in db.Batches
                            where n.Purchase_ID == id
                                  select n).ToList();
           
             return View(purchasedItem);  
        }

        //
        // GET: /PurchaseHistory/Edit/5

        public ActionResult Edit(string id = null)
        {
            Purchase purchase = db.Purchases.Find(id);
            if (purchase == null)
            {
                return HttpNotFound();
            }
            ViewBag.Supplier_ID = new SelectList(db.Suppliers, "ID", "Supplier_Name", purchase.Supplier_ID);
            return View(purchase);
        }

        //
        // POST: /PurchaseHistory/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Purchase purchase)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.Purchases.Attach(purchase);
                    db.Entry(purchase).Property(r => r.IsPaid).IsModified = true;
                    db.Entry(purchase).Property(r => r.Description).IsModified = true;
                    //db.Entry(purchase).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                catch (DbEntityValidationException dbEx)
                {
                    foreach (var validationErrors in dbEx.EntityValidationErrors)
                    {
                        foreach (var validationError in validationErrors.ValidationErrors)
                        {
                            Trace.TraceInformation("Property: {0} Error: {1}",
                                                    validationError.PropertyName,
                                                    validationError.ErrorMessage);
                        }
                    }
                }
            }
            ViewBag.Supplier_ID = new SelectList(db.Suppliers, "ID", "Supplier_Name", purchase.Supplier_ID);
            return View(purchase);
        }

        //
        // GET: /PurchaseHistory/Delete/5

        public ActionResult Delete(string id = null)
        {
            Purchase purchase = db.Purchases.Find(id);
            if (purchase == null)
            {
                return HttpNotFound();
            }
            return View(purchase);
        }

        //
        // POST: /PurchaseHistory/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Purchase purchase = db.Purchases.Find(id);
            db.Purchases.Remove(purchase);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
        

        public ActionResult ExportReport()
        {
            List<Purchase> allEverest = new List<Purchase>();
            using (pharmEntities dc = new pharmEntities())
            {
                allEverest = dc.Purchases.ToList();
            }

            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Report"), "PurchaseReport.rpt"));
            rd.SetDataSource(allEverest);

            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();
            try
            {
                Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                stream.Seek(0, SeekOrigin.Begin);
                return File(stream, "application/pdf", "EverestList.pdf");
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public ActionResult Report(string id)
        {
            LocalReport lr = new LocalReport();
            string path = Path.Combine(Server.MapPath("~/Report"), "PurchaseReport.rpt");
            if (System.IO.File.Exists(path))
            {
                lr.ReportPath = path;
            }
            else
            {
                return View("Index");
            }
            List<Purchase> cm = new List<Purchase>();
            using (pharmEntities dc = new pharmEntities())
            {
                cm = dc.Purchases.ToList();
            }
            ReportDataSource rd = new ReportDataSource("MyDataset", cm);
            lr.DataSources.Add(rd);
            string reportType = id;
            string mimeType;
            string encoding;
            string fileNameExtension;



            string deviceInfo =

            "<DeviceInfo>" +
            "  <OutputFormat>" + id + "</OutputFormat>" +
            "  <PageWidth>8.5in</PageWidth>" +
            "  <PageHeight>11in</PageHeight>" +
            "  <MarginTop>0.5in</MarginTop>" +
            "  <MarginLeft>1in</MarginLeft>" +
            "  <MarginRight>1in</MarginRight>" +
            "  <MarginBottom>0.5in</MarginBottom>" +
            "</DeviceInfo>";

            Warning[] warnings;
            string[] streams;
            byte[] renderedBytes;

            renderedBytes = lr.Render(
                reportType,
                deviceInfo,
                out mimeType,
                out encoding,
                out fileNameExtension,
                out streams,
                out warnings);


            return File(renderedBytes, mimeType);
        }

    }
}