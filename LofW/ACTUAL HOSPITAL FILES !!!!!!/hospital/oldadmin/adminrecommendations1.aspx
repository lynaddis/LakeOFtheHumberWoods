<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminrecommendations.aspx.cs" Inherits="adminrecommendations" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:repeater ID="rpt_rec" runat="server">
        <ItemTemplate>
               <br />

            <asp:HiddenField ID="hdf_Id" runat="server" Value='<%#Eval ("Id") %>' />
            
           <asp:label ID="lt_name" runat="server" Text='<%#Eval ("name") %>' />
            <br />
             <asp:label ID="lt_illname" runat="server" Text='<%#Eval ("ill_name") %>' />
            <br />
            <asp:label ID="lt_region" runat="server" Text='<%#Eval ("region") %>' />
            <br />
            <asp:label ID="lt_rec" runat="server" Text='<%#Eval ("recomend") %>' />
            <br />
               <br />
           <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Confirm Delete?');" />
            
               <br />   <br />   <br />
        </ItemTemplate>

    </asp:repeater>

                   <asp:Label ID="lbl_message" runat="server" />

          <a href="adminHealthConcerns.aspx">Back to Health Concerns Input Fields</a>
    </div>
    </form>
</body>
</html>
