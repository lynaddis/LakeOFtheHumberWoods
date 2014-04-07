<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newsupdates.aspx.cs"  MasterPageFile="~/Master.master" Inherits="newsupdates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">

            <p>Here you can View Our News Events & Activities for the hospital</p>
            <asp:Button ID="ButtonEditP1" runat="server" Text="Find News" CommandName="ViewNews" OnClick="ButtonEditP1_Click" />
    
       
        <asp:Panel ID="panel3" runat="server">
            <asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
            <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand">
                <ItemTemplate>
                    <table>
                        <tr>
                            <th>Date</th>
                            <th>Department</th>
                            <th>Details</th>
                            <th>See More....</th>
                            </tr>
                        <tr>
                            
                            <asp:HiddenField ID="hdf_idE" runat="server" Value ='<%#Eval ("Id") %>' /> 
                            <td> <asp:label ID="Label1" runat="server" Text='<%#Eval("Date") %>'></asp:label></td>
                            <td> <asp:label ID="lbl" runat="server" Text='<%#Eval("Department") %>'></asp:label></td>
                            <td> <asp:label ID="Label2" runat="server" Text='<%#Eval("Details") %>'></asp:label></td>
                            <td> <asp:label ID="Label3" runat="server" Text='<%#Eval("Url") %>'></asp:label></td>
                            </tr>
                    </table>
                </ItemTemplate>
               
            </asp:ListView>
        </asp:Panel>
   </asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cph_IB" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cph_donate" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="cph_cal" Runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="cph_map" Runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="cph_other" Runat="Server">
</asp:Content>

