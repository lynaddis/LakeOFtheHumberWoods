<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addUser.aspx.cs" Inherits="Admin_addUser" Culture="en-CA" UICulture="en-CA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Add User</title>
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

        <asp:HyperLink ID="hyp_admin_menu" runat="server" Text="Main Menu"  NavigateUrl="~/admin/homeadmin.aspx" />
        <br /> <br /> <br />
            </div>
    <div>
    
        <asp:Label ID="lbl_title1" runat="server" Text="Patient Information" />
        <br />
        <table> <%-- Add user input fields--%>
            <tr>
                <td> <%-- First Name --%>
                    <asp:Label ID="lbl_fname" runat="server" Text="First Name" />
                </td>
                <td>
                    <asp:TextBox ID="txt_fname" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_fname" runat="server" ControlToValidate="txt_fname" Text="*Required" ErrorMessage="First name is required" Display="Static" ValidationGroup="addUser" />
                    <asp:RegularExpressionValidator ID="reg_fname" runat="server" ControlToValidate="txt_fname" ErrorMessage="Invalid first name, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="addUser" />
                </td>    
            </tr>
            <tr>
                <td><%-- Last Name --%>
                    <asp:Label ID="lbl_lname" runat="server" Text="Last Name" />
                </td>
                <td>
                    <asp:TextBox ID="txt_lname" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_lname" runat="server" ControlToValidate="txt_lname" Text="*Required" ErrorMessage="Last name is required" Display="Static" ValidationGroup="addUser" />
                    <asp:RegularExpressionValidator ID="reg_lname" runat="server" ControlToValidate="txt_lname" ErrorMessage="Invalid last name, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="addUser" />
                </td> 
            </tr>
            <tr>
                <td><%-- Address --%>
                    <asp:Label ID="lbl_address" runat="server" Text="Address" />
                </td>
                <td>
                    <asp:TextBox ID="txt_address" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_address" runat="server" ControlToValidate="txt_address" Text="*Required" ErrorMessage="Address is required" Display="Static" ValidationGroup="addUser" />
                    <asp:RegularExpressionValidator ID="reg_address" runat="server" ControlToValidate="txt_address" ErrorMessage="Invalid address" Display="None" ValidationExpression="\d+\w+\s\w+\s\w+" ValidationGroup="addUser" />
                </td> 
            </tr>
            <tr>
                <td><%--Phone Number --%>
                    <asp:Label ID="lbl_phone" runat="server" Text="Phone" />
                </td>
                <td>
                    <asp:TextBox ID="txt_phone" runat="server" Text="eg. 999-999-9999"  />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_phone" runat="server" ControlToValidate="txt_phone" Text="*Required" ErrorMessage="Phone number is required" Display="Static" ValidationGroup="addUser" />
                    <asp:RegularExpressionValidator ID="reg_phone" runat="server" ControlToValidate="txt_phone" ErrorMessage="Invalid phone number" Display="None" ValidationExpression="\d{3}[\-]\d{3}[\-]\d{4}" ValidationGroup="addUser" />
                </td>
            </tr>
            <tr>
                 <td><%-- Postal Code --%>
                    <asp:Label ID="lbl_pc" runat="server" Text="Postal Code" />
                </td>
                <td>
                    <asp:TextBox ID="txt_pc" runat="server" Text="eg. a1a8H8" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_pc" runat="server" ControlToValidate="txt_pc" Text="*Required" ErrorMessage="Postal Code is required" Display="Static" ValidationGroup="addUser" />
                    <asp:RegularExpressionValidator ID="reg_pc" runat="server" ControlToValidate="txt_pc" ErrorMessage="Invalid postal code" Display="None" ValidationExpression="[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]" ValidationGroup="addUser" />
                </td> 
            </tr>
            <tr>
                <td><%-- City --%>
                    <asp:Label ID="lbl_city" runat="server" Text="City" />
                </td>
                <td>
                    <asp:TextBox ID="txt_city" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_city" runat="server" ControlToValidate="txt_city" Text="*Required" ErrorMessage="City is required" Display="Static" ValidationGroup="addUser" />
                </td> 
            </tr>
            <tr>
                <td><%-- Country --%>
                    <asp:Label ID="lbl_country" runat="server" Text="Country" />
                </td>
                <td>
                    <asp:TextBox ID="txt_country" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_country" runat="server" ControlToValidate="txt_country" Text="*Required" ErrorMessage="Country is required" Display="Static" ValidationGroup="addUser" />
                </td>
            </tr>
            <tr>
                <td><%-- Date of Birth --%>
                    <asp:Label ID="lbl_dob" runat="server" Text="Date of Birth" />
                </td>
                <td>
                    <asp:TextBox ID="txt_dob" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_dob" runat="server" ControlToValidate="txt_dob" Text="*Required" ErrorMessage="Date of birth is required" Display="Static" ValidationGroup="addUser" />
                    <asp:CompareValidator ID="cv_dob" runat="server" ControlToValidate="txt_dob" Operator="DataTypeCheck" Type="Date" Display="None" CultureInvariantValues="true" ErrorMessage="invalid form for date of birth, expected: dd-mm-yyyy" ValidationGroup="addUser" />
                </td>
            </tr>
        </table>

        <br />

        <asp:Label ID="lbl_title2" runat="server" Text="Account Setup" />
        <br />
        <table> <%-- User Membership input fields --%>
            <tr>
                <td><%-- Username--%>
                    <asp:Label ID="lbl_username" runat="server" Text="User Name:" />
                </td>
                <td>
                    <asp:TextBox ID="txt_username" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_usr" runat="server" ControlToValidate="txt_username" Text="*Required" ErrorMessage="User name is required" Display="Static" ValidationGroup="addUser" />
                </td>
            </tr>
            <tr>
                <td><%-- Password --%>
                    <asp:Label ID="lbl_password" runat="server" Text="Password" />
                </td>
                <td>
                    <asp:TextBox ID="txt_password" runat="server" TextMode="Password" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_pass" runat="server" ControlToValidate="txt_password" Text="*Required" ErrorMessage="Password is required" Display="Static" ValidationGroup="addUser" />
                </td>
            </tr>
            <tr>
                <td><%-- Retype Password --%>
                    <asp:Label ID="lbl_match_pass" runat="server" Text="Re-type Password" />
                </td>
                <td>
                    <asp:TextBox ID="txt_match_pass" runat="server" TextMode="Password" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_match_pass" runat="server" ControlToValidate="txt_match_pass" Text="*Required"  Display="Static" ValidationGroup="addUser" />
                    <asp:CompareValidator ID="cv_match_pass" runat="server" ControlToValidate="txt_match_pass" ControlToCompare="txt_password" Operator="Equal" ErrorMessage="Password does not match" ValidationGroup="addUser" />
                </td>
            </tr>
            <tr>
                <td><%-- E-mail --%>
                    <asp:Label ID="lbl_email" runat="server" Text="E-mail" />
                </td>
                <td>
                    <asp:TextBox ID="txt_email" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="txt_email" Text="*Required" ErrorMessage="E-mail is required" Display="Static" ValidationGroup="addUser" />
                    <asp:RegularExpressionValidator ID="reg_email" runat="server" ControlToValidate="txt_email"  ValidationExpression="[a-z0-9._-]+@[a-z0-9.-]+\.[a-z]{2,4}$" ErrorMessage="Invalid E-mail address" ValidationGroup="addUser" /> 
                </td>
            </tr>
            <tr>
                <td><%-- Security Question --%>
                    <asp:label ID="lbl_question" runat="server" Text="Security Question"/>
                </td>
                <td>
                    <asp:TextBox ID="txt_question" runat="server" />
                 </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_question" runat="server" ControlToValidate="txt_question" Text="*Required" ErrorMessage="Security question is required" Display="Static" ValidationGroup="addUser" />
                </td>
            </tr>
            <tr>
                <td><%-- Security Answer --%>
                    <asp:Label ID="lbl_answer" runat="server" Text="Security Answer" />
                </td>
                <td>
                    <asp:TextBox ID="txt_answer" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_answer" runat="server" ControlToValidate="txt_answer" Text="*Required" ErrorMessage="Security Answer is required" Display="Static" ValidationGroup="addUser" />
                </td>
            </tr>
        </table>

        <br /><%-- create button --%>
        <asp:Button ID="btn_create" runat="server" Text="Create User" OnClick="createUser" ValidationGroup="addUser" />
        <asp:ValidationSummary ID="vs_adduser" runat="server" HeaderText="Add User Form" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="addUser" />
        <br />
        <%-- output status label --%>
        <asp:Label ID="lbl_accountStatus" runat="server" />
    </div>
    </form>
</body>
</html>
