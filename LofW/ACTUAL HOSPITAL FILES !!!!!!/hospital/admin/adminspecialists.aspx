<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="adminspecialists.aspx.cs" Inherits="adminspecialists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">

    <asp:Label ID="lbl_entryDateI" runat="server" Text="EntryDate" />
    <br />
    <asp:TextBox ID="txt_entryDateI" runat="server" />
    <br />
    <asp:Label ID="lbl_appAvailI" runat="server" Text="Time Specialist will be here: " />
    <br />
    <asp:TextBox ID="txt_appAvailI" runat="server" />
    <br />
    <asp:Label ID="lbl_snameI" runat="server" Text="Specialist Name: " />
    <br />
    <asp:TextBox ID="txt_snameI" runat="server"  />
    <br />
    <asp:Label ID="lbl_fieldI" runat="server" Text="Specialist's Field: " />
    <br />
    <asp:TextBox ID="txt_fieldI" runat="server" />
    <br />
 
    <asp:Label ID="lbl_appInfoI" runat="server" Text="Appointment Information"  />
    <br />
        <asp:TextBox ID="txt_appInfoI" runat="server"  />
    <br />
    <asp:Label ID="lbl_timeI" runat="server" Text="Times Available: " />
    <br />
        <asp:TextBox ID="txt_timeI" runat="server"/>
    <br />
    
    <asp:ListView ID="ltv_all" runat="server"></asp:ListView>
</asp:Content>
