﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="healthconcerns.aspx.cs" Inherits="healthconcerns" %>
<%@ MasterType VirtualPath="~/Master.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">

    <script src="js/jquery.js"></script>
    
    <script>
        //used toggle to hide regions... !
        $(function () {
            $('a.toggler').on('click', function () {
                $('+ div', this).toggle();
            });
        });


    </script>
    
    <div class="page_title" >

           <h2>Health Concerns</h2>
        <p>Select different regions to view currently trending health concerns.  All information known to the hosptial has been made available to you.  This includes symptoms, preventatives, treatments, and any reccommendations submitted by users of the site </p>
    </div>
  
    <div id="listed_concern">
     
       <a href="javascript:void(0);" class="titleText toggler"><h3>+    Kenora</h3></a>

            <%--Repeater for Kenora !--%>

        <div class="Kenora" style="display: none;">
            <asp:repeater ID="rpt_k" runat="server"  >
        <ItemTemplate>
             <asp:Label ID="infname" runat="server" Text="Infection Name: " />
        <%#Eval ("InfectionName") %>
            <br />

<asp:Label ID="lbl_loc" runat="server" Text="Region: " />
<%#Eval ("Location") %>
                    <br />
            <asp:Label ID="lbl_eDate" runat="server" Text="Posted On: " />
      <%#Eval ("EntryDate") %>
            <br />
               <asp:Label ID="lbl_desc" runat="server" Text="Description : " />
        <%#Eval ("Description") %>
            <br />
            <asp:Label ID="lbl_symp" runat="server" Text="Symptoms : " />
          <%#Eval ("symptoms") %>
            <br />
            <asp:Label ID="lbl_prev" runat="server" Text="Preventatives : " />
          <%#Eval ("preventatives") %>
            <br />
              <asp:Label ID="lbl_treat" runat="server" Text="Treatments : " />
         <%#Eval ("treatments") %>
            <br />
              <asp:Label ID="Label1" runat="server" Text="Recommendations : " />
          <%#Eval ("recomend") %>

<br />
            <br />
        </ItemTemplate>

 
    </asp:repeater>
</div>
        <br />

        <br />
         <%--Datalist for Ontario !--%>
        <a href="javascript:void(0);" class="titleText toggler"><h3>+   Ontario</h3></a>
        <div class="Ontario" style="display:none">  <%--won't display when page loads.. heading has to be clicked for information to appear !--%>
         <asp:DataList ID="dtl_Ont" runat="server"  >
        <ItemTemplate>
             <asp:Label ID="infname" runat="server" Text="Infection Name: " />
        <%#Eval ("InfectionName") %>
            <br />

<asp:Label ID="lbl_loc" runat="server" Text="Region: " />
<%#Eval ("Location") %>
                    <br />
            <asp:Label ID="lbl_eDate" runat="server" Text="Posted On: " />
      <%#Eval ("EntryDate") %>
            <br />
               <asp:Label ID="lbl_desc" runat="server" Text="Description : " />
        <%#Eval ("Description") %>
            <br />
            <asp:Label ID="lbl_symp" runat="server" Text="Symptoms : " />
          <%#Eval ("symptoms") %>
            <br />
            <asp:Label ID="lbl_prev" runat="server" Text="Preventatives : " />
          <%#Eval ("preventatives") %>
            <br />
              <asp:Label ID="lbl_treat" runat="server" Text="Treatments : " />
         <%#Eval ("treatments") %>
            <br />
              <asp:Label ID="Label1" runat="server" Text="Recommendations : " />
          <%#Eval ("recomend") %>

<br />
            <br />
        </ItemTemplate>

 
    </asp:DataList></div>

        <br />
        <br />
        <a href="javascript:void(0);" class="titleText toggler"><h3>+   Canada</h3></a>
        <div class="Canada" style="display:none">

             <%--Listview for Canada! --%>
        <asp:ListView ID="ltv_Can" runat="server" >
        <ItemTemplate>
             <asp:Label ID="infname" runat="server" Text="Infection Name: " />
        <%#Eval ("InfectionName") %>
            <br />

