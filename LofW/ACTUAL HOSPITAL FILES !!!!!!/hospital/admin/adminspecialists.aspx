<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="adminspecialists.aspx.cs" Inherits="adminspecialists" %>
<%@ MasterType VirtualPath="~/admin/adminMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">


     <div class="page_title"><h2>Add, Update, or Delete Specialist Appointments</h2>

            <p>Add or edit visiting specialist for the calendar on public pages.  </p>
     </div>
    <br />
    <br />
     <asp:HyperLink ID="hyp_home" runat="server" Text="Back to Home" Font-Underline="false" SkinID="hblink_submit" NavigateUrl="~/Admin/homeadmin.aspx"  />
<br /><br />
    <div id="insert_special">
        <h3>Add New Specialist to Calendar</h3>
    
    <asp:Label ID="lbl_output" runat="server" />
        <br />
        <br />
    <asp:Label ID="lbl_entryDateI" runat="server" Text="EntryDate" />
     
    <br />
    <asp:TextBox ID="txt_entryDateI" runat="server" />
          <asp:RequiredFieldValidator ID="rfv_entryDate" runat="server" ControlToValidate="txt_entryDateI" SetFocusOnError="true" ErrorMessage="Please enter date" Text="*Required" Display="Dynamic" ValidationGroup="cal_val" />
    <asp:CompareValidator ID="com_date" runat="server" ControlToValidate="txt_entryDateI" Operator="DataTypeCheck" Type="Date" Text="Invalid Date!" ErrorMessage="Please Enter Correct Date Format (YYYY/MM/DD)" ValidationGroup="cal_val" />  
    <br />
  
    <asp:Label ID="lbl_snameI" runat="server" Text="Specialist Name: " />
    <br />
    <asp:TextBox ID="txt_snameI" runat="server"  />
        <asp:RequiredFieldValidator ID="rfv_sname" runat="server" ControlToValidate="txt_snameI" SetFocusOnError="true" ErrorMessage="Please Add Specialist Name" Text="*Required" Display="Dynamic" ValidationGroup="cal_val" />
    <br />
    <asp:Label ID="lbl_fieldI" runat="server" Text="Specialist's Field: " />
    <br />
    <asp:TextBox ID="txt_fieldI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_fieldI" runat="server" ControlToValidate="txt_fieldI" SetFocusOnError="true" ErrorMessage="Please Add Specialist Field" Text="*Required" Display="Dynamic" ValidationGroup="cal_val" /><br />
    <asp:Label ID="lbl_appAvailI" runat="server" Text="Time Specialist will be here " />
    <br />
    <asp:TextBox ID="txt_appAvailI" runat="server" />
        <asp:RequiredFieldValidator ID="rfv_appAvailI" runat="server" ControlToValidate="txt_appAvailI" SetFocusOnError="true" ErrorMessage="Please Add Available Appointment Information" Text="*Required" Display="Dynamic" ValidationGroup="cal_val" />
    <br />
 
    <asp:Label ID="lbl_appInfoI" runat="server" Text="Appointment Information"  />
    <br />
        <asp:TextBox ID="txt_appInfoI" runat="server"  />
              <asp:RequiredFieldValidator ID="rfv_appInfoI" runat="server" ControlToValidate="txt_appInfoI" SetFocusOnError="true" ErrorMessage="Please Add Appointment Information" Text="*Required" Display="Dynamic" ValidationGroup="cal_val" />
    <br />
    <asp:Label ID="lbl_timeI" runat="server" Text="Times Available: " />
    <br />
        <asp:TextBox ID="txt_timeI" runat="server"/>
        <asp:RequiredFieldValidator ID="rfv_timeI" runat="server" ControlToValidate="txt_timeI" SetFocusOnError="true" ErrorMessage="Please Add Avail Appointment Times" Text="*Required" Display="Dynamic" ValidationGroup="cal_val" />
    <br />
    <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subInsert" CommandName="Insert" SkinID="btn_submit" ValidationGroup="cal_val" /><%-- onCommand for subroutine on code behind called subAdmin --%>
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subInsert" CommandName="Cancel" SkinID="btn_submit" CausesValidation="false" />
    <br />
        <asp:ValidationSummary ID="cv_CalInsert" runat="server" ValidationGroup="cal_val" ShowMessageBox="true" HeaderText="Errors!" />
        <br />
    </div>

   
       <div id="update_special">
             <h3>Update or Remove Specialist Appointments</h3>
             <asp:Button ID="btn_update" runat="server" Text="Update Existing Records" OnCommand="subInsert" CommandName="Cancel" SkinID="btn_update" />
            <br />
            

    <asp:ListView ID="ltv_all" runat="server" OnItemCommand="subEdit" OnPagePropertiesChanging="ltv_allChange">
  
        <itemTemplate>
            <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval("Id") %>' />
            <asp:Label ID="lbl_entryDateE" runat="server" Text="EntryDate" />
         <br />
            <asp:TextBox ID="txt_entrydateE"  runat="server" Text='<%#Bind("EntryDate") %>' />
            <asp:RequiredFieldValidator ID="rfv_entryDate" runat="server" ControlToValidate="txt_entrydateE" SetFocusOnError="true" ErrorMessage="Please enter date" Text="*Required" Display="Dynamic" ValidationGroup="illess_val" />
    <asp:CompareValidator ID="com_date" runat="server" ControlToValidate="txt_entrydateE" Operator="DataTypeCheck" Type="Date" Text="Invalid Date!" ErrorMessage="Please Enter Correct Date Format (YYYY/MM/DD)" ValidationGroup="cal_valE" />  
            <br />
             <asp:Label ID="lbl_snameE" runat="server" Text="Specialist Name: " />
          <br />
            <asp:TextBox ID="txt_snameE" runat="server" Text='<%#Bind("SpecialistName") %>' />
                 <asp:RequiredFieldValidator ID="rfv_snameE" runat="server" ControlToValidate="txt_snameE" SetFocusOnError="true" ErrorMessage="Please Add Specialist Name" Text="*Required" Display="Dynamic" ValidationGroup="cal_valE" />
            <br />
    <asp:Label ID="lbl_fieldE" runat="server" Text="Specialist's Field: " />
  <br />
            <asp:TextBox ID="txt_fieldE"  runat="server" Text='<%#Bind("SpecialistField") %>' />
                    <asp:RequiredFieldValidator ID="rfv_sFieldE" runat="server" ControlToValidate="txt_fieldE" SetFocusOnError="true" ErrorMessage="Please Add Specialist Field" Text="*Required" Display="Dynamic" ValidationGroup="cal_valE" />
            <br />
             <asp:Label ID="lbl_appAvailE" runat="server" Text="Time Specialist will be here: " />
       <br />
            <asp:TextBox ID="txt_appAvailE" runat="server" Text='<%#Bind("AppAvail") %>' />
            <asp:RequiredFieldValidator ID="rfv_appAvailE" runat="server" ControlToValidate="txt_appAvailE" SetFocusOnError="true" ErrorMessage="Please Add Available Appointment Information" Text="*Required" Display="Dynamic" ValidationGroup="cal_valE" />
            <br />
            <asp:Label ID="lbl_appInfoI" runat="server" Text="Appointment Information"  /><br />
            <asp:TextBox ID="txt_appInfoE" TextMode="MultiLine" Rows="3" runat="server" Text='<%#Bind("AppInfo") %>' />
                   <asp:RequiredFieldValidator ID="rfv_appInfoE" runat="server" ControlToValidate="txt_appInfoE" SetFocusOnError="true" ErrorMessage="Please Add Appointment Information" Text="*Required" Display="Dynamic" ValidationGroup="cal_valE" />
            <br />
             <asp:Label ID="lbl_timeI" runat="server" Text="Times Available: " /><br />
            <asp:TextBox ID="txt_timesAvailE" TextMode="MultiLine" Rows="3" runat="server" Text='<%#Bind("TimesAvail") %>' />
                <asp:RequiredFieldValidator ID="rfv_timeE" runat="server" ControlToValidate="txt_timesAvailE" SetFocusOnError="true" ErrorMessage="Please Add Avail Appointment Times" Text="*Required" Display="Dynamic" ValidationGroup="cal_valE" />
            <br />
            <asp:LinkButton ID="update" runat="server" Text="Update" CommandName="UpdateE" SkinID="link_submit" Font-Underline="false" ValidationGroup="cal_valE"  />
        
        <asp:LinkButton ID="delete" runat="server" Text="Delete" CommandName="DeleteE" OnClientClick="return confirm('Confirm Delete?')" SkinID="link_submit" Font-Underline="false"  />
           
         <asp:LinkButton ID="Cancel" runat="server" Text="Cancel" CommandName="CancelE" SkinID="link_submit" Font-Underline="false" />

            <br /> <br />
        </itemTemplate>
      


    </asp:ListView>
            <asp:ValidationSummary ID="vs_calE" runat="server" ValidationGroup="cal_valE" ShowMessageBox="true" HeaderText="Errors!" />
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
