<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Person.aspx.cs" MasterPageFile="~/Site.Master" Inherits="LTP_Website.Person" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">--%>
    <asp:content ContentPlaceHolderID="MainContent" runat="server">
        <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
        <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
        <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css' media="screen" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js" type="text/javascript"></script>
        <script type="text/javascript">               
            $(function () {
                        $('#txtDOB').datepicker({
                            changeMonth: true,
                            changeYear: true,
                            format: "mm/dd/yyyy",
                            language: "tr"
                        });
                        $('#txtAddDOB').datepicker({
                            changeMonth: true,
                            changeYear: true,
                            format: "mm/dd/yyyy",
                            language: "tr"
                        });                                               
                    });        
        
        function AddPerson() {
            $("#AddPersonModal").modal("show");
        }
        </script>
        
        <table style="height:100%; width:100%;">
            <tbody>
                <tr>
                    <td>
                        <table style="width:100%;">
                            <tbody>
                                <tr>
                                    <td>   
                                        <div style="background-color:beige; width:100%; padding-top:10px; padding-bottom:10px;">  
                                            <asp:Label ID="lblSearchPerson" runat="server" Text="Search Person" CssClass="labelHeader"></asp:Label>
                                        </div>
                                        <br />
                                        <table style="border-style:solid; border:1px;">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblFirstName" Text="First Name:" runat="server" CssClass="labelLeft"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="textLeft" ClientIDMode="Static" MaxLength="50"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="regvalFirstName" runat="server" ControlToValidate="txtFirstName" 
                                                            ValidationExpression="^([a-zA-Z]+\s*)+$" ErrorMessage="Only letters and spaces allowed.Should not begin with space."
                                                             ValidationGroup="valgrpSearch" EnableClientScript="false"></asp:RegularExpressionValidator>
                                                    </td>
                                                    <td>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblLastName" Text="Last Name:" runat="server" CssClass="labelLeft"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtLastName"  runat="server" CssClass="textLeft" ClientIDMode="Static" MaxLength="50"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="regvalLastName" runat="server" ControlToValidate="txtLastName" 
                                                            ValidationExpression="^([a-zA-Z]+\s*)+$" 
                                                            ErrorMessage="Only letters and spaces allowed.Should not begin with space" ValidationGroup="valgrpSearch"
                                                            EnableClientScript="false"></asp:RegularExpressionValidator>
                                                    </td>
                                                    <td>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblState" Text="State:" runat="server" CssClass="labelLeft"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlState"  runat="server" AppendDataBoundItems="true" DataTextField="StateCode" DataValueField="StateID" CssClass="dropdownLeft">
                                                            <asp:ListItem  Text="Select State" Value="-1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblGender" Text="Gender:" runat="server" CssClass="labelLeft"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" CssClass="radioLeft" >
                                                            <asp:ListItem Text="Female" Value="F" style="margin-right:20px;" />
                                                            <asp:ListItem Text="Male" Value="M" />            
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCalendar" Text="DOB:" runat="server" CssClass="labelLeft"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtDOB" runat="server" CssClass="textLeft" ClientIDMode="Static"></asp:TextBox>                                                       
                                                        <asp:CompareValidator ID="cmpvalDOB" runat="server" ControlToValidate="txtDOB" Operator="DataTypeCheck" Type="Date"
                                                             ErrorMessage="Please enter a valid date." ValidationGroup="valgrpSearch" EnableClientScript="false"></asp:CompareValidator>
                                                    </td>
                                                    <td>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>

                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btnSearch"  text="Search" runat="server" CausesValidation="true" OnClick ="btnSearch_Click" OnClientClick="return(SearchValidate());"
                                                            ValidationGroup="valgrpSearch" CssClass="buttonLeft"/>
                                                        <asp:Button ID="btnAddPerson"  text="Add Person" CausesValidation="false" runat="server" OnClick="btnAddPerson_Click" 
                                                            UseSubmitBehavior="false" CssClass="buttonLeft"/>
                                                        <asp:Button ID="btnClear"  text="Clear" CausesValidation="false" runat="server" OnClick="btnClear_Click"
                                                            CssClass="buttonLeft"/>
                                                    </td>                                                    
                                                    <td>
                                                        
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                        <div style="background-color:beige; width:100%; padding-top:10px; padding-bottom:10px;"> 
                                            <asp:Label ID="lblSearchResults" runat="server" Text="Person Search Results" CssClass="labelHeader"></asp:Label>
                                        </div>
                                        <br />
                                        <div style="width:800px;">
                                        <asp:UpdatePanel ID="updpnlPersonGridView" runat ="server"> 
                                            <ContentTemplate>
                                                <asp:GridView ID="GridViewPerson" runat="server" DataKeyNames="PersonId,StateID" AutoGenerateColumns="false" OnRowDataBound="GridViewPerson_RowDataBound" 
                                                    ShowHeaderWhenEmpty="true" EmptyDataText="No matching person details found" Width="100%" CssClass="gridviewLayout" PageSize="10" 
                                                    OnRowCommand="GridViewPerson_RowCommand" AllowPaging="true" OnPageIndexChanging="GridViewPerson_PageIndexChanging"
                                                    HeaderStyle-BackColor="DarkCyan" HeaderStyle-ForeColor="White">
                                                     <Columns>                   
                                                         <asp:BoundField DataField="FirstName" HeaderText="First Name" Visible="true" />
                                                         <asp:BoundField DataField="LastName" HeaderText="Last Name" Visible="true" />                                                 
                                                         <asp:BoundField DataField="StateCode" HeaderText="State" Visible="true" />
                                                         <asp:BoundField DataField="Gender" HeaderText="Gender" Visible="true" />
                                                         <asp:BoundField DataField="DOB" HeaderText="Date of Birth" Visible="true" DataFormatString="{0:MM/dd/yyyy}" />  
                                                         <asp:ButtonField CommandName="editRecord" ButtonType="Button" Text="Edit" ControlStyle-CssClass="buttonLeft"></asp:ButtonField> 
                                                    </Columns>  
                                                 </asp:GridView>                                                  
                                            </ContentTemplate>                                                                                         
                                        </asp:UpdatePanel>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
   <div id="AddPersonModal" class="modal fade" role="dialog">
    <div class="modal-dialog" style="height:400px; width:800px;">
        <div class="modal-content">
            <div class="modal-header" style="background-color:darkcyan;">
                <button type="button" class="close" data-dismiss="modal" onclick="ClearAddUpdatePersonDetails();">
                    &times;</button>
                <asp:Label ID="lblAddModalTitle" runat="server" Text="Add Person Detail" CssClass="modal-title" Font-Names="Arial"></asp:Label>
            </div>
            <div class="modal-body">
                <div class="form-group ">
                    <asp:UpdatePanel ID="updpnlAddPersonModal" runat="server">
                        <ContentTemplate>
                                <table style="width:100%;">
                                    <tbody>
                                        <table style="border-style:solid; border:1px; width:400px;">
                                            <tbody>
                                                <tr>
                                                    <td style="width:110px;">
                                                        <asp:Label ID="lblAddFirstName" Text="First Name:" runat="server" CssClass="modalLabelLeft"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtAddFirstName" runat="server" CssClass="modalTextLeft" ClientIDMode="Static" MaxLength="50"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="reqtxtAddFirstName" runat="server" ControlToValidate="txtAddFirstName" 
                                                            ErrorMessage="Please enter a first name." ValidationGroup="valgrpAddPerson" EnableClientScript="false"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="regAddFirstName" runat="server" ControlToValidate="txtAddFirstName" 
                                                            ValidationExpression="^([a-zA-Z]+\s*)+$" 
                                                            ErrorMessage="Only letters and spaces allowed.Should not begin with space." ValidationGroup="valgrpAddPerson"
                                                            EnableClientScript="false"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblAddLastName" Text="Last Name:" runat="server" CssClass="modalLabelLeft"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtAddLastName"  runat="server" CssClass="modalTextLeft" ClientIDMode="Static" MaxLength="50"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="reqtxtAddLastName" runat="server" ControlToValidate="txtAddLastName" 
                                                            ErrorMessage="Please enter a last name." ValidationGroup="valgrpAddPerson" EnableClientScript="false"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="regAddLastName" runat="server" ControlToValidate="txtAddLastName"
                                                             ValidationExpression="^([a-zA-Z]+\s*)+$" 
                                                            ErrorMessage="Only letters and spaces allowed.Should not begin with space." 
                                                            ValidationGroup="valgrpAddPerson" EnableClientScript="false"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblAddState" Text="State:" runat="server" CssClass="modalLabelLeft"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlAddState"  runat="server" DataTextField="StateCode" DataValueField="StateID" CssClass="modalDropdownLeft"></asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblAddGender" Text="Gender:" runat="server" CssClass="modalLabelLeft"></asp:Label>  
                                                    </td>
                                                    <td>
                                                        <div style="vertical-align:middle;">
                                                        <asp:RadioButtonList ID="rblAddGender" runat="server" RepeatDirection="Horizontal" CssClass="modalRadioLeft" ClientIDMode="Static" >
                                                            <asp:ListItem Text="Female" Value="F" style="margin-right:20px;"/>
                                                            <asp:ListItem Text="Male" Value="M" />            
                                                        </asp:RadioButtonList>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="reqAddGender" runat="server" ControlToValidate="rblAddGender" ErrorMessage="Please select a Gender."
                                                             ValidationGroup="valgrpAddPerson" EnableClientScript="false"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblAddDOB" Text="DOB:" runat="server" CssClass="modalLabelLeft"></asp:Label>                                                    
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtAddDOB" runat="server" CssClass="modalTextLeft" ClientIDMode="Static"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="reqAddDOB" runat="server" ControlToValidate="txtAddDOB" ErrorMessage="Please enter or select a Date of birth." 
                                                            ValidationGroup="valgrpAddPerson" EnableClientScript="false"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="cmpvalAddDOB" runat="server" ControlToValidate="txtAddDOB" Operator="DataTypeCheck" Type="Date" 
                                                            ErrorMessage="Please enter a valid date." ValidationGroup="valgrpAddPerson" EnableClientScript="false"></asp:CompareValidator>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="btnAddSave" text="Add" CausesValidation="true" runat="server" OnClick ="btnAddSave_Click" OnClientClick="return(AddPersonValidate());" 
                    CssClass="modalButton" ValidationGroup="valgrpAddPerson"/>
                <button type="button" data-dismiss="modal" class="modalButton" onclick="ClearAddUpdatePersonDetails();">Close</button>
            </div>
        </div>
    </div>
