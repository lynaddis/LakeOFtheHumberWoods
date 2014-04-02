<%@ Page Language="C#" AutoEventWireup="true" CodeFile="volunteer.aspx.cs" Inherits="publicVol" Debug="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
   
        
              

                    <%--Creating Insert textboxes --%>
        <asp:Label ID="lbl_fname" runat="server" Text="Full Name: " />
        <br />
                    <asp:TextBox ID="txt_nameI" runat="server" /> 
                     <asp:RequiredFieldValidator ID="rfv_nameI" runat="server" ControlToValidate="txt_nameI" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />

        <br />
          <asp:Label ID="lbl_age" runat="server" Text="Age: " />
              <br />    
                        <asp:TextBox ID="txt_ageI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_ageI" runat="server" ControlToValidate="txt_ageI" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
                       <br />
          <asp:Label ID="lbl_gender" runat="server" Text="Gender: " />
                 <br />
               <asp:TextBox ID="txt_genderI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_genderI" runat="server" ControlToValidate="txt_genderI" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
                      <br />
          <asp:Label ID="lbl_email" runat="server" Text="Email:" /> 
       <br />
         <asp:TextBox ID="txt_emailI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_emailI" runat="server" ControlToValidate="txt_emailI" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
                      <br />
          <asp:Label ID="lbl_phone" runat="server" Text="Phone: " />
                  <br />  <asp:TextBox ID="txt_phoneI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_phoneI" runat="server" ControlToValidate="txt_phoneI" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
               <br />
          <asp:Label ID="lbl_reason" runat="server" Text="Reason For Volunteering: " />
                 <br />   <asp:TextBox ID="txt_reasonI" runat="server" TextMode="MultiLine" Rows="4" />
                        <asp:RequiredFieldValidator ID="rfv_reasonI" runat="server" ControlToValidate="txt_reasonI" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
                  <br />
          <asp:Label ID="lbl_Experience" runat="server" Text="Have you Volunteered here before?" />
               <br />     <asp:TextBox ID="txt_VolExpI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_VolExpI" runat="server" ControlToValidate="txt_VolExpI" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
                  <br />
          <asp:Label ID="lbl_yes" runat="server" Text="If yes, what did you do?" />
               <br />     <asp:TextBox ID="txt_ifYesI" runat="server" />
                   <br />
          <asp:Label ID="lbl_noHours" runat="server" Text="How many hours do you want?" />
                  <br />  <asp:TextBox ID="txt_noHoursI" runat="server" />
                   
                <br />
          <asp:Label ID="lbl_PR" runat="server" Text="Is there someone you would like to volunteer with?" />
                <br />    <asp:TextBox ID="txt_personRequestI" runat="server" />
                <br />
          <asp:Label ID="lbl_int" runat="server" Text="Any specific interets (ie. department, practice)" />
                 <br />   <asp:TextBox ID="txt_interestI" runat="server" />
                 <br />
          <asp:Label ID="lbl_allergy" runat="server" Text="Do you have any allergies?" />
                 <br />   <asp:TextBox ID="txt_allergiesI" runat="server" />
                     <br />
          <asp:Label ID="lbl_refuse" runat="server" Text="Departments you refuse to work in: " />
                 <br />   <asp:TextBox ID="txt_deptRefuseI" runat="server" />
                     <br />
          <asp:Label ID="lbl_request" runat="server" Text="Departments you want to work in: " />
                 <br />   <asp:TextBox ID="txt_deptRequestI" runat="server" />
            <br />
        <br />
                    <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subInsert" CommandName="Insert" /><%-- onCommand for subroutine on code behind called subAdmin --%>
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subInsert" CommandName="Cancel" />
        
            <%-- end of insert rows--%>
        <br />
        <br />
             <asp:Label ID="lbl_message" runat="server" />
        <br />

         <asp:DataList ID="dtl_all" runat="server" >
                <ItemTemplate>
                    </ItemTemplate>
             </asp:DataList>
    </div>
    </form>
</body>
</html>
