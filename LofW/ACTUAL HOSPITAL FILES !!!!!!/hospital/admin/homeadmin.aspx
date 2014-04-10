<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="homeadmin.aspx.cs" Inherits="homeadmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
    <div id="IMGslide">
                
            </div>
     <div class="banner">
            <div id="textDesc">

             
          
   </div>
         </div>
     <div id="adminhome_title" >

           <h2>Welcome Admin!</h2>
        <p>   </p>
    </div>

        <div class="contentBody">
                <a href="adminhealthconcerns.aspx">Add a New Health Concern</a>
    <br />
       <br />
   
    <a href="adminupdatehealth.aspx">Update Or Delete Health Concerns</a>

       <br />
    <a href="adminvolunteer.aspx">View Submitted Volunteer Forms</a>
        <br />
       <br />
    <a href="adminCalendar.aspx">Add Specialists to Calendar</a>
        </div>
        <div class="sidebar">
        <div class="infectBox">
            
                    <div id="heading">
                        <h3> <a href="adminhealthconcerns.aspx">Edit Health Concerns</a>
    <br /></h3>

                    </div>
                   
                      <asp:GridView ID="grd_health" runat="server" AutoGenerateColumns="false" GridLines="None">
                          <Columns>
                              <asp:TemplateField>
                                  <HeaderTemplate>Trending Illnessess...</HeaderTemplate>
                                  
                                  <ItemTemplate>
                                      
                                      <asp:Label ID="region_home" runat="server" Text='<%#Eval ("Location") %>' /> 
                             <asp:Label ID="illname_Home" runat="server" Text='<%#Eval ("InfectionName") %>' />
                                      </ItemTemplate>
                                  </asp:TemplateField>
                          </Columns>

                      </asp:GridView> 

               
        

        </div>

            <div class="donate">
                <h3><a href="#">Review Donations</a></h3>
           
              Check out our donations

        </div>
            </div>
                <div class="bottomBar">
        <div class="calendar">
 <h3><a href="adminCalendar.aspx">Edit Visiting Specialists</a></h3>
            <asp:GridView ID="home_cal" runat="server" AutoGenerateColumns="false" GridLines="None">
                          <Columns>
                              <asp:TemplateField>
                                  <HeaderTemplate>Trending Illnessess...</HeaderTemplate>
                                  
                                  <ItemTemplate>
                                      
                                      <asp:Label ID="region_home" runat="server" Text='<%#Eval ("") %>' /> 
                           
                                      </ItemTemplate>
                                  </asp:TemplateField>
                          </Columns>

                      </asp:GridView> 
        </div>

            <div class="Maps">
                <h3><a href="#">Maps</a></h3>

        </div>
              <div class="paybills">
        <h3><a href="#">PayBills</a></h3>

        </div>
                    </div>
 


</asp:Content>

