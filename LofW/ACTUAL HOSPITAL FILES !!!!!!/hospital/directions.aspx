﻿<%@ Page Language="C#" MasterPageFile="~/Master.master"  AutoEventWireup="true" CodeFile="directions.aspx.cs" Inherits="directions" %>
<%@ MasterType VirtualPath="~/Master.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">

        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script type="text/javascript" src="js/MapDirections.js"></script>
      <style>
         #wrapper_dir {
              margin: 0 auto;
              width:auto;
              clear:both;
          }
          
          #map-canvas {
        height: 100%;
        margin: 0 auto;
        float: left;
        width:auto;
        padding: 0px
      }

      #directions-panel {
        height: 100%;
        width:auto;
        float: left;

      }
    </style>

    <div class="page_title" >

        <h2>Maps and Directions</h2>
        <p>If you need to find our hosptial simply add in your address you are travelling from then select the building you wish to arrive at.  For your convenience, all travelling information you need will be calculated and appear to the right of the map</p>
        <br />
        <%-- Link back to the static map page --%>
        <asp:HyperLink ID="hyp_maps" runat="server" Text="Click here for map locations" NavigateUrl="~/map.aspx" Font-Underline="false" SkinID="hblink_submit" />
        <br /><br />
    </div>
                 <%-- user input fields --%>
                <asp:Label ID="lbl_startloc" runat="server" Text="Starting location" AssociatedControlID="txtStart" />
                <asp:TextBox ID="txtStart" runat="server"  AutoPostBack="true"/>
 
               <asp:RequiredFieldValidator ID="rfv_startloc" runat="server" ControlToValidate="txtStart" Text="*Required" Display="Static" ErrorMessage="A starting address is required" ValidationGroup="Directions" EnableClientScript="true" />

                <asp:Label ID="lbl_endloc" runat="server" Text=" Ending location" AssociatedControlID="ddl_list" />
                <asp:DropDownList ID="ddl_list" runat="server" AutoPostBack="true" ValidationGroup="Directions" />

                <asp:RequiredFieldValidator ID="rfv_endloc" runat="server" ControlToValidate="ddl_list" Text="*Required" Display="None" ErrorMessage="An ending address is required" ValidationGroup="Directions" EnableClientScript="true" />
                <asp:CompareValidator ID="cmv_endloc" runat="server" ControlToValidate="ddl_list" Operator="GreaterThan" ValueToCompare="0" Display="static" Text="*Required" ErrorMessage="Please select a destination" ValidationGroup="Directions" EnableClientScript="true" />
                
                <%-- on click calls javascript function to get the direction; also validation on this page is fired from javascript  --%>
                <asp:Button ID="btnGenerate_D" runat="server" Text="Directions" OnClientClick="return checkDirection()" UseSubmitBehavior="false" SkinID="btn_submit" /> 
                <%--  on click calls javascript function to get the reverse direction; also validation on this page is fired from javascript  --%>
                <asp:Button ID="btn_reverse" runat="server" Text="Reverse"  OnClientClick="return checkReverse()"  UseSubmitBehavior="false" SkinID="btn_submit" />
                <br />
                <asp:Label ID="lbl_toll" runat="server" Text="Avoid Toll Roads" AssociatedControlID="cb_toll" />
                <asp:CheckBox ID="cb_toll" runat="server" AutoPostBack="true" />

                <asp:Label ID="lbl_highway" runat="server" Text="Avoid Highways" AssociatedControlID="cb_highway" />
                <asp:CheckBox ID="cb_highway" runat="server" AutoPostBack="true" />

        <asp:ValidationSummary ID="vs_directions" runat="server" HeaderText="Directions Form" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Directions" EnableClientScript="true" />
     <%-- hidden fields used to pass values from asp code behind to javascript --%>
     <input type="hidden" id="Start" value="<%=txtStart.Text %>" />
     <input type="hidden" id="End" value="<%=ddl_list.SelectedItem.Value.ToString() %>" /> 
     <input type="hidden" id="Toll" value="<%=cb_toll.Checked %>" /> 
     <input type="hidden" id="Highway" value="<%= cb_highway.Checked %>" />  
       
    <%-- mad and directions divs --%>     
<div id="wrapper_dir">
<div id="map-canvas" style=" width:450px; height:500px; border:1px dashed red;"></div>   
<div id="directions-panel" style=" width:450px; height:500px; border:1px dashed blue;" ></div>

</div>
    <p id="error"> </p>
</asp:Content>
