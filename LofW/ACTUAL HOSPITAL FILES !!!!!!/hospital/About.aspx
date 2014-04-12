<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_main" Runat="Server">
   
     <div class="page_title" >
    <h2>About Our Project</h2>
         <p>Get to know our team!</p>
</div>
    <div id="about_text">
    words about our projects and stuff.
        </div>
    <div id="about_img">
<asp:Image ID="dinosaur" runat="server" Width="350px" Height="300px" ImageUrl="~/imgs/img1.jpg" />
    
        </div>
</asp:Content>

