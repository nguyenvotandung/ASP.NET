using ChuyenDeASPNET.Context;
using ChuyenDeASPNET.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace ChuyenDeASPNET.Controllers
{
    public class HomeController : Controller
    {
        ASPNETEntities2 objASPNETEntities = new ASPNETEntities2();
        public ActionResult Index()
        {
            HomeModel objHomeModel = new HomeModel();
            // Lấy danh sách sản phẩm và danh mục từ cơ sở dữ liệu
            objHomeModel.ListProduct = objASPNETEntities.Products.ToList();
            objHomeModel.ListCategory = objASPNETEntities.Categories.ToList();

            return View(objHomeModel);
        }
        public ActionResult Register()
        {
            return View();
        }

        //POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(User _user)
        {
            if (ModelState.IsValid)
            {
                var check = objASPNETEntities.Users.FirstOrDefault(s => s.Email == _user.Email);
                if (check == null)
                {
                    _user.Password = GetMD5(_user.Password);
                    objASPNETEntities.Configuration.ValidateOnSaveEnabled = false;
                    objASPNETEntities.Users.Add(_user);
                    objASPNETEntities.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Email already exists";
                    return View();
                }


            }
            return View();


        }

        //create a string MD5
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string email, string password)
        {
            if (ModelState.IsValid)
            {
                // Mã hóa mật khẩu
                var f_password = GetMD5(password);
                // Kiểm tra thông tin đăng nhập
                var user = objASPNETEntities.Users
                            .FirstOrDefault(u => u.Email == email && u.Password == f_password);

                if (user != null)
                {
                    // Thêm thông tin vào Session
                    Session["FullName"] = user.FirstName + " " + user.LastName;
                    Session["Email"] = user.Email;
                    Session["idUser"] = user.idUser;

                    // Kiểm tra quyền Admin
                    if (user.IsAdmin == true)
                    {
                        Session["IsAdmin"] = true;
                        return RedirectToAction("Index", "Home", new { area = "Admin" });
                    }
                    else
                    {
                        Session["IsAdmin"] = false;
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ViewBag.error = "Login failed";
                }
            }
            return View();
        }


        //Logout
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Login");
        }
        public ActionResult Search(string query)
        {
            if (string.IsNullOrEmpty(query))
            {
                return View("SearchResults", new List<Product>()); // Không có kết quả
            }

            // Tìm kiếm sản phẩm theo tên hoặc mô tả
            var products = objASPNETEntities.Products
                .Where(p => p.ProductName.Contains(query) || p.ShortDescription.Contains(query))
                .ToList();

            // Trả về view với danh sách sản phẩm tìm được
            return View("SearchResults", products);
        }
    }
}