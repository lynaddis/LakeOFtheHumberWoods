<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="adminhealthconcerns.aspx.cs" Inherits="adminhealthconcerns" %>
<%@ MasterType VirtualPath="~/admin/adminMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">


     <div class="page_title"><h2>Add Health Concern</h2>

         <p>Add any health concerns that have come up around the country.  All entries will automatically appear on the public page</p>

     </div>
    <br />
       <asp:HyperLink ID="hyp_home" runat="server" Text="Back to Home" Font-Underline="false" SkinID="hblink_submit" NavigateUrl="~/Admin/homeadmin.aspx"  /><%-- hyperlink for redirecting to home page --%>
    <br />
    <br />
       <asp:HyperLink ID="hpl_upH" runat="server" Text="Edit Health Concerns" Font-Underline="false" SkinID="hblink_submit" NavigateUrl="~/Admin/adminupdatehealth.aspx"  />
    <br />
     <asp:Label ID="lbl_message" runat="server" /><%-- will output message when insert is successfull--%>
        <br />
        <br />
    
                    
 
                    <%--Creating Insert textboxes --%>

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
    <asp:CompareValidator ID="com_date" runat="server" ControlToValidate="txt_entryDateI" Operator="DataTypeCheck" Type="Date" Text="Invalid Date!" ErrorMessage="Please Enter Correct Date Format" ValidationGroup="illess_val" />
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
                       
    <br />
                    <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subInsert" CommandName="Insert" SkinID="btn_submit" ValidationGroup="illess_val" /><%-- onCommand for subroutine on code behind called subAdmin --%>
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subInsert" CommandName="Cancel" SkinID="btn_submit" CausesValidation="false" ValidationGroup="illess_val" />
                    <asp:ValidationSummary ID="vs_illnesVal" runat="server" ValidationGroup="illess_val" ShowSummary="true" ShowMessageBox="true" HeaderText="Errors!" />
            <%-- end of insert rows--%>

         <asp:DataList ID="dtl_all" runat="server" >
                <ItemTemplate>
                    </ItemTemplate>
             </asp:DataList>
  
     



                      
</asp:Content>
