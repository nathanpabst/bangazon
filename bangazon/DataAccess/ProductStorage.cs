﻿using System;
using Dapper;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using bangazon.Models;

namespace bangazon.DataAccess
{
    public class ProductStorage
    {
        private const string ConnectionInfo = "Server = (local); Database=Bangazon; Trusted_Connection=True";

        public IEnumerable<Product> GetAllProducts()
        {
            using (var connection = new SqlConnection(ConnectionInfo))
            {
                connection.Open();
                var result = connection.Query<Product>(@"select * from product");
                return result;
            }
        }

        public IEnumerable<Product> GetSingleProduct(int id)
        {
            using (var connection = new SqlConnection(ConnectionInfo))
            {
                connection.Open();
                var result = connection.Query<Product>(@"select * 
                                from product as p
                                where p.id = @id", new { id });
                return result;
            }
        }

        public bool AddNewProduct(int category, decimal price, string title, string description, int quantity, int owner_id)
        {
            using (var db = new SqlConnection(ConnectionInfo))
            {
                db.Open();
                var result = db.Execute(
                        @"insert into [dbo].product([category], [price], [title], [description], [quantity], [owner_id])
                        VALUES (@Category, @Price, @Title, @Description, @Quantity, @Owner_Id)", new {category, price, title, description, quantity, owner_id }
                );
                return result == 1;
            }
        }
    }
}