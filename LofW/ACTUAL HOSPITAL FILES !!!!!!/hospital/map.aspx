<%@ Page Language="C#" AutoEventWireup="true" CodeFile="map.aspx.cs" Inherits="map" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script type="text/javascript" src="js/MapLocations.js"></script>
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

      @media print {
        #map-canvas {
          height: 500px;
          margin: 0;
          width: auto;
        }
      }
    </style>
</head>
<body>
    <div class="page_title">
        <h2>Maps</h2>
    </div>
    <form id="form1" runat="server">
    <div>
    <div id="map-canvas" style=" width:500px; height:400px; border:1px dashed red;"></div>
    </div>

        

    </form>
</body>
</html>
