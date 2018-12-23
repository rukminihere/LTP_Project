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
            if (!IsPostBack)
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
            string strFirstName = Convert.ToString(txtFirstName.Text);
            string strLastName = Convert.ToString(txtLastName.Text);

            int? nStateId = null;
            if (Convert.ToInt32(ddlState.SelectedItem.Value) != -1)
            {
                nStateId = Convert.ToInt32(ddlState.SelectedItem.Value);
            }
            char? cGender = null;
            if (rblGender.SelectedIndex != -1)
            {
                cGender = Convert.ToChar(rblGender.SelectedItem.Value);
            }
            DateTime? dtDob = null;
            if (!(String.IsNullOrEmpty(txtDOB.Text)))
            {
                dtDob = Convert.ToDateTime(DateTime.Parse(txtDOB.Text).Date);

            }

            LoadPersonGridView(strFirstName, strLastName, nStateId, cGender, dtDob);
        }
        protected void LoadPersonGridView(string strFirstName, string strLastName, int? nStateId, char? Gender, DateTime? dtDOB)
        {
            List<DTOPerson> lstPerson = new List<DTOPerson>();
            DALMethods dalMethods = new DALMethods();
            lstPerson = dalMethods.GetPersonDetails(strFirstName, strLastName, nStateId, Gender, dtDOB);
            GridViewPerson.DataSource = lstPerson;
            GridViewPerson.DataBind();
        }

        protected void GridViewPerson_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Display the company name in italics.
                if (e.Row.Cells[5].Text == "M")
                    e.Row.Cells[5].Text = "Male";
                else if (e.Row.Cells[5].Text == "F")
                    e.Row.Cells[5].Text = "Female";
            }
        }

        protected void btnAddPerson_Click(object sender, EventArgs e)
        {

        }
    }
}