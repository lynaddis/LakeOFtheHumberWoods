<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="visitingspecialists.aspx.cs" Inherits="visitingspecialists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_main" Runat="Server">

     <div> <h1>THe Fuck you Calendar</h1>
      <asp:Calendar ID="calSchedule" OnDayRender="Cal_DR" SelectedDate='<%#Bind ("EntryDate") %>' OnSelectionChanged="selectChange" runat="server">
          <DayHeaderStyle BackColor="DeepSkyBlue" />
            <DayStyle BorderStyle="Solid" BorderWidth="2px" />
             </asp:Calendar>

        <asp:Label ID="lbl_output" runat="server" />
   </div>
</asp:Content>

