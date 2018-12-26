using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace LibraryManager
{
    public class Author
    {
        [Display(AutoGenerateField = false)]
        public int Id;

        [Display(Name = "First Name", AutoGenerateField = false)]
        public string FirstName;

        [Display(Name = "Last Name", AutoGenerateField = false)]
        public string LastName;

        [Display(Name = "Name")]
        public string FullName
        {
            get
            {
                return FirstName + " " + LastName;
            }
        }
    }
}