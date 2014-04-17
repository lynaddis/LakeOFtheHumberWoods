<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="visitingspecialists.aspx.cs" Inherits="visitingspecialists" %>
<%@ MasterType VirtualPath="~/Master.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_main" Runat="Server">

     <div class="page_title"> <h2>Visiting Specialists</h2>
         <p>Select a highlighted day for full details on the visiting specialist. Any day that is not highlighted is empty.  Check regularly if all appointment slots are currently full for a specialist you are interested in as they may become available due to a cancellation or extended visiting hours.</p>
         <%-- Once upon a time there was a calendar that had a way better name than Visiting Specialists. But now it specifies that this is indeed a calendar that displays when visiting specialists will be at the hosptial. !!    --%>
     </div><div id="cal_position">         <%-- have entry date binded as selcted date.  Onselected change needs a subroutine or it can't find table 0! --%>
      <asp:Calendar ID="calSchedule" OnDayRender="Cal_DR" SelectedDate='<%#Bind ("EntryDate") %>' OnSelectionChanged="selectChange" runat="server">
          <DayHeaderStyle BackColor="Wheat" />
            <DayStyle BorderStyle="Solid" BorderWidth="2px" />
             </asp:Calendar></div>
    <div id="cal_output">
                 <%-- put i a literally control to display hospital phone so they can call and book appointments! --%>
        <asp:Literal ID="lt_contact" runat="server" Text="Please Call: 705-555-1212 to book an appointment" />
        <br />
        <br />
        <asp:Label ID="lbl_output" runat="server" />          <%-- outputs all information selected (day selected) ! --%>
   </div>


</asp:Content>

