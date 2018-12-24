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
            $('[id*=txtDOB]').datepicker({
                changeMonth: true,
                changeYear: true,
                format: "mm/dd/yyyy",
                language: "tr"
            });
        });
        $(function () {
            $('[id*=txtAddDOB]').datepicker({
                changeMonth: true,
                changeYear: true,
                format: "mm/dd/yyyy",
                language: "tr"
            });
        });

                
        
        function btnAddPerson_Click(title, body) {
            $("#MyPopup .modal-title").html(title);
            $("#MyPopup .modal-body").html(body);
            $("#MyPopup").modal("show");
         }

        </script>
        
        <table style="height:100%; width:100%;">
            <tbody>
                <tr>
                    <td>
                        <table style="height:25%; width:100%;">
                            <tbody>
                                <tr>
                                    <td style="border:2px;">                                        
                                        <asp:Label ID="lblSearchPerson" runat="server" Text="Search Person" CssClass="labelHeader"></asp:Label>
                                        <br />
                                        <br />
                                        <table style="border-style:solid; border:1px;">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblFirstName" Text="First Name:" runat="server" CssClass="labelLeft"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="textboxLeft"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="regvalFirstName" runat="server" ControlToValidate="txtFirstName" ValidationExpression="^([a-zA-Z]+\s*)+$" ErrorMessage="Only letters and spaces allowed.Should not begin with space"></asp:RegularExpressionValidator>
                                                    </td>
                                                    <td>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblLastName" Text="Last Name:" runat="server" CssClass="labelLeft"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtLastName"  runat="server" CssClass="textboxLeft"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="regvalLastName" runat="server" ControlToValidate="txtLastName" ValidationExpression="^([a-zA-Z]+\s*)+$" ErrorMessage="Only letters and spaces allowed.Should not begin with space"></asp:RegularExpressionValidator>
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
                                                        <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" >
                                                            <asp:ListItem Text="Female" Value="F" style="margin-right:20px" />
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
                                                        <asp:TextBox ID="txtDOB" runat="server" CssClass="textboxLeft"></asp:TextBox>
                                                        <asp:CompareValidator ID="cmpvalDOB" runat="server" ControlToValidate="txtDOB" Operator="DataTypeCheck" Type="Date" ErrorMessage="Please enter a valid date"></asp:CompareValidator>
                                                    </td>
                                                    <td>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>

                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btnSearch"  text="Search" CausesValidation="true" runat="server" OnClick ="btnSearch_Click"/>
                                                        <asp:Button ID="btnAddPerson"  text="Add Person" CausesValidation="false" runat="server" OnClick="btnAddPerson_Click" UseSubmitBehavior="false"/>
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
                                        <asp:Label ID="lblSearchResults" runat="server" Text="Person Search Results" CssClass="labelHeader" Visible="false"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:GridView ID="GridViewPerson" runat="server" DataKeyNames="PersonId" AutoGenerateColumns="false" OnRowDataBound="GridViewPerson_RowDataBound" ShowHeaderWhenEmpty="true" 
                                            EmptyDataText="No matching person details found" Width="100%" CssClass="gridviewLayout">
                                             <Columns>                   
                                                 <asp:BoundField DataField="PersonId" HeaderText="Person ID" Visible="false" />
                                                 <asp:BoundField DataField="FirstName" HeaderText="First Name" Visible="true" />
                                                 <asp:BoundField DataField="LastName" HeaderText="Last Name" Visible="true" />
                                                 <asp:BoundField DataField="StateId" HeaderText="State Id" Visible="false" />
                                                 <asp:BoundField DataField="StateCode" HeaderText="State" Visible="true" />
                                                 <asp:BoundField DataField="Gender" HeaderText="Gender" Visible="true" />
                                                 <asp:BoundField DataField="DOB" HeaderText="Date of Birth" Visible="true" />                        
                                                <asp:CommandField ShowEditButton="True" />  
                                            </Columns>  
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
        <div id="MyPopup" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    &times;</button>
                <h4 class="modal-title">
                </h4>
            </div>
            <div class="modal-body">
                <div class="form-group ">
                    <asp:Label ID="lblAddFirstName" Text="First Name:" runat="server" CssClass="labelLeft"></asp:Label>
                    <asp:TextBox ID="txtAddFirstName" runat="server" CssClass="textboxLeft"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqtxtAddFirstName" runat="server" ControlToValidate="txtAddFirstName" ErrorMessage="Please enter a first name."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regAddFirstName" runat="server" ControlToValidate="txtAddFirstName" ValidationExpression="^([a-zA-Z]+\s*)+$" ErrorMessage="Only letters and spaces allowed.Should not begin with space"></asp:RegularExpressionValidator>
                     <br />
                    <br />
                    <asp:Label ID="lblAddLastName" Text="Last Name:" runat="server" CssClass="labelLeft"></asp:Label>
                    <asp:TextBox ID="txtAddLastName"  runat="server" CssClass="textboxLeft"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqtxtAddLastName" runat="server" ControlToValidate="txtAddLastName" ErrorMessage="Please enter a last name."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regAddLastName" runat="server" ControlToValidate="txtAddLastName" ValidationExpression="^([a-zA-Z]+\s*)+$" ErrorMessage="Only letters and spaces allowed.Should not begin with space"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblAddState" Text="State:" runat="server" CssClass="labelLeft"></asp:Label>
                    <asp:DropDownList ID="ddlAddState"  runat="server" AppendDataBoundItems="true" DataTextField="StateCode" DataValueField="StateID" CssClass="dropdownLeft">
                        <asp:ListItem  Text="Select State" Value="-1"></asp:ListItem>
                    </asp:DropDownList>
                    <%--<asp:RequiredFieldValidator ID="reqAddState" runat="server" ControlToValidate="ddlAddState" InitialValue="-1" ErrorMessage="Please select a state."></asp:RequiredFieldValidator>--%>
                    <br />
                    <br />
                    <asp:Label ID="lblAddGender" Text="Gender:" runat="server" CssClass="labelLeft"></asp:Label>                                                    
                    <asp:RadioButtonList ID="rblAddGender" runat="server" RepeatDirection="Horizontal" >
                        <asp:ListItem Text="Female" Value="F" style="margin-right:20px" />
                        <asp:ListItem Text="Male" Value="M" />            
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="reqAddGender" runat="server" ControlToValidate="rblAddGender" ErrorMessage="Please select a Gender."></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblAddDOB" Text="DOB:" runat="server" CssClass="labelLeft"></asp:Label>                                                    
                    <asp:TextBox ID="txtAddDOB" runat="server" CssClass="textboxLeft"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqAddDOB" runat="server" ControlToValidate="txtAddDOB" ErrorMessage="Please enter or select a Date of birth."></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cmpvalAddDOB" runat="server" ControlToValidate="txtAddDOB" Operator="DataTypeCheck" Type="Date" ErrorMessage="Please enter a valid date"></asp:CompareValidator>
                </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="btnSave"  text="Save" CausesValidation="true" runat="server" OnClick ="btnSave_Click"/>
                <button type="button" class="btn btn-danger" data-dismiss="modal">
                    Close</button>
            </div>
        </div>
    </div>
</div>
    </asp:content>

 