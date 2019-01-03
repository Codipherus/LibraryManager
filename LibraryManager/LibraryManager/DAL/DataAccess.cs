using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Microsoft.AspNet.Identity;

namespace LibraryManager
{
    public class DataAccess
    {
        static string ConnectionString = "Data Source = WIN2012BASE; Initial Catalog = LibraryManager; Integrated Security = True;";

        public static void RequestTitle(string title, string author)
        {
            var query = "INSERT INTO request(title, author, user_id) VALUES(@Title, @Author, @UserId);";
            using(var con = new SqlConnection(ConnectionString))
            {
                con.Open();
                var cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Author", author);
                cmd.Parameters.AddWithValue("@UserId", HttpContext.Current.User.Identity.GetUserId());
                cmd.ExecuteNonQuery();
            }
        }

    }
}