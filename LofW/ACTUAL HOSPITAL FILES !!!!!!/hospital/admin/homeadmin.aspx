<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="homeadmin.aspx.cs" Inherits="homeadmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
    
     <div class="page_title" >

           <h2>Welcome Admin!</h2>
        <p>   </p>
    </div>

        <div class="contentBody">
            <ul>
            <li><asp:HyperLink ID="hyp_usr_add" runat="server" Text="Create new user" NavigateUrl="~/Admin/addUser.aspx"  />   </li>
            <li><asp:HyperLink ID="hyp_usr_edit" runat="server" Text="Edit User" NavigateUrl="~/Admin/editUser.aspx" /></li>
            <li><asp:HyperLink ID="hyp_invoce_add" runat="server" Text="Create New Invocie" NavigateUrl="~/Admin/addInvoice.aspx" /></li>
            <li><asp:HyperLink ID="hyp_invoice_edit" runat="server" Text="Edit Invoice" NavigateUrl="~/Admin/editInvoice.aspx" /></li>
            <li><asp:HyperLink ID="hyp_location_add" runat="server" Text="Add New Hospital Branch Location" NavigateUrl="~/Admin/addLocation.aspx" /></li>
            <li><asp:HyperLink ID="hyp_location_edit" runat="server" Text="Edit Hospital Locations" NavigateUrl="~/admin/editLocation.aspx" /></li>
            <li><asp:HyperLink ID="hyp_waitTimes_edit" runat="server" Text="Update Hospital wait times" NavigateUrl="~/admin/editWait_times.aspx" /></li>
            <li><asp:HyperLink ID="hyp_Calender" runat="server" Text="Add Specialists to Calendar" NavigateUrl="~/admin/adminspecialists.aspx" /></li>
            <li><asp:HyperLink ID="hyp_ContactUs" runat="server" Text="ContactUs_Admin" NavigateUrl="~/admin/AdminContactUs.aspx" /></li>
            <li><asp:HyperLink ID="hyp_Emp" runat="server" Text="Employment Admin" NavigateUrl="~/admin/AdminEmployment.aspx" /></li>
            <li><asp:HyperLink ID="hyp_health" runat="server" Text="Add a New Health Concern" NavigateUrl="~/admin/adminhealthconcerns.aspx" /></li>
            <li><asp:HyperLink ID="hyp_slider" runat="server" Text="Image Slider admin" NavigateUrl="~/admin/AdminImageSlider.aspx" /></li>
            <li><asp:HyperLink ID="hyp_administrative" runat="server" Text="Administrative?" NavigateUrl="~/admin/administrative.aspx" /></li>
            <li><asp:HyperLink ID="hyp_healthupdate" runat="server" Text="Update Or Delete Health Concerns" NavigateUrl="~/admin/adminupdatehealth.aspx" /></li>
            <li><asp:HyperLink ID="hyp_volunteer" runat="server" Text="View Submitted Volunteer Forms" NavigateUrl="~/admin/adminvolunteer.aspx" /></li>
            <li><asp:HyperLink ID="hyp_jobs" runat="server" Text="jobs" NavigateUrl="~/admin/jobs.aspx" /></li>
            <li><asp:HyperLink ID="hyp_lab" runat="server" Text="lab" NavigateUrl="~/admin/lab.aspx" /></li>
            <li><asp:HyperLink ID="hyp_news" runat="server" Text="News" NavigateUrl="~/admin/newsadmin.aspx" /></li>
            <li><asp:HyperLink ID="hyp_suggestion" runat="server" Text="Suggestion" NavigateUrl="~/admin/sugAdmin.aspx" /></li>
        </ul>
  <%--              <a href="adminhealthconcerns.aspx">Add a New Health Concern</a>
    <br />
       <br />
   
    <a href="adminupdatehealth.aspx">Update Or Delete Health Concerns</a>

       <br />
    <a href="adminvolunteer.aspx">View Submitted Volunteer Forms</a>
        <br />
       <br />
    <a href="adminCalendar.aspx">Add Specialists to Calendar</a>--%>
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

