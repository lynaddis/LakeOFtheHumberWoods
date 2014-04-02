p<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CalA.aspx.cs" Inherits="CalA" Debug="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <asp:Calendar ID="calSchedule" OnDayRender="calSchedule_DayRender" runat="server" >
        
      </asp:Calendar>

        <asp:Label ID="lbl_output" runat="server" />
   
   
    </div>
    </form>
</body>
</html>
