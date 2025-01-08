using ChuyenDeASPNET.Context;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace ChuyenDeASPNET.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        // GET: Admin/Product
        ASPNETEntities objASPNETEntities = new ASPNETEntities();
        public ActionResult Index(string searchTerm, int? page)
        {
            // Get all products as IQueryable
            var lstProduct = objASPNETEntities.Products.AsQueryable();

            // Search functionality
            if (!string.IsNullOrEmpty(searchTerm))
            {
                lstProduct = lstProduct.Where(p => p.ProductName.Contains(searchTerm));
            }

            ViewBag.CurrentFilter = searchTerm;

            // Pagination settings
            int pageSize = 10;
            int pageNumber = page ?? 1;

            // Ensure you call ToPagedList() on the IQueryable to get IPagedList
            var pagedList = lstProduct.OrderBy(p => p.ProductName).ToPagedList(pageNumber, pageSize);

            return View(pagedList);  // Return IPagedList<Product> to the view
        }
        public ActionResult Details(int Id)
        {
            var objProduct = objASPNETEntities.Products.Where(n => n.ProductID == Id).FirstOrDefault();
            return View(objProduct);
        }

        [HttpGet]
        public ActionResult Create()
        {
            // Lấy danh sách danh mục và thương hiệu từ cơ sở dữ liệu
            var categories = objASPNETEntities.Categories.ToList();
            ViewBag.CategoryId = new SelectList(categories, "CategoryID", "CategoryName");

            var brands = objASPNETEntities.Brands.ToList();
            ViewBag.BrandId = new SelectList(brands, "BrandID", "BrandName");

            return View();
        }

        [HttpPost]
        public ActionResult Create(Product objProduct)
        {
            try
            {
                if (objProduct.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);
                    string extension = Path.GetExtension(objProduct.ImageUpload.FileName);
                    fileName = fileName + extension;
                    objProduct.ProductImage = fileName;
                    objProduct.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/items/"), fileName));
                }

                objASPNETEntities.Products.Add(objProduct);
                objASPNETEntities.SaveChanges();

                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index");
            }
        }

        [HttpGet]
        public ActionResult Delete(int Id)
        {
            var objProduct = objASPNETEntities.Products.Where(n => n.ProductID == Id).FirstOrDefault();
            return View(objProduct);
        }

        [HttpPost]
        public ActionResult Delete(Product objPro)
        {
            var objProduct = objASPNETEntities.Products.Where(n => n.ProductID == objPro.ProductID).FirstOrDefault();

            objASPNETEntities.Products.Remove(objProduct);
            objASPNETEntities.SaveChanges();

            return RedirectToAction("Index");
        }

        // GET: Admin/Product
        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null) return HttpNotFound();

            var product = objASPNETEntities.Products.Find(id);
            if (product == null) return HttpNotFound();

            // Truyền danh sách Category và Brand vào ViewBag
            ViewBag.CategoryId = new SelectList(objASPNETEntities.Categories, "Id", "Name", product.CategoryID);
            ViewBag.BrandId = new SelectList(objASPNETEntities.Brands, "Id", "Name", product.BrandID);

            return View(product);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Product objProduct)
        {
            try
            {
                var existingProduct = objASPNETEntities.Products.Find(objProduct.ProductID);
                if (existingProduct == null)
                {
                    return HttpNotFound();
                }

                // Kiểm tra và xử lý tệp tải lên
                if (objProduct.ImageUpload != null && objProduct.ImageUpload.ContentLength > 0)
                {
                    // Xử lý ảnh
                    string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);
                    string extension = Path.GetExtension(objProduct.ImageUpload.FileName);
                    fileName = fileName + extension; // Thêm timestamp để tránh trùng tên
                    string filePath = Path.Combine(Server.MapPath("~/Content/images/items/"), fileName);

                    objProduct.ImageUpload.SaveAs(filePath);

                    // Xóa ảnh cũ nếu có
                    if (!string.IsNullOrEmpty(existingProduct.ProductImage))
                    {
                        string oldFilePath = Path.Combine(Server.MapPath("~/Content/images/items/"), existingProduct.ProductImage);
                        if (System.IO.File.Exists(oldFilePath))
                        {
                            System.IO.File.Delete(oldFilePath);
                        }
                    }

                    // Cập nhật đường dẫn ảnh mới
                    existingProduct.ProductImage = fileName;
                }

                // Cập nhật các trường khác
                existingProduct.ProductName = objProduct.ProductName;
                existingProduct.ShortDescription = objProduct.ShortDescription;
                existingProduct.FullDescription = objProduct.FullDescription;
                existingProduct.Price = objProduct.Price;
                existingProduct.CategoryID = objProduct.CategoryID;
                existingProduct.BrandID = objProduct.BrandID;

                // Đánh dấu thực thể là đã chỉnh sửa
                objASPNETEntities.Entry(existingProduct).State = EntityState.Modified;

                // Lưu thay đổi vào cơ sở dữ liệu
                objASPNETEntities.SaveChanges();

                TempData["SuccessMessage"] = "Cập nhật sản phẩm thành công!";
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                // Log lỗi nếu cần thiết (sử dụng thư viện log như NLog hoặc Serilog)
                TempData["ErrorMessage"] = "Đã xảy ra lỗi trong quá trình cập nhật sản phẩm. Vui lòng thử lại.";
                return RedirectToAction("Edit", new { id = objProduct.ProductID });
            }
        }
    }
}