</div>
<div id="UpdatePersonModal" class="modal fade" role="dialog">
    <div class="modal-dialog" style="height:400px; width:800px;">
        <div class="modal-content">
            <div class="modal-header" style="background-color:darkcyan;">
                <button type="button" class="close" data-dismiss="modal" onclick="ClearAddUpdatePersonDetails();">
                    &times;</button>
                <asp:Label ID="lblUpdateModalTitle" runat="server" Text="Update Person Detail" CssClass="modal-title" Font-Names="Arial"></asp:Label>
            </div>
            <div class="modal-body">
                <div class="form-group ">
                    <asp:TextBox ID="txtHiddenPersonID" runat="server" Visible="false" ></asp:TextBox>
                    <asp:UpdatePanel ID="updpnlEditPersonalModal" runat="server">                        
                        <ContentTemplate>
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="width:110px;">
                                            <asp:Label ID="lblEditFirstName" Text="First Name:" runat="server" CssClass="modalLabelLeft"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEditFirstName" runat="server" CssClass="modalTextLeft" ClientIDMode="Static" MaxLength="50"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="reqtxtEditFirstName" runat="server" ControlToValidate="txtEditFirstName" ErrorMessage="Please enter a first name." 
                                                ValidationGroup="valgrpEditPerson" EnableClientScript="false"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="regEditFirstName" runat="server" ControlToValidate="txtEditFirstName" ValidationExpression="^([a-zA-Z]+\s*)+$" 
                                                ErrorMessage="Only letters and spaces allowed.Should not begin with space." 
                                                EnableClientScript="false" ValidationGroup="valgrpEditPerson"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblEditLastName" Text="Last Name:" runat="server" CssClass="modalLabelLeft"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEditLastName"  runat="server" CssClass="modalTextLeft" ClientIDMode="Static" MaxLength="50"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="reqtxtEditLastName" runat="server" ControlToValidate="txtEditLastName" ErrorMessage="Please enter a last name." 
                                                ValidationGroup="valgrpEditPerson" EnableClientScript="false"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="regEditLastName" runat="server" ControlToValidate="txtEditLastName" ValidationExpression="^([a-zA-Z]+\s*)+$" 
                                                ErrorMessage="Only letters and spaces allowed.Should not begin with space." 
                                                EnableClientScript="false" ValidationGroup="valgrpEditPerson"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblEditState" Text="State:" runat="server" CssClass="modalLabelLeft"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlEditState"  runat="server" DataTextField="StateCode" DataValueField="StateID" CssClass="modalDropdownLeft"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblEditGender" Text="Gender:" runat="server" CssClass="modalLabelLeft"></asp:Label>
                                        </td>
                                        <td>
                                             <asp:RadioButtonList ID="rblEditGender" runat="server" RepeatDirection="Horizontal" CssClass="modalRadioLeft" ClientIDMode="Static">
                                                <asp:ListItem Text="Female" Value="F" style="margin-right:20px;" />
                                                <asp:ListItem Text="Male" Value="M" />            
                                            </asp:RadioButtonList>
                                            <asp:RequiredFieldValidator ID="reqEditGender" runat="server" ControlToValidate="rblEditGender" 
                                                ErrorMessage="Please select a Gender." EnableClientScript="false"
                                                ValidationGroup="valgrpEditPerson"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblEditDOB" Text="DOB:" runat="server" CssClass="modalLabelLeft"></asp:Label> 
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEditDOB" runat="server" CssClass="modalTextLeft" ClientIDMode="Static"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="reqEditDOB" runat="server" ControlToValidate="txtEditDOB" ErrorMessage="Please enter or select a Date of birth." 
                                                ValidationGroup="valgrpEditPerson" EnableClientScript="false"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="cmpEditDOB" runat="server" ControlToValidate="txtEditDOB" Operator="DataTypeCheck" Type="Date" 
                                                ErrorMessage="Please enter a valid date." ValidationGroup="valgrpEditPerson" EnableClientScript="false"></asp:CompareValidator>                                            
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="btnEditSave" text="Update" CausesValidation="true" runat="server" OnClick="btnEditSave_Click" OnClientClick="return(UpdatePersonValidate());"
                    CssClass="modalButton" ValidationGroup="valgrpEditPerson"/>
                <button type="button" data-dismiss="modal" class="modalButton" onclick="ClearAddUpdatePersonDetails();">Close</button>
            </div>
        </div>
    </div>
</div>
</asp:content>

 