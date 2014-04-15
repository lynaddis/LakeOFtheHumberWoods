<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="homeadmin.aspx.cs" Inherits="homeadmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
    <script src="../js/jquery.js" ></script>
    <script>
        $(function () {
            $('a.toggler').on('click', function () {
                $('+ div', this).toggle();
            });
        });

    </script>

     <div class="page_title" >

           <h2>Welcome Admin!</h2>
        <p> Administrative pages only.  Each editable page can be found in this section.  Select titles for more information on what is on each page, as well as the link to the specific page.  </p>
    </div>
   
        <div id="contentbody_6">
            
                 
<a href="javascript:void(0);" class="links toggler"><h3>+    Create New User</h3></a>
            <div class="page_links" ><p>Pages for adding new patients to the site so they can have access to pay bills online and lab results</p>   <asp:HyperLink ID="hyp_home" runat="server" Text="Create New User" Font-Underline="false" SkinID="hblink_submit" NavigateUrl="~/Admin/addUser.aspx"  />  </div>
            
            <a href="javascript:void(0);" class="links toggler"><h3>+    Edit User</h3></a>
            <div class="page_links" style="display:none">
                
                <p>Page for editing user information for existing users  </p>
                <asp:HyperLink ID="hyp_usr_edit" runat="server" Text="Edit User" Font-Underline="false" SkinID="hblink_submit" NavigateUrl="~/Admin/editUser.aspx"  /></div>

            <a href="javascript:void(0);" class="links toggler"><h3>+    Create New Invoice</h3></a>
            <div class="page_links" style="display:none">
                <p>Page for creating invoices for patients who are registered users on the site to pay their bills.</p>
                <asp:HyperLink ID="hyp_invoce_add" runat="server" Text="Create New Invocie" NavigateUrl="~/Admin/addInvoice.aspx" Font-Underline="false" SkinID="hblink_submit" /></div>

            <a href="javascript:void(0);" class="links toggler"><h3>+    Edit Invoices</h3></a>
            <div class="page_links" style="display:none">
                <p>Page for editing existing patient invoices</p>
                <asp:HyperLink ID="hyp_invoice_edit" runat="server" Text="Edit Invoice" NavigateUrl="~/Admin/editInvoice.aspx" Font-Underline="false" SkinID="hblink_submit" /></div>

           <a href="javascript:void(0);" class="links toggler"><h3>+    Add New Hosptial Branch (Location)</h3></a>
             <div class="page_links" style="display:none">
                 <p>Page for adding a new building location that is affiliated with the hosptial.</p>
                 <asp:HyperLink ID="hyp_location_add" runat="server" Text="Add New Branch" NavigateUrl="~/Admin/addLocation.aspx" Font-Underline="false" SkinID="hblink_submit"  /></div>

           <a href="javascript:void(0);" class="links toggler"><h3>+    Edit Hosptial Locations</h3></a>
             <div class="page_links" style="display:none">
                 <p>Page for editing existing hosptial locations</p>
                 <asp:HyperLink ID="hyp_location_edit" runat="server" Text="Edit Hospital Locations" NavigateUrl="~/admin/editLocation.aspx" Font-Underline="false" SkinID="hblink_submit"  /></div> </div>
    <div id="contentbody_12">

           <a href="javascript:void(0);" class="links toggler"><h3>+    Update Hosptial Wait Times</h3></a>
             <div class="page_links">
                 <p>Page for updating wait times so users can know how long they will be in emergency</p>
                 <asp:HyperLink ID="hyp_waitTimes_edit" runat="server" Text="Update Hospital wait times" NavigateUrl="~/admin/editWait_times.aspx"  Font-Underline="false" SkinID="hblink_submit"  /></div>

           <a href="javascript:void(0);" class="links toggler"><h3>+    Add and Edit Specialists </h3></a>
             <div class="page_links" style="display:none">
                 
                 <p>Page for inserting new visiting specialists to calender for public users. Also contains update and delete sections for all specialist records </p>
                 <asp:HyperLink ID="hyp_Calender" runat="server" Text="Add Specialists to Calendar" NavigateUrl="~/admin/adminspecialists.aspx"  Font-Underline="false" SkinID="hblink_submit"  /></div>
           
           <a href="javascript:void(0);" class="links toggler"><h3>+    View Submitted Contact Forms</h3></a>
             <div class="page_links" style="display:none">
                 <p>Page for editing and reviwing user sumbitted contact forms</p>
                 <asp:HyperLink ID="hyp_ContactUs" runat="server" Text="Contact Us " NavigateUrl="~/admin/AdminContactUs.aspx" Font-Underline="false" SkinID="hblink_submit"  /></div>

           <a href="javascript:void(0);" class="links toggler"><h3>+    Employment Forms</h3></a>
             <div class="page_links" style="display:none">
                 <p>Page for viewing, editing, and deleting submitted employment forms</p>
                 <asp:HyperLink ID="hyp_Emp" runat="server" Text="Employment Admin" NavigateUrl="~/admin/AdminEmployment.aspx" Font-Underline="false" SkinID="hblink_submit"  /></div>

           <a href="javascript:void(0);" class="links toggler"><h3>+    Add New Health Concern</h3></a>
             <div class="page_links" style="display:none">
                 
                 <p>Page for adding new health concerns to page viewable to the public.  </p>
                 <asp:HyperLink ID="hyp_health" runat="server" Text="Add a New Health Concern" NavigateUrl="~/admin/adminhealthconcerns.aspx" Font-Underline="false" SkinID="hblink_submit"  /></div>

            <a href="javascript:void(0);" class="links toggler"><h3>+    Edit Health Concerns</h3></a>
             <div class="page_links" style="display:none">
                 <p>Page to view, update, or delete all health concerns records.  Will also find submitted recommendations here so ensure they are easy to add to exsiting health concern records; can delete recommendation on this page once it has been added to existing public page information</p>

                 <asp:HyperLink ID="hyp_healthupdate" runat="server" Text="Edit Health Concerns" NavigateUrl="~/admin/adminupdatehealth.aspx" Font-Underline="false" SkinID="hblink_submit"  /></div></div>
     <div id="contentbody_18">
            <a href="javascript:void(0);" class="links toggler"><h3>+    Edit Image Slider</h3></a>
            <div class="page_links">
                <p>Page to add, delete, or change images for the image slider on the public home page</p>
                <asp:HyperLink ID="hyp_slider" runat="server" Text="Image Slider admin" NavigateUrl="~/admin/AdminImageSlider.aspx" Font-Underline="false" SkinID="hblink_submit"  /></div>

           <a href="javascript:void(0);" class="links toggler"><h3>+    Administrative</h3></a>
             <div class="page_links" style="display:none">
                 <p>Find aministrative stuff here</p>
                 <asp:HyperLink ID="hyp_administrative" runat="server" Text="Administrative?" NavigateUrl="~/admin/administrative.aspx" Font-Underline="false" SkinID="hblink_submit"  /></div>

           

           <a href="javascript:void(0);" class="links toggler"><h3>+   Volunteer Forms</h3></a>
             <div class="page_links" style="display:none">
                 <p>Page for viewing, updating, approving, and/or deleting submitted volunteer forms.</p>
                 <asp:HyperLink ID="hyp_volunteer" runat="server" Text="Edit Volunteer Forms" NavigateUrl="~/admin/adminvolunteer.aspx" Font-Underline="false" SkinID="hblink_submit"  /></div>

            <a href="javascript:void(0);" class="links toggler"><h3>+    Add New Job Posting</h3></a>
            <div class="page_links" style="display:none">
                <p>Page for adding job postings as needed</p>
                <asp:HyperLink ID="hyp_jobs" runat="server" Text="Job Postings" NavigateUrl="~/admin/jobs.aspx"  Font-Underline="false" SkinID="hblink_submit"  /></div>

            <a href="javascript:void(0);" class="links toggler"><h3>+    Edit Lab Results</h3></a>
            <div class="page_links" style="display:none">
                <p>Page for editing Lab Results information for registered patients.  May also delete lab result information on this page.</p>
                <asp:HyperLink ID="hyp_lab" runat="server" Text="Lab Results" NavigateUrl="~/admin/lab.aspx"  Font-Underline="false" SkinID="hblink_submit"  /></div>

          <a href="javascript:void(0);" class="links toggler"><h3>+    Edit News Updates</h3></a>
              <div class="page_links" style="display:none">
                  <p>

                      Page for editing news updates as they develop or become outdated and need to be removed.

                  </p>
                  <asp:HyperLink ID="hyp_news" runat="server" Text="News Updates" NavigateUrl="~/admin/newsadmin.aspx"  Font-Underline="false" SkinID="hblink_submit"  /></div>
            <a href="javascript:void(0);" class="links toggler"><h3>+   Edit Suggestions</h3></a>
            <div class="page_links" style="display:none">
                <p>Page for viewing and editing submitted suggestions from public users</p>
                <asp:HyperLink ID="hyp_suggestion" runat="server" Text="Suggestion" NavigateUrl="~/admin/sugAdmin.aspx"  Font-Underline="false" SkinID="hblink_submit"  /></div>
        </div>

        


</asp:Content>

