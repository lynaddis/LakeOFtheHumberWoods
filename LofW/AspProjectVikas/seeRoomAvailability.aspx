﻿<%@ Page Title="" Language="C#" MasterPageFile="~/pages/MasterPage.master" AutoEventWireup="true" CodeFile="seeRoomAvailability.aspx.cs" Inherits="pages_seeRoomAvailability" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">

    <h1>Room Availabilty List</h1>
    <asp:GridView ID="GridViewShowRoomAvailability"  runat="server" AutoGenerateColumns="False" DataKeyNames="bedId" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="GridViewSearchAll_RowDataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="bedId" HeaderText="bedId" InsertVisible="False" ReadOnly="True" SortExpression="bedId" />
            <asp:BoundField DataField="bedCount" HeaderText="bedCount" SortExpression="bedCount" />
            <asp:BoundField DataField="bedAvailable" HeaderText="bedAvailable" SortExpression="bedAvailable" />
            <asp:BoundField DataField="bedRoomId" HeaderText="bedRoomId" SortExpression="bedRoomId" />
            <asp:BoundField DataField="roomType" HeaderText="roomType" SortExpression="roomType" />
            <asp:BoundField DataField="roomTotleBed" HeaderText="roomTotleBed" SortExpression="roomTotleBed" />
            <asp:BoundField DataField="roomNo" HeaderText="roomNo" SortExpression="roomNo" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

    <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_66299_aspprojectConnectionString %>" SelectCommand="SELECT tblBedRooms.bedId, tblBedRooms.bedCount, tblBedRooms.bedAvailable, tblBedRooms.bedRoomId, tblRoomType.roomType, tblRoomType.roomTotleBed, tblBedRooms.roomNo FROM tblBedRooms INNER JOIN tblRoomType ON tblBedRooms.bedRoomId = tblRoomType.roomId"></asp:SqlDataSource>
        
</asp:Content>
<%--<asp:Content ID="Content5" ContentPlaceHolderID="cph_IB" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cph_donate" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="cph_cal" Runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="cph_map" Runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="cph_other" Runat="Server">
</asp:Content>--%>

