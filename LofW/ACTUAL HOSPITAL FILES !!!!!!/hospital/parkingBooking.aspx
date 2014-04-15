<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="parkingBooking.aspx.cs" Inherits="pages_parkingBooking" %>
<%@ MasterType VirtualPath="~/Master.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
     
        <div class="page_title">
            <h2>Get Parking Ticket Number</h2>

            <p>Please select button to recieve a parking number that you may use in the hosptial parking lot. Numbers recieved are only applicable on the day they are received. </p>

        </div>
    <br />
            <div class="form_back">
                <h3>
Generated parking No Number: 
                </h3>
            
            <strong><asp:Label ID="lblRandomNumber" runat="server"></asp:Label></strong>
           <br /><br />
                <asp:Button ID="btnGenerateNo" runat="server" Text="Click to Generate Random Number" onclick="btnGenerateNo_Click" />
                <br /><br />
            </div>
        
    
</asp:Content>


