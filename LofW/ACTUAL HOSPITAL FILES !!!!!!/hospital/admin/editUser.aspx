<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editUser.aspx.cs" Inherits="Admin_editUser" Culture="en-CA" UICulture="en-CA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Edit User</title>
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
    <asp:Label ID="lbl_title" runat="server" Text=" Edit User info" />
    </div>
        <br />
        <asp:Label ID="lbl_accountStatus" runat="server" />
        <br /><br />

        <asp:Panel ID="pnl_search" runat="server" >
        <table>
            <tr>
                <td>
                    <asp:RadioButton ID="rbl_username" runat="server" Text="Search by Username" OnCheckedChanged="Checked"  GroupName="search" AutoPostBack="true" />
                </td>
                <td>
                    <asp:Label ID="lbl_ByUsername" runat="server" Text="Username" />
                    <asp:TextBox ID="txt_byUsername" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_byuser" runat="server" ControlToValidate="txt_byUsername" Text="*Required" Display="static" ErrorMessage="A Username is needed" ValidationGroup="ByUser" />
                </td>
                <td>
                    <asp:Button ID="btn_byUsername" runat="server" OnClick="subByUsername" Text="Search" ValidationGroup="ByUser" />
                    <asp:ValidationSummary ID="vs_ByUser" runat="server" HeaderText="Search By User" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ByUser" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButton ID="rbl_info" runat="server" Text="Search by User info"  OnCheckedChanged="Checked" GroupName="search" AutoPostBack="true" />
                </td>
                <td>
                    <asp:Label ID="lbl_info_fname" runat="server" Text="First Name" />
                    <asp:TextBox ID="txt_byFName" runat="server" />
                </td>
                <td>
                     <asp:RequiredFieldValidator ID="rfv_by_fname" runat="server" ControlToValidate="txt_byFname" Text="*Required" ErrorMessage="First name is required" Display="Static" ValidationGroup="ByUserInfo" />
                     <asp:RegularExpressionValidator ID="reg_by_fname" runat="server" ControlToValidate="txt_byFname" ErrorMessage="Invalid first name, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="ByUserInfo" />
                </td>
                 <td>  
                    <asp:Label ID="lbl_info_lname" runat="server" Text="Last Name" />
                    <asp:TextBox ID="txt_byLname" runat="server" />
                 </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_by_lname" runat="server" ControlToValidate="txt_byLname" Text="*Required" ErrorMessage="Last name is required" Display="Static" ValidationGroup="ByUserInfo" />
                     <asp:RegularExpressionValidator ID="reg_by_lname" runat="server" ControlToValidate="txt_byLname" ErrorMessage="Invalid last name, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="ByUserInfo" />
                </td>
                  <td>
                    <asp:Label ID="lbl_info_dob" runat="server" Text="D.O.B" />
                    <asp:TextBox ID="txt_bydob" runat="server" />
                </td>
                <td>
                     <asp:RequiredFieldValidator ID="rfv_by_dob" runat="server" ControlToValidate="txt_bydob" Text="*Required" ErrorMessage="Date of birth is required" Display="Static" ValidationGroup="ByUserInfo" />
                     <asp:CompareValidator ID="cv_by_dob" runat="server" ControlToValidate="txt_bydob" Operator="DataTypeCheck" Type="Date" CultureInvariantValues="true"  Display="None" ErrorMessage="invalid form for date of birth, expected: dd-mm-yyyy" ValidationGroup="ByUserInfo" />     
                </td>
                <td>
                     <asp:Button ID="btn_byInfo" runat="server" OnClick="subByInfo" Text="Search" ValidationGroup="ByUserInfo" />
                    <asp:ValidationSummary ID="vs_ByInfo" runat="server" HeaderText="Search By User Info Errors" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ByUserInfo" />
                
                </td>
            </tr>
        </table>
       </asp:Panel>
        <br /><br />

        <asp:Label ID="lbl_editlist" runat="server" />
        <br /><br />

    
        <asp:ListView ID="lv_editUser" runat="server" OnItemCommand="subAdmin" >
            <ItemTemplate>
                <table>
                    <tr>
                       <th>First Name </th> <th> Last Name </th> <th> Address </th> <th> Phone Number </th> <th> Postal Code </th> <th> City </th> <th> Country </th> <th> Date of Birth </th>  
                    </tr>
                    <tr>
                        
                        <td> <asp:Label ID="lbl_fnameI" runat="server" Text='<%#Eval("fname") %>' />  </td>
                        <td> <asp:Label ID="lbl_lnameI" runat="server" Text='<%#Eval("lname") %>' /> </td>
                        <td> <asp:Label ID="lbl_addressI" runat="server" Text='<%#Eval("address") %>' /> </td>
                        <td> <asp:Label ID="lbl_phoneI" runat="server" Text='<%#Eval("phone") %>' />  </td>
                        <td> <asp:Label ID="lbl_pcI" runat="server" Text='<%#Eval("pc") %>' /> </td>
                        <td> <asp:Label ID="lbl_cityI" runat="server" Text='<%#Eval("city") %>' /> </td>
                        <td> <asp:Label ID="lbl_countryI" runat="server" Text='<%#Eval("country") %>' />  </td>
                        <td> <asp:Label ID="lbl_dobI" runat="server" Text='<%#Eval("dob") %>' /> </td>
                        <td> 
                            <asp:LinkButton ID="lk_btn_update" runat="server" Text="Edit" CommandName="Editx" CommandArgument='<%#Eval("Id") %>' CausesValidation="false" /> 
                        </td>
                    </tr>
                </table>
            </ItemTemplate>

            <EditItemTemplate>
                <table>
                    <tr>
                        <td> <%-- First Name --%>
                            <asp:Label ID="lbl_fname" runat="server" Text="First Name" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_fname" runat="server" Text='<%#Bind("fname") %>' />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv_fname" runat="server" ControlToValidate="txt_fname" Text="*Required" ErrorMessage="First name is required" Display="Static" ValidationGroup="editUser" />
                            <asp:RegularExpressionValidator ID="reg_fname" runat="server" ControlToValidate="txt_fname" ErrorMessage="Invalid first name, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="editUser" />
                        </td>    
                    </tr>
                    <tr>
                        <td><%-- Last Name --%>
                            <asp:Label ID="lbl_lname" runat="server" Text="Last Name" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_lname" runat="server" Text='<%#Bind("lname") %>' />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv_lname" runat="server" ControlToValidate="txt_lname" Text="*Required" ErrorMessage="Last name is required" Display="Static" ValidationGroup="editUser" />
                            <asp:RegularExpressionValidator ID="reg_lname" runat="server" ControlToValidate="txt_lname" ErrorMessage="Invalid last name, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="editUser" />
                        </td> 
                    </tr>
                    <tr>
                        <td><%-- Address --%>
                            <asp:Label ID="lbl_address" runat="server" Text="Address"  />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_address" runat="server" Text='<%#Bind("address") %>' />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv_address" runat="server" ControlToValidate="txt_address" Text="*Required" ErrorMessage="Address is required" Display="Static" ValidationGroup="editUser" />
                            <asp:RegularExpressionValidator ID="reg_address" runat="server" ControlToValidate="txt_address" ErrorMessage="Invalid address" Display="None" ValidationExpression="\d+\w+\s\w+\s\w+" ValidationGroup="editUser" />
                        </td> 
                    </tr>
                    <tr>
                        <td><%--Phone Number --%>
                            <asp:Label ID="lbl_phone" runat="server" Text="Phone" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_phone" runat="server" Text='<%#Bind("phone") %>'  />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv_phone" runat="server" ControlToValidate="txt_phone" Text="*Required" ErrorMessage="Phone number is required" Display="Static" ValidationGroup="editUser" />
                            <asp:RegularExpressionValidator ID="reg_phone" runat="server" ControlToValidate="txt_phone" ErrorMessage="Invalid phone number" Display="None" ValidationExpression="\d{3}[\-]\d{3}[\-]\d{4}" ValidationGroup="editUser" />
                        </td>
                    </tr>
                    <tr>
                         <td><%-- Postal Code --%>
                            <asp:Label ID="lbl_pc" runat="server" Text="Postal Code" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_pc" runat="server" Text='<%#Bind("pc") %>' />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv_pc" runat="server" ControlToValidate="txt_pc" Text="*Required" ErrorMessage="Postal Code is required" Display="Static" ValidationGroup="editUser" />
                            <asp:RegularExpressionValidator ID="reg_pc" runat="server" ControlToValidate="txt_pc" ErrorMessage="Invalid postal code" Display="None" ValidationExpression="[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]" ValidationGroup="editUser" />
                        </td> 
                    </tr>
                    <tr>
                        <td><%-- City --%>
                            <asp:Label ID="lbl_city" runat="server" Text="City" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_city" runat="server" Text='<%#Bind("city") %>' />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv_city" runat="server" ControlToValidate="txt_city" Text="*Required" ErrorMessage="City is required" Display="Static" ValidationGroup="editUser" />
                             <asp:RegularExpressionValidator ID="reg_city" runat="server" ControlToValidate="txt_city" ErrorMessage="Invalid city name, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="editUser" />
                        </td> 
                    </tr>
                    <tr>
                        <td><%-- Country --%>
                            <asp:Label ID="lbl_country" runat="server" Text="Country" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_country" runat="server" Text='<%#Bind("country") %>' />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv_country" runat="server" ControlToValidate="txt_country" Text="*Required" ErrorMessage="Country is required" Display="Static" ValidationGroup="editUser" />
                             <asp:RegularExpressionValidator ID="reg_country" runat="server" ControlToValidate="txt_country" ErrorMessage="Invalid country name, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="editUser" />
                        </td>
                    </tr>
                    <tr>
                        <td><%-- Date of Birth --%>
                            <asp:Label ID="lbl_dob" runat="server" Text="Date of Birth" />
                        </td>
                        <td>
                            <asp:TextBox ID="txt_dob" runat="server" Text='<%#Bind("dob") %>' />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfv_dob" runat="server" ControlToValidate="txt_dob" Text="*Required" ErrorMessage="Date of birth is required" Display="Static" ValidationGroup="editUser" />
                            <asp:CompareValidator ID="cv_dob" runat="server" ControlToValidate="txt_dob" Operator="DataTypeCheck" Type="Date" CultureInvariantValues="true"  Display="None" ErrorMessage="invalid form for date of birth, expected: dd-mm-yyyy" ValidationGroup="editUser" />
                           <%-- <asp:CustomValidator ID="ctv_dob" runat="server" ControlToValidate="txt_dob" Text="test" Display="Static" OnServerValidate="testDate" ErrorMessage="invalid form for date of birth" ValidationGroup="editUser" /> --%>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:HiddenField ID="hdf_username" runat="server"  Value='<%#Eval("username") %>' />

                <asp:LinkButton ID="btn_update" runat="server" Text="Update User"  CommandName="Updatex" CommandArgument='<%#Eval("Id") %>' ValidationGroup="editUser" />
                <asp:LinkButton ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancelx" CausesValidation="false" />
                <asp:ValidationSummary ID="vs_edituser" runat="server" HeaderText="Edit User Form Errors" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="editUser" />

            </EditItemTemplate>
        </asp:ListView>
    </form>
</body>
</html>
