﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using bangazon.Models;
using Dapper;

namespace bangazon.DataAccess
{
    public class TrainingProgramStorage
    {
        private readonly string ConnectionString;

        public TrainingProgramStorage(IConfiguration config)
        {
            ConnectionString = config.GetSection("ConnectionString").Value;
        }

        public IEnumerable<TrainingProgram> GetAllTrainingPrograms()
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                var result = connection.Query<TrainingProgram>(@"SELECT * FROM training_programs");
                return result;
            }
        }

        public IEnumerable<TrainingProgram> GetSingleTrainingProgram(int id)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                var result = connection.Query<TrainingProgram>(
                    @"SELECT *
                    FROM training_programs AS tp
                    WHERE tp.id = @id", new { id }    
                );
                return result;
            }
        }

        public bool AddNewTrainingProgram(TrainingProgram trainingProgram)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                var result = connection.Execute(
                        @"INSERT into [dbo].[training_programs]([start_date], [end_date], [max_attendees])
                        VALUES (@start_date, @end_date, @max_attendees)", trainingProgram
                );
                return result == 1;
            }
        }
    }
}
