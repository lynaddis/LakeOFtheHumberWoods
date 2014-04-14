<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="healthconcerns.aspx.cs" Inherits="healthconcerns" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">

    <script src="js/jquery.js"></script>
     <script type="text/javascript" src="scripts/page/jquery.simplePagination.js" ></script>   
    <script>

        $(function () {
            $('a.toggler').on('click', function () {
                $('+ div', this).toggle();
            });
        });
        /*
          $(function () {
              $('div.repeater').pagination({
                  items: 100,
                  itemsOnPage: 1,
                  cssStyle: 'light-theme'
              });
          });
          */

    </script>
    
    <div class="page_title" >

           <h2>Health Concerns</h2>
        <p>Select different regions to view currently trending health concerns.  All information known to the hosptial has been made available to you.  This includes symptoms, preventatives, treatments, and any reccommendations submitted by users of the site </p>
    </div>
  
    <div id="listed_concern">
     
       <a href="javascript:void(0);" class="titleText toggler"><h3>+    Kenora</h3></a>


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

        <a href="javascript:void(0);" class="titleText toggler"><h3>+   Ontario</h3></a>
        <div class="Ontario" style="display:none">
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
        <%-- need a compare validator to make sure they put in Kenora, Ontario, or Canada and thats it --%>
             <asp:Label ID="lbl_regionI" runat="server" Text="Region <br />(Kenora, Ontario, or Canada): " />
         <br /><asp:TextBox ID="txt_regionI" runat="server" />
            <asp:RequiredFieldValidator ID="rfv_region" runat="server" ControlToValidate="txt_regionI" Text="*Required" ErrorMessage="Please Enter Region (Kenora, Ontario, or Canada)" SetFocusOnError="true" ValidationGroup="recommend_val" />
            <asp:RegularExpressionValidator ID="rg_region" runat="server" ControlToValidate="txt_regionI" Text="*Invalid Region" ErrorMessage="Must be Kenora, Ontario, or Canada" SetFocusOnError="true" ValidationGroup="recommend_val" ValidationExpression="^(?:k|K|kenora|Kenora|o|O|ontario|Ontario|c|C|canada|Canada)$" />
        <br />        
        <asp:Label ID="lbl_rec" runat="server" Text="Information: "/>
        <br /> <asp:TextBox ID="txt_infoI" runat="server" TextMode="MultiLine" Rows="5" />
            <asp:RequiredFieldValidator ID="rfv_rec" runat="server" ControlToValidate="txt_infoI" Text="*Required" ErrorMessage="Please Enter Recommendation" SetFocusOnError="true" ValidationGroup="recommend_val" />
         <br />
     
                    <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subInsert" CommandName="Insert" ValidationGroup="recommend_val" SkinID="btn_submit"/><%-- onCommand for subroutine on code behind called subAdmin --%>
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subInsert" CommandName="Cancel" CausesValidation="false" SkinID="btn_submit" />
           <asp:Label ID="lbl_message" runat="server" />
            <asp:ValidationSummary ID="vs_recommend" runat="server" ValidationGroup="recommend_val" ShowMessageBox="true" />
    </div>
        
</asp:Content>

