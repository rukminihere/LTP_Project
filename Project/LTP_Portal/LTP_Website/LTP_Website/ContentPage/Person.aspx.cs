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
                this.LoadStates(ddlState);
            }

        }

        public void LoadStates(DropDownList ddl)
        {
            List<DTOStates> lstStates = new List<DTOStates>();
            DALMethods dalMethods = new DALMethods();
            lstStates = dalMethods.GetStates();

            ddl.DataSource= lstStates;
            ddl.DataBind();
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
            lblSearchResults.Visible = true;
        }

        protected void GridViewPerson_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[5].Text == "M")
                    e.Row.Cells[5].Text = "Male";
                else if (e.Row.Cells[5].Text == "F")
                    e.Row.Cells[5].Text = "Female";
            }
        }

        protected void btnAddPerson_Click(object sender, EventArgs e)
        {
            LoadStates(ddlAddState);

            string title = "Add New Person";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "btnAddPerson_Click('"+title+"');", true);    
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string strFirstName = Convert.ToString(txtAddFirstName.Text);
            string strLastName = Convert.ToString(txtAddLastName.Text);

            int nStateId = Convert.ToInt32(ddlAddState.SelectedItem.Value);
            
            char cGender = Convert.ToChar(rblAddGender.SelectedItem.Value); 
            
            DateTime dtDob = Convert.ToDateTime(DateTime.Parse(txtAddDOB.Text).Date); 
            

            DALMethods dalMethods = new DALMethods();
            if(dalMethods.SavePerson(strFirstName, strLastName, nStateId, cGender, dtDob) == -1)
            {
                LoadPersonGridView(strFirstName, strLastName, nStateId, cGender, dtDob);
            }

            this.ResetAddPersonFields();      
        }

        protected void ResetAddPersonFields()
        {

        }
    }
}