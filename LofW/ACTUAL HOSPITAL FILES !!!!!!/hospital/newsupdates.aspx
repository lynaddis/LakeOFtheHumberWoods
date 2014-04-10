<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Master.master" CodeFile="newsupdates.aspx.cs" Inherits="newsupdates" %>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
            <p>Here you can View Our News Events and Activities for the hospital</p>
            <asp:Button ID="btn_news" runat="server" Text="Find News" CommandName="ViewNews" OnClick="btn_news_Click" />
    
       
        <asp:Panel ID="panel3" runat="server">
            <asp:DropDownList ID="ddl_news" AutoPostBack="true" runat="server"  OnSelectedIndexChanged="ddl_news_SelectedIndexChanged"></asp:DropDownList>
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
                            <td> <asp:label ID="lbl_date" runat="server" Text='<%#Eval("Date") %>'></asp:label></td>
                            <td> <asp:label ID="lbl_department" runat="server" Text='<%#Eval("Department") %>'></asp:label></td>
                            <td> <asp:label ID="lbl_details" runat="server" Text='<%#Eval("Details") %>'></asp:label></td>
                            <td> <asp:HyperLink ID="hyp_link" runat="server" Text="Link" NavigateUrl='<%#Eval("Url") %>'></asp:HyperLink></td>
                            </tr>
                    </table>
                </ItemTemplate>
               
            </asp:ListView>
        </asp:Panel>
    </asp:Content>
