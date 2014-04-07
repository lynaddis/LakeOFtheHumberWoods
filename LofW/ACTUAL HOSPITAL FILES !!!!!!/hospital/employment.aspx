<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="employment.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
    <asp:Label ID="lbl_employment" runat="server" />
    <table>
        <tr><th>Personal</th></tr>
        <tr><asp:label ID="hdf_IdE" runat="server" Value='<%#Eval("Id") %>' />
            
            <td><asp:Label ID="lbl_fname" runat="server" Text="First Name" /></td>
            <td><asp:TextBox ID="txt_fname" runat="server" /></td>
                <asp:RequiredFieldValidator ID="rqv_fname" runat="server" ControlToValidate="txt_fname" ErrorMessage="*First Name Required" Text="*Required" ValidationGroup="employeeInsert" />
                <asp:RegularExpressionValidator ID="rgv_fname" runat="server" display="Dynamic" ControlToValidate="txt_fname" 
                    ErrorMessage="Enter First Name in Characters only!" validationexpression="[a-zA-Z]*" ValidationGroup="employeeInsert" />
            <td></td><td></td>
            <td><asp:Label ID="lbl_address" runat="server" Text="Address" /></td>
            <td><asp:TextBox ID="txt_address" runat="server" /></td></tr>
                <asp:RequiredFieldValidator ID="rqv_add" runat="server" ControlToValidate="txt_address" ErrorMessage="*Address Required" Text="*Required" ValidationGroup="employeeInsert"/>
           
        <tr>
            <td><asp:Label ID="lbl_lname" runat="server" Text="Last Name" /></td>
            <td><asp:textBox ID="txt_lname" runat="server" />
               <asp:RequiredFieldValidator ID="rqv_lname" runat="server" ControlToValidate="txt_lname" ErrorMessage="*Last Required" Text="*Required" ValidationGroup="employeeInsert" />
               <asp:RegularExpressionValidator ID="rgv_lname" runat="server" display="Dynamic" ControlToValidate="txt_lname" 
                    ErrorMessage="Enter Last Name in Characters only!" validationexpression="[a-zA-Z]*" ValidationGroup="employeeInsert" />
            </td>
            <td></td><td></td>
             <td><asp:Label ID="lbl_pcode" runat="server" Text="Postal Code" /></td>
            <td><asp:TextBox ID="txt_pcode" runat="server" />
               <asp:RequiredFieldValidator ID="rqv_pcode" runat="server" ControlToValidate="txt_pcode" ErrorMessage="*Postal Code Required" Text="*Required" ValidationGroup="employeeInsert" />
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_email" runat="server" Text="E-mail" /></td>
            <td><asp:TextBox ID="txt_email" runat="server" />
                <asp:RequiredFieldValidator ID="rqv_email" runat="server" ControlToValidate="txt_email" ErrorMessage="*Email Required" Text="*Required" ValidationGroup="employeeInsert" />
                  <%--To make sure valid E-mail will be entered --%>
                    <asp:RegularExpressionValidator ID="rgv_email" runat="server" ControlToValidate="txt_email" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="*Enter a valid e-mail" ValidationGroup="employeeInsert"/>
                   
            </td>
            <td></td><td></td>
             <td><asp:Label ID="lbl_state" runat="server" Text="State" /></td>
            <td><asp:TextBox ID="txt_state" runat="server" />
           <asp:RequiredFieldValidator ID="rqv_state" runat="server" ControlToValidate="txt_state" ErrorMessage="*State Required" Text="*Required" ValidationGroup="employeeInsert" />
            <asp:RegularExpressionValidator ID="rgv_state" runat="server" display="Dynamic" ControlToValidate="txt_state" 
                    ErrorMessage="Enter State in Characters only!" validationexpression="[a-zA-Z]*" ValidationGroup="employeeInsert" />
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_phone" runat="server" Text="Primary Phone" /></td>
            <td><asp:TextBox ID="txt_phone" runat="server" />
                <asp:RequiredFieldValidator ID="rqv_phone" runat="server" ControlToValidate="txt_phone" ErrorMessage="*Mobile Number Required" Text="*Required" ValidationGroup="employeeInsert" />
                <asp:RegularExpressionValidator ID="rgv_phone" runat="server" ControlToValidate="txt_phone" ValidationExpression="^[0-9]{10}$" 
                 ErrorMessage="Provide valid mobile number, Must be 10 digits" ValidationGroup="employeeInsert" />  <%-- TO make sure Mobile Number is 10 Digits long--%>
           </td>
            <td></td><td></td>
            <td><asp:Label ID="lbl_country" runat="server" text="Country" /></td>
            <td><asp:TextBox ID="txt_country" runat="server" />
                <asp:RequiredFieldValidator ID="rqv_country" runat="server" ControlToValidate="txt_country" ErrorMessage="*Country Required" Text="*Required" ValidationGroup="employeeInsert" />
                 <asp:RegularExpressionValidator ID="rgv_country" runat="server" display="Dynamic" ControlToValidate="txt_country" 
                    ErrorMessage="Enter Country in Characters only!" validationexpression="[a-zA-Z]*" ValidationGroup="employeeInsert" />

                </td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_ophone" runat="server" Text="Other Phone" /></td>
            <td><asp:TextBox ID="txt_ophone" runat="server" /></td>
             <asp:RegularExpressionValidator ID="rgv_ophone" runat="server" ControlToValidate="txt_ophone" ValidationExpression="^[0-9]{10}$" 
                 ErrorMessage="Provide valid mobile number, Must be 10 digits" ValidationGroup="employeeInsert" /> 
            <td><asp:Label ID="lbl_ddl" runat="server" Text="Applying For" /></td>
            <td><asp:DropDownList ID="ddl_title" runat="server" /></td>                
            <td></td><td></td>
            
        </tr>
        <tr><th>Highest Qualification</th></tr>
        <tr><th>Date of Attended</th></tr>
        <tr>
            <td><asp:Label ID="lbl_edufrom" runat="server" Text="From dd/mm/yy" /></td>
            <td><asp:TextBox ID="txt_edufrom" runat="server" Wrap="true"  />
                <asp:RequiredFieldValidator ID="rqv_edufrom" runat="server" ControlToValidate="txt_edufrom" ErrorMessage="*Required,  Enter Date in dd/mm/yy format" ValidationGroup="employeeInsert" />
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_eduto" runat="server" Text="To dd/mm/yy" /></td>
            <td><asp:TextBox ID="txt_eduto" runat="server" />
                <asp:RequiredFieldValidator ID="rqv_eduto" runat="server" ControlToValidate="txt_eduto" ErrorMessage="*Required, Enter Date in dd/mm/yy format" ValidationGroup="employeeInsert" />
            </td>
       </tr>
        <tr>
            <td><asp:Label ID="lbl_eduLevel" runat="server" Text="Education Level" /></td>
            <td><asp:TextBox ID="txt_eduLevel" runat="server" />
            <asp:RequiredFieldValidator ID="rqv_eduLevel" runat="server" ControlToValidate="txt_eduLevel" ErrorMessage="*Education Level Required" Text="*Required" ValidationGroup="employeeInsert" />
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_eduInstitute" runat="server" Text="Institution" /></td>
            <td><asp:TextBox ID="txt_eduInstitute" runat="server" />
                <asp:RequiredFieldValidator ID="rqv_eduInstitute" runat="server" ControlToValidate="txt_eduInstitute" ErrorMessage="*Institution Required" Text="*Required" ValidationGroup="employeeInsert" />
                
            </td>
        </tr>
        <tr>
            <th>Work Experience</th>
        </tr>
        <tr><td><asp:textbox ID="txt_wexp" runat="server" TextMode="MultiLine" /></td></tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btn_submit" runat="server" Text="Submit" CommandName="Insert" OnCommand="subInsert" ValidationGroup="employeeInsert" /></td>
            <td><asp:Button ID="btn_upload" runat="server" Text="Upload Resume" /></td>
        </tr>
    <asp:ValidationSummary ID="vds_main" runat="server" DisplayMode="BulletList" ShowMessageBox="true"  ValidationGroup="employeeInsert" HeaderText="Please fill in the required fields !" ShowSummary="false" />
    </table>
</asp:Content>
