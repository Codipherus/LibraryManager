using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace LibraryManager
{
    public static class DL_Book
    {
        static string ConnectionString = "Data Source = WIN2012BASE; Initial Catalog = LibraryManager; Integrated Security = True;";

        public static Book GetBook(int id)
        {
            var book = new Book();
            var query = "SELECT m.Id, m.Title, a.FirstName + ' ' + a.LastName AS authorname, m.Length, m.Release, m.QtyTotal, m.QtyChecked, m.ISBN, m.AuthorID, m.GenreID, m.SubGenreID, m.PublisherID FROM media AS m LEFT JOIN author AS a ON m.AuthorID = a.AuthorID WHERE id = @ID;";
            using (var con = new SqlConnection(ConnectionString))
            {
                con.Open();
                var cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ID", id);
                var rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    book.Id = Convert.ToInt32(rdr["id"]);
                    book.Title = rdr["title"].ToString();
                    //book.Author = rdr["authorname"].ToString();
                    //book.Release = Convert.ToDateTime(rdr["release"]);
                    //book.Genre = rdr["genre"].ToString();
                    //book.Subgenre = rdr["subgenre"].ToString();
                    //book.Publisher = rdr["publisher"].ToString();
                    book.Length = Convert.ToInt32(rdr["length"]);
                    book.QtyTotal = Convert.ToInt32(rdr["QtyTotal"]);
                    //book.QtyAvailable = Convert.ToInt32(rdr["qty_available"]);
                    book.QtyChecked = Convert.ToInt32(rdr["QtyChecked"]);
                    book.ISBN = rdr["ISBN"].ToString();
                }
            }

            return book;
        }

        public static List<Book> GetList()
        {
            var list = new List<Book>();
            var query = "SELECT m.Id, m.Title, a.FirstName, a.LastName, m.Length, m.Release, m.QtyTotal, m.QtyChecked, m.ISBN, m.AuthorID, m.GenreID, m.SubGenreID, m.PublisherID FROM media AS m LEFT JOIN author AS a ON m.AuthorID = a.AuthorID;";
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
                    book.Author.Id = Convert.ToInt32(rdr["AuthorId"]);
                    book.Author.FirstName = rdr["FirstName"].ToString();
                    book.Author.LastName = rdr["LastName"].ToString();
                    //book.Release = Convert.ToDateTime(rdr["release"]);
                    //book.Genre = rdr["genre"].ToString();
                    //book.Subgenre = rdr["subgenre"].ToString();
                    //book.Publisher = rdr["publisher"].ToString();
                    book.Length = Convert.ToInt32(rdr["length"]);
                    book.QtyTotal = Convert.ToInt32(rdr["QtyTotal"]);
                    //book.QtyAvailable = Convert.ToInt32(rdr["qty_available"]);
                    book.QtyChecked = Convert.ToInt32(rdr["QtyChecked"]);
                    book.ISBN = rdr["ISBN"].ToString();
                    list.Add(book);
                }
            }

            return list;
        }

        public static List<Book> GetListByAuthor(int id)
        {
            var list = new List<Book>();
            var query = "SELECT m.Id, m.Title, a.FirstName, a.LastName, m.Length, m.Release, m.QtyTotal, m.QtyChecked, m.ISBN, m.AuthorID, m.GenreID, m.SubGenreID, m.PublisherID FROM media AS m LEFT JOIN author AS a ON m.AuthorID = a.AuthorID WHERE m.AuthorID = @ID;";
            using (var con = new SqlConnection(ConnectionString))
            {
                con.Open();
                var cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ID", id);
                var rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    var book = new Book();
                    book.Id = Convert.ToInt32(rdr["id"]);
                    book.Title = rdr["title"].ToString();
                    book.Author.Id = Convert.ToInt32(rdr["AuthorId"]);
                    book.Author.FirstName = rdr["FirstName"].ToString();
                    book.Author.LastName = rdr["LastName"].ToString();
                    //book.Release = Convert.ToDateTime(rdr["release"]);
                    //book.Genre = rdr["genre"].ToString();
                    //book.Subgenre = rdr["subgenre"].ToString();
                    //book.Publisher = rdr["publisher"].ToString();
                    book.Length = Convert.ToInt32(rdr["length"]);
                    book.QtyTotal = Convert.ToInt32(rdr["QtyTotal"]);
                    //book.QtyAvailable = Convert.ToInt32(rdr["qty_available"]);
                    book.QtyChecked = Convert.ToInt32(rdr["QtyChecked"]);
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