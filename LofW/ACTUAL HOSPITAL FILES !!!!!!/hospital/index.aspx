<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" Culture="en-CA" UICulture="en-CA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:Login ID="log_form" runat="server" DestinationPageUrl="~/Patient/account.aspx" />
        <br />


        <asp:TextBox ID="test" runat="server" />
        <%--<asp:CompareValidator ID="cv_dob" runat="server" ControlToValidate="test" Operator="DataTypeCheck" Type="Date" Text="invalid" Display="Static" ErrorMessage="invalid form for date of birth" ValidationGroup="addUser" />
       --%> <asp:CustomValidator ID="cv_date" runat="server" ControlToValidate="test" Text="*Invalid" Display="Static" OnServerValidate="testDate" ErrorMessage="invalid form for date of birth" /> 
        <asp:Label ID="lbl" runat="server"  />      

     <%--<asp:Calendar ID="cal" runat="server" OnDayRender="test" />   
     

<asp:Label id="lblEntry" Text="Entry:" AssociatedControlID="txtEntry" Runat="server" />
<br /> 
<asp:TextBox id="txtEntry"  TextMode="MultiLine" Columns="40" Rows="8" Runat="server" />
<br /> 
<asp:Button id="btnInsert" Text="Insert"  CommandName="Insert" Runat="server" />--%>
  
    </div>
    </form>
</body>
</html>
