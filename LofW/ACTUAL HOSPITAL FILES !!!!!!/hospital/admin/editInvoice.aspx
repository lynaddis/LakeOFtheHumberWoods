<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editInvoice.aspx.cs" Inherits="Admin_editInvoice" %>

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

        <asp:HyperLink ID="hyp_admin_menu" runat="server" Text="Main Menu" NavigateUrl="~/admin/homeadmin.aspx" />
        <br /> <br /> <br />
        </div>
    <div>
        <asp:Label ID="lbl_title" runat="server" Text="Edit Invoice" />
        <br /><br />

        <asp:Label ID="lbl_status" runat="server" />
        <br /> <br />

        <table>
            <tr>
                <td>
                    <asp:RadioButton ID="rbl_invoiceid" runat="server" Text="Search By Invoice ID"  GroupName="search"  OnCheckedChanged="Checked"  AutoPostBack="true" />
                </td>
                <td>
                    <asp:TextBox ID="txt_byInvoice" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_byinvoice" runat="server" ControlToValidate="txt_byInvoice" Text="*Required" Display="static" ErrorMessage="An Invoice Id is required" ValidationGroup="ByInvoice" />
                    <asp:CompareValidator ID="cv_Invoice" runat="server" ControlToValidate="txt_byInvoice" Operator="DataTypeCheck" Type="Integer" Display="None" ErrorMessage="invalid invoice ID" ValidationGroup="ByInvoice" /> 
                </td>
                <td>
                    <asp:Button ID="btn_byInvoice" runat="server" OnClick="subByInvoice" Text="Search" ValidationGroup="ByInvoice" />
                    <asp:ValidationSummary ID="vs_ByInvoice" runat="server" HeaderText="Search By Invoice ID Errors" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ByInvoice" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButton ID="rbl_patientid" runat="server" Text="Search by Patient ID" GroupName="search" OnCheckedChanged="Checked"  AutoPostBack="true" />
                </td>
                <td>
                    <asp:TextBox ID="txt_byPatient" runat="server" />
                </td>
                <td>
                     <asp:RequiredFieldValidator ID="rfv_bypatient" runat="server" ControlToValidate="txt_byPatient" Text="*Required" ErrorMessage="A Patient ID is required" Display="Static" ValidationGroup="ByPatient" />
                     <asp:CompareValidator ID="cv_patient" runat="server" ControlToValidate="txt_byPatient" Operator="DataTypeCheck" Type="Integer" Display="None" ErrorMessage="invalid patient ID" ValidationGroup="ByPatient" />
                             
                </td>
                <td>
                     <asp:Button ID="btn_bypatient" runat="server" OnClick="subByPatient" Text="Search" ValidationGroup="ByPatient" />
                    <asp:ValidationSummary ID="vs_Bypatient" runat="server" HeaderText="Search By Patient ID Errors" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="ByPatient" /> 
                </td>
            </tr>
        </table>
        <br /><br />

        <asp:Label ID="lbl_invoicelist" runat="server" />
        <br /><br />

        <asp:Panel ID="pnl_display" runat="server" >
            <asp:Repeater ID="rp_editInvoice" runat="server" OnItemCommand="subAdmin" >
                <ItemTemplate>
                    <table>
                        <tr>
                           <th>Amount </th> <th> Status </th> <th> Procedure </th> <th> Payment Method </th> <th> Patient ID </th>   
                        </tr>
                        <tr>
                        
                            <td> <asp:Label ID="lbl_amount" runat="server" Text='<%#Eval("amount") %>' />  </td>
                            <td> <asp:Label ID="lbl_status" runat="server" Text='<%#Eval("status") %>' /> </td>
                            <td> <asp:Label ID="lbl_procedure" runat="server" Text='<%#Eval("procedure") %>' /> </td>
                            <td> <asp:Label ID="lbl_payment_method" runat="server" Text='<%#Eval("payment_method") %>' />  </td>
                            <td> <asp:Label ID="lbl_patientid" runat="server" Text='<%#Eval("patient_id") %>' /> </td>
                            <td> 
                                <asp:LinkButton ID="lk_btn_update" runat="server" Text="Edit" CommandName="Editx" CommandArgument='<%#Eval("Id") %>' CausesValidation="false" /> 
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>
         </asp:Panel>

        <asp:Panel ID="pnl_edit" runat="server" >
            <asp:Repeater ID="rp_updateInvoice" runat="server" OnItemCommand="subAdmin" >
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_amount" runat="server" Text="Amount" />
                            </td>
                            <td>
                                <asp:TextBox ID="txt_amount" runat="server" Text='<%#Bind("amount") %>' />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfv_amount" runat="server" ControlToValidate="txt_amount" Text="*Required" ErrorMessage="An amount is required" Display="Static" ValidationGroup="UpdateInvoice" />
                                <asp:CompareValidator ID="cv_amount" runat="server" ControlToValidate="txt_amount" Operator="DataTypeCheck" Type="Currency" Display="None" ErrorMessage="Invalid amount entered" ValidationGroup="UpdateInvoice" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_status" runat="server" Text="Status" />
                            </td>
                            <td>
                                <asp:TextBox ID="txt_status" runat="server" Text='<%#Bind("status") %>' />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfv_status" runat="server" ControlToValidate="txt_status" Text="*Required" ErrorMessage="A status is required" Display="Static" ValidationGroup="UpdateInvoice" />
                                <asp:RegularExpressionValidator ID="reg_status" runat="server" ControlToValidate="txt_status" ErrorMessage="Invalid status, Paid or Unpaid" Display="None" ValidationExpression="^(Paid|Unpaid)" ValidationGroup="UpdateInvoice" />
                             </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_procedure" runat="server" Text="Procedure" />
                            </td>
                            <td>
                                <asp:TextBox ID="txt_procedure" runat="server" Text='<%#Bind("procedure") %>' /> 
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfv_procedure" runat="server" ControlToValidate="txt_procedure" Text="*Required" ErrorMessage="A procedure is required" Display="Static" ValidationGroup="UpdateInvoice" />
                                <asp:RegularExpressionValidator ID="reg_procedure" runat="server" ControlToValidate="txt_procedure" ErrorMessage="Invalid procedure, characters only" Display="None" ValidationExpression="[A-Za-z\s]+$" ValidationGroup="UpdateInvoice" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_payment" runat="server" Text="Payment Method" />
                            </td>
                            <td>
                                <asp:TextBox ID="txt_payment" runat="server" Text='<%#Bind("payment_method") %>'  />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfv_payment" runat="server" ControlToValidate="txt_payment" Text="*Require" ErrorMessage="A payment method is needed" Display="Static" ValidationGroup="UpdateInvoice" /> 
                               <asp:RegularExpressionValidator ID="reg_payment" runat="server" ControlToValidate="txt_payment" ErrorMessage="Invalid Payment method, Creditcard, Paypal or NULL" Display="None" ValidationExpression="^(Creditcard|Paypal|None)" ValidationGroup="UpdateInvoice" /> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_pid" runat="server" Text="Patient ID" />
                            </td>
                            <td>
                                <asp:TextBox ID="txt_pid" runat="server" Text='<%#Bind("patient_id") %>' />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfv_pid" runat="server" ControlToValidate="txt_pid" Text="*Required" Display="Static" ErrorMessage="An associated patient ID is needed" ValidationGroup="UpdateInvoice" />
                                <asp:CompareValidator ID="cv_pid" runat="server" ControlToValidate="txt_pid" Operator="DataTypeCheck" Type="Integer" Display="None" ErrorMessage="invalid form for patient id" ValidationGroup="UpdateInvoice" />
                            </td>
                        </tr>
                    </table>
                    <br />
                <asp:LinkButton ID="btn_update" runat="server" Text="Update Invoice"  CommandName="Updatex" CommandArgument='<%#Eval("Id") %>' ValidationGroup="UpdateInvoice" />
                <asp:LinkButton ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancelx" CausesValidation="false" />
                <asp:ValidationSummary ID="vs_updateinvoice" runat="server" HeaderText="Edit Invoice Form Errors" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="UpdateInvoice" />

                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>



    </div>
    </form>
</body>
</html>
