<%@ Page Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="map.aspx.cs" Inherits="map" %>
<%@ MasterType VirtualPath="~/Master.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script type="text/javascript" src="js/MapLocations.js"></script>
      <style>
           #list-wrapper {
              margin: 0 auto;
              width:auto;
              clear:both;
          }
              #map-canvas {
                  height: 100%;
                  margin: 0 auto;
                  float: left;
                  width:auto;
                  padding: 0px;
              }

              #list {
                  margin: 0 auto;
                  width:auto;
                  clear: both;
              }

    </style>
    <div class="page_title">
        <h2>Maps</h2>
    </div>
    <asp:Literal ID="lit_title" runat="server" Text="Maps" />
        <br /><br />
         <asp:Literal ID="lit_msg" runat="server" Text="Hospital Network" />  
    <br />
    <%-- link to directs page --%>
    <asp:HyperLink ID="hyp_directions" runat="server" Text="Click here for directions to Hospital /Branch locations" Font-Underline="false" NavigateUrl="~/directions.aspx" SkinID="hlink_submit" />
    <br />
    <div>
       
        <%-- Dispays map with all current hospital locations from database on one map --%>
    <div id="map-canvas" style=" width:400px; height:400px;"></div>
    </div>

     
      <%-- Displays each hospital location from database on a seperate map for better viewing --%>
       <div id="list-wrapper">   
     <asp:DataList ID="dl_locations" runat="server">
         <HeaderTemplate>
             <br /><br />
             <asp:Label ID="lbl_list" runat="server" Text="Locations" />
             <br />
         </HeaderTemplate>
         <ItemTemplate>
             <asp:Label ID="lbl_title" runat="server" Text='<%#Eval("hospital_name") %>' /> <br />
             <asp:Label  ID="lbl_desc" runat="server"  Text='<%#Eval("desc") %>' /><br /><br />
               <div id="list">
             <asp:Image ID="img_map" runat="server" ImageUrl='<%# "http://maps.googleapis.com/maps/api/staticmap?&zoom=14&size=300x300&scale=2&markers="+Eval("hospital_address")+"&sensor=false" %>' Width="400" Height="400" />
               </div>
              <br /><br />
  
         </ItemTemplate>
     </asp:DataList>   
     </div>  
    </asp:Content>
