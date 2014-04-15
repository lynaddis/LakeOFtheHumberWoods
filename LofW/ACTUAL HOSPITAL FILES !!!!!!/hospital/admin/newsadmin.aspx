<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newsadmin.aspx.cs" MasterPageFile="~/admin/adminMaster.master" Inherits="newsadmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
    
     <div class="page_title"><h2>Edit News Updates</h2></div>
    <br />
     <asp:HyperLink ID="hyp_home" runat="server" Text="Back to Home" Font-Underline="false" SkinID="hblink_submit" NavigateUrl="~/Admin/homeadmin.aspx"  />
    <br />
    <asp:Label ID="lbl_message" runat="server" />
        <br />
        <br />
        <table>
            <tr>
                <%--Headings for News info--%>
                <th>Date</th>
                <th>Department </th>
                <th>Details</th> 
                <th>Url</th>
                <th>&nbsp;</th>          
            </tr>
            <tr>
                <td>
                <asp:Label ID="lbl_dateI" runat="server"  AssociatedControlID="txt_dateI" />
                <br />
                <asp:TextBox ID="txt_dateI" runat="server" />
                <asp:RequiredFieldValidator ID="rvf_dateI" runat="server" ControlToValidate="txt_dateI" Text="*Required"  ForeColor="#ff0000"  ValidationGroup="insert" /> <%--user's must enter a date--%>
                </td>
                  
                 <td>
                 <asp:Label ID="lbl_departmentI" runat="server"   AssociatedControlID="txt_departmentI" />
                 <br />
                 <asp:TextBox ID="txt_departmentI" runat="server" /> 
                      <asp:RequiredFieldValidator ID="rvf_department" runat="server" ControlToValidate="txt_departmentI" Text="*Required" ForeColor="#ff0000" SetFocusOnError="true"  ValidationGroup="insert" /> <%--user's must enter department name--%> 
                <asp:RegularExpressionValidator ID="rev_dep" runat="server" ControlToValidate="txt_departmentI" Text="*Please enter a valid Department Name" ErrorMessage="*Error! only text can be inserted" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[A-za-z]{2,}$" ValidationGroup="insert" />
                </td>
               
                <td>
                <asp:Label ID="lbl_details" runat="server"   AssociatedControlID="txt_detailsI" />
                <br />
                <asp:TextBox ID="txt_detailsI" runat="server" />
                     <asp:RequiredFieldValidator ID="rvf_details" runat="server" ControlToValidate="txt_detailsI" SetFocusOnError="true" ForeColor="#ff0000" Text="*Required"  ValidationGroup="insert" /> <%--user's must enter news details--%>
                </td>
               
                <td>
                <asp:Label ID="lbl_url" runat="server"  AssociatedControlID="txt_urlI"  />
                <br />
                <asp:TextBox ID="txt_urlI" runat="server" />
                     <asp:RequiredFieldValidator ID="rvf_url" runat="server" ControlToValidate="txt_urlI" SetFocusOnError="true" ForeColor="#ff0000"  Text="*Required"  ValidationGroup="insert" /> <%--user's must enter a value for news url/link--%>
                </td>
               
                <td>
                <br />
                <%--Buttons for insert and cancel--%>
                <asp:Button ID="btn_insert" runat="server" Text="Insert" SkinID="btn_submit" OnCommand="subAdmin" CommandName="Insert"  ValidationGroup="insert"  />
                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" SkinID="btn_submit" OnCommand="subAdmin" CommandName="Cancel"  />
                <asp:ValidationSummary ID="vds_summary" runat="server" HeaderText="Errors" ShowMessageBox="true"  ValidationGroup="insert" />
               </td>
                </tr>
                <asp:Datalist ID="dlt_all" runat="server" OnItemCommand="subUpDel"> <%--Datalist data bound control --%>
                    <ItemTemplate>
                        <tr>
                            <td>
                            <asp:HiddenField ID="hdf_idE" runat="server" Value ='<%#Eval ("Id") %>' />
                            </td>
                            <td>
                            <asp:TextBox ID="txt_dateE" runat="server" Text='<%#Bind ("Date") %>' />
                            <asp:RequiredFieldValidator ID="rfv_dateE" ControlToValidate="txt_dateE" runat="server" Text="*Required" ValidationGroup="update" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please enter yyyy-mm-dd" />
                            </td>
                            <td>
                            <asp:TextBox ID="txt_departmentE" runat="server" Text='<%#Bind ("Department") %>' />
                            <asp:RegularExpressionValidator ID="rev_dep" runat="server" ControlToValidate="txt_departmentE" Text="*Please enter a valid Department Name" ErrorMessage="*Error! only text can be inserted" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[A-za-z]{2,}$" ValidationGroup="update" />
                            </td>
                            <td>
                            <asp:TextBox ID="txt_detailsE" runat="server" Text='<%#Bind ("Details") %>' />
                            </td>
                            <asp:RequiredFieldValidator ID="rvf_details" runat="server" ControlToValidate="txt_detailsE" Text="*Required"  ValidationGroup="update" /> <%--user's must enter a value for news details--%>
                            <td>
                            <asp:TextBox ID="txt_urlE" runat="server" Text='<%#Bind ("Url") %>' />
                            </td>
                             <asp:RequiredFieldValidator ID="rvf_url" runat="server" ControlToValidate="txt_urlE" Text="*Required"  ValidationGroup="update" /> <%--user's must enter a value for news url/link--%>
                            <td>
                                <asp:Button ID="btn_update" runat="server" Text="Update" SkinID="btn_submit" CommandName ="Update"  ValidationGroup="update"  />
                                <asp:Button ID="btn_delete" runat="server" Text="Delete" SkinID="btn_submit" CommandName="Delete" OnClientClick="return confirm('Confirm Delete?');" />
                                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" SkinID="btn_submit" CommandName="Cancel"  CausesValidation="false"/>
                                <asp:ValidationSummary ID="vds_summ" runat="server" HeaderText="Errors" ShowMessageBox="true"  ShowSummary="true" />
                         </td>
                        </tr>
                    </ItemTemplate>
                   </asp:Datalist>
                  </table>
             <hr />

    </asp:Content>




   