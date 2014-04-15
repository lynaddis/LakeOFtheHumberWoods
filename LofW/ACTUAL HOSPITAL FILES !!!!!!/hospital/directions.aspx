<%@ Page Language="C#" MasterPageFile="~/Master.master"  AutoEventWireup="true" CodeFile="directions.aspx.cs" Inherits="directions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">

        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script type="text/javascript" src="js/MapDirections.js"></script>
      <style>
      #map-canvas {
        height: 100%;
        margin: 0 auto;
        float: left;
        padding: 0px
      }

          #wrapper_dir {
              margin: 0 auto;
              width:1024px;
              clear:both;
              border: 1px dotted green;
          }

      #directions-panel {
        height: 100%;
        float: right;
        overflow: auto;
      }

      @media print {
        #map-canvas {
          height: 500px;
          margin: 0;
          width: auto;
        }

        #directions-panel {
          float: none;
          width: auto;
        }
      }
    </style>

    <div class="page_title" >

        <h2>Maps and Directions</h2>
        <p>If you need to find our hosptial simply add in your address you are travelling from then select the building you wish to arrive at.  For your convenience, all travelling information you need will be calculated and appear to the right of the map</p>
        <br />
        <asp:HyperLink ID="hyp_maps" runat="server" Text="Click here for map locations" NavigateUrl="~/map.aspx" Font-Underline="false" SkinID="hblink_submit" />
        <br /><br />
    </div>
    <div>
     <asp:Label ID="lbl_startloc" runat="server" Text="Starting location" AssociatedControlID="txtStart" />
                <asp:TextBox ID="txtStart" runat="server"  AutoPostBack="true"/>
 
               <asp:RequiredFieldValidator ID="rfv_startloc" runat="server" ControlToValidate="txtStart" Text="*Required" Display="Static" ErrorMessage="A starting address is required" ValidationGroup="Directions" EnableClientScript="true" />

                <asp:Label ID="lbl_endloc" runat="server" Text=" Ending location" AssociatedControlID="ddl_list" />
                <asp:DropDownList ID="ddl_list" runat="server" AutoPostBack="true" ValidationGroup="Directions" />
<<<<<<< HEAD

                <asp:RequiredFieldValidator ID="rfv_endloc" runat="server" ControlToValidate="ddl_list" Text="*Required" Display="None" ErrorMessage="An ending address is required" ValidationGroup="Directions" EnableClientScript="true" />
                <asp:CompareValidator ID="cmv_endloc" runat="server" ControlToValidate="ddl_list" Operator="GreaterThan" ValueToCompare="0" Display="static" Text="*Required" ErrorMessage="Please select a destination" ValidationGroup="Directions" EnableClientScript="true" />

                <asp:Button ID="btnGenerate_D" runat="server" Text="Directions" OnClientClick="return checkDirection()" UseSubmitBehavior="false" /> 

                <asp:Button ID="btn_reverse" runat="server" Text="Reverse"  OnClientClick="return checkReverse()"  UseSubmitBehavior="false" />
                <br />
                <asp:Label ID="lbl_toll" runat="server" Text="Avoid Toll Roads" AssociatedControlID="cb_toll" />
=======
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfv_endloc" runat="server" ControlToValidate="ddl_list" Text="*Required" Display="Static" ErrorMessage="An ending address is required" ValidationGroup="Directions" EnableClientScript="true" />
                <asp:CompareValidator ID="cmv_endloc" runat="server" ControlToValidate="ddl_list" Operator="GreaterThan" ValueToCompare="0" Display="None" ErrorMessage="Please select a destination" ValidationGroup="Directions" EnableClientScript="true" />
            </td>
            <td>
                <asp:Button ID="btnGenerate_D" runat="server" Text="Directions" OnClientClick="return checkDirection()" UseSubmitBehavior="false" /> 
            </td>
            <td>
                <asp:Button ID="btn_reverse" runat="server" Text="Reverse"  OnClientClick="return checkReverse()"  UseSubmitBehavior="false" />
            </td>
        </tr>
        <tr>
            <td>
              <asp:Label ID="lbl_toll" runat="server" Text="Avoid Toll Roads" />
            </td>
            <td>
>>>>>>> parent of eb10f68... Merge branch 'master' of https://github.com/lynaddis/LakeOFtheHumberWoods
                <asp:CheckBox ID="cb_toll" runat="server" AutoPostBack="true" />

                <asp:Label ID="lbl_highway" runat="server" Text="Avoid Highways" AssociatedControlID="cb_highway" />
                <asp:CheckBox ID="cb_highway" runat="server" AutoPostBack="true" />

        <asp:ValidationSummary ID="vs_directions" runat="server" HeaderText="Directions Form" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Directions" EnableClientScript="true" />
     
     <input type="hidden" id="Start" value="<%=txtStart.Text %>" />
     <input type="hidden" id="End" value="<%=ddl_list.SelectedItem.Value.ToString() %>" /> 
     <input type="hidden" id="Toll" value="<%=cb_toll.Checked %>" /> 
     <input type="hidden" id="Highway" value="<%= cb_highway.Checked %>" />  
            
<div id="wrapper_dir">
   
<div id="directions-panel" style=" width:500px; height:600px; border:1px dashed blue;" ></div>
<div id="map-canvas" style=" width:500px; height:600px; border:1px dashed red;"></div>
</div>
    <p id="error"> </p>
    </div>
</asp:Content>
