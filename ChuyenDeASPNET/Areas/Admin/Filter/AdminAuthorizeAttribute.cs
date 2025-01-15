using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ChuyenDeASPNET.Areas.Admin.Filter
{
    public class AdminAuthorizeAttribute : AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            // Kiểm tra quyền Admin trong Session
            if (httpContext.Session["IsAdmin"] == null || (bool)httpContext.Session["IsAdmin"] == false)
            {
                return false;
            }
            return true;
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            // Nếu chưa đăng nhập hoặc không có quyền Admin, chuyển hướng về trang đăng nhập của khu vực Admin
            filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary
            {
                { "controller", "Home" },
                { "action", "Index" },
                { "area", "" } // Khu vực Admin
            });
        }
    }
}