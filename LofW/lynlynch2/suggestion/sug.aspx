<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sug.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="lbl_insert" runat="server"  Text=""/> <%--Insert begins here--%>
    <br />
        <asp:Label ID="lbl_message" runat="server" />
        <br />
        <br />
             <asp:Label ID="lbl_suggestionI" runat="server" AssociatedControlID="ddl_suggestionType" Text="Suggestion Type" />
             <asp:DropDownList ID="ddl_suggestionType" runat="server" >
               <asp:ListItem>Suggestion</asp:ListItem>
               <asp:ListItem>Complaint</asp:ListItem>
               <asp:ListItem>Compliment</asp:ListItem>
               <asp:ListItem>Other</asp:ListItem>
             </asp:DropDownList>
                <br />
                <asp:Label ID="lbl_first" runat="server"   AssociatedControlID="txt_firstI" Text="First Name:" />
                <asp:TextBox ID="txt_firstI" runat="server" /> 
                <asp:RequiredFieldValidator ID="rvf_first" runat="server" ControlToValidate="txt_firstI" Text="*Required"  ValidationGroup="insert" /> <%--user's must enter a value for first name--%> <br />
                <asp:Label ID="lbl_last" runat="server"   AssociatedControlID="txt_lastI" Text="Last Name:" />
                <asp:TextBox ID="txt_lastI" runat="server" />
                <asp:RequiredFieldValidator ID="rvf_last" runat="server" ControlToValidate="txt_lastI" Text="*Required"  ValidationGroup="insert" /> <%--user's must enter a value for last name--%><br />
                <asp:Label ID="lbl_phone" runat="server" Text="Phone Number:"  AssociatedControlID="txt_phoneI" />
                <asp:TextBox ID="txt_phoneI" runat="server" />
                <asp:RequiredFieldValidator ID="rvf_phone" runat="server" ControlToValidate="txt_phoneI" Text="*Required"  ValidationGroup="insert" /> <%--user's must enter a value for phone number--%><br />
                <br />
                <asp:Label ID="lbl_hours" runat="server"  Text="Contact Hours"  /><br />
                <asp:RadioButtonList ID="rb_hours" runat="server">
                    <asp:ListItem Selected="True">Morning</asp:ListItem>
                    <asp:ListItem>Evening</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <asp:Label ID="lbl_emailI" runat="server" Text="Email:"  AssociatedControlID="txt_emailI" />
                <asp:TextBox ID ="txt_emailI" runat="server" /> 
        <asp:RequiredFieldValidator ID="rfv_emailI" runat="server" ControlToValidate="txt_emailI" Text="*Required"  ValidationGroup="insert" /> <%--user's must enter a value for email--%><br />
                <asp:Label ID="lbl_comment" runat="server" Text="Message:"  AssociatedControlID="txt_commentI" />
                <asp:TextBox ID ="txt_commentI" Rows="5" textmode="MultiLine" runat="server" /> 
                <asp:RequiredFieldValidator ID="rvf_comment" runat="server" ControlToValidate="txt_commentI" Text="*Required"  ValidationGroup="insert"  Display="Dynamic" /> <%--user's must enter a value for comment--%><br />
                <br />
                <%--Buttons for insert and cancel--%>
                <asp:Button ID="btn_insert" runat="server" Text="Send" OnCommand="subAdmin" CommandName="Insert" ValidationGroup="insert"  />
                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subAdmin" CommandName="Cancel"  />
                <hr />
        <%--extended login control authenticates, creates and change users, redirects user to another page using a url--%>
    </div>
    </form>
</body>
</html>
