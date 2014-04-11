<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LabResults.aspx.cs"  MasterPageFile="~/Master.master" Inherits="LabResults" %>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
   
     <h1>Lab Results </h1>
    <h2>Please Contact Your Physician For Further Details. </h2><br />
       
 <asp:GridView ID="grd_main" runat="server"  AllowSorting="true"  AutoGenerateColumns="false" BorderWidth="1px"  ForeColor="Black"  GridLines="Both">
   <HeaderStyle BackColor="blue" Font-Bold="True" CssClass="titleText"  />
                 <Columns>
           <asp:TemplateField>
               <HeaderTemplate>
                        <table>
                        <tr>
                        <th>PatientCode</th>
                        <th>Gender</th>
                        <th>Age<th> 
                        <th>Result</th>
                        <th>Test Code</th>
                        <th>Test Type</th>
                        </tr>
                       </table>
                   </HeaderTemplate>
                   <ItemTemplate>
                   <asp:Label ID="lbl_name" runat="server" Text='<%#Eval("patientCode")%>' />
                   <asp:Label ID="lbl_sex" runat="server" Text='<%#Eval("sex")%>' />
                   <asp:Label ID="lbl_age" runat="server" Text='<%#Eval("age")%>' />
                   <asp:label ID="lbl_result" runat="server" Text='<%#Eval("resultType1")%>' />
                   <asp:label ID="lbl_code" runat="server" Text='<%#Eval("TestCode")%>' />
                   <asp:label ID="lbl_type" runat="server" Text='<%#Eval("TestType")%>' />
                   </ItemTemplate>
                 </asp:TemplateField>
                </Columns>
             </asp:GridView>
    </asp:Content>
