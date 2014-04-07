<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="adminrecommendations.aspx.cs" Inherits="adminrecommendations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">

     <asp:repeater ID="rpt_rec" runat="server">
        <ItemTemplate>
               <br />

            <asp:HiddenField ID="hdf_Id" runat="server" Value='<%#Eval ("Id") %>' />
            
           <asp:label ID="lt_name" runat="server" Text='<%#Eval ("name") %>' />
            <br />
             <asp:label ID="lt_illname" runat="server" Text='<%#Eval ("ill_name") %>' />
            <br />
            <asp:label ID="lt_region" runat="server" Text='<%#Eval ("region") %>' />
            <br />
            <asp:label ID="lt_rec" runat="server" Text='<%#Eval ("recomend") %>' />
            <br />
               <br />
           <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Confirm Delete?');" />
            
               <br />   <br />   <br />
        </ItemTemplate>

    </asp:repeater>

                   <asp:Label ID="lbl_message" runat="server" />

          <a href="adminHealthConcerns.aspx">Back to Health Concerns Input Fields</a>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cph_IB" Runat="Server">

    <asp:repeater ID="Repeater1" runat="server">
        <ItemTemplate>
               <br />

            <asp:HiddenField ID="hdf_Id" runat="server" Value='<%#Eval ("Id") %>' />
            
           <asp:label ID="lt_name" runat="server" Text='<%#Eval ("name") %>' />
            <br />
             <asp:label ID="lt_illname" runat="server" Text='<%#Eval ("ill_name") %>' />
            <br />
            <asp:label ID="lt_region" runat="server" Text='<%#Eval ("region") %>' />
            <br />
            <asp:label ID="lt_rec" runat="server" Text='<%#Eval ("recomend") %>' />
            <br />
               <br />
           <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Confirm Delete?');" />
            
               <br />   <br />   <br />
        </ItemTemplate>

    </asp:repeater>

                   <asp:Label ID="Label1" runat="server" />


</asp:Content>

