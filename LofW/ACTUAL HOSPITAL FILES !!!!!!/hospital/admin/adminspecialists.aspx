<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="adminspecialists.aspx.cs" Inherits="adminspecialists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">

    <asp:Label ID="lbl_output" runat="server" />

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
    <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subInsert" CommandName="Insert" /><%-- onCommand for subroutine on code behind called subAdmin --%><br />
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subInsert" CommandName="Cancel" />
    <br />
    
   
    <asp:ListView ID="ltv_all" runat="server" OnItemCommand="subEdit">
  
        <itemTemplate>
            <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval("Id") %>' />
            <br />
            <asp:TextBox ID="txt_entrydateE" runat="server" Text='<%#Bind("EntryDate") %>' />
            <br />
            <asp:TextBox ID="txt_snameE" runat="server" Text='<%#Bind("SpecialistName") %>' />
            <br />
            <asp:TextBox ID="txt_fieldE" runat="server" Text='<%#Bind("SpecialistField") %>' />
            <br />
            <asp:TextBox ID="txt_appAvailE" runat="server" Text='<%#Bind("AppAvail") %>' />
            <br />
            <asp:TextBox ID="txt_appInfoE" runat="server" Text='<%#Bind("AppInfo") %>' />
            <br />
            <asp:TextBox ID="txt_timesAvailE" runat="server" Text='<%#Bind("TimesAvail") %>' />
            <br />
            <asp:LinkButton ID="update" runat="server" Text="Update" CommandName="UpdateE"  />
        <br />
        <asp:LinkButton ID="delete" runat="server" Text="Delete" CommandName="DeleteE" OnClientClick="return confirm('Confirm Delete?')" />
             <br />
         <asp:LinkButton ID="Cancel" runat="server" Text="Cancel" CommandName="CancelE"  />


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
</asp:Content>
