<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="adminhealthconcerns.aspx.cs" Inherits="adminhealthconcerns" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
     <asp:Label ID="lbl_message" runat="server" />
        <br />
        <br />
    
                      <a href="homeadmin.aspx">Back To Home</a>
 
                    <%--Creating Insert textboxes --%>
    <asp:HiddenField ID="hdf_Id" runat="server" Value='<%#Eval("Id") %>' />

                     <asp:Label ID="lbl_illname" runat="server" Text="Illness Name: " />
                    <asp:TextBox ID="txt_infnameI" runat="server" /> 
                     <asp:RequiredFieldValidator ID="rfv_infnameI" runat="server" ControlToValidate="txt_infnameI" SetFocusOnError="true" ErrorMessage="Please Enter Illness Name!" Text="*Required!" Display="Dynamic" ValidationGroup="illess_val" />
                  <br />
         <asp:Label ID="lbl_region" runat="server" Text=" Region Infected: " />
              
                        <asp:TextBox ID="txt_locationI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_locationI" runat="server" ControlToValidate="txt_locationI" SetFocusOnError="true" ErrorMessage="Please Enter Region!" Text="*Required" Display="Dynamic" ValidationGroup="illess_val" />
                         <br />
                    <asp:Label ID="lbl_entryDateI" runat="server" Text="Date" />

                    <asp:TextBox ID="txt_entryDateI" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_txt_rentryDate" runat="server" ControlToValidate="txt_entryDateI" SetFocusOnError="true" ErrorMessage="Please enter date" Text="*Required" Display="Dynamic" ValidationGroup="illess_val" />
    <asp:CompareValidator ID="com_date" runat="server" ControlToValidate="txt_entryDateI" Operator="DataTypeCheck" Type="Date" Text="Invalid Date!" ErrorMessage="Please Enter Correct Date Format (YYYY/MM/DD)" ValidationGroup="illess_val" />
                <br />
                    
                     <asp:Label ID="lbl_desc" runat="server" Text="Description:" />
                        <asp:TextBox ID="txt_descI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_descI" runat="server" ControlToValidate="txt_descI" SetFocusOnError="true" ErrorMessage="Please Enter Description!" Text="*Required" Display="Dynamic" ValidationGroup="illess_val" />
                       <br />
                     <asp:Label ID="lbl_symptoms" runat="server" Text=" Symptoms:" />
                        <asp:TextBox ID="txt_symptomsI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_symptomsI" runat="server" ControlToValidate="txt_symptomsI" SetFocusOnError="true" ErrorMessage="Please Enter Symptoms" Text="*Required" Display="Dynamic" ValidationGroup="illess_val" />
                            <br />
                     <asp:Label ID="lbl_prev" runat="server" Text="Preventatives:" />
                    <asp:TextBox ID="txt_preventI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_preventI" runat="server" ControlToValidate="txt_preventI" SetFocusOnError="true" ErrorMessage="Please Enter Preventatives" Text="*Required" Display="Dynamic" ValidationGroup="illess_val" />
    
          <br />
                      <asp:Label ID="lbl_treat" runat="server" Text="Treatments:" />
                    <asp:TextBox ID="txt_treatmentsI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_treatmentsI" runat="server" ControlToValidate="txt_treatmentsI" SetFocusOnError="true" ErrorMessage="Please Enter Treatments" Text="*Required" Display="Dynamic" ValidationGroup="illess_val" />
    
              <br />
                     <asp:Label ID="lbl_rec" runat="server" Text=" Recommenations: " />
       
                    <asp:TextBox ID="txt_recommendI" runat="server" />
                       

                    <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subInsert" CommandName="Insert" /><%-- onCommand for subroutine on code behind called subAdmin --%>
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subInsert" CommandName="Cancel" />
                    <asp:ValidationSummary ID="vs_illnesVal" runat="server" ValidationGroup="illness_val" ShowMessageBox="true" HeaderText="Errors!" />
            <%-- end of insert rows--%>

         <asp:DataList ID="dtl_all" runat="server" >
                <ItemTemplate>
                    </ItemTemplate>
             </asp:DataList>

        <a href="adminupdatehealth.aspx">Update and Delete Health Concerns</a>
                <a href="adminvolunteer.aspx">View, Update, Delete Volunteer Forms</a>



                      
</asp:Content>
