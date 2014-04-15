<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="jobs.aspx.cs" Inherits="jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
      
     <div class="page_title"><h2>Edit Jobs</h2></div>
        
    <br />
     <asp:HyperLink ID="hyp_home" runat="server" Text="Back to Home" Font-Underline="false" SkinID="hblink_submit" NavigateUrl="~/Admin/homeadmin.aspx"  />
    <br />
    <br />
    <asp:Panel ID="pnl_all" runat="server" GroupingText="List of Jobs">
    <table>
        <thead>
            <tr><th><asp:Label ID="lbl_name" runat="server" Text="List of jobs" /></th><th></th>
                                    
                <td><asp:LinkButton ID="LinkButton1" runat="server" Text="Add New Job" OnClick="showAddForm" /></td>
            </tr>
            <tr></tr>
        <tr>
            <th><asp:Label ID="lbl_main" runat="server" Text="Title" /></th>
            <th><asp:Label ID="lbl_option" runat="server" Text="Option" /></th>
            <th><asp:Label ID="lbl_option2" runat="server" Text="Option" /></th>
            
        </tr>
       </thead>
      <asp:Repeater ID="rpt_main" runat="server" >
        <ItemTemplate>
             <tr>
                 <td><asp:Label ID="lbl_desc_show" runat="server" Text='<%#Eval("title")%>' /></td>
                 <td><asp:LinkButton ID="btn_edit" runat="server" Text="Edit" CommandArgument='<%#Eval("id")%>' CommandName="Update" OnCommand="subAdmi1n" /></td>
                 <td><asp:LinkButton ID="btn_delete" runat="server" CommandName="delete" CommandArgument='<%#Eval("id")%>' text="Delete" OnClientClick="return confirm('Confirm ?')" OnCommand="subAdmi1n"/></td>
                 
             </tr>
        </ItemTemplate>
    </asp:Repeater>
   </table>
  </asp:Panel>
    <%--Panel to insert new job entry --%>
    <asp:Panel ID="pnl_add" runat="server" GroupingText="Add New Vacancy">
        <table>
               <tr>
                         <td><asp:HiddenField ID="hdf_idA" runat="server" value='<%#Eval("id")%>' /></td></tr>
                        <tr> <td><asp:label ID="lbl_titleA" runat="server" Text="Title" /></td>
                         <td><asp:TextBox ID="txt_titleA" runat="server" Text='<%#Eval("title") %>' /></td>
                     </tr>
                     <tr>
                       <td><asp:Label ID="lbl_descA" runat="server" Text="Description" /></td>
                       <td><asp:TextBox ID="txt_descA" runat="server" Text='<%#Eval("description") %>' /></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="lbl_closing_dateA" runat="server" Text="Closing Date" /></td>
                        <td><asp:TextBox ID="txt_closing_dateA" runat="server" Text='<%#Eval("closing_date") %>' placeholder="DD/MM/YYYY" /></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="lbl_deptA" runat="server" Text="Department" /></td>
                        <td><asp:TextBox ID="txt_deptA" runat="server" Text='<%#Eval("department") %>' /></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="lbl_statusA" runat="server" Text="Status" /></td>
                        <td><asp:TextBox ID="txt_statusA" runat="server" Text='<%#Eval("status") %>' /></td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:Button ID="btn_add" runat="server" Text="Post" CommandName="insert" OnCommand="subAdmi1n"/>
                            <asp:Button ID="btn_cancelA" runat="server" Text="Cancel" CommandName="cancel" OnCommand="subAdmi1n" />
                        </td>
                    </tr> 
        </table>          
    </asp:Panel>


    <%--<Panel for update job entries--%>
    <asp:Panel ID="pnl_update" runat="server" GroupingText="Update Jobs Posting">
        <table>
            <%--<tr>
                <th><asp:Label ID="lbl_heading" runat="server" Text="Add Job" /></th>
           </tr>--%>
         <asp:Repeater ID="rpt_update" runat="server" OnItemCommand="subUpdate">
                <ItemTemplate>
                     <tr>
                         <td><asp:HiddenField ID="hdf_id" runat="server" value='<%#Eval("id")%>' /></td></tr>
                        <tr> <td><asp:label ID="lbl_title" runat="server" Text="Title" /></td>
                         <td><asp:TextBox ID="txt_title" runat="server" Text='<%#Eval("title") %>' /></td>
                     </tr>
                     <tr>
                       <td><asp:Label ID="lbl_desc" runat="server" Text="Description" /></td>
                       <td><asp:TextBox ID="txt_desc" runat="server" Text='<%#Eval("description") %>' /></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="lbl_closing_date" runat="server" Text="Closing Date" /></td>
                        <td><asp:TextBox ID="txt_closing_date" runat="server" Text='<%#Eval("closing_date") %>' /></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="lbl_dept" runat="server" Text="Department" /></td>
                        <td><asp:TextBox ID="txt_dept" runat="server" Text='<%#Eval("department") %>' /></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="lbl_status" runat="server" Text="Status" /></td>
                        <td><asp:TextBox ID="txt_status" runat="server" Text='<%#Eval("status") %>' /></td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:Button ID="btn_update" runat="server" Text="Post" CommandName="update" CommandArgument='<%#Eval("id")%>' OnCommand="subAdmi1n"/>
                            <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="cancel" CausesValidation="false" OnCommand="subAdmi1n" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>        
        </table>
    </asp:Panel>
   

</asp:Content>
