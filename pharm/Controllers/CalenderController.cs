using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using pharm.Models;

namespace pharm.Controllers
{
    public class CalenderController : Controller
    {
        
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetEvents()
        {
            using (pharmEntities dc = new pharmEntities())
            {
                var events = dc.Events.ToList();
                return new JsonResult { Data = events, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
            }
        }

        [HttpPost]
        public JsonResult SaveEvent(Event e)
        {
            var status = false;
            using (pharmEntities dc = new pharmEntities())
            {
                if (e.Id > 0)
                {
                    //Update the event
                    var v = dc.Events.Where(a => a.Id == e.Id).FirstOrDefault();
                    if (v != null)
                    {
                        v.Subject = e.Subject;
                        v.Start = e.Start;
                        v.End = e.End;
                        v.Description = e.Description;
                        v.IsFullDay = e.IsFullDay;
                        v.ThemeColor = e.ThemeColor;
                    }
                }
                else
                {
                    dc.Events.Add(e);
                }

                dc.SaveChanges();
                status = true;

            }
            return new JsonResult { Data = new { status = status } };
        }

        [HttpPost]
        public JsonResult DeleteEvent(int eventID)
        {
            var status = false;
            using (pharmEntities dc = new pharmEntities())
            {
                var v = dc.Events.Where(a => a.Id == eventID).FirstOrDefault();
                if (v != null)
                {
                    dc.Events.Remove(v);
                    dc.SaveChanges();
                    status = true;
                }
            }
            return new JsonResult { Data = new { status = status } };
        }
    }
}