<%@ Page Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="editLocation.aspx.cs" Inherits="Admin_editLocation" %>
<%@ MasterType VirtualPath="~/admin/adminMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
    <div>
    <%-- Displys welcome message to user --%> 
        <asp:LoginName ID="log_name" runat="server" FormatString="Welcome, {0} " />

          <%-- Allows user to logout if logged in --%>  
        <asp:LoginStatus ID="log_status" runat="server" LogoutAction="Redirect" LogoutPageUrl="~/admin_login.aspx" />
            <br />

            <!-- Will display to the user what type of account is currently logged in. 
               Because of the web.config file, access to this page is restricted for everyone but an admin; so only the admin role will display -->
        <asp:LoginView ID="log_view" runat="server" >
            <AnonymousTemplate>
                Public User(s)
            </AnonymousTemplate>
            <LoggedInTemplate>
                Logged In User(s)
            </LoggedInTemplate>
            <RoleGroups>
                <asp:RoleGroup Roles="Admin">
                    <ContentTemplate>
                        Admin(s) only
                    </ContentTemplate>
                </asp:RoleGroup>
                <asp:RoleGroup Roles="User">
                    <ContentTemplate>
                        User(s) only
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
        <asp:HyperLink ID="hyp_home" runat="server" Text="Back to Home" Font-Underline="false" SkinID="hblink_submit" NavigateUrl="~/Admin/homeadmin.aspx"  />
        <asp:HyperLink ID="hyp_admin_menu" runat="server" Text="Main Menu"  NavigateUrl="~/Admin/manage.aspx" />
        <br /> <br /> <br />
            </div>
    <%-- displays list of hospital locations  --%>

        <asp:Label ID="lbl_Status" runat="server" />
        <br /> <br />
        <asp:Panel ID="pnl_list" runat="server">
        <asp:DataList ID="dl_locations" runat="server" OnItemCommand="subSelect">
            <ItemTemplate>
                <asp:Label ID="lbl_name" runat="server" Text="Hospital Name:" /><br />
                <asp:Label ID="lbl_hName" runat="server" Text='<%#Eval("hospital_name") %>' />
                <br /><br />
                <asp:Label ID="lbl_address" runat="server" Text="Hospital Address:" /><br />
                <asp:Label ID="lbl_hAddress" runat="server" Text='<%#Eval("hospital_address") %>' />
                <br /><br />
                <asp:Label ID="lbl_description" runat="server" Text="Hospital Description:" /><br />
                <asp:TextBox ID="txt_hDes" runat="server" Text='<%#Eval("desc") %>' TextMode="MultiLine" ReadOnly="true"  />
                <br /><br />
                <asp:LinkButton ID="btn_select" runat="server" Text="Edit" CommandName="Selectx" CommandArgument='<%#Eval("Id") %>' />
                <asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandName="Deletex" CommandArgument='<%#Eval("Id") %>' />
                <br /><br />
            </ItemTemplate>
        </asp:DataList>
        </asp:Panel>

    <%-- selected hospital location is displayed here for editing or deletion --%>
        <asp:Panel ID="pnl_edit" runat="server">
        <asp:DataList ID="dl_editLoc" runat="server" OnItemCommand="subAdmin">
            <ItemTemplate>
                 <asp:Label ID="lbl_name" runat="server" Text="Hospital Name:" /><br />
                <asp:TextBox ID="txt_hName" runat="server" Text='<%#Eval("hospital_name") %>' />
                <asp:RequiredFieldValidator ID="rfv_name" runat="server" ControlToValidate="txt_hName" Text="*Required" Display="Static" ErrorMessage="A Hospital Name is required" ValidationGroup="editMap" />
                <br /><br />
                <asp:Label ID="lbl_address" runat="server" Text="Hospital Address:" /><br />
                <asp:TextBox ID="txt_hAddress" runat="server" Text='<%#Eval("hospital_address") %>' />
                <asp:RequiredFieldValidator ID="rfv_address" runat="server" ControlToValidate="txt_hAddress" Text="*Required" Display="Static" ErrorMessage="Hospital address is required" ValidationGroup="editMap" />
                <br /><br />
                <asp:Label ID="lbl_description" runat="server" Text="Hospital Description:" /> <br /><br />
                <asp:TextBox ID="txt_hDes" runat="server" Text='<%#Eval("desc") %>' TextMode="MultiLine" />
                <asp:RequiredFieldValidator ID="rfv_des" runat="server" ControlToValidate="txt_hDes" Text="*Required" Display="Static" ErrorMessage="A Hospital description is needed" ValidationGroup="editMap" />
                <br /><br />
                <asp:LinkButton ID="btn_select" runat="server" Text="Update" CommandName="Updatex" CommandArgument='<%#Eval("Id") %>' ValidationGroup="editMap" CausesValidation="true" />
                <asp:LinkButton ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancelx" CausesValidation="false" />
                <asp:ValidationSummary ID="vs_editMap" runat="server" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="editMap" />
                <br /><br />
            </ItemTemplate>
        </asp:DataList>
            </asp:Panel>

        <div>
    </div>
</asp:Content>
