using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LTP_DAL;

namespace LTP_Website
{
    public partial class Person : System.Web.UI.Page
    {
                      
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                this.LoadStates();
            }
            
        }

        public void LoadStates()
        {
            List<DTOStates> lstStates = new List<DTOStates>();
            DALMethods dalMethods = new DALMethods();
            lstStates = dalMethods.GetStates();

            ddlState.DataSource = lstStates;
            ddlState.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string strFirstName= txtFirstName.Text.ToString();
            string strLastName= txtLastName.Text.ToString();
            int nStateId= Convert.ToInt32(ddlState.SelectedItem.Value);
            char cGender= Convert.ToChar(rblGender.SelectedItem.Value);
            DateTime dtDob= DateTime.Parse(txtDOB.Text).Date;
            
            LoadPersonGridView(strFirstName, strLastName, nStateId, cGender, dtDob);
        }
        protected void LoadPersonGridView(string strFirstName, string strLastName,int nStateId,char Gender,DateTime dtDOB)
        {
            List<DTOPerson> lstPerson = new List<DTOPerson>();
            DALMethods dalMethods = new DALMethods();
            lstPerson = dalMethods.GetPersonDetails(strFirstName, strLastName, nStateId, Gender, dtDOB);
            GridViewPerson.DataSource = lstPerson;
            GridViewPerson.DataBind();
        } 

    }
}