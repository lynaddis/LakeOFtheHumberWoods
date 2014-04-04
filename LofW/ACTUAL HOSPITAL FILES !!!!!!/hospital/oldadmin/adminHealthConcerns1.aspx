<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminHealthConcerns1.aspx.cs" Inherits="_adminHealthConcerns" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

      <asp:Label ID="lbl_message" runat="server" />
        <br />
        <br />
    
         
                    <%--Creating Insert textboxes --%>
                     <asp:Label ID="lbl_illname" runat="server" Text="Illness Name: " />
                    <asp:TextBox ID="txt_infnameI" runat="server" /> 
                     <asp:RequiredFieldValidator ID="rfv_infnameI" runat="server" ControlToValidate="txt_infnameI" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
                  <br />
         <asp:Label ID="lbl_region" runat="server" Text=" Region Infected: " />
              
                        <asp:TextBox ID="txt_locationI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_locationI" runat="server" ControlToValidate="txt_locationI" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
                         <br />
                    <asp:Label ID="lbl_entryDateI" runat="server" Text="Date" />

                    <asp:TextBox ID="txt_entryDateI" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_txt_entryDate" runat="server" ControlToValidate="txt_entryDateI" SetFocusOnError="true" ErrorMessage="Please enter date" Display="Dynamic" />
                <br />
                    
                     <asp:Label ID="lbl_desc" runat="server" Text="Description:" />
                        <asp:TextBox ID="txt_descI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_descI" runat="server" ControlToValidate="txt_descI" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
                       <br />
                     <asp:Label ID="lbl_symptoms" runat="server" Text=" Symptoms:" />
                        <asp:TextBox ID="txt_symptomsI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_symptomsI" runat="server" ControlToValidate="txt_symptomsI" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
                            <br />
                     <asp:Label ID="lbl_prev" runat="server" Text="Preventatives:" />
                    <asp:TextBox ID="txt_preventI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_preventI" runat="server" ControlToValidate="txt_preventI" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
    
          <br />
                      <asp:Label ID="lbl_treat" runat="server" Text="Treatments:" />
                    <asp:TextBox ID="txt_treatmentsI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_treatmentsI" runat="server" ControlToValidate="txt_treatmentsI" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
    

              <br />
                     <asp:Label ID="lbl_rec" runat="server" Text=" Recommenations: " />
       
                    <asp:TextBox ID="txt_recommendI" runat="server" />
                       

                    <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subInsert" CommandName="Insert" /><%-- onCommand for subroutine on code behind called subAdmin --%>
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subInsert" CommandName="Cancel" />

            <%-- end of insert rows--%>

         <asp:DataList ID="dtl_all" runat="server" >
                <ItemTemplate>
                    </ItemTemplate>
             </asp:DataList>

        <a href="adminrecommendations.aspx">Review Submitted Reccomendations</a>
                <a href="adminVol.aspx">Volunteer submitted forms</a>
    </div>
    </form>
</body>
</html>
