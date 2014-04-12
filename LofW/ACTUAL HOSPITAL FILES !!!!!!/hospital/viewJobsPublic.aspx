<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="viewJobsPublic.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
     <asp:Label ID="lbl_msg" runat="server" />
     <h1>Employment Opportunities</h1>
     <h3>There are a variety of roles required to deliver world-class health care at Lake of Humber Woods.</h3>
    <table border="1" style="word-wrap: break-word">
        <thead>
                     <tr>
                         <th style="width: 100px;"><asp:Label ID="lbl_htitle" runat="server" Text="Title" /></th>
                         <th style="width: 300px;"><asp:Label ID="lbl_hdesc" runat="server" Text="Description" /></th>
                         <th style="width: 130px;"><asp:Label ID="lbl_hdate" runat="server" Text="Closing Date" /></th>
                         <th style="width: 70px;"><asp:Label ID="lbl_hdept" runat="server" Text="Department" /></th>
                         <th style="width: 70px;"><asp:Label ID="lbl_hstatus" runat="server" Text="Status" /></th>
                         <th><asp:Label ID="lbl_happly" runat="server" Text="Apply now" /></th>
                     </tr>
       </thead>

         <asp:DataList ID="dtl_main" runat="server">
             <ItemTemplate>
                     
                     <tr>
                         <td><asp:Label ID="lbl_title" runat="server" Text='<%#Bind("title")%>' /></td>
                         <td><asp:Label ID="lbl_desc" runat="server" Text='<%#Bind("description")%>' /></td>
                         <td><asp:Label ID="lbl_date" runat="server" Text='<%#Bind("closing_date") %>' /></td>
                         <td><asp:Label ID="lbl_dept" runat="server" Text='<%#Bind("department") %>' /></td>
                         <td><asp:Label ID="lbl_status" runat="server" Text='<%#Bind("status") %>' /></td>
                         <td><asp:button ID="btn_apply" runat="server" Text="Apply" OnClientClick="window.open('employment.aspx', 'OtherPage');" CommandArgument='<%#Eval("Id") %>' /></td>
                     </tr>
                     
                
             </ItemTemplate>
         </asp:DataList>    
         </table>
</asp:Content>


