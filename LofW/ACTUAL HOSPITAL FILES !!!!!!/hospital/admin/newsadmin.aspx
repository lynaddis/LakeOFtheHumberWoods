<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newsadmin.aspx.cs" MasterPageFile="~/Master.master"  Inherits="newsadmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">


    <asp:Label ID="lbl_message" runat="server" />
        <br />
        <br />
        <asp:Label ID="lbl_insert" runat="server"  Text="Insert News"/> <%--Insert begins here--%>
        <br />
        <table>
            <tr>
                <%--Headings for Suggestion info--%>
                <th>Publish Before</th>
                <th>Publish After </th>
                <th>Department</th> 
                <th>Date</th>
                <th>&nbsp;</th>          
            </tr>
            <tr>
                <td>
                <asp:Label ID="lbl_filterI" runat="server"  AssociatedControlID="txt_filterI" />
                <br />
                <asp:TextBox ID="txt_filterI" runat="server" />
                </td>
                  <asp:RequiredFieldValidator ID="rvf_filterI" runat="server" ControlToValidate="txt_filterI" Text="*Required"  ValidationGroup="insert" /> <%--user's must enter a value for product name--%>
                <td>
                 <asp:Label ID="lbl_filterafterI" runat="server"   AssociatedControlID="txt_filterafterI" />
                 <br />
                 <asp:TextBox ID="txt_filterafterI" runat="server" /> 
                </td>
                <asp:RequiredFieldValidator ID="rvf_filterafterI" runat="server" ControlToValidate="txt_filterafterI" Text="*Required"  ValidationGroup="insert" /> <%--user's must enter a value for product name--%> 
                <td>
                <asp:Label ID="lbl_department" runat="server"   AssociatedControlID="txt_departmentI" />
                <br />
                <asp:TextBox ID="txt_departmentI" runat="server" />
                </td>
                <asp:RequiredFieldValidator ID="rvf_department" runat="server" ControlToValidate="txt_departmentI" Text="*Required"  ValidationGroup="insert" /> <%--user's must enter a value for product description--%>
                <td>
                <asp:Label ID="lbl_date" runat="server"  AssociatedControlID="txt_dateI"  />
                <br />
                <asp:TextBox ID="txt_dateI" runat="server" />
                </td>
                <asp:RequiredFieldValidator ID="rvf_date" runat="server" ControlToValidate="txt_dateI" Text="*Required"  ValidationGroup="insert" /> <%--user's must enter a value for product description--%>
                <td>
                <br />
                <%--Buttons for insert and cancel--%>
                <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subAdmin" CommandName="Insert"  ValidationGroup="insert"  />
                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subAdmin" CommandName="Cancel"  />
               </td>
                </tr>
                <asp:Datalist ID="dlt_all" runat="server" OnItemCommand="subUpDel"> <%--Datalist data bound control --%>
                    <ItemTemplate>
                        <tr>
                            <td>
                            <asp:HiddenField ID="hdf_idE" runat="server" Value ='<%#Eval ("Id") %>' />
                            </td>
                            <td>
                            <asp:TextBox ID="txt_filterE" runat="server" Text='<%#Bind ("PublishBefore") %>' />
                            </td>
                            <td>
                            <asp:TextBox ID="txt_filterafterE" runat="server" Text='<%#Bind ("PublishAfter") %>' />
                            </td>
                            <td>
                            <asp:TextBox ID="txt_departmentE" runat="server" Text='<%#Bind ("Department") %>' />
                            </td>
                            <td>
                            <asp:TextBox ID="txt_dateE" runat="server" Text='<%#Bind ("Date") %>' />
                            </td>
                            <td>
                                <asp:Button ID="btn_update" runat="server" Text="Update" CommandName ="Update"  ValidationGroup="update"  />
                                <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Confirm Delete?');" />
                                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel"  CausesValidation="false"/>
                                <%--<asp:RequiredFieldValidator ID="rfv_" runat="server" Text="*Required" ControlToValidate="txt_nameE" ValidationGroup="update" />
                                <asp:RequiredFieldValidator ID="rfv_descE" runat="server" Text="*Required" ControlToValidate="txt_descE" ValidationGroup="update" />
                                <asp:RequiredFieldValidator ID="rfv_priceE" runat="server" Text="*Required" ControlToValidate="txt_priceE" ValidationGroup="update" />
                                <%--Buttons for insert and cancel, delete --%>
                            </td>
                        </tr>
                    </ItemTemplate>
                   </asp:Datalist>
                  </table>

             <hr />
 </asp:Content>




