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

        //public string Author;

        //public int AuthorID = 0;

        public Author Author = new Author();

        public DateTime Release;

        public string Genre;

        public int GenreID = 0;

        public string Subgenre;

        public int SubGenreID = 0;

        public string Publisher;

        public int PublisherID = 0;

        public int Length;

        [Display(Name = "Total Quantity")]
        public int QtyTotal;

        [Display(Name = "Number Checked Out")]
        public int QtyChecked;

        [Display(Name = "Available Copies")]
        public int QtyAvailable
        {
            get
            {
                return QtyTotal - QtyChecked;
            }
        }

        public string ISBN;
    }
}