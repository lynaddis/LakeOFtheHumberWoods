<%@ Page Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="admin_login.aspx.cs" Inherits="admin_login" %>
<%@ MasterType VirtualPath="~/Master.master" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Login ID="log_form" runat="server" DestinationPageUrl="~/admin/homeadmin.aspx" />
        <br />
    </div>
    </form>
</body>
</html>
