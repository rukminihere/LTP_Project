using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace LTP_DAL
{
    public class DALMethods
    {
        #region MemberVariables

        /// <summary>
        /// Connection String Value from Config File
        /// </summary>
        public string connectionString = ConfigurationManager.ConnectionStrings["LabTestPortalConnection"].ConnectionString.ToString();

        #endregion

        #region DAL Methods

        /// <summary>
        /// Method to fetch the States details from DB
        /// </summary>
        /// <returns></returns>
        public List<DTOStates> GetStates()
        {
            DTOStates dtoStates = null;
            List<DTOStates> lstStates = new List<DTOStates>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("dbo.uspStatesList", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataReader reader;
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        dtoStates = new DTOStates();
                        dtoStates.StateID = Convert.ToInt32(reader["ID"]);
                        dtoStates.StateCode = Convert.ToString(reader["CODE"]);
                        lstStates.Add(dtoStates);
                    }
                }                
            }
            catch(Exception ex)
            {
                ErrorHandling.WriteErrorDetails("GetStates", ex);
            }
            return lstStates;
        }

        /// <summary>
        /// Method to fetch the Person details from DB
        /// </summary>
        /// <param name="strFirstName"></param>
        /// <param name="strLastName"></param>
        /// <param name="nStateId"></param>
        /// <param name="cGender"></param>
        /// <param name="dtDOB"></param>
        /// <returns></returns>
        public List<DTOPerson> GetPersonDetails(string strFirstName, string strLastName, int ?nStateId, char ?cGender, DateTime ?dtDOB)
        {
            DTOPerson dtoPerson = null;
            List<DTOPerson> lstPerson = new List<DTOPerson>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("dbo.uspSelectPerson", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("FirstName", strFirstName));
                    cmd.Parameters.Add(new SqlParameter("LastName", strLastName));
                    cmd.Parameters.Add(new SqlParameter("StateId", nStateId));
                    cmd.Parameters.Add(new SqlParameter("Gender", cGender));
                    cmd.Parameters.Add(new SqlParameter("DOB", dtDOB));
                    SqlDataReader reader;
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        dtoPerson = new DTOPerson();
                        dtoPerson.PersonID = Convert.ToInt32(reader["PersonId"]);
                        dtoPerson.FirstName = Convert.ToString(reader["FirstName"]);
                        dtoPerson.LastName = Convert.ToString(reader["LastName"]);
                        dtoPerson.StateID = Convert.ToInt32(reader["StateID"]);
                        dtoPerson.StateCode = Convert.ToString(reader["StateCode"]);
                        dtoPerson.Gender = Convert.ToChar(reader["Gender"]);
                        dtoPerson.DOB = Convert.ToDateTime(reader["DOB"]);
                        lstPerson.Add(dtoPerson);
                    }
                }
            }
            catch(Exception ex)
            {
                ErrorHandling.WriteErrorDetails("GetPersonDetails", ex);
            }

            return (lstPerson);
        }

        /// <summary>
        /// Method to Insert / Update Person details to DB
        /// </summary>
        /// <param name="strFirstName"></param>
        /// <param name="strLastName"></param>
        /// <param name="nStateId"></param>
        /// <param name="cGender"></param>
        /// <param name="dtDOB"></param>
        /// <returns></returns>
        public int SavePerson(int nPersonID, string strFirstName, string strLastName, int nStateId, char cGender, DateTime dtDOB)
        {
            int iResult = 0;
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("dbo.uspPersonUpsert", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("PersonID", nPersonID));
                    cmd.Parameters.Add(new SqlParameter("FirstName", strFirstName));
                    cmd.Parameters.Add(new SqlParameter("LastName", strLastName));
                    cmd.Parameters.Add(new SqlParameter("StateId", nStateId));
                    cmd.Parameters.Add(new SqlParameter("Gender", cGender));
                    cmd.Parameters.Add(new SqlParameter("DateofBirth", dtDOB));
                    iResult = cmd.ExecuteNonQuery();
                }
            }
            catch(Exception ex)
            {
                ErrorHandling.WriteErrorDetails("SavePerson", ex);
            }

            return iResult;
        }

        #endregion
    }
}
