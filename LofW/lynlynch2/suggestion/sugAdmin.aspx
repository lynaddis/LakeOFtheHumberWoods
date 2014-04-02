﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sugAdmin.aspx.cs" Inherits="admin_sugAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:LoginName ID="lgn_name" runat="server" FormatString="Hello, {0}!" /> <%--user's registered user name--%>
        <hr />
         <asp:Label ID="lbl_output" runat="server" /> <asp:LoginStatus ID="lgs_main" runat="server" /> <%--renders login or logout (authenticates)--%>
        <asp:Label ID="lbl_message" runat="server" />
        <br />
        <br />
        <asp:Label ID="lbl_insert" runat="server"  Text="Insert Suggestion"/> <%--Insert begins here--%>
        <br />
        <table>
            <tr>
                <%--Headings for Suggestion info--%>
                <th>Suggestion Type</th>
                <th>First Name </th>
                <th>Last Name</th> 
                <th>Phone Number</th>
                <th>Hours</th>
                <th>Email</th>
                <th>Comment</th>
                <th>&nbsp;</th>          
            </tr>
            <tr>
                <td>
                <asp:Label ID="lbl_suggestionI" runat="server"  AssociatedControlID="txt_suggestionI" />
                <br />
                <asp:TextBox ID="txt_suggestionI" runat="server" />
                </td>
                  <asp:RequiredFieldValidator ID="rvf_suggestionI" runat="server" ControlToValidate="txt_suggestionI" Text="*Required"  ValidationGroup="insert" /> <%--user's must enter a value for product name--%>
                <td>
                 <asp:Label ID="lbl_first" runat="server"   AssociatedControlID="txt_firstI" />
                 <br />
                 <asp:TextBox ID="txt_firstI" runat="server" /> 
                </td>
                <asp:RequiredFieldValidator ID="rvf_first" runat="server" ControlToValidate="txt_firstI" Text="*Required"  ValidationGroup="insert" /> <%--user's must enter a value for product name--%> 
                <td>
                <asp:Label ID="lbl_last" runat="server"   AssociatedControlID="txt_lastI" />
                <br />
                <asp:TextBox ID="txt_lastI" runat="server" />
                </td>
                <asp:RequiredFieldValidator ID="rvf_last" runat="server" ControlToValidate="txt_lastI" Text="*Required"  ValidationGroup="insert" /> <%--user's must enter a value for product description--%>
                <td>
                <asp:Label ID="lbl_phone" runat="server"  AssociatedControlID="txt_phoneI" />
                <br />
                <asp:TextBox ID="txt_phoneI" runat="server" />
                </td>
                <asp:RequiredFieldValidator ID="rvf_phone" runat="server" ControlToValidate="txt_phoneI" Text="*Required"  ValidationGroup="insert" /> <%--user's must enter a value for product description--%>
              
                <td>
                <asp:Label ID="lbl_hours" runat="server"  />
                <br />
                <asp:TextBox ID="txt_hours" runat="server" />
                </td> 
                <asp:RequiredFieldValidator ID="rvf_hours" runat="server" ControlToValidate="txt_hours" Text="*Required" ValidationGroup="insert" />
                <td>
                <asp:Label ID="lbl_emailI" runat="server"  AssociatedControlID="txt_emailI" />
                <br />
                <asp:TextBox ID ="txt_emailI" runat="server" /> 
                </td>
                <asp:RequiredFieldValidator ID="rfv_emailI" runat="server" ControlToValidate="txt_emailI" Text="*Required"  ValidationGroup="insert" /> <%--user's must enter a value for product description--%>
                <td>
                <asp:Label ID="lbl_comment" runat="server"   AssociatedControlID="txt_commentI" />
                <br />
                <asp:TextBox ID ="txt_commentI"  runat="server" /> 
                 </td>
                <asp:RequiredFieldValidator ID="rfv_comment" runat="server" ControlToValidate="txt_commentI" Text="*Required"  ValidationGroup="insert"  Display="Dynamic" /> <%--user's must enter a value for product price--%>
                <td>
                <br />
                <%--Buttons for insert and cancel--%>
                <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subAdmin" CommandName="Insert" ValidationGroup="insert"  />
                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subAdmin" CommandName="Cancel"  />
               </td>
                </tr>
                <asp:Datalist ID="dlt_all" runat="server" OnItemCommand="subUpDel"> <%--Datalist data bound control --%>
                    <ItemTemplate>
                        <tr>
                            <td>
                            <asp:HiddenField ID="hdf_idE" runat="server" Value ='<%#Eval ("Id") %>' />
                            <asp:TextBox ID="txt_suggestionE" runat="server" Text='<%#Bind ("suggestionType") %>' /> 
                            </td>
                            <td>
                            <asp:TextBox ID="txt_firstE" runat="server" Text='<%#Bind ("first") %>' />
                            </td>
                            <td>
                            <asp:TextBox ID="txt_lastE" runat="server" Text='<%#Bind ("last") %>' />
                            </td>
                            <td>
                            <asp:TextBox ID="txt_phoneE" runat="server" Text='<%#Bind ("phone") %>' />
                            </td>
                            <td>
                            <asp:TextBox ID="txt_hoursE" runat="server" Text='<%#Bind ("hours") %>' />
                            </td>
                            <td>
                            <asp:TextBox ID="txt_emailE" runat="server" Text='<%#Bind ("email") %>' />
                            </td>
                            <td>
                            <asp:TextBox ID="txt_commentE" runat="server" Text='<%#Bind ("comment") %>' />
                            </td>
                            <td>
                                <asp:Button ID="btn_update" runat="server" Text="Update" CommandName ="Update"  ValidationGroup="update"  />
                                <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Confirm Delete?');" />
                                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel"  CausesValidation="false"/>
                                <%--<asp:RequiredFieldValidator ID="rfv_" runat="server" Text="*Required" ControlToValidate="txt_nameE" ValidationGroup="update" />
                                <asp:RequiredFieldValidator ID="rfv_descE" runat="server" Text="*Required" ControlToValidate="txt_descE" ValidationGroup="update" />
                                <asp:RequiredFieldValidator ID="rfv_priceE" runat="server" Text="*Required" ControlToValidate="txt_priceE" ValidationGroup="update" />
                                <%--Buttons for insert and cancel, delete --%>
                            </td>
                        </tr>
                    </ItemTemplate>
                   </asp:Datalist>
                  </table>

             <hr />
        <%--extended login control authenticates, creates and change users, redirects user to another page using a url--%>
        <asp:LoginView ID="lgv_main" runat="server" ><%--displays the content based on user's authentication for e.g  logged in user if user is logged in--%>
        <AnonymousTemplate>
            Public user(s)
        </AnonymousTemplate>
        <LoggedInTemplate>
            Logged in user(s)
        </LoggedInTemplate>
    </asp:LoginView>
    </div>
    </form>
</body>
</html>
