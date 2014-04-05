<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="pages_Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../App_Themes/Donation.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="Error">
    <table>
        <tr>
            <td colspan="3"><h1>Un Known Error Occur.</h1><br />
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
