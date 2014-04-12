<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
     <asp:Label ID="lbl_msg" runat="server" />
     <h2>Concerns or comments about patient care?</h2>
    <h3>If you have concerns or comments about patient care that have not been addressed by the department or nursing unit where 
        the patient is receiving care or did receive care, please feel welcome to share patient experience.<br />
        <br />
        Please note: Lake of Humber Woods cannot provide personal health advice over the internet.
         Please consult your own physician for advice, appointments or referral.</h3><br />
      
        <br />
        <table>
            <tr>
                <td><asp:Label ID="lbl_fname" runat="server" Text="First Name " /></td>
                <td><asp:TextBox ID="txt_fname" runat="server" />
                    <asp:RequiredFieldValidator ID="rqv_fname" runat="server" ControlToValidate="txt_fname" ErrorMessage="*First Name Required" Text="*Required" />
                <%-- TO make sure First name will be entered in chracters only--%> 
                     <asp:RegularExpressionValidator ID="rgv_fname" runat="server" display="Dynamic" ControlToValidate="txt_fname" 
                    ErrorMessage="Enter First Name in Characters only!" validationexpression="[a-zA-Z]*" />
                </td>                
            </tr>
            <tr>
                <td><asp:Label ID="lbl_lname" runat="server" Text="Last Name " /></td>
                <td><asp:TextBox ID="txt_lname" runat="server" />
                    <asp:RequiredFieldValidator ID="rqv_lname" runat="server" ControlToValidate="txt_lname" ErrorMessage="*Last Name Required" Text="*Required" />
                <%-- TO make sure Last name will be entered in chracters only--%> 
                     <asp:RegularExpressionValidator ID="rgv_lname" runat="server" display="Dynamic" ControlToValidate="txt_lname" 
                    ErrorMessage="Enter Last Name in Characters only!" validationexpression="[a-zA-Z]*" />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_tel" runat="server" Text="Telephone " /></td>
                <td><asp:TextBox ID="txt_tel" runat="server" />
                    <asp:RequiredFieldValidator ID="rqv_tel" runat="server" ControlToValidate="txt_tel" ErrorMessage="*Mobile Number Required" Text="*Required" />
                    <asp:RegularExpressionValidator ID="rgv_tel" runat="server" ControlToValidate="txt_tel" ValidationExpression="^[0-9]{10}$" 
                        ErrorMessage="Provide valid mobile number, Must be 10 digits" /> <%-- TO make sure Mobile Number is 10 Digits long--%>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_email" runat="server" Text="E-Mail " /></td>
                <td><asp:TextBox ID="txt_email" runat="server" />
                    <asp:RequiredFieldValidator ID="rqv_email" runat="server" ControlToValidate="txt_email" ErrorMessage="*Email Required" Text="*Required" />
                     <%--To make sure valid E-mail will be entered --%>
                    <asp:RegularExpressionValidator ID="rgv_email" runat="server" ControlToValidate="txt_email" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="*Enter a valid e-mail" />
                                   
                        
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_subject" runat="server" Text="E-Subject " /></td>
                <td><asp:TextBox ID="txt_subject" runat="server" />
                    <asp:RequiredFieldValidator ID="rqv_subject" runat="server" ControlToValidate="txt_subject" ErrorMessage="*Subject Required" Text="*Required" />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_message" runat="server" Text="Message Body " /></td>
                <td><asp:TextBox ID="txt_message" runat="server" TextMode="MultiLine" Height="100" />
                    <asp:RequiredFieldValidator ID="rqv_message" runat="server" ControlToValidate="txt_message" ErrorMessage="*Enter Message" Text="*Required" />
                </td>
            </tr>
           
            <tr><td></td>
                <td><asp:Button ID="btn_submit" runat="server" Text="Submit" CommandName="Insert" OnCommand="subInsert" /></td>
            </tr>
        </table>
    <asp:ValidationSummary ID="vds_all" runat="server" HeaderText="Please fill in the required fields !" DisplayMode="BulletList" ShowSummary="false" ShowMessageBox="true" />
</asp:Content>
