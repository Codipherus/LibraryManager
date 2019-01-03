using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace LibraryManager
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Book",
                url: "book/{id}",
                defaults: new { controller = "Home", action = "Book", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Books",
                url: "books",
                defaults: new { controller = "Home", action = "books" }
            );

            routes.MapRoute(
                name: "Author",
                url: "author/{id}",
                defaults: new { controller = "Home", action = "Author", id = UrlParameter.Optional }    
            );

            routes.MapRoute("Request", "submit-request", new { controller = "home", action = "submitrequest" });

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

        }
    }
}
