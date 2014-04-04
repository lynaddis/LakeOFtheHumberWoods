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
    
         
                    <%--Creating Insert textboxes --%>
    <asp:HiddenField ID="hdf_Id" runat="server" Value='<%#Eval("Id") %>' />

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
                <a href="adminvolunteer.aspx">Volunteer submitted forms</a>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cph_IB" Runat="Server">

        <asp:repeater ID="rpt_rec" runat="server" OnItemCommand="subDel">
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
                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" />
            
               <br />   <br />   <br />
        </ItemTemplate>

    </asp:repeater>

                  
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cph_donate" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="cph_cal" Runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="cph_map" Runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="cph_other" Runat="Server">
</asp:Content>

