<%@ Page Title="" Language="C#" MasterPageFile="~/pages/MasterPage.master" AutoEventWireup="true" CodeFile="parkingBooking.aspx.cs" Inherits="pages_parkingBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
     <div>
       
            <h3>Get Parking Ticket Number</h3>
            <div>
            Generated parking No Number: 
            <strong><asp:Label ID="lblRandomNumber" runat="server"></asp:Label></strong>
            </div>
            <div>
                <asp:Button ID="btnGenerateNo" runat="server" 
                Text="Click to Generate Random Number" onclick="btnGenerateNo_Click" />
            </div>
        
    </div>
</asp:Content>


