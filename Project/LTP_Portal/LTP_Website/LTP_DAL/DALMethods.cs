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

        public string connectionString = ConfigurationManager.ConnectionStrings["LabTestPortalConnection"].ConnectionString.ToString();

        #endregion

        public List<DTOStates> GetStates()
        {
            DTOStates dtoStates = null;
            List<DTOStates> lstStates = new List<DTOStates>();
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

            return lstStates;
        }

        public List<DTOPerson> GetPersonDetails(string strFirstName, string strLastName, int nStateId, char cGender, DateTime dtDOB)
        {
            DTOPerson dtoPerson = null;
            List<DTOPerson> lstPerson = new List<DTOPerson>();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("dbo.uspSelectPerson", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                //SqlParameterCollection coll = new SqlParameterCollection();
                //coll.Add(strFirstName);
                //SqlParameter param1=new SqlParameter(strFirstName)
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
                    dtoPerson.PersonID= Convert.ToInt32(reader["PersonId"]);
                    dtoPerson.FirstName  = Convert.ToString(reader["FirstName"]);
                    dtoPerson.LastName = Convert.ToString(reader["LastName"]);
                    dtoPerson.StateID = Convert.ToInt32(reader["StateID"]);
                    dtoPerson.StateCode  = Convert.ToString(reader["StateCode"]);
                    dtoPerson.Gender = Convert.ToChar(reader["Gender"]);
                    dtoPerson.DOB = Convert.ToDateTime(reader["DOB"]);
                    lstPerson.Add(dtoPerson);
                }
            }
            return (lstPerson);
        }
    }
}
