using ChuyenDeASPNET.Context;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ChuyenDeASPNET.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        ASPNETEntities objASPNETEntities = new ASPNETEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ProductDetail(int id)
        {
            var objProduct = objASPNETEntities.Products.Where(n => n.ProductID == id).FirstOrDefault();
            return View(objProduct);
        }
        public ActionResult AllProduct(string currentFilter, string SearchString, int? page)
        {
            var lstProduct = new List<Product>();
            if (SearchString != null)
            {
                page = 1;
            }
            else
            {
                SearchString = currentFilter;
            }
            if (!string.IsNullOrEmpty(SearchString))
            {
                lstProduct = objASPNETEntities.Products.Where(n => n.ProductName.Contains(SearchString)).ToList();
            }
            else
            {
                lstProduct = objASPNETEntities.Products.ToList();
            }
            ViewBag.CurentFIlter = SearchString;
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            lstProduct = lstProduct.OrderByDescending(n => n.ProductID).ToList();
            return View(lstProduct.ToPagedList(pageNumber, pageSize));
        }
    }
}