<%@ Page Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="addLocation.aspx.cs" Inherits="Admin_addLocation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
    <div>

         <div class="page_title"><h2>Add Location</h2></div>
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
        <br /> <br /> <br />
            </div>
        <div>

        <asp:Label ID="lbl_Status" runat="server" />
        <br /> <br />

        <asp:Label ID="lbl_title" runat="server" Text="Add Hospital location to map" />
        <br />

            <%-- Hospital Name --%>
                 <asp:Label ID="lbl_name" runat="server" Text="Hospital Name:" AssociatedControlID="txt_name" />
                    <asp:TextBox ID="txt_name" runat="server" />

                    <asp:RequiredFieldValidator ID="rfv_name" runat="server" ControlToValidate="txt_name" Text="*Required" ErrorMessage="Hospital name is required" Display="Static" ValidationGroup="addLocation" />
                    <asp:RegularExpressionValidator ID="reg_name" runat="server" ControlToValidate="txt_name" ErrorMessage="Hospital name, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="addLocation" />
                     <br /><br />
                <%-- Hospital address --%>
                    <asp:Label ID="lbl_address" runat="server" Text="Hospital Address" AssociatedControlID="txt_address"/>
                    <asp:TextBox ID="txt_address" runat="server" AutoPostBack="true" />

                    <asp:RequiredFieldValidator ID="rfv_address" runat="server" ControlToValidate="txt_address" Text="*Required" ErrorMessage="Hospital address is required" Display="Static" ValidationGroup="addLocation" />
                    <asp:RegularExpressionValidator ID="reg_address" runat="server" ControlToValidate="txt_address" ErrorMessage="Invalid Hospital address, characters and spaces only" Display="None" ValidationExpression="\d+\s\w+\s\w+(\s\w+|\s\d+)*" ValidationGroup="addLocation" />
                    <br /><br />
                <%-- Hospital Description --%>
                    <asp:Label ID="lbl_desc" runat="server" Text="Hospital Description" AssociatedControlID="txt_des" />
                    <asp:TextBox ID="txt_des" runat="server" TextMode="MultiLine" />

                    <asp:RequiredFieldValidator ID="rfv_des" runat="server" ControlToValidate="txt_des" Text="*Required" ErrorMessage="Hospital Description is required" Display="Static" ValidationGroup="addLocation" />

        <br /><br />
         <asp:Button ID="btn_addLocation" runat="server" Text="Add Location" OnClick="subAddLoc" ValidationGroup="addLocation"/>
        <asp:ValidationSummary ID="vs_addLocation" runat="server" HeaderText="Add Location Form" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="addLocation" />


    </div>
</asp:Content>
