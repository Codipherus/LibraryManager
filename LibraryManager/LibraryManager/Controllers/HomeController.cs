using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LibraryManager.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Landing()
        {
            return View("index");
        }

        public ActionResult Index()
        {
            var list = DL_Book.GetList();
            return View("index_old", list);
        }

        public ActionResult Book(int id)
        {
            var book = DL_Book.GetBook(id);
            return View(book);
        }

        public ActionResult Checkout(int id)
        {
            DL_Book.CheckOut(id);
            return RedirectToAction("index");
        }

        public ActionResult Author(int id)
        {
            var author = DL_Author.GetAuthor(id);
            return View(author);
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