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
            var books = DL_Book.GetList().Take(10);
            return View(books);
        }

        public ActionResult Books()
        {
            var list = DL_Book.GetList();
            ViewBag.Alert = Session["Alert"];
            ViewBag.AlertStatus = Session["AlertStatus"];
            ViewBag.AlertMessage = Session["AlertMessage"];
            return View("index_old", list);
        }

        public ActionResult Book(int id)
        {
            var book = DL_Book.GetBook(id);
            return View(book);
        }

        [Authorize]
        public ActionResult Checkout(int id)
        {
            DL_Book.CheckOut(id);
            //ViewBag.Alert = true;
            //ViewBag.AlertStatus = "success";
            //ViewBag.AlertMessage = "Checkout successful!";
            Session["Alert"] = true;
            Session["AlertStatus"] = "success";
            Session["AlertMessage"] = "Checkout successful!";

            return RedirectToAction("books");
        }

        public ActionResult Author(int id)
        {
            var author = DL_Author.GetAuthor(id);
            return View(author);
        }

        public ActionResult SubmitRequest()
        {
            return View();
        }

        [HttpPost]
        [Authorize]
        public ActionResult SubmitRequest(string title, string author)
        {
            DataAccess.RequestTitle(title, author);
            ViewBag.Alert = true;
            ViewBag.AlertStatus = "success";
            ViewBag.AlertMessage = "Request submitted!";
            return View();
        }
    }
}