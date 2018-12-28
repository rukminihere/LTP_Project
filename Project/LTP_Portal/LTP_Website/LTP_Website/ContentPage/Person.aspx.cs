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

        #region Page Load

        /// <summary>
        /// Page Load Method
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.LoadStates(ddlState);
            }
        }

        #endregion

        #region Functions

        /// <summary>
        /// Method to load the State dropdown
        /// </summary>
        /// <param name="ddl"></param>
        public void LoadStates(DropDownList ddl)
        {
            List<DTOStates> lstStates = new List<DTOStates>();
            DALMethods dalMethods = new DALMethods();
            lstStates = dalMethods.GetStates();

            ddl.DataSource = lstStates;
            ddl.DataBind();
        }

        /// <summary>
        /// Method to load the Person Search Results gridview
        /// </summary>
        /// <param name="strFirstName"></param>
        /// <param name="strLastName"></param>
        /// <param name="nStateId"></param>
        /// <param name="Gender"></param>
        /// <param name="dtDOB"></param>
        protected void LoadPersonGridView(string strFirstName, string strLastName, int nStateId, char Gender, DateTime dtDOB)
        {
            List<DTOPerson> lstPerson = new List<DTOPerson>();
            DALMethods dalMethods = new DALMethods();
            lstPerson = dalMethods.GetPersonDetails(strFirstName, strLastName, nStateId, Gender, dtDOB);
            GridViewPerson.DataSource = lstPerson;
            GridViewPerson.DataBind();
            lblSearchResults.Visible = true;
        }

        /// <summary>
        /// Method to load the Person Search Results gridview
        /// </summary>
        protected void LoadPersonGridView()
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
            List<DTOPerson> lstPerson = new List<DTOPerson>();
            DALMethods dalMethods = new DALMethods();
            lstPerson = dalMethods.GetPersonDetails(strFirstName, strLastName, nStateId, cGender, dtDob);
            GridViewPerson.DataSource = lstPerson;
            GridViewPerson.DataBind();
            lblSearchResults.Visible = true;
        }

        /// <summary>
        /// Method to Reset the Add Person modal details 
        /// </summary>
        protected void ResetAddPersonModalFields()
        {
            this.txtAddFirstName.Text = string.Empty;
            this.txtAddLastName.Text = string.Empty;
            this.ddlAddState.ClearSelection();
            this.rblAddGender.ClearSelection();
            this.txtAddDOB.Text = string.Empty;
        }

        /// <summary>
        /// Method to Reset the Update Person modal details
        /// </summary>
        protected void ResetUpdatePersonFields()
        {
            this.txtEditFirstName.Text = string.Empty;
            this.txtEditLastName.Text = string.Empty;
            this.ddlEditState.ClearSelection();
            this.rblEditGender.ClearSelection();
            this.txtEditDOB.Text = string.Empty;
        }

        #endregion


        #region Event Handlers

        #region Button Event Handlers

        /// <summary>
        /// Search Button Event Handler
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadPersonGridView();
        }

        /// <summary>
        /// Add Person Button Event Handler
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAddPerson_Click(object sender, EventArgs e)
        {
            LoadStates(ddlAddState);
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "AddPerson();", true);
        }

        /// <summary>
        /// Save Button - Add Modal - Event Handler
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAddSave_Click(object sender, EventArgs e)
        {
            Page.Validate("valgrpAddPerson");
            if(Page.IsValid == true)
            {
                int nPersonId = 0;
                string strFirstName = Convert.ToString(txtAddFirstName.Text);
                string strLastName = Convert.ToString(txtAddLastName.Text);
                int nStateId = Convert.ToInt32(ddlAddState.SelectedItem.Value);
                char cGender = Convert.ToChar(rblAddGender.SelectedItem.Value);
                DateTime dtDob = Convert.ToDateTime(DateTime.Parse(txtAddDOB.Text).Date);

                DALMethods dalMethods = new DALMethods();
                if (dalMethods.SavePerson(nPersonId, strFirstName, strLastName, nStateId, cGender, dtDob) == -1)
                {
                    LoadPersonGridView(strFirstName, strLastName, nStateId, cGender, dtDob);
                }

                ResetAddPersonModalFields();
            }         
        }

        /// <summary>
        /// Save Button - Edit Modal - Event Handler
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEditSave_Click(object sender, EventArgs e)
        {
            Page.Validate("valgrpEditPerson");
            if (Page.IsValid == true)
            {
                int nPersonId = 0;
                if (string.IsNullOrEmpty(txtHiddenPersonID.Text) == false)
                {
                    nPersonId = Convert.ToInt32(txtHiddenPersonID.Text);
                }

                string strFirstName = Convert.ToString(txtEditFirstName.Text);
                string strLastName = Convert.ToString(txtEditLastName.Text);
                int nStateId = Convert.ToInt32(ddlEditState.SelectedItem.Value);
                char cGender = Convert.ToChar(rblEditGender.SelectedItem.Value);
                DateTime dtDob = Convert.ToDateTime(DateTime.Parse(txtEditDOB.Text).Date);

                DALMethods dalMethods = new DALMethods();
                if (dalMethods.SavePerson(nPersonId, strFirstName, strLastName, nStateId, cGender, dtDob) == -1)
                {
                    LoadPersonGridView(strFirstName, strLastName, nStateId, cGender, dtDob);
                }

                ResetUpdatePersonFields();
            }
        }

        /// <summary>
        /// Clear Button Event Handler
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnClear_Click(object sender, EventArgs e)
        {
            this.txtFirstName.Text = string.Empty;
            this.txtLastName.Text = string.Empty;
            this.ddlState.ClearSelection();
            this.rblGender.ClearSelection();
            this.txtDOB.Text = string.Empty;
            this.GridViewPerson.DataSource = null;
            this.GridViewPerson.DataBind();
        }

        #endregion

        #region GridView Event Handlers

        /// <summary>
        /// GridView RowDataBound Event Handler
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridViewPerson_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[3].Text == "M")
                {
                    e.Row.Cells[3].Text = "Male";
                }
                else if (e.Row.Cells[3].Text == "F")
                {
                    e.Row.Cells[3].Text = "Female";
                }
            }
        }

        /// <summary>
        /// GridView RowCommand Event Handler
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridViewPerson_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName.Equals("editRecord"))
            {
                int PersonID = Convert.ToInt32(GridViewPerson.DataKeys[index].Values[0].ToString());
                txtHiddenPersonID.Text = Convert.ToString(PersonID);
                txtEditFirstName.Text = GridViewPerson.Rows[index].Cells[0].Text;
                txtEditLastName.Text = GridViewPerson.Rows[index].Cells[1].Text;
                if ((GridViewPerson.Rows[index].Cells[3].Text).Equals("Male"))
                {
                    rblEditGender.SelectedValue = "M";
                }
                else
                {
                    rblEditGender.SelectedValue = "F";
                }

                txtEditDOB.Text = GridViewPerson.Rows[index].Cells[4].Text;

                LoadStates(ddlEditState);
                ddlEditState.SelectedValue = GridViewPerson.DataKeys[index].Values[1].ToString();

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append(@"$('#txtEditDOB').datepicker({changeMonth: true,
                            changeYear: true,
                            format: 'mm/dd/yyyy',
                            language: 'tr'});");
                sb.Append("$('#UpdatePersonModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);
            }
        }    

        /// <summary>
        /// GridView PageIndexChanging Event Handler
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridViewPerson_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewPerson.PageIndex = e.NewPageIndex;
            LoadPersonGridView();
        }    
     

        #endregion

        #endregion

       
    }
}