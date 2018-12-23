<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Person.aspx.cs" MasterPageFile="~/Site.Master" Inherits="LTP_Website.Person" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">--%>
    <asp:content ContentPlaceHolderID="MainContent" runat="server">
        <!-- Bootstrap -->
        <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
        <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
        <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'
        media="screen" />
        <!-- Bootstrap -->
        <!-- Bootstrap DatePicker -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js" type="text/javascript"></script>
        <!-- Bootstrap DatePicker -->
        <script type="text/javascript">
            function SearchInputValidate()
            {
            }
        $(function () {
            $('[id*=txtDOB]').datepicker({
                changeMonth: true,
                changeYear: true,
                format: "mm/dd/yyyy",
                language: "tr"
            });
        });
        </script>
        <h3> Search Person</h3>
        <asp:Label ID="lblFirstName" Text="First Name:" runat="server"></asp:Label>
        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblLastName" Text="Last Name:" runat="server"></asp:Label>
        <asp:TextBox ID="txtLastName"  runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblState" Text="State:" runat="server"></asp:Label>
        <asp:DropDownList ID="ddlState"  runat="server" AppendDataBoundItems="true" DataTextField="StateCode" DataValueField="StateID">
            <asp:ListItem  Text="Select State" Value="0"></asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Label ID="lblGender" Text="Gender:" runat="server"></asp:Label>
        <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" TextAlign="Right" >
            <asp:ListItem Text="Female" Value="F" />
            <asp:ListItem Text="Male" Value="M" />            
        </asp:RadioButtonList>
        <br />
        <asp:Label ID="lblCalendar" Text="DOB:" runat="server"></asp:Label>
        <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnSearch" CausesValidation="true" runat="server" OnClick ="btnSearch_Click" OnClientClick="SearchInputValidate()"/>
        <br />
        <asp:Label ID="lblPerson" runat="server" Text="Person List"></asp:Label>
        <br />
        <asp:GridView ID="GridViewPerson" runat="server" AutoGenerateColumns="false">
             <Columns>  
                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Person ID" Visible="false">  
                            <ItemTemplate>  
                                <asp:Label ID="lblID" runat="server" Text='<%#Eval("PersonId")%>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                        <asp:TemplateField ItemStyle-Width="100px" HeaderText="First Name">  
                            <ItemTemplate>  
                                <asp:Label ID="lblFirstName" runat="server" Text='<%#Eval("FirstName")%>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                        <asp:TemplateField ItemStyle-Width="100px" HeaderText="Last Name">  
                            <ItemTemplate>  
                                <asp:Label ID="lblLastName" runat="server" Text='<%#Eval("LastName")%>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="State ID" Visible="false">  
                            <ItemTemplate>  
                                <asp:Label ID="lblLastName" runat="server" Text='<%#Eval("StateId")%>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                        <asp:TemplateField ItemStyle-Width="100px" HeaderText="State">  
                            <ItemTemplate>  
                                <asp:Label ID="lblState" runat="server" Text='<%#Eval("StateCode")%>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                        <asp:TemplateField ItemStyle-Width="100px" HeaderText="Gender">  
                            <ItemTemplate>  
                                <asp:Label ID="lblState" runat="server" Text='<%#Eval("Gender")%>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                        <asp:TemplateField ItemStyle-Width="100px" HeaderText="Date of Birth">  
                            <ItemTemplate>  
                                <asp:Label ID="lblDOB" runat="server" Text='<%#Eval("DOB")%>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>   
                        <asp:CommandField ShowEditButton="True" />  
                    </Columns>  
        </asp:GridView>
        
    </asp:content>
<%--html--%>
 