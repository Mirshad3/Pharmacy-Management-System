using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using pharm.Models;
using System.Data;
using Newtonsoft.Json;
using System.Data.Entity;
namespace pharm.Controllers
{
    public class DashboardController : Controller
    {
        //
        // GET: /Dashboard/


        private pharmEntities db = new pharmEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AdminDashboard()
        {
            // DateTime limit = DateTime.Now.AddMonths(1);
            //int items = ((from s in db.Batches
            //                      where s.Expire_Date < limit
            //                      select s).ToList()).Count();
            var max = DateTime.Now.AddYears(-1);
            var result = db.Expenses.Where(d => d.Date >= max)
           .GroupBy(d => d.Expense_Information.Category)
           .Select(g =>
                   new
                   {
                       Name = g.FirstOrDefault().Expense_Information.Category,
                       name_count = g.Select(j=> j.Expense_Id),
                       Data = g.Sum(m => m.Amount)
                   }).ToList();

        

            ViewBag.MobileCount_List = JsonConvert.SerializeObject(result.Select(k=> k.Data));
            ViewBag.Productname_List = JsonConvert.SerializeObject(result.Select(k => k.Name).ToList());
            Session["Expenses_type"] =(result.Select(k => k.name_count).Count()).ToString();
            Session["Expenses"] = (result.Select(k=> k.Data).Sum()).ToString();
            return View();
         
        }

        public ActionResult StaffDashboard()
        {
            return View();
        }
        //public ActionResult Search()
        //{
        //    return View();
        //}
        //public ActionResult Details()
        //{
        //    var tuple = new Tuple<pharm.Models.Drug_Generic_name, pharm.Models.Medicine_Information>(new pharm.Models.Drug_Generic_name() , new pharm.Models.Medicine_Information());
        //    return View(tuple);
        //}
        ////[HttpPost]
        ////public ActionResult NewChart()
        ////{


        ////DateTime limit2 = DateTime.Now.AddDays(-3);
        ////List<Sale> iData = (from s in db.Sales
        ////                    where s.Bill_Information.Date >= limit2
        ////                    select s).ToList();
        ////    ViewBag.DataPoints = iData;
        ////    return Json(iData, JsonRequestBehavior.AllowGet);
        ////}
        //////// public ActionResult DataFromDataBase()
        //////// {
        ////try
        ////{
        ////    DateTime limit2 = DateTime.Now.AddDays(-3);
        //List<Sale> iData = (from s in db.Sales
        //                    where s.Bill_Information.Date >= limit2
        //                    select s).ToList();
        //ViewBag.DataPoints = JsonConvert.SerializeObject(iData, _jsonSetting);
        ////////        IEnumerable<SelectListItem> stores = db.Sales
        ////////.Where(store => store.Bill_Information.Date >= limit2)
        ////////.Select(store => new SelectListItem { Value = (store.Bill_Information.Date).ToString(), Text = (store.Bill_Information.Total_Payable).ToString() });
        ////////        ViewBag.DataPoints = stores;
        ////////                 ViewBag.DataPoints = JsonConvert.SerializeObject(stores.ToList(), _jsonSetting);
        ////////                 return View();
        ////////    }
        ////////     catch (System.Data.Entity.Core.EntityException)
        ////////     {
        ////////         return View("Error");
        ////////     }
        ////////     catch (System.Data.SqlClient.SqlException)
        ////////     {
        ////////         return View("Error");
        ////////     }
        //////// }
        //////// JsonSerializerSettings _jsonSetting = new JsonSerializerSettings() { NullValueHandling = NullValueHandling.Ignore };
        //////public ActionResult DataFromDataBase()
        //////{
        //////    var months = Enumerable.Range(1, 12);
        //////    var max = DateTime.Now.AddYears(-1);
        ////////var result = db.Expenses.Where(d => d.Date >= max)
        ////////               .GroupBy(d => d.Expense_Information.Category)
        ////////               .Select(g =>
        ////////                       new
        ////////                       {
        ////////                           Name = g.Select(m => m.Expense_Information.Category),
        ////////                           Data = g.Select(m => m.Amount)
        ////////                       }).ToArray();
        //////    return View(result);

        //////}
   
}
}
