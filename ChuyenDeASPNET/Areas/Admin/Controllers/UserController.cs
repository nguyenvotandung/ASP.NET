using ChuyenDeASPNET.Context;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using ChuyenDeASPNET.Areas.Admin.Filter;

namespace ChuyenDeASPNET.Areas.Admin.Controllers
{
    [AdminAuthorize] // Gắn bộ lọc vào toàn bộ controller
    public class UserController : Controller
    {
        // GET: Admin/User
        ASPNETEntities2 objASPNETEntities = new ASPNETEntities2();
        public ActionResult Index(string searchTerm, int? page)
        {
            // Get all products as IQueryable
            var lstUser = objASPNETEntities.Users.AsQueryable();

            // Search functionality
            if (!string.IsNullOrEmpty(searchTerm))
            {
                lstUser = lstUser.Where(p => p.FirstName.Contains(searchTerm)
                                          || p.LastName.Contains(searchTerm)
                                          || p.Email.Contains(searchTerm));
            }

            ViewBag.CurrentFilter = searchTerm;

            // Pagination settings
            int pageSize = 10;
            int pageNumber = page ?? 1;

            // Sorting and Pagination
            var pagedList = lstUser
                .OrderBy(p => p.FirstName)
                .ThenBy(p => p.LastName)
                .ThenBy(p => p.Email)
                .ToPagedList(pageNumber, pageSize);

            return View(pagedList);  // Return IPagedList<Product> to the view
        }


        public ActionResult Details(int Id)
        {
            var objUser = objASPNETEntities.Users.Where(n => n.idUser == Id).FirstOrDefault();
            return View(objUser);
        }

        [HttpGet]
        public ActionResult Delete(int Id)
        {
            var objUser = objASPNETEntities.Users.Where(n => n.idUser == Id).FirstOrDefault();
            return View(objUser);
        }

        [HttpPost]
        public ActionResult Delete(User objUse)
        {
            var objUser = objASPNETEntities.Users.Where(n => n.idUser == objUse.idUser).FirstOrDefault();

            objASPNETEntities.Users.Remove(objUser);
            objASPNETEntities.SaveChanges();

            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(User objUser)
        {
            try
            {
                // Mã hóa mật khẩu
                if (!string.IsNullOrEmpty(objUser.Password))
                {
                    objUser.Password = HashPassword(objUser.Password);
                }

                // Thêm người dùng vào cơ sở dữ liệu
                objASPNETEntities.Users.Add(objUser);
                objASPNETEntities.SaveChanges();

                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index");
            }
        }

        // Hàm mã hóa mật khẩu
        private string HashPassword(string password)
        {
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                var bytes = System.Text.Encoding.UTF8.GetBytes(password);
                var hash = sha256.ComputeHash(bytes);
                return Convert.ToBase64String(hash);
            }
        }

        // GET: Admin/Product
        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null) return HttpNotFound();

            var user = objASPNETEntities.Users.Find(id);
            if (user == null) return HttpNotFound();

            return View(user);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(User objUser)
        {
            try
            {
                var existingUser = objASPNETEntities.Users.Find(objUser.idUser);
                if (existingUser == null)
                {
                    return HttpNotFound();
                }

                // Cập nhật các trường khác
                existingUser.FirstName = objUser.FirstName;
                existingUser.LastName = objUser.LastName;
                existingUser.Email = objUser.Email;
                existingUser.Password = objUser.Password;

                // Đánh dấu thực thể là đã chỉnh sửa
                objASPNETEntities.Entry(existingUser).State = EntityState.Modified;

                // Lưu thay đổi vào cơ sở dữ liệu
                objASPNETEntities.SaveChanges();

                TempData["SuccessMessage"] = "Cập nhật sản phẩm thành công!";
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                // Log lỗi nếu cần thiết (sử dụng thư viện log như NLog hoặc Serilog)
                TempData["ErrorMessage"] = "Đã xảy ra lỗi trong quá trình cập nhật sản phẩm. Vui lòng thử lại.";
                return RedirectToAction("Edit", new { id = objUser.idUser });
            }
        }
    }
}