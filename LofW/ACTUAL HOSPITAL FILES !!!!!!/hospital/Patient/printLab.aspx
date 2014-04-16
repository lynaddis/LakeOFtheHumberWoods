﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="printLab.aspx.cs" Inherits="Patient_printLab" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:DetailsView ID="dv_print" runat="server"  AutoGenerateRows="false" >
            <Fields>
                <asp:TemplateField>
                    <ItemTemplate>
                       
                     <asp:Label ID="lbl_invoice_num" runat="server" Text="Invoice #: " /> <asp:Label ID="lbl_num" runat="server" Text='<%#Eval("patientCode") %>' />
                     <br />    
                     <asp:Label ID="lbl_colAmount" runat="server" Text="Amount :" /> <asp:Label ID="lbl_amount" runat="server" Text='<%#Eval("DateofBirth") %>' /> 
                     <br />       
                     <asp:Label ID="lbl_colProcedure" runat="server" Text="Procedure :" /> <asp:Label ID="lbl_procedure" runat="server" Text='<%#Eval("sex") %>' />
                      <br />   
                     <asp:Label ID="lbl_colStatus" runat="server" Text="Status :" /> <asp:Label ID="lbl_status" runat="server" Text='<%#Eval("testCode") %>' />
                      
                    </ItemTemplate>
                </asp:TemplateField>
             </Fields>
         </asp:DetailsView>
    </div>
    </form>
</body>
</html>
