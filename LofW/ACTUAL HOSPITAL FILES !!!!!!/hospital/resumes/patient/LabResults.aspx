<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LabResults.aspx.cs" Inherits="LabResults" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
 <asp:GridView ID="grd_main" runat="server"  AllowSorting="true"  AutoGenerateColumns="false" BorderWidth="1px" CellPadding="2" ForeColor="Black"    GridLines="Vertical"> <%--Grid view data bound control --%>
             
    <FooterStyle BackColor="Tan" />
    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" Font-Bold="True" />
    <HeaderStyle BackColor="Tan" Font-Bold="True" />
    <AlternatingRowStyle BackColor="PaleGoldenrod" />
             <Columns>
           <asp:TemplateField>
               <ItemTemplate>
                   <asp:Label ID="lbl_name" runat="server" Text='<%#Eval("patientCode")%>' />
                   <asp:Label ID="lbl_sex" runat="server" Text='<%#Eval("sex")%>' />
                   <asp:Label ID="lbl_age" runat="server" Text='<%#Eval("age")%>' />
                   <asp:label ID="lbl_result" runat="server" Text='<%#Eval("resultType1")%>' />
                    </ItemTemplate>
                 </asp:TemplateField>
                </Columns>
             </asp:GridView>




    </div>
    </form>
</body>
</html>
