<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="AdminImageSlider.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
    <asp:Panel ID="pnl_main" runat="server">
    <asp:Label ID="lbl_head" runat="server" />
    <table>
         <tr><th></th>
            <th><asp:Label ID="lbl_h" runat="server" Text="Image URL" /></th>
            <th><asp:Label ID="lbl_d" runat="server" Text="Description" /></th>
            <th><asp:Label ID="lbl_option1" runat="server" Text="Option" /></th>
            <th><asp:Label ID="lbl_option2" runat="server" Text="Option" /></th>
            <th><asp:LinkButton ID="LinkButton1" runat="server" Text="Add New Image" OnClick="showAddPanel" /></th>
           
            </tr>
    <asp:Repeater ID="rpt_main" runat="server">
                       
        <ItemTemplate><tr>
           
            <tr>
            <td><asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("id") %>' /></td>
            <td><asp:Label ID="lbl_imgURL"  runat="server" Text='<%#Eval("image_url") %>' /></td>
            <td><asp:Label ID="lbl_desc" runat="server" Text='<%#Eval("description") %>' /></td>
            <td><asp:Button ID="btn_edit" runat="server" Text="Edit" CommandArgument='<%#Eval("id")%>' CommandName="Update" OnCommand="subAdmin" /></td>
            <td><asp:Button ID="btn_del" runat="server" Text="Delete" CommandName="delete" CommandArgument='<%#Eval("id")%>' OnClientClick="return confirm('Confirm Delete?');" OnCommand="subAdmin" /></td>
            
           </tr>
        </ItemTemplate>
    </asp:Repeater>
    </table>
   </asp:Panel>
    <%-- Panel for update operation --%>
    <asp:Panel ID="pnl_update" runat="server" GroupingText="Update Image Information">
       <table>
           <tr><th></th><th><asp:Label ID="lbl_imageurlE" runat="server" Text="Image Url" /></th>
                        <th><asp:Label ID="lbl_descE" runat="server" Text="Description" /></th>
          <th></th> </tr>
        <asp:Repeater ID="rpt_update" runat="server" OnItemCommand="subUpdate">
          <ItemTemplate>
              <tr>
                  <td><asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval("id") %>' /></td>
                  <td><asp:TextBox ID="txt_imgU" runat="server" Text='<%#Eval("image_url") %>' /></td>
                  <td><asp:TextBox ID="txt_descU" runat="server" Text='<%#Eval("description") %>' /></td>
              </tr>
              <tr><td></td>
                  <td><asp:Button ID="btn_update" runat="server" CommandName="update" Text="Update" CommandArgument='<%#Eval("id")%>' OnCommand="subAdmin" /></td>
                  <td><asp:Button ID="btn_cancel" runat="server" CommandName="cancel" Text="Back" OnCommand="subAdmin" /></td>
                   <td></td>
              </tr>
          </ItemTemplate>    
        </asp:Repeater>
      </table>     
    </asp:Panel>
    <%-- Panel to insert new entry --%>
    <asp:Panel ID="pnl_add" runat="server" GroupingText="Add New Image">
        <table>
        <tr>
            <th></th><th><asp:Label ID="lbl_imgURLA" runat="server" Text="Image Url" /></th>
                        <th><asp:Label ID="lbl_descA" runat="server" Text="Description" /></th>
          <th></th> 
        </tr>
        <tr>
            <td><asp:TextBox ID="txt_imgURLA" runat="server" Text='<%#Eval("image_url") %>' /></td>
            <td><asp:TextBox ID="txt_descA" runat="server" Text='<%#Eval("description") %>' /></td>
        </tr>
        <tr>
            <td><asp:LinkButton ID="btn_add" runat="server" Text="ADD" commandname="insert" OnCommand="subAdmin" /></td>
            <td><asp:LinkButton ID="btn_cancel" runat="server" Text="Cancel" CommandName="cancel" OnCommand="subAdmin" /></td>
        </tr>
                  
        </table>
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

