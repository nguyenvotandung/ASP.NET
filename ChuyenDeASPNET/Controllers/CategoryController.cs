using ChuyenDeASPNET.Context;
using ChuyenDeASPNET.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;

namespace ChuyenDeASPNET.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        ASPNETEntities2 objASPNETEntities = new ASPNETEntities2();
        public ActionResult Index()
        {

            return View();
        }
        public ActionResult AllCategory()

        {
            var lstCategory = objASPNETEntities.Categories.ToList();

            return View(lstCategory);
        }
        public ActionResult ProductByCategory(int id, int page = 1)  
        {
            int pageSize = 3; 

            
            var listProduct = objASPNETEntities.Products
                                .Where(n => n.CategoryID == id)
                                .OrderBy(p => p.ProductID)  
                                .Skip((page - 1) * pageSize) 
                                .Take(pageSize) 
                                .ToList();

            // Tổng số sản phẩm
            var totalItems = objASPNETEntities.Products.Count(n => n.CategoryID == id);
            var totalPages = (int)Math.Ceiling((double)totalItems / pageSize);

            // Tạo ViewModel chứa thông tin phân trang
            var model = new ProductListViewModel
            {
                Products = listProduct,
                CurrentPage = page,
                TotalPages = totalPages,
                CategoryID = id
            };

            return View(model);
        }
    }
}