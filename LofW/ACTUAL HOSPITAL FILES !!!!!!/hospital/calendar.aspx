﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="calendar.aspx.cs" Inherits="calendar" %>
<%@ MasterType VirtualPath="~/Master.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
    

      <asp:Calendar ID="calSchedule" OnDayRender="calSchedule_DayRender" runat="server" >
        
      </asp:Calendar>

        <asp:Label ID="lbl_output" runat="server" />
   
   

</asp:Content>

