using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace LibraryManager
{
    public class DL_Author
    {
        static string ConnectionString = "Data Source = WIN2012BASE; Initial Catalog = LibraryManager; Integrated Security = True;";

        public static Author GetAuthor(int id)
        {
            var author = new Author();
            var query = "SELECT * FROM author WHERE AuthorId = @ID;";
            using (var con = new SqlConnection(ConnectionString))
            {
                con.Open();
                var cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ID", id);
                var rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    author.Id = Convert.ToInt32(rdr["AuthorId"]);
                    author.FirstName = rdr["FirstName"].ToString();
                    author.LastName = rdr["LastName"].ToString();
                }
            }

            return author;
        }

        public static List<Author> GetList()
        {
            var list = new List<Author>();
            var query = "SELECT * FROM author;";
            using (var con = new SqlConnection(ConnectionString))
            {
                con.Open();
                var cmd = new SqlCommand(query, con);
                var rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    var author = new Author();
                    author.Id = Convert.ToInt32(rdr["id"]);
                    author.FirstName = rdr["FirstName"].ToString();
                    author.LastName = rdr["LastName"].ToString();
                    list.Add(author);
                }
            }

            return list;
        }

    }
}