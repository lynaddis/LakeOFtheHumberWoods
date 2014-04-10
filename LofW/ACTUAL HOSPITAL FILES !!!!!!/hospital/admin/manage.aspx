<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage.aspx.cs" Inherits="Admin_manage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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

        <asp:HyperLink ID="hyp_usr_add" runat="server" Text="Create new user" NavigateUrl="~/Admin/addUser.aspx"  />
        <asp:HyperLink ID="hyp_usr_edit" runat="server" Text="Edit User" NavigateUrl="~/Admin/editUser.aspx" />
        <asp:HyperLink ID="hyp_invoce_add" runat="server" Text="Create New Invocie" NavigateUrl="~/Admin/addInvoice.aspx" />
        <asp:HyperLink ID="hyp_invoice_edit" runat="server" Text="Edit Invoice" NavigateUrl="~/Admin/editInvoice.aspx" />
        <asp:HyperLink ID="hyp_location_add" runat="server" Text="Add New Hospital Branch Location" NavigateUrl="~/Admin/addLocation.aspx" />


    </div>
    </form>
</body>
</html>
