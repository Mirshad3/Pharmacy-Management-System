using pharm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace pharm.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/

        private pharmEntities db = new pharmEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Login(User_Access users)
        {
            if (ModelState.IsValid)
            {
                var details = from user in db.User_Access
                              where user.Username == users.Username && user.Password == users.Password
                              select user;
           
                if (details.FirstOrDefault() != null)
                {
                    var other = from user in db.User_Information
                                where user.Username == users.Username
                                select user;
                    Session["Join_Date"] = other.FirstOrDefault().Join_Date;
                    Session["Join_Date_new"] = Convert.ToDateTime(Session["Join_Date"].ToString()).ToString("dd/MM/yyyy");
                    Session["Gender"] = other.FirstOrDefault().Gender;
                    Session["ID"] = other.FirstOrDefault().ID;

                    if (details.FirstOrDefault().Usertype == "Admin")
                    {
                        Session["Username"] = details.FirstOrDefault().Username;
                        Session["Usertype"] = details.FirstOrDefault().Usertype;
                       Session["User_Gender"] = Session["Gender"].ToString() == "Male"? "avatar5.png" : "avatar3.png";
                        return RedirectToAction("AdminDashboard", "Dashboard");
                    }
                    else
                    {
                        Session["Username"] = details.FirstOrDefault().Username;
                        Session["Usertype"] = details.FirstOrDefault().Usertype;
                        Session["User_Gender"] = Session["Gender"].ToString() == "Male" ? "avatar.png" : "avatar2.png";
                        return RedirectToAction("StaffDashboard", "Dashboard");
                    }
                }
                else
                {
                    ModelState.AddModelError("Error", "Wrong Username or Password");
                }

            }

            else
            {
                ModelState.AddModelError("", "Invalid");
            }

            return View(users);
        }

    }
}
