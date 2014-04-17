<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="_Default" %>
<%@ MasterType VirtualPath="~/Master.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="content_home" ContentPlaceHolderID="cph_main" runat="server">

     <div class="banner">
                  <asp:ScriptManager ID="scr" runat="server" />
    <asp:UpdatePanel ID="udp" runat="server">
        <ContentTemplate>
           
            <asp:MultiView ID="mlt" runat="server">
             
            </asp:MultiView>
        </ContentTemplate>
      <Triggers>
            <asp:AsyncPostBackTrigger ControlID="tmr" EventName="Tick" />
      </Triggers>
    </asp:UpdatePanel>
        <asp:Timer ID="tmr" runat="server" Interval="5000" OnTick="subTick" />
    <%--<table>
        <tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
           <td><asp:Button ID="btn_back" runat="server" Text="Backward" OnClick="ImgBackward" /></td> 
            <td><asp:Button ID="btn_forw" runat="server" Text="Forward" OnClick="ImgForward" /></td> 
        <td></td><td></td><td></td><td></td><td></td></tr>


     </table>--%>
         
         </div>

               <div class="contentBody">
                   <h2>Our Hospital Project</h2>
        <p>Our team consists of 5 developers who attend Humber College in the post-graduate website development program.
We have enjoyed the whole process of this project, form initially receiving the previous team’s blueprints and plants for the hospital redesign to the final product that has evolved from document to functional website.
We made lots of changes from the original documents provided to us, however all changes were based on exercises and testing that were performed to determine the best changes for the site.
Our team consists of: </p>
<ul>
    <li>Project Manager: Joel</li>
<li>Assistant Project Manager: Danielle</li>
<li>Documentation Master: Navpreet</li>
<li>Assistant Documentation Master: Vikas</li>
<li>Team Member: Lyn</li>
    </ul>

            
        </div>
         
        <div class="sidebar">
        <div class="infectBox">
            
                    <div id="heading">
                        <h3><a href="healthconcerns.aspx">Health Concerns</a></h3>

                    </div><%-- put in gridview to display current health concerns, so if it gets updated on admin page, it will update on homepage! --%>
                   
                      <asp:GridView ID="grd_health" runat="server" AutoGenerateColumns="false" GridLines="None">
                          <Columns>
                              <asp:TemplateField>
                                  <HeaderTemplate>Trending Illnessess...</HeaderTemplate>
                                  
                                  <ItemTemplate>
                                      
                                      <asp:Label ID="region_home" runat="server" Text='<%#Eval ("Location") %>' /> 
                             <asp:Label ID="illname_Home" runat="server" Text='<%#Eval ("InfectionName") %>' />
                                      </ItemTemplate>
                                  </asp:TemplateField>
                          </Columns>

                      </asp:GridView> 

               
        

        </div>

            <div class="donate">
                <h3><a href="Donation.aspx">Donations Information</a></h3>
           
              Our donations pages contains payment methods to make your kind donations easy to process.  We use paypal to ensure secure transfers. Thank you to everyone who as and who will donate; a little donation goes a long way!  

        </div>
            </div>
                <div class="bottomBar">
        <div class="calendar">
 <h3><a href="visitingspecialists.aspx">Visiting Specialists</a></h3>
    
           <div class="imghome"> <asp:Image id="img_cal" runat="server" ImageUrl="~/imgs/CALENDAR.jpg" Width="300px" Height="200px" /></div>
            
               <br /><br />
        </div>

            <div class="Maps">
                <h3><a href="map.aspx">Maps</a></h3>
               <div class="imghome"><asp:Image id="img_map" runat="server" ImageUrl="~/imgs/map.png" Width="300px" Height="200px" /></div>
        
               <br /><br />
        </div>
              <div class="paybills">
        <h3><a href="userlogin.aspx">PayBills</a></h3>
        <div class="imghome"><asp:Image ID="bills" runat="server" ImageUrl="~/imgs/bills.png" /></div>
        </div>
                    </div>
                    </asp:Content>