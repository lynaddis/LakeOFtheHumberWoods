<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addInvoice.aspx.cs" Inherits="Admin_addInvoice" %>

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

        <asp:HyperLink ID="hyp_admin_menu" runat="server" Text="Main Menu"  NavigateUrl="~/Admin/manage.aspx" />
        <br /> <br /> <br />
        </div>

    <div>

        <asp:Label ID="lbl_title" runat="server" Text="Create Invoice" />
        <br /><br />

        <asp:Label ID="lbl_status" runat="server" />
        <br /><br />

    <table>
        <tr>
            <td>
                <asp:Label ID="lbl_amount" runat="server" Text="Amount" />
            </td>
            <td>
                <asp:TextBox ID="txt_amount" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfv_amount" runat="server" ControlToValidate="txt_amount" Text="*Required" ErrorMessage="An amount is required" Display="Static" ValidationGroup="AddInvoice" />
                <asp:CompareValidator ID="cv_amount" runat="server" ControlToValidate="txt_amount" Operator="DataTypeCheck" Type="Currency" Display="None" ErrorMessage="Invalid amount entered" ValidationGroup="AddInvoice" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_procedure" runat="server" Text="Procedure" />
            </td>
            <td>
                <asp:TextBox ID="txt_procedure" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfv_procedure" runat="server" ControlToValidate="txt_procedure" Text="*Required" ErrorMessage="A procedure name is required" Display="Static" ValidationGroup="AddInvoice" />
                <asp:RegularExpressionValidator ID="reg_procedure" runat="server" ControlToValidate="txt_procedure" ErrorMessage="Invalid procedure, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="AddInvoice" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_patient_id" runat="server" Text="Patient ID" />
            </td>
            <td>
                <asp:TextBox ID="txt_pid" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfv_pid" runat="server" ControlToValidate="txt_pid" Text="*Required" ErrorMessage="A Patient ID is required" Display="Static" ValidationGroup="AddInvoice" />
                <asp:CompareValidator ID="cv_pid" runat="server" ControlToValidate="txt_pid" Operator="DataTypeCheck" Type="Integer" Display="None" ErrorMessage="Invalid patient ID" ValidationGroup="AddInvoice" />
            </td>
        </tr>
    </table>
        <br />
        <asp:Button ID="btn_insert" runat="server" Text="Create Invoice" OnClick="subInsert" ValidationGroup="AddInvoice" />
        <asp:ValidationSummary ID="vs_addinvoice" runat="server" HeaderText="Create Invoice Errors" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="AddInvoice" />
    </div>
    </form>
</body>
</html>
