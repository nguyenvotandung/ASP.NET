using ChuyenDeASPNET.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ChuyenDeASPNET.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        ASPNETEntities1 objASPNETEntities = new ASPNETEntities1();
        public ActionResult AllCategory()
        {
            var lstAllCategory = objASPNETEntities.Categories.ToList();
            return View(lstAllCategory);
        }
        public ActionResult ProductByCategory()
        {
            return View();
        }
    }
}