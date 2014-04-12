<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="adminupdatehealth.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">

     <div class="page_title"><h2>Update Health Concerns</h2></div>
             <asp:Label ID="lbl_message" runat="server" />

    <br />
    <br />
     <a href="adminhealthconcerns.aspx">Back To Add Health Conerns</a>
    <asp:DataList ID="dtl_update" runat="server" OnItemCommand="subUpDel">
        <ItemTemplate>
        <br />
        <br />    
             <asp:HiddenField ID="hdf_Id" runat="server" Value='<%#Eval("Id") %>' />

                     <asp:Label ID="lbl_illnameU" runat="server" Text="Illness Name: " />
                    <asp:TextBox ID="txt_infnameU" runat="server" Text='<%#Bind ("InfectionName") %>' /> 
                     <asp:RequiredFieldValidator ID="rfv_infnameU" runat="server" ControlToValidate="txt_infnameU" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
                  <br />
         <asp:Label ID="lbl_regionU" runat="server" Text=" Region Infected: " />
              
                        <asp:TextBox ID="txt_locationU" runat="server" Text='<%#Bind ("Location") %>' />
                        <asp:RequiredFieldValidator ID="rfv_locationU" runat="server" ControlToValidate="txt_locationU" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
                         <br />
                    <asp:Label ID="lbl_entryDateU" runat="server" Text="Date" />

                    <asp:TextBox ID="txt_entryDateU" runat="server" Text='<%#Bind ("EntryDate") %>' />
                    <asp:RequiredFieldValidator ID="rfv_txt_entryDateU" runat="server" ControlToValidate="txt_entryDateU" SetFocusOnError="true" ErrorMessage="Please enter date" Display="Dynamic" />
                <br />
                    
                     <asp:Label ID="lbl_desc" runat="server" Text="Description:" />
                        <asp:TextBox ID="txt_descU" runat="server" Text='<%#Bind ("Description") %>' />
                        <asp:RequiredFieldValidator ID="rfv_descU" runat="server" ControlToValidate="txt_descU" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
                       <br />
                     <asp:Label ID="lbl_symptomsU" runat="server" Text=" Symptoms:" />
                        <asp:TextBox ID="txt_symptomsU" runat="server" Text='<%#Bind ("symptoms") %>' />
                        <asp:RequiredFieldValidator ID="rfv_symptomsU" runat="server" ControlToValidate="txt_symptomsU" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
                            <br />
                     <asp:Label ID="lbl_prevU" runat="server" Text="Preventatives:" />
                    <asp:TextBox ID="txt_preventU" runat="server" Text='<%#Bind ("preventatives") %>' />
                        <asp:RequiredFieldValidator ID="rfv_preventU" runat="server" ControlToValidate="txt_preventU" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
    
          <br />
                      <asp:Label ID="lbl_treatU" runat="server" Text="Treatments:" />
                    <asp:TextBox ID="txt_treatmentsU" runat="server" Text='<%#Bind ("treatments") %>' />
                        <asp:RequiredFieldValidator ID="rfv_treatmentsU" runat="server" ControlToValidate="txt_treatmentsU" SetFocusOnError="true" ErrorMessage="Required" Display="Dynamic" />
    

              <br />
                     <asp:Label ID="lbl_recU" runat="server" Text=" Recommenations: " />
       
                    <asp:TextBox ID="txt_recommendU" runat="server" Text='<%#Bind ("recomend") %>' />
                       

                    <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" /><%-- onCommand for subroutine on code behind called subAdmin --%>
                    <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Are you sure?')" />
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" />
            </ItemTemplate>
    </asp:DataList>

    <%--Add in recommendation w/ deletes.  --%>


<div id="adU_sidebar">

    <asp:Repeater ID="rep_rec" runat="server" OnItemCommand="recDelete">
<ItemTemplate>
               <br />

            <asp:HiddenField ID="hdf_IdD" runat="server" Value='<%#Eval ("Id") %>' />
            
           <asp:label ID="lt_name" runat="server" Text='<%#Eval ("name") %>' />
            <br />
             <asp:label ID="lt_illname" runat="server" Text='<%#Eval ("ill_name") %>' />
            <br />
            <asp:label ID="lt_region" runat="server" Text='<%#Eval ("region") %>' />
            <br />
            <asp:label ID="lt_rec" runat="server" Text='<%#Eval ("recomend") %>' />

    <asp:Button ID="btn_delete" runat="server" CommandName="Deletex" Text="Delete" OnClientClick="return confirm('Are you sure?')" />
    <asp:Button ID="btn_cancel" runat="server" CommandName="Cancelx" Text="Cancel" />

    </ItemTemplate>
    </asp:Repeater>

</div>
    </asp:Content>