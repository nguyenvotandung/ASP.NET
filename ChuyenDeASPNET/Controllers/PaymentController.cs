using ChuyenDeASPNET.Context;
using ChuyenDeASPNET.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ChuyenDeASPNET.Controllers
{
    public class PaymentController : Controller
    {
        // GET: Payment
        ASPNETEntities2 objASPNETEntities = new ASPNETEntities2();
        public ActionResult Index()
        {
            if (Session["idUser"] == null)
            {
                return RedirectToAction("Login", "Home");
            }
            else
            {
                // lấy thông tin từ giỏ hàng trong session
                var istCart = (List<CartModel>)Session["cart"];
                if (istCart == null || !istCart.Any())
                {
                    // Giỏ hàng trống, bạn có thể thông báo hoặc làm gì đó ở đây
                    TempData["ErrorMessage"] = "Giỏ hàng của bạn đang trống. Vui lòng thêm sản phẩm vào giỏ hàng.";
                    return RedirectToAction("Index", "Home"); // Hoặc chuyển hướng khác
                }

                // tạo dữ liệu cho Order
                Order objOrder = new Order();
                objOrder.Name = "DonHang-" + DateTime.Now.ToString("yyyyMMddHHmmss");
                objOrder.UserId = int.Parse(Session["idUser"].ToString());
                objOrder.CreatedOnUtc = DateTime.Now;
                objOrder.Status = 17;

                objASPNETEntities.Orders.Add(objOrder);

                // lưu thông tin vào bảng Order
                objASPNETEntities.SaveChanges();

                // Lấy OrderId vừa tạo để lưu vào bảng OrderDetail
                int orderId = objOrder.Id;
                List<OrderDetail> lstOrderDetail = new List<OrderDetail>();

                foreach (var item in istCart)
                {
                    var product = objASPNETEntities.Products.FirstOrDefault(p => p.ProductID == item.Product.ProductID);

                    if (product == null)
                    {
                        // Nếu sản phẩm không tồn tại trong cơ sở dữ liệu, bạn có thể thông báo lỗi
                        TempData["ErrorMessage"] = "Sản phẩm trong giỏ hàng không tồn tại. Vui lòng thử lại.";
                        return RedirectToAction("Index", "Home");
                    }
                    OrderDetail obj = new OrderDetail();
                    obj.Quantity = item.Quantity;
                    obj.OrderId = orderId;
                    obj.ProductId = item.Product.ProductID;
                    lstOrderDetail.Add(obj);
                }

                objASPNETEntities.OrderDetails.AddRange(lstOrderDetail);
                objASPNETEntities.SaveChanges();
                ViewBag.OrderDetails = lstOrderDetail;
                ViewBag.TotalAmount = lstOrderDetail.Sum(m => m.Quantity * m.Product.Price);


                // Xóa giỏ hàng sau khi thanh toán thành công
                Session["cart"] = null; 
                Session["count"] = 0; 
            }

            return View();
        }
    }
}