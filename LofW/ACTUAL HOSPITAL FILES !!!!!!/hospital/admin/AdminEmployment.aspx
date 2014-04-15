<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="AdminEmployment.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">

     <div class="page_title"><h2>Employment</h2></div>
         <br />
       
           <asp:HyperLink ID="hyp_home" runat="server" Text="Back to Home" Font-Underline="false" SkinID="hblink_submit" NavigateUrl="~/Admin/homeadmin.aspx"  />
<br /> <br />
    <table border="1">
   
        <asp:Label ID="lbl_message" runat="server" />
        <tr>
                 <th><asp:Label ID="lbl_name" runat="server" Text="Name:" /></th>
                 <th style="width: 90px;"><asp:Label ID="lbl_lnamel" runat="server" Text="Qualification:" /></th>
                 <th style="width: 150px;"><asp:Label ID="lbl_lemail" runat="server" Text="Email:" /></th>
                 <th><asp:Label ID="lbl_view" runat="server" Text="Option" /></th>
                 <th><asp:Label ID="lbl_del" runat="server" Text="Option" /></th>
                 <%--<th><asp:Label ID="lbl_cancel" runat="server" Text="Option" /></th>--%>
             </tr>
       <asp:datalist ID="dtl_main" runat="server" OnItemCommand="subAdmin">
         <ItemTemplate>
             <tr><td>
                   <asp:HiddenField ID="hdf_Id" runat="server" Value='<%#Eval("Id") %>' />                      
                   <asp:Label ID="lbl_fname" runat="server" Text='<%#Eval("firstname") %>' /></td>
                   <td><asp:Label ID="lbl_level" runat="server" Text='<%#Eval("level") %>' /></td>
                   <td><asp:label ID="lbl_email" runat="server" Text='<%#Eval("email") %>' /></td>
                   <td><asp:LinkButton ID="lnk_view" runat="server" Text="View" CommandName="Select" CommandArgument='<%#Eval("Id")%>' /></td>
                  <td><asp:LinkButton ID="lnk_del" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Confirm ?')" CausesValidation="false" /></td>
                  <%--<td><asp:LinkButton ID="lnk_cancel" runat="server" Text="Cancel" CommandName="Cancel" /></td>--%>
           </ItemTemplate>     
      </asp:datalist>
   </table>

    <asp:GridView ID="grd_main" runat="server">
         <Columns>
           <asp:TemplateField>
                       
           </asp:TemplateField>
       </Columns>
    </asp:GridView>
 </asp:Content>
