<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cancel.aspx.cs" Inherits="cancel" %>
<%@ MasterType VirtualPath="~/Master.master" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <%-- Cancel page for users who cancel their paypal transaction; redirects to homepage --%>
<script type="text/javascript">
    alert("You have chosen to cancel the Paypal Payment process;The Transaction has been stopped and you will be redirected tothe hospital home page!'");
    window.location ="http://daniellestirling.com/hospital/home.aspx";
</script>
<body>
    <form id="form1" runat="server">
    <div>
        
    </div>
    </form>
</body>
</html>
