<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="adminspecialists.aspx.cs" Inherits="adminspecialists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
     <div class="page_title"><h2>Add, Update, or Delete Specialist Appointments</h2></div>

    <div id="insert_special">
        <h3>Add New Specialist to Calendar</h3>
       
    <asp:Label ID="lbl_output" runat="server" />
        <br />
        <br />
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
    <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subInsert" CommandName="Insert" SkinID="btn_submit" /><%-- onCommand for subroutine on code behind called subAdmin --%>
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subInsert" CommandName="Cancel" SkinID="btn_submit" />
    <br />
        <br />
    </div>

   
       <div id="update_special">
             <h3>Update or Remove Specialist Appointments</h3>
             <asp:Button ID="btn_update" runat="server" Text="Update Existing Records" OnCommand="subInsert" CommandName="Cancel" SkinID="btn_update" />
            <br />
            

    <asp:ListView ID="ltv_all" runat="server" OnItemCommand="subEdit" OnPagePropertiesChanging="ltv_allChange">
  
        <itemTemplate>
            <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval("Id") %>' />
            <br />
            <asp:TextBox ID="txt_entrydateE"  runat="server" Text='<%#Bind("EntryDate") %>' />
            <br />
            <asp:TextBox ID="txt_snameE" runat="server" Text='<%#Bind("SpecialistName") %>' />
            <br />
            <asp:TextBox ID="txt_fieldE"  runat="server" Text='<%#Bind("SpecialistField") %>' />
            <br />
            <asp:TextBox ID="txt_appAvailE" TextMode="MultiLine" Rows="3" runat="server" Text='<%#Bind("AppAvail") %>' />
            <br />
            <asp:TextBox ID="txt_appInfoE" TextMode="MultiLine" Rows="3" runat="server" Text='<%#Bind("AppInfo") %>' />
            <br />
            <asp:TextBox ID="txt_timesAvailE" TextMode="MultiLine" Rows="3" runat="server" Text='<%#Bind("TimesAvail") %>' />
            <br />
            <asp:LinkButton ID="update" runat="server" Text="Update" CommandName="UpdateE" SkinID="link_submit" Font-Underline="false"  />
        
        <asp:LinkButton ID="delete" runat="server" Text="Delete" CommandName="DeleteE" OnClientClick="return confirm('Confirm Delete?')" SkinID="link_submit" Font-Underline="false" />
           
         <asp:LinkButton ID="Cancel" runat="server" Text="Cancel" CommandName="CancelE" SkinID="link_submit" Font-Underline="false" />

            <br /> <br />
        </itemTemplate>
      


    </asp:ListView>
     <asp:DataPager ID="dp_listAll" runat="server" PagedControlID="ltv_all" PageSize="1">
                <Fields>
                    <%--the first, previous, next, last page options are available--%>
                    <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowNextPageButton="false" />
                    <asp:NumericPagerField ButtonType="Link" />
                    <asp:NextPreviousPagerField ShowNextPageButton="true" ShowLastPageButton="true" ShowPreviousPageButton="false" />
                </Fields>
</asp:DataPager>
</div>
</asp:Content>
