using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LibraryManager.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var list = DL_Book.GetList();
            return View(list);
        }

        public ActionResult Book(int id)
        {
            var book = DL_Book.GetList().First(x => x.Id == id);
            return View(book);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}