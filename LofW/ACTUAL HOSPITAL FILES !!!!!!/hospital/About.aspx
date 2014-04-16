<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>
<%@ MasterType VirtualPath="~/Master.master" %>
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
    <p>Our team consists of 5 developers who attend Humber College in the poast-graduate website development program.
We have enjoyed the whole process of this project, form initially receiving the previous team’s blueprints and plants for the hospital redesign to the final product that has evolved from document to functional website.
We made lots of changes from the original documents provided to us, however all changes were based on exercises and testing that were performed to determine the best changes for the site.
Our team consists of: </p>
<ul>
    <li>Project Manager: Joel</li>
<li>Assistant Project Manager: Danielle</li>
<li>Documentation Master: Navpreet</li>
<li>Assistant Documentation Master: Vikas</li>
<li>Team Member: Lyn</li>
    </ul>

   
        </div>
    <div id="about_img">
<asp:Image ID="logo" runat="server"  Height="300px" ImageUrl="~/imgs/Logo.png" />
    
        </div>
</asp:Content>

