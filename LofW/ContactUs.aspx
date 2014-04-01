﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
     <asp:Label ID="lbl_msg" runat="server" />
        <br />
        <table>
            <tr>
                <td><asp:Label ID="lbl_fname" runat="server" Text="First Name " /></td>
                <td><asp:TextBox ID="txt_fname" runat="server" />
                    <asp:RequiredFieldValidator ID="rqv_fname" runat="server" ControlToValidate="txt_fname" ErrorMessage="*Required" />
                </td>                
            </tr>
            <tr>
                <td><asp:Label ID="lbl_lname" runat="server" Text="Last Name " /></td>
                <td><asp:TextBox ID="txt_lname" runat="server" />
                    <asp:RequiredFieldValidator ID="rqv_lname" runat="server" ControlToValidate="txt_lname" ErrorMessage="*Required" />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_tel" runat="server" Text="Telephone " /></td>
                <td><asp:TextBox ID="txt_tel" runat="server" />
                    <asp:RequiredFieldValidator ID="rqv_tel" runat="server" ControlToValidate="txt_tel" ErrorMessage="*Required" />
                    <asp:RegularExpressionValidator ID="rgv_tel" runat="server" ControlToValidate="txt_tel" ValidationExpression="^[0-9]{10}$" 
                        ErrorMessage="Provide valid mobile number, Must be 10 digits" /> <%-- TO make sure Mobile Number is 10 Digits long--%>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_email" runat="server" Text="E-Mail " /></td>
                <td><asp:TextBox ID="txt_email" runat="server" />
                    <asp:RequiredFieldValidator ID="rqv_email" runat="server" ControlToValidate="txt_email" Text="*Required" />
                    <%--<asp:RegularExpressionValidator ID="rgv_email" runat="server" ControlToValidate="txt_email" 
                        ValidationExpression="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$" ErrorMessage="*Enter valid Email" /> <%--To make sure valid E-mail will be entered --%>
                        
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_subject" runat="server" Text="E-Subject " /></td>
                <td><asp:TextBox ID="txt_subject" runat="server" />
                    <asp:RequiredFieldValidator ID="rqv_subject" runat="server" ControlToValidate="txt_subject" ErrorMessage="*Required" />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_message" runat="server" Text="Message Body " /></td>
                <td><asp:TextBox ID="txt_message" runat="server" TextMode="MultiLine" Height="100" />
                    <asp:RequiredFieldValidator ID="rqv_message" runat="server" ControlToValidate="txt_message" ErrorMessage="*Required" />
                </td>
            </tr>
           
            <tr><td></td>
                <td><asp:Button ID="btn_submit" runat="server" Text="Submit" CommandName="Insert" OnCommand="subInsert" /></td>
            </tr>
        </table>
    <asp:ValidationSummary ID="vds_all" runat="server" HeaderText="Please fill in the required fields !" DisplayMode="BulletList" ShowSummary="true" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cph_IB" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cph_donate" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="cph_cal" Runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="cph_map" Runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="cph_other" Runat="Server">
</asp:Content>

