<%@ Page Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="editInvoice.aspx.cs" Inherits="Admin_editInvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">

         <div class="page_title"><h2>Edit Invoices</h2></div>
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
        <br /> <br /> <br />
        </div>
    <div>
        <asp:Label ID="lbl_title" runat="server" Text="Edit Invoice" />
        <br /><br />

        <asp:Label ID="lbl_status" runat="server" />
        <br /> <br />

      
                    <asp:RadioButton ID="rbl_invoiceid" runat="server" Text="Search By Invoice ID"  GroupName="search"  OnCheckedChanged="Checked"  AutoPostBack="true" />
                    <asp:TextBox ID="txt_byInvoice" runat="server" />

                    <asp:RequiredFieldValidator ID="rfv_byinvoice" runat="server" ControlToValidate="txt_byInvoice" Text="*Required" Display="static" ErrorMessage="An Invoice Id is required" ValidationGroup="ByInvoice" />
                    <asp:CompareValidator ID="cv_Invoice" runat="server" ControlToValidate="txt_byInvoice" Operator="DataTypeCheck" Type="Integer" Display="None" ErrorMessage="invalid invoice ID" ValidationGroup="ByInvoice" /> 

                    <asp:Button ID="btn_byInvoice" runat="server" OnClick="subByInvoice" Text="Search" ValidationGroup="ByInvoice" />
                    <asp:ValidationSummary ID="vs_ByInvoice" runat="server" HeaderText="Search By Invoice ID Errors" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ByInvoice" />
                    <br /><br />
                    <asp:RadioButton ID="rbl_patientid" runat="server" Text="Search by Patient ID" GroupName="search" OnCheckedChanged="Checked"  AutoPostBack="true" />

                    <asp:TextBox ID="txt_byPatient" runat="server" />

                     <asp:RequiredFieldValidator ID="rfv_bypatient" runat="server" ControlToValidate="txt_byPatient" Text="*Required" ErrorMessage="A Patient ID is required" Display="Static" ValidationGroup="ByPatient" />
                     <asp:CompareValidator ID="cv_patient" runat="server" ControlToValidate="txt_byPatient" Operator="DataTypeCheck" Type="Integer" Display="None" ErrorMessage="invalid patient ID" ValidationGroup="ByPatient" />

                     <asp:Button ID="btn_bypatient" runat="server" OnClick="subByPatient" Text="Search" ValidationGroup="ByPatient" />
                    <asp:ValidationSummary ID="vs_Bypatient" runat="server" HeaderText="Search By Patient ID Errors" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ByPatient" /> 

        <br /><br />

        <asp:Label ID="lbl_invoicelist" runat="server" />
        <br /><br />

        <asp:Panel ID="pnl_display" runat="server" >
            <asp:Repeater ID="rp_editInvoice" runat="server" OnItemCommand="subAdmin" >
                <ItemTemplate>
                    <asp:Label ID="lbl_amt" runat="server" Text="Amount: " AssociatedControlID="lbl_amount" />
                    <asp:Label ID="lbl_amount" runat="server" Text='<%#Eval("amount") %>' />  
                    <br />
                    <asp:Label ID="lbl_stat" runat="server" Text="Status: " AssociatedControlID="lbl_status" />
                    <asp:Label ID="lbl_status" runat="server" Text='<%#Eval("status") %>' />
                    <br /> 
                    <asp:Label ID="lbl_proc" runat="server" Text="Procedure: " AssociatedControlID="lbl_procedure" />
                    <asp:Label ID="lbl_procedure" runat="server" Text='<%#Eval("procedure") %>' /> 
                    <br />
                    <asp:Label ID="lbl_method" runat="server" Text="Payment_Method: " AssociatedControlID="lbl_payment_method" />
                    <asp:Label ID="lbl_payment_method" runat="server" Text='<%#Eval("payment_method") %>' /> 
                    <br /> 
                    <asp:Label ID="lbl_id" runat="server" Text="Patient Number: " AssociatedControlID="lbl_patientid" />
                    <asp:Label ID="lbl_patientid" runat="server" Text='<%#Eval("patient_id") %>' /> 
                    <br /><br />      
                    <asp:LinkButton ID="lk_btn_update" runat="server" Text="Edit" CommandName="Editx" CommandArgument='<%#Eval("Id") %>' CausesValidation="false" /> 
                    <hr />
                    <br />
                </ItemTemplate>
            </asp:Repeater>
         </asp:Panel>

        <asp:Panel ID="pnl_edit" runat="server" >
            <asp:Repeater ID="rp_updateInvoice" runat="server" OnItemCommand="subAdmin" >
                <ItemTemplate>

                                <asp:Label ID="lbl_amount" runat="server" Text="Amount" AssociatedControlID="txt_amount" />
                                <asp:TextBox ID="txt_amount" runat="server" Text='<%#Bind("amount") %>' />

                                <asp:RequiredFieldValidator ID="rfv_amount" runat="server" ControlToValidate="txt_amount" Text="*Required" ErrorMessage="An amount is required" Display="Static" ValidationGroup="UpdateInvoice" />
                                <asp:CompareValidator ID="cv_amount" runat="server" ControlToValidate="txt_amount" Operator="DataTypeCheck" Type="Currency" Display="None" ErrorMessage="Invalid amount entered" ValidationGroup="UpdateInvoice" />
                                 <br />   
                                <asp:Label ID="lbl_status" runat="server" Text="Status" AssociatedControlID="txt_status" />
                                <asp:TextBox ID="txt_status" runat="server" Text='<%#Bind("status") %>' />

                                <asp:RequiredFieldValidator ID="rfv_status" runat="server" ControlToValidate="txt_status" Text="*Required" ErrorMessage="A status is required" Display="Static" ValidationGroup="UpdateInvoice" />
                                <asp:RegularExpressionValidator ID="reg_status" runat="server" ControlToValidate="txt_status" ErrorMessage="Invalid status, Paid or Unpaid" Display="None" ValidationExpression="^(Paid|Unpaid)" ValidationGroup="UpdateInvoice" />
                                <br />
                                <asp:Label ID="lbl_procedure" runat="server" Text="Procedure" AssociatedControlID="txt_procedure" />
                                <asp:TextBox ID="txt_procedure" runat="server" Text='<%#Bind("procedure") %>' /> 

                                <asp:RequiredFieldValidator ID="rfv_procedure" runat="server" ControlToValidate="txt_procedure" Text="*Required" ErrorMessage="A procedure is required" Display="Static" ValidationGroup="UpdateInvoice" />
                                <asp:RegularExpressionValidator ID="reg_procedure" runat="server" ControlToValidate="txt_procedure" ErrorMessage="Invalid procedure, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="UpdateInvoice" />
                                <br />
                                <asp:Label ID="lbl_payment" runat="server" Text="Payment Method" AssociatedControlID="txt_payment" />
                                <asp:TextBox ID="txt_payment" runat="server" Text='<%#Bind("payment_method") %>'  />

                                <asp:RequiredFieldValidator ID="rfv_payment" runat="server" ControlToValidate="txt_payment" Text="*Require" ErrorMessage="A payment method is needed" Display="Static" ValidationGroup="UpdateInvoice" /> 
                               <asp:RegularExpressionValidator ID="reg_payment" runat="server" ControlToValidate="txt_payment" ErrorMessage="Invalid Payment method, Creditcard, Paypal or NULL" Display="None" ValidationExpression="^(Creditcard|Paypal|None)" ValidationGroup="UpdateInvoice" /> 
                               <br />
                                <asp:Label ID="lbl_pid" runat="server" Text="Patient ID" AssociatedControlID="txt_pid" />
                                <asp:TextBox ID="txt_pid" runat="server" Text='<%#Bind("patient_id") %>' />

                                <asp:RequiredFieldValidator ID="rfv_pid" runat="server" ControlToValidate="txt_pid" Text="*Required" Display="Static" ErrorMessage="An associated patient ID is needed" ValidationGroup="UpdateInvoice" />
                                <asp:CompareValidator ID="cv_pid" runat="server" ControlToValidate="txt_pid" Operator="DataTypeCheck" Type="Integer" Display="None" ErrorMessage="invalid form for patient id" ValidationGroup="UpdateInvoice" />

                    <br /><br />
                <asp:LinkButton ID="btn_update" runat="server" Text="Update Invoice"  CommandName="Updatex" CommandArgument='<%#Eval("Id") %>' ValidationGroup="UpdateInvoice" />
                <asp:LinkButton ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancelx" CausesValidation="false" />
                <asp:ValidationSummary ID="vs_updateinvoice" runat="server" HeaderText="Edit Invoice Form Errors" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="UpdateInvoice" />

                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>



    </div>
</asp:Content>
