<%@ Page Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="editUser.aspx.cs" Inherits="Admin_editUser" Culture="en-CA" UICulture="en-CA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
     <div class="page_title"><h2>Edit User</h2></div>
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
    <asp:Label ID="lbl_title" runat="server" Text=" Edit User info" />
    </div>
        <br />
        <asp:Label ID="lbl_accountStatus" runat="server" />
        <br /><br />

       <asp:Panel ID="pnl_search" runat="server" >

                    <asp:RadioButton ID="rbl_username" runat="server" Text="Search by Username" OnCheckedChanged="Checked"  GroupName="search" AutoPostBack="true" />

                    <asp:Label ID="lbl_ByUsername" runat="server" Text="Username" AssociatedControlID="txt_byUsername" />
                    <asp:TextBox ID="txt_byUsername" runat="server" />

                    <asp:RequiredFieldValidator ID="rfv_byuser" runat="server" ControlToValidate="txt_byUsername" Text="*Required" Display="static" ErrorMessage="A Username is needed" ValidationGroup="ByUser" />

                    <asp:Button ID="btn_byUsername" runat="server" OnClick="subByUsername" Text="Search" ValidationGroup="ByUser" />
                    <asp:ValidationSummary ID="vs_ByUser" runat="server" HeaderText="Search By User" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ByUser" />
                    <br />
                    <asp:RadioButton ID="rbl_info" runat="server" Text="Search by User info"  OnCheckedChanged="Checked" GroupName="search" AutoPostBack="true" />

                    <asp:Label ID="lbl_info_fname" runat="server" Text="First Name" AssociatedControlID="txt_byFName" />
                    <asp:TextBox ID="txt_byFName" runat="server" />

                     <asp:RequiredFieldValidator ID="rfv_by_fname" runat="server" ControlToValidate="txt_byFname" Text="*Required" ErrorMessage="First name is required" Display="Static" ValidationGroup="ByUserInfo" />
                     <asp:RegularExpressionValidator ID="reg_by_fname" runat="server" ControlToValidate="txt_byFname" ErrorMessage="Invalid first name, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="ByUserInfo" />

                    <asp:Label ID="lbl_info_lname" runat="server" Text="Last Name" AssociatedControlID="txt_byLname" />
                    <asp:TextBox ID="txt_byLname" runat="server" />

                    <asp:RequiredFieldValidator ID="rfv_by_lname" runat="server" ControlToValidate="txt_byLname" Text="*Required" ErrorMessage="Last name is required" Display="Static" ValidationGroup="ByUserInfo" />
                     <asp:RegularExpressionValidator ID="reg_by_lname" runat="server" ControlToValidate="txt_byLname" ErrorMessage="Invalid last name, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="ByUserInfo" />

                    <asp:Label ID="lbl_info_dob" runat="server" Text="D.O.B" AssociatedControlID="txt_bydob" />
                    <asp:TextBox ID="txt_bydob" runat="server" />

                     <asp:RequiredFieldValidator ID="rfv_by_dob" runat="server" ControlToValidate="txt_bydob" Text="*Required" ErrorMessage="Date of birth is required" Display="Static" ValidationGroup="ByUserInfo" />
                     <asp:CompareValidator ID="cv_by_dob" runat="server" ControlToValidate="txt_bydob" Operator="DataTypeCheck" Type="Date" CultureInvariantValues="true"  Display="None" ErrorMessage="invalid form for date of birth, expected: dd-mm-yyyy" ValidationGroup="ByUserInfo" />     

                     <asp:Button ID="btn_byInfo" runat="server" OnClick="subByInfo" Text="Search" ValidationGroup="ByUserInfo" />
                    <asp:ValidationSummary ID="vs_ByInfo" runat="server" HeaderText="Search By User Info Errors" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ByUserInfo" />

       </asp:Panel>
        <br /><br />

        <asp:Label ID="lbl_editlist" runat="server" />
        <br /><br />

    
        <asp:ListView ID="lv_editUser" runat="server" OnItemCommand="subAdmin" >
            <ItemTemplate>
                        <asp:Label ID="lbl_fn" runat="server" Text="First Name: " AssociatedControlID="lbl_fnameI" />
                        <asp:Label ID="lbl_fnameI" runat="server" Text='<%#Eval("fname") %>' /> 
                        <br /> 
                        <asp:Label ID="lbl_ln" runat="server" Text="Last Name: " AssociatedControlID="lbl_lnameI" />
                        <asp:Label ID="lbl_lnameI" runat="server" Text='<%#Eval("lname") %>' /> 
                        <br />
                        <asp:Label ID="lbl_address" runat="server" Text="Address: " AssociatedControlID="lbl_addressI" />
                        <asp:Label ID="lbl_addressI" runat="server" Text='<%#Eval("address") %>' /> 
                        <br />
                        <asp:Label ID="lbl_phone" runat="server" Text="Phone Number: " AssociatedControlID="lbl_phoneI" />
                        <asp:Label ID="lbl_phoneI" runat="server" Text='<%#Eval("phone") %>' /> 
                        <br />
                        <asp:Label ID="lbl_postalcode" runat="server" Text="Postal Code: " AssociatedControlID="lbl_pcI" /> 
                        <asp:Label ID="lbl_pcI" runat="server" Text='<%#Eval("pc") %>' /> 
                        <br />
                        <asp:Label ID="lbl_city" runat="server" Text="City: " AssociatedControlID="lbl_cityI" />
                        <asp:Label ID="lbl_cityI" runat="server" Text='<%#Eval("city") %>' /> 
                        <br />
                        <asp:Label ID="lbl_country" runat="server" Text="Country: " AssociatedControlID="lbl_countryI" />
                        <asp:Label ID="lbl_countryI" runat="server" Text='<%#Eval("country") %>' />  
                        <br />
                        <asp:Label ID="lbl_dateofbirth" runat="server" Text="Date of Birth: " AssociatedControlID="lbl_dobI" />
                        <asp:Label ID="lbl_dobI" runat="server" Text='<%#Eval("dob") %>' /> 
                        <br /><br />
                        <asp:LinkButton ID="lk_btn_update" runat="server" Text="Edit" CommandName="Editx" CommandArgument='<%#Eval("Id") %>' CausesValidation="false" /> 

            </ItemTemplate>

            <EditItemTemplate>

                         <%-- First Name --%>
                         <asp:Label ID="lbl_fname" runat="server" Text="First Name" AssociatedControlID="txt_fname" />
                         <asp:TextBox ID="txt_fname" runat="server" Text='<%#Bind("fname") %>' />

                         <asp:RequiredFieldValidator ID="rfv_fname" runat="server" ControlToValidate="txt_fname" Text="*Required" ErrorMessage="First name is required" Display="Static" ValidationGroup="editUser" />
                         <asp:RegularExpressionValidator ID="reg_fname" runat="server" ControlToValidate="txt_fname" ErrorMessage="Invalid first name, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="editUser" />
                         <br />   
                         <%-- Last Name --%>
                            <asp:Label ID="lbl_lname" runat="server" Text="Last Name" AssociatedControlID="txt_lname" />
                            <asp:TextBox ID="txt_lname" runat="server" Text='<%#Bind("lname") %>' />

                            <asp:RequiredFieldValidator ID="rfv_lname" runat="server" ControlToValidate="txt_lname" Text="*Required" ErrorMessage="Last name is required" Display="Static" ValidationGroup="editUser" />
                            <asp:RegularExpressionValidator ID="reg_lname" runat="server" ControlToValidate="txt_lname" ErrorMessage="Invalid last name, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="editUser" />
                            <br />
                        <%-- Address --%>
                            <asp:Label ID="lbl_address" runat="server" Text="Address" AssociatedControlID="txt_address"  />
                            <asp:TextBox ID="txt_address" runat="server" Text='<%#Bind("address") %>' />

                            <asp:RequiredFieldValidator ID="rfv_address" runat="server" ControlToValidate="txt_address" Text="*Required" ErrorMessage="Address is required" Display="Static" ValidationGroup="editUser" />
                            <asp:RegularExpressionValidator ID="reg_address" runat="server" ControlToValidate="txt_address" ErrorMessage="Invalid address" Display="None" ValidationExpression="\d+\w+\s\w+\s\w+" ValidationGroup="editUser" />
                            <br />
                        <%--Phone Number --%>
                            <asp:Label ID="lbl_phone" runat="server" Text="Phone" AssociatedControlID="txt_phone" />
                            <asp:TextBox ID="txt_phone" runat="server" Text='<%#Bind("phone") %>'  />

                            <asp:RequiredFieldValidator ID="rfv_phone" runat="server" ControlToValidate="txt_phone" Text="*Required" ErrorMessage="Phone number is required" Display="Static" ValidationGroup="editUser" />
                            <asp:RegularExpressionValidator ID="reg_phone" runat="server" ControlToValidate="txt_phone" ErrorMessage="Invalid phone number" Display="None" ValidationExpression="\d{3}[\-]\d{3}[\-]\d{4}" ValidationGroup="editUser" />
                            <br />
                       <%-- Postal Code --%>
                            <asp:Label ID="lbl_pc" runat="server" Text="Postal Code" AssociatedControlID="txt_pc"/>
                            <asp:TextBox ID="txt_pc" runat="server" Text='<%#Bind("pc") %>' />

                            <asp:RequiredFieldValidator ID="rfv_pc" runat="server" ControlToValidate="txt_pc" Text="*Required" ErrorMessage="Postal Code is required" Display="Static" ValidationGroup="editUser" />
                            <asp:RegularExpressionValidator ID="reg_pc" runat="server" ControlToValidate="txt_pc" ErrorMessage="Invalid postal code" Display="None" ValidationExpression="[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]" ValidationGroup="editUser" />
                            <br />
                      <%-- City --%>
                            <asp:Label ID="lbl_city" runat="server" Text="City" AssociatedControlID="txt_city" />
                            <asp:TextBox ID="txt_city" runat="server" Text='<%#Bind("city") %>' />

                            <asp:RequiredFieldValidator ID="rfv_city" runat="server" ControlToValidate="txt_city" Text="*Required" ErrorMessage="City is required" Display="Static" ValidationGroup="editUser" />
                             <asp:RegularExpressionValidator ID="reg_city" runat="server" ControlToValidate="txt_city" ErrorMessage="Invalid city name, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="editUser" />
                            <br />
                      <%-- Country --%>
                            <asp:Label ID="lbl_country" runat="server" Text="Country" AssociatedControlID="txt_country"/>
                            <asp:TextBox ID="txt_country" runat="server" Text='<%#Bind("country") %>' />

                            <asp:RequiredFieldValidator ID="rfv_country" runat="server" ControlToValidate="txt_country" Text="*Required" ErrorMessage="Country is required" Display="Static" ValidationGroup="editUser" />
                             <asp:RegularExpressionValidator ID="reg_country" runat="server" ControlToValidate="txt_country" ErrorMessage="Invalid country name, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="editUser" />
                            <br />
                      <%-- Date of Birth --%>
                            <asp:Label ID="lbl_dob" runat="server" Text="Date of Birth" AssociatedControlID="txt_dob" />
                            <asp:TextBox ID="txt_dob" runat="server" Text='<%#Bind("dob") %>' />

                            <asp:RequiredFieldValidator ID="rfv_dob" runat="server" ControlToValidate="txt_dob" Text="*Required" ErrorMessage="Date of birth is required" Display="Static" ValidationGroup="editUser" />
                            <asp:CompareValidator ID="cv_dob" runat="server" ControlToValidate="txt_dob" Operator="DataTypeCheck" Type="Date" CultureInvariantValues="true"  Display="None" ErrorMessage="invalid form for date of birth, expected: dd-mm-yyyy" ValidationGroup="editUser" />

                <br />
                <asp:HiddenField ID="hdf_username" runat="server"  Value='<%#Eval("username") %>' />
                <br /><br />
                <asp:LinkButton ID="btn_update" runat="server" Text="Update User"  CommandName="Updatex" CommandArgument='<%#Eval("Id") %>' ValidationGroup="editUser" />
                <asp:LinkButton ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancelx" CausesValidation="false" />
                <asp:ValidationSummary ID="vs_edituser" runat="server" HeaderText="Edit User Form Errors" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="editUser" />

            </EditItemTemplate>
        </asp:ListView>
</asp:Content>
