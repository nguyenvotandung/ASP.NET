using ChuyenDeASPNET.Context;
using ChuyenDeASPNET.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ChuyenDeASPNET.Controllers
{
    public class HomeController : Controller
    {
        ASPNETEntities1 objASPNETEntities = new ASPNETEntities1();
        public ActionResult Index()
        {
            HomeModel objHomeModel = new HomeModel();
            // Lấy danh sách sản phẩm và danh mục từ cơ sở dữ liệu
            objHomeModel.ListProduct = objASPNETEntities.Products.ToList();
            objHomeModel.ListCategory = objASPNETEntities.Categories.ToList();

            return View(objHomeModel);
        }
    }
}