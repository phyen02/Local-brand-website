using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebBanHangOnline
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
              name: "Contact",
              url: "gioi-thieu",
              defaults: new { controller = "Contact", action = "Index", alias = UrlParameter.Optional },
              namespaces: new[] { "WebBanHangOnline.Controllers" }
          );
            routes.MapRoute(
         name: "CheckOut",
         url: "thanh-toan",
         defaults: new { controller = "ShoppingCart", action = "CheckOut", alias = UrlParameter.Optional },
         namespaces: new[] { "WebBanHangOnline.Controllers" }
     );
            routes.MapRoute(
             name: "ShoppingCart",
             url: "gio-hang",
             defaults: new { controller = "ShoppingCart", action = "Index", alias = UrlParameter.Optional },
             namespaces: new[] { "WebBanHangOnline.Controllers" }
         );
            routes.MapRoute(
              name: "CategoryProduct",
              url: "danh-muc-san-pham/{alias}-{id}",
              defaults: new { controller = "Products", action = "ProductCategory", id = UrlParameter.Optional },
              namespaces: new[] { "WebBanHangOnline.Controllers" }
          );
            routes.MapRoute(
            name: "BaiViet",
            url: "post/{alias}",
            defaults: new { controller = "Article", action = "Index", alias = UrlParameter.Optional },
            namespaces: new[] { "WebBanHangOnline.Controllers" }
        );
            routes.MapRoute(
              name: "detailProduct",
              url: "chi-tiet/{alias}-p{id}",
              defaults: new { controller = "Products", action = "Detail", alias = UrlParameter.Optional },
              namespaces: new[] { "WebBanHangOnline.Controllers" }
          );
            routes.MapRoute(
               name: "Products",
               url: "san-pham",
               defaults: new { controller = "Products", action = "Index", alias = UrlParameter.Optional },
               namespaces: new[] { "WebBanHangOnline.Controllers" }
           );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "WebBanHangOnline.Controllers" }
            );
        }
    }
}
