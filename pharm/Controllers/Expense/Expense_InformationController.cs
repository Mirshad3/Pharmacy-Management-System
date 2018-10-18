using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq.Dynamic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using pharm.Models;

namespace pharm.Controllers.Expense
{
    public class Expense_InformationController : Controller
    {
        private pharmEntities db = new pharmEntities();

        // GET: Expense_Information
        public ActionResult Index()
        {
            return View(db.Expense_Information.ToList());
        }

        // GET: Expense_Information/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Expense_Information expense_Information = db.Expense_Information.Find(id);
            if (expense_Information == null)
            {
                return HttpNotFound();
            }
            return View(expense_Information);
        }

        // GET: Expense_Information/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Expense_Information/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "category_Id,Category,Description")] Expense_Information expense_Information)
        {
            if (ModelState.IsValid)
            {
                db.Expense_Information.Add(expense_Information);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(expense_Information);
        }

        // GET: Expense_Information/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Expense_Information expense_Information = db.Expense_Information.Find(id);
            if (expense_Information == null)
            {
                return HttpNotFound();
            }
            return View(expense_Information);
        }

        // POST: Expense_Information/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "category_Id,Category,Description")] Expense_Information expense_Information)
        {
            if (ModelState.IsValid)
            {
                db.Entry(expense_Information).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(expense_Information);
        }

        // GET: Expense_Information/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Expense_Information expense_Information = db.Expense_Information.Find(id);
            if (expense_Information == null)
            {
                return HttpNotFound();
            }
            return View(expense_Information);
        }

        // POST: Expense_Information/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Expense_Information expense_Information = db.Expense_Information.Find(id);
            db.Expense_Information.Remove(expense_Information);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
