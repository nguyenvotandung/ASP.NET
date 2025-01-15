using ChuyenDeASPNET.Areas.Admin.Filter;
using ChuyenDeASPNET.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ChuyenDeASPNET.Areas.Admin.Controllers
{
    [AdminAuthorize] // Gắn bộ lọc vào toàn bộ controller
    public class HomeController : Controller
    {
        ASPNETEntities2 objASPNETEntities = new ASPNETEntities2();
        // GET: Admin/Home
        public ActionResult Index()
        {
            // Thống kê
            var totalProducts = objASPNETEntities.Products.Count();
            var totalOrders = objASPNETEntities.Orders.Count();
            var totalCustomers = objASPNETEntities.Users.Count();

            var totalRevenue = objASPNETEntities.OrderDetails
                .Where(od => od.Product != null && od.Product.Price.HasValue && od.Product.Price.HasValue)
                .Sum(od => od.Quantity * od.Product.Price.Value);

            // Truyền dữ liệu qua ViewBag hoặc ViewData
            ViewBag.TotalProducts = totalProducts;
            ViewBag.TotalOrders = totalOrders;
            ViewBag.TotalCustomers = totalCustomers;
            ViewBag.TotalRevenue = totalRevenue;
            ViewData["Active"] = "Home";
            return View();
        }
    }
}