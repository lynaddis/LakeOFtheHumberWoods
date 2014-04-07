<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="AdminEmployment.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
    <table border="1">
        <asp:Label ID="lbl_message" runat="server" />
        <tr>
                 <th><asp:Label ID="lbl_name" runat="server" Text="Name:" /></th>
                 <th><asp:Label ID="lbl_lnamel" runat="server" Text="Qualification:" /></th>
                 <th><asp:Label ID="lbl_lemail" runat="server" Text="Email:" /></th>
                 <th><asp:Label ID="lbl_view" runat="server" Text="Option" /></th>
                 <th><asp:Label ID="lbl_del" runat="server" Text="Option" /></th>
                 <th><asp:Label ID="lbl_cancel" runat="server" Text="Option" /></th>
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
                  <td><asp:LinkButton ID="lnk_cancel" runat="server" Text="Cancel" CommandName="Cancel" /></td>
<%--               <td><asp:Label ID="lbl_lname" runat="server" Text='<%#Eval("lastname") %>' /></td>
               
               <td><asp:Label ID="lbl_primaryphone" runat="server" Text='<%#Eval("primary_phone") %>'/></td>
               <td><asp:Label ID="lbl_otherphone" runat="server" Text='<%#Eval("other_phone") %>' /></td>
               <td><asp:Label ID="lbl_address" runat="server" Text='<%#Eval("address") %>' /></td>
               <td><asp:Label ID="lbl_pcode" runat="server" Text='<%#Eval("postal_code") %>' /></td>
               <td><asp:Label ID="lbl_state" runat="server" Text='<%#Eval("state") %>' /></td>
               <td><asp:Label ID="lbl_country" runat="server" Text='<%#Eval("country") %>' /></td>
               <td><asp:Label ID="lbl_eduf" runat="server" Text='<%#Eval("edu_date_from") %>' /></td>
               <td><asp:Label ID="lbl_edut" runat="server" Text='<%#Eval("edu_date_to") %>' /></td>
               
               <td><asp:Label ID="lbl_inst" runat="server" Text='<%#Eval("edu_institute") %>' /></td>
               <td><asp:Label ID="lbl_work" runat="server" Text='<%#Eval("work_exp") %>' /></td></tr>--%>
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
