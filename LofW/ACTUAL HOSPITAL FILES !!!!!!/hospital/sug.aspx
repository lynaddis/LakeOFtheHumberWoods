﻿<%@ Page Language="C#" MasterPageFile="~/Master.master"  AutoEventWireup="true"  CodeFile="sug.aspx.cs" Theme="MenuStyle" Inherits="admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
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
                <asp:RequiredFieldValidator ID="rvf_first" runat="server" ControlToValidate="txt_firstI" Text="*Required"  ValidationGroup="insert" />
                <asp:RegularExpressionValidator ID="rev_name" runat="server" Text="*DataError" ErrorMessage="Not a valid name" ValidationGroup="insert" ControlToValidate="txt_firstI" ValidationExpression="^[a-zA-Z ]*$" />
                <%--user's must enter a value for first name--%> <br />
                <asp:Label ID="lbl_last" runat="server"   AssociatedControlID="txt_lastI" Text="Last Name:" />
                <asp:TextBox ID="txt_lastI" runat="server" />
                <asp:RequiredFieldValidator ID="rvf_last" runat="server" ControlToValidate="txt_lastI" Text="*Required"  ValidationGroup="insert" /> <%--user's must enter a value for last name--%><br />
                <asp:Label ID="lbl_phone" runat="server" Text="Phone Number:"  AssociatedControlID="txt_phoneI" />
                <asp:TextBox ID="txt_phoneI" runat="server" placeholder="000-000-0000" />
                <asp:RequiredFieldValidator ID="rvf_phone" runat="server" ControlToValidate="txt_phoneI" Text="*Required"  ValidationGroup="insert" />
                <asp:RegularExpressionValidator ID="rev_phone"  runat="server" ErrorMessage="Phone Number is not valid" ValidationGroup="insert" ControlToValidate="txt_phoneI"  ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" />  
                <%--user's must enter a value for phone number--%><br />
                <br />
                <asp:Label ID="lbl_hours" runat="server"  Text="Contact Hours"  /><br />
                <asp:RadioButtonList ID="rb_hours" runat="server">
                    <asp:ListItem Selected="True">Morning</asp:ListItem>
                    <asp:ListItem>Evening</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <asp:Label ID="lbl_emailI" runat="server" Text="Email:"  AssociatedControlID="txt_emailI" />
                <asp:TextBox ID ="txt_emailI" runat="server" placeholder="example@address.com" /> 
        <asp:RequiredFieldValidator ID="rfv_emailI" runat="server" ControlToValidate="txt_emailI" Text="*Required"  ValidationGroup="insert" />
        <asp:RegularExpressionValidator ID="rev_email" runat="server" Text="Invalid Email" ControlToValidate="txt_emailI" Display="Dynamic" SetFocusOnError="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email" />
         <%--user's must enter a value for email--%><br />
                <asp:Label ID="lbl_comment" runat="server" Text="Message:"  AssociatedControlID="txt_commentI" />
                <asp:TextBox ID ="txt_commentI" Rows="5" textmode="MultiLine" runat="server" /> 
                <asp:RequiredFieldValidator ID="rvf_comment" runat="server" ControlToValidate="txt_commentI" Text="*Required"  ValidationGroup="insert"  Display="Dynamic" /> <%--user's must enter a value for comment--%><br />
                <br />
                <%--Buttons for insert and cancel--%>
                <asp:Button ID="btn_insert" runat="server" Text="Send" OnClick="btn" OnCommand="subAdmin" CommandName="Insert" ValidationGroup="insert"  />
                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subAdmin" CommandName="Cancel"  />
                <asp:ValidationSummary ID="vds_main" runat="server" HeaderText="Errors:" ShowMessageBox="true" ShowSummary="false" />
                <hr />
        <p>
    <asp:Label ID="DisplayMessage" runat="server" Visible="false" />
</p>  
        <%--extended login control authenticates, creates and change users, redirects user to another page using a url--%>
    </asp:Content>

