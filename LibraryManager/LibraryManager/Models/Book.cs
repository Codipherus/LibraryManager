using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace LibraryManager
{
    public class Book
    {
        public int Id;

        public string Title;

        public string Author;

        public DateTime Release;

        public string Genre;

        public string Subgenre;

        public string Publisher;

        public int Length;

        [Display(Name = "Total Quantity")]
        public int QtyTotal;

        [Display(Name = "Number Checked Out")]
        public int QtyChecked;

        [Display(Name = "Available Copies")]
        public int QtyAvailable;

        public string ISBN;
    }
}