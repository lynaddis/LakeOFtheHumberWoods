<%@ Page Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="LabResults.aspx.cs" Inherits="patient_LabResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
    <div>
        <asp:LoginName ID="log_name" runat="server" FormatString="Welcome, {0} " />
 <asp:GridView ID="grd_main" runat="server"  AllowSorting="true"  AutoGenerateColumns="false" BorderWidth="1px" CellPadding="2" ForeColor="Black"    GridLines="Vertical"> <%--Grid view data bound control --%>
             
    <FooterStyle BackColor="Tan" />
    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" Font-Bold="True" />
    <HeaderStyle BackColor="Tan" Font-Bold="True" />
    <AlternatingRowStyle BackColor="PaleGoldenrod" />
             <Columns>
        <asp:TemplateField HeaderText="Patient Code">
        <ItemTemplate>
        <%#Eval("patientCode")%> />
       </ItemTemplate>
     
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Date of Birth">
        <ItemTemplate>
          <%#Eval("DateofBirth")%>
        </ItemTemplate>
     
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Gender">
        <ItemTemplate>
          <%#Eval("sex")%>
        </ItemTemplate>
        </asp:TemplateField>
     
         <asp:TemplateField HeaderText="Test Code">
        <ItemTemplate>
         <%#Eval("testCode")%>
        </ItemTemplate>
          </asp:TemplateField>
                                  
        <asp:TemplateField HeaderText="Result">
        <ItemTemplate>
        <%#Eval("resultType1")%>
        </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Result Description">
        <ItemTemplate>
        <%#Eval("resultdescription")%>
        </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Reference Range">
        <ItemTemplate>
       <%#Eval("referenceRange")%>
        </ItemTemplate>
        </asp:TemplateField>
        </Columns>
         
     </asp:GridView>
    </div>
    </asp:Content>
