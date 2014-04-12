<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="AdminContactUs.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">

     <div class="page_title"><h2>Contact Us</h2></div>

    <br />
    <br />
    <asp:Label ID="lbl_msg" runat="server" />   
   <table>
                <tr>
                    
                    <td></td>
                    <td>Subject</td>
                    <td>Option</td>
                    <td>Option</td>                    
                    <td>Option</td>
                </tr>   
   <asp:ListView ID="ltv_main" runat="server" OnItemCommand="subedit">
       <ItemTemplate>
                <tr>
                    <td><asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("Id")%>' /></td>
                    <td><asp:TextBox ID="txt_subject" runat="server" Text='<%#Bind("subject")%>' Width="300" Height="50" /></td>
                    <td><asp:LinkButton ID="lkb_view" runat="server" Text="View" CommandName="xSelect" CommandArgument='<%#Eval("Id")%>' /></td>
                    <td><asp:LinkButton ID="lkb_delete" runat="server" Text="Delete" CommandName="xDelete" OnClientClick="return confirm('Confirm ?')" CausesValidation="false" /></td>
                    <td><asp:LinkButton ID="lkb_update" runat="server" Text="Update" CommandName="xUpdate" /></td>
                </tr>            
        </ItemTemplate>
       </asp:ListView>
     </table>   
    <br />
    <br />
    <%-- To view all details of selected message --%>
    <asp:GridView ID="grd_main" runat="server">
       <Columns>
           <asp:TemplateField>
                             
           </asp:TemplateField>
       </Columns>
    </asp:GridView>
    
</asp:Content>
