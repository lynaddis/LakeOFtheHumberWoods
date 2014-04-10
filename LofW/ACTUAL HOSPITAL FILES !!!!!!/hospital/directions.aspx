<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="directions.aspx.cs" Inherits="directions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Directions</title>
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
</head>
<body>
    <form id="getDirections" runat="server">
    <div>
    <table>
        <tr>
            <td>
                <asp:Label ID="lbl_startloc" runat="server" Text="Starting location" />
            </td>
            <td>
                <asp:TextBox ID="txtStart" runat="server"  AutoPostBack="true"/>
            </td>
            <td>
               <asp:RequiredFieldValidator ID="rfv_startloc" runat="server" ControlToValidate="txtStart" Text="*Required" Display="Static" ErrorMessage="A starting address is required" ValidationGroup="Directions" EnableClientScript="true" />
            </td>
            <td>
                <asp:Label ID="lbl_endloc" runat="server" Text=" Ending location" />
            </td>
            <td>
               <%-- <asp:TextBox ID="txtEnd" runat="server" Text="21 Sylvan Street Kenora ON P9N 3W7" AutoPostBack="true" />--%>
                <asp:DropDownList ID="ddl_list" runat="server" AutoPostBack="true" ValidationGroup="Directions" />
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
                <asp:CheckBox ID="cb_toll" runat="server" AutoPostBack="true" />
            </td>
            <td>
                <asp:Label ID="lbl_highway" runat="server" Text="Avoid Highways" />
            </td>
            <td>
                <asp:CheckBox ID="cb_highway" runat="server" AutoPostBack="true" />
            </td>
        </tr>
    </table>
        <asp:ValidationSummary ID="vs_directions" runat="server" HeaderText="Directions Form" DisplayMode="BulletList" ShowMessageBox="true" ShowSummary="false" ValidationGroup="Directions" EnableClientScript="true" />
     
     <input type="hidden" id="Start" value="<%=txtStart.Text %>" />
     <input type="hidden" id="End" value="<%=ddl_list.SelectedItem.Value.ToString() %>" /> 
     <input type="hidden" id="Toll" value="<%=cb_toll.Checked %>" /> 
     <input type="hidden" id="Highway" value="<%= cb_highway.Checked %>" />  
            
<%--        <input type="button" onclick="checkDirection()" value="Click Me"  />
         <input type="button" onclick="checkReverse()" value="reverse Me"  />--%>
<div id="wrapper_dir">
    <p> div wrapper</p>
<div id="directions-panel" style=" width:500px; height:600px; border:1px dashed blue;" ></div>
<div id="map-canvas" style=" width:500px; height:600px; border:1px dashed red;"></div>
</div>
    <p id="error"> </p>
    </div>
    </form>

</body>
</html>
