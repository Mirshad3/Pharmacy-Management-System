using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using pharm.Models;
using System.Linq.Dynamic;

namespace pharm.Controllers.Expense
{
    public class ExpensController : Controller
    {
        private pharmEntities db = new pharmEntities();

        // GET: Expens
        public ActionResult Index()
        {
            var expenses = db.Expenses.Include(e => e.Expense_Information);
            return View(expenses.ToList());

        }

        //public ActionResult Index()
        //{
        //    return View();

        //}

        //Write action for return json data
        //////[HttpPost]
        //////public ActionResult LoadData()
        //////{
        //////    //Get parameters

        //////    // get Start (paging start index) and length (page size for paging)
        //////    var draw = Request.Form.GetValues("draw").FirstOrDefault();
        //////    var start = Request.Form.GetValues("start").FirstOrDefault();
        //////    var length = Request.Form.GetValues("length").FirstOrDefault();
        //////    //Get Sort columns value
        //////    var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
        //////    var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();

        //////    int pageSize = length != null ? Convert.ToInt32(length) : 0;
        //////    int skip = start != null ? Convert.ToInt32(start) : 0;
        //////    int totalRecords = 0;

        //////    using (pharmEntities dc = new pharmEntities())
        //////    {
        //////        var v = (from a in dc.Expenses select a);
        //////        //Sorting
        //////        if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDir)))
        //////        {
        //////            v = v.OrderBy(sortColumn + " " + sortColumnDir);
        //////        }

        //////        totalRecords = v.Count();
        //////        var data = v.Skip(skip).Take(pageSize).ToList();
        //////        return Json(new { draw = draw, recordsFiltered = totalRecords, recordsTotal = totalRecords, data = data }, JsonRequestBehavior.AllowGet);

        //////    }
        //////}

        // GET: Expens/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Expens expens = db.Expenses.Find(id);
            if (expens == null)
            {
                return HttpNotFound();
            }
            return View(expens);
        }

        // GET: Expens/Create
        public ActionResult Create()
        {
            ViewBag.category_Id = new SelectList(db.Expense_Information, "category_Id", "Category");
            return View();
        }

        // POST: Expens/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "category_Id,Details,Date,Amount")] Expens expens)
        {
            if (ModelState.IsValid)
            {
                db.Expenses.Add(expens);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.category_Id = new SelectList(db.Expense_Information, "category_Id", "Category", expens.category_Id);
            return View(expens);
        }

        // GET: Expens/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Expens expens = db.Expenses.Find(id);
            if (expens == null)
            {
                return HttpNotFound();
            }
            ViewBag.category_Id = new SelectList(db.Expense_Information, "category_Id", "Category", expens.category_Id);
            return View(expens);
        }

        // POST: Expens/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Expense_Id,category_Id,Details,Date,Amount")] Expens expens)
        {
            if (ModelState.IsValid)
            {
                db.Entry(expens).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.category_Id = new SelectList(db.Expense_Information, "category_Id", "Category", expens.category_Id);
            return View(expens);
        }

        // GET: Expens/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Expens expens = db.Expenses.Find(id);
            if (expens == null)
            {
                return HttpNotFound();
            }
            return View(expens);
        }

        // POST: Expens/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Expens expens = db.Expenses.Find(id);
            db.Expenses.Remove(expens);
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
