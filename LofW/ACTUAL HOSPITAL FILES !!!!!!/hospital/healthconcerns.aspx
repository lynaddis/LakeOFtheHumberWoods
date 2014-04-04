<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="healthconcerns.aspx.cs" Inherits="healthconcerns" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
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
    

  
    <div>

       <a href="javascript:void(0);" class="titleText toggler">Kenora</a>


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

        <a href="javascript:void(0);" class="titleText toggler">+ Ontario</a>
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

 
    </asp:DataList>
</div>
        <br />
        <br />
        <a href="javascript:void(0);" class="titleText toggler">+ Canada</a>
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

        <h4>Do you have a recommendation for any listed illnessess? Let us know!</h4>
        
        <asp:Label ID="lbl_nameI" runat="server" Text="Your Name: " />
         <br /><asp:TextBox ID="txt_nameI" runat="server" />
        <br />
        <asp:Label ID="lbl_illI" runat="server" Text="Illness: " />
       <br />  <asp:TextBox ID="txt_illI" runat="server" />
        <br />
        <%-- need a compare validator to make sure they put in Kenora, Ontario, or Canada and thats it --%>
             <asp:Label ID="lbl_regionI" runat="server" Text="Region (Kenora, Ontario, or Canada): " />
         <br /><asp:TextBox ID="txt_regionI" runat="server" />
        <br />        
        <asp:Label ID="lbl_rec" runat="server" Text="Information: "/>
        <br /> <asp:TextBox ID="txt_infoI" runat="server" TextMode="MultiLine" Rows="5" />
         <br />
     
                    <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subInsert" CommandName="Insert" /><%-- onCommand for subroutine on code behind called subAdmin --%>
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subInsert" CommandName="Cancel" />
           <asp:Label ID="lbl_message" runat="server" />
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cph_IB" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cph_donate" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="cph_cal" Runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="cph_map" Runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="cph_other" Runat="Server">
</asp:Content>

