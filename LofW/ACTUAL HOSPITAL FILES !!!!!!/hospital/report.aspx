<%@ Page Language="C#" AutoEventWireup="true" CodeFile="report.aspx.cs" Inherits="report" %>
<%@ MasterType VirtualPath="~/Master.master" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div>
  <asp:ScriptManager ID="scm_main" runat="server" /> <%--allows ajax--%>
        <asp:UpdatePanel ID="upd_main" runat="server">
            <ContentTemplate>
             <rsweb:ReportViewer ID="rpt_report" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" >
                    <LocalReport ReportPath="Report1.rdlc">
                     <DataSources>
                         <rsweb:ReportDataSource DataSourceId="LabResults" Name="LabResults" />
                     </DataSources>
                 </LocalReport>
                </rsweb:ReportViewer>
            </ContentTemplate>
            </asp:UpdatePanel>
    </div>
    </div>
    </form>
</body>
</html>

