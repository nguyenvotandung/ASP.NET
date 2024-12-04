using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ChuyenDeASPNET.Controllers
{
    public class ProfileController : Controller
    {
        // GET: Profile
        public ActionResult ProfileMain()
        {
            return View();
        }
        public ActionResult Order()
        {
            return View();
        }
        public ActionResult Seller()
        {
            return View();
        }
        public ActionResult Setting()
        {
            return View();
        }
        public ActionResult Wishlist()
        {
            return View();
        }
        public ActionResult Address()
        {
            return View();
        }
    }
}