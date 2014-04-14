<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="visitingspecialists.aspx.cs" Inherits="visitingspecialists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_main" Runat="Server">

     <div class="page_title"> <h2>The Fuck you Calendar</h2>
         <p>Select a highlighted day for full details on the visiting specialist. Any day that is not highlighted is empty.  Check regularly if all appointment slots are currently full for a specialist you are interested in as they may become available due to a cancellation or extended visiting hours.</p>

     </div>
      <asp:Calendar ID="calSchedule" OnDayRender="Cal_DR" SelectedDate='<%#Bind ("EntryDate") %>' OnSelectionChanged="selectChange" runat="server">
          <DayHeaderStyle BackColor="DeepSkyBlue" />
            <DayStyle BorderStyle="Solid" BorderWidth="2px" />
             </asp:Calendar>
    <div id="cal_output">
        
        <asp:Literal ID="lt_contact" runat="server" Text="Please Call: 705-555-1212 to book an appointment" />
        <br />
        <br />
        <asp:Label ID="lbl_output" runat="server" />
   </div>


</asp:Content>