<asp:Label ID="lbl_loc" runat="server" Text="Region: " />
<%#Eval ("Location") %>
                    <br />
            <asp:Label ID="lbl_eDate" runat="server" Text="Posted On: " />
      <%#Eval ("EntryDate") %>
            <br />
               <asp:Label ID="lbl_desc" runat="server" Text="Description : " />
        <%#Eval ("Description") %>
            <br />
            <asp:Label ID="lbl_symp" runat="server" Text="Symptoms : " />
          <%#Eval ("symptoms") %>
            <br />
            <asp:Label ID="lbl_prev" runat="server" Text="Preventatives : " />
          <%#Eval ("preventatives") %>
            <br />
              <asp:Label ID="lbl_treat" runat="server" Text="Treatments : " />
         <%#Eval ("treatments") %>
            <br />
              <asp:Label ID="Label1" runat="server" Text="Recommendations : " />
          <%#Eval ("recomend") %>

<br />
            <br />
        </ItemTemplate>

 
    </asp:ListView>
            </div>

            </div>
     <%--End of region illnesses !--%>



     <%--Recommendations form! --%>
        <div id="recommend">
        
        <h3>Recommendations</h3>
            <p>If you know any information on existing illnesses that is not here, or that you think may help others please let us know.</p>
        
        <asp:Label ID="lbl_nameI" runat="server" Text="Your Name: " />
         <br /><asp:TextBox ID="txt_nameI" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_name" runat="server" ControlToValidate="txt_nameI" Text="*Required" ErrorMessage="Please Enter Your Name!" SetFocusOnError="true" ValidationGroup="recommend_val" />
        <br />
        <asp:Label ID="lbl_illI" runat="server" Text="Illness: " />
       <br />  <asp:TextBox ID="txt_illI" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_illness" ControlToValidate="txt_illI" runat="server" Text="*Required" ErrorMessage="Please Enter Illness Name!" SetFocusOnError="true" ValidationGroup="recommend_val" />
        <br />
        <%-- need a compare validator to make sure they put in Kenora, Ontario, or Canada and thats it! --%>
             <asp:Label ID="lbl_regionI" runat="server" Text="Region <br />(Kenora, Ontario, or Canada): " />
         <br /><asp:TextBox ID="txt_regionI" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_region" runat="server" ControlToValidate="txt_regionI" Text="*Required" ErrorMessage="Please Enter Region (Kenora, Ontario, or Canada)" SetFocusOnError="true" ValidationGroup="recommend_val" />
            <asp:RegularExpressionValidator ID="rg_region" runat="server" ControlToValidate="txt_regionI" Text="*Invalid Region" ErrorMessage="Must be Kenora, Ontario, or Canada" SetFocusOnError="true" ValidationGroup="recommend_val" ValidationExpression="^(?:k|K|kenora|Kenora|o|O|ontario|Ontario|c|C|canada|Canada)$" />
        <br />        
        <asp:Label ID="lbl_rec" runat="server" Text="Information: "/>
        <br /> <asp:TextBox ID="txt_infoI" runat="server" TextMode="MultiLine" Rows="5" />
            <asp:RequiredFieldValidator ID="rfv_rec" runat="server" ControlToValidate="txt_infoI" Text="*Required" ErrorMessage="Please Enter Recommendation" SetFocusOnError="true" ValidationGroup="recommend_val" />
         <br />
     
                    <asp:Button ID="btn_insert" runat="server" Text="Submit" OnCommand="subInsert" CommandName="Insert" SkinID="btn_submit" ValidationGroup="recommend_val"/><%-- onCommand for subroutine on code behind called subInsert! --%>
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subInsert" SkinID="btn_submit" CommandName="Cancel" CausesValidation="false" />
           <asp:Label ID="lbl_message" runat="server" /> <%--label that will output message when insert is attempted! --%>
            <asp:ValidationSummary ID="vs_recommend" runat="server" ValidationGroup="recommend_val" ShowMessageBox="true" />
    </div>
        
</asp:Content>

