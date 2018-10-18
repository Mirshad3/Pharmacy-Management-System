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
    public class ExpireController : Controller
    {
        private pharmEntities db = new pharmEntities();
       

        public ActionResult Index()
        {
           // DateTime currentDateTime = DateTime.Now.Date;
           //int sMonth = Convert.ToInt32(DateTime.Now.ToString("MM"));
           // //int sYeaar = Convert.ToInt32(DateTime.Now.ToString("yyyy"));
           // //int sDate  = Convert.ToInt32(DateTime.Now.ToString("dd"));
           // //int exprdate = (sYeaar + sMonth + sDate);

           // ////var purchases = db.Batches.Include(p => p.Medicine_Information);
           // ////int other = Convert.ToInt32(from user in db.Batches
           // ////             where user.Expire_Date.AddMonths(-1) < currentDateTime
           // ////             select user.ID);

           // var lastTwelveMonths = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1).AddMonths(-11);
           // var result = db.Batches.Where(item => item.Expire_Date >= lastTwelveMonths);

            DateTime limit = DateTime.Now.AddMonths(1);
            List<Batch> items = (from s in db.Batches
                                   where  s.Expire_Date  < limit
                                               select s).ToList();

            return View(items);
        }

        public ActionResult Details(int id)
        {
            var ExpireItem = (from n in db.Batches
                                 where n.ID == id
                                 select n).ToList();
            return View(ExpireItem);
        }

    }
}