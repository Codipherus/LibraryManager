using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace LibraryManager
{
    public static class DL_Book
    {
        static string ConnectionString = new SqlConnection("Data Source = WIN2012BASE; Initial Catalog = LibraryManager; Integrated Security = True;").ToString();

        public static List<Book> GetList()
        {
            var list = new List<Book>();
            var query = "SELECT * FROM media;";
            using(var con = new SqlConnection(ConnectionString))
            {
                con.Open();
                var cmd = new SqlCommand(query, con);
                var rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    var book = new Book();
                    book.Id = Convert.ToInt32(rdr["id"]);
                    book.Title = rdr["title"].ToString();
                    book.Author = rdr["author"].ToString();
                    book.Release = Convert.ToDateTime(rdr["release"]);
                    book.Genre = rdr["genre"].ToString();
                    book.Subgenre = rdr["subgenre"].ToString();
                    book.Publisher = rdr["publisher"].ToString();
                    book.Length = Convert.ToInt32(rdr["length"]);
                    book.QtyTotal = Convert.ToInt32(rdr["qty_total"]);
                    //book.QtyAvailable = Convert.ToInt32(rdr["qty_available"]);
                    book.QtyChecked = Convert.ToInt32(rdr["qty_checked"]);
                    book.ISBN = rdr["ISBN"].ToString();
                    list.Add(book);
                }
            }

            return list;
        }

        public static void CheckOut(int id)
        {
            var query = "UPDATE media SET qty_checked = qty_checked - 1;";
            using (var con = new SqlConnection(ConnectionString))
            {
                var cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
            }
        }
    }
}