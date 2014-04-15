<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    <table>
        <tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
           <td><asp:Button ID="btn_back" runat="server" Text="Backward" OnClick="ImgBackward" /></td> 
            <td><asp:Button ID="btn_forw" runat="server" Text="Forward" OnClick="ImgForward" /></td> 
        <td></td><td></td><td></td><td></td><td></td></tr>

     </table>



         </div>

               <div class="contentBody">
         this is a student project. THis is in no way affiliated with the real hosptial.
            
        </div>
         <div class="mobile_contain">
        <div class="sidebar">
        <div class="infectBox">
            
                    <div id="heading">
                        <h3><a href="healthconcerns.aspx">Health Concerns</a></h3>

                    </div>
                   
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
                <h3><a href="#">Donations Informations</a></h3>
           
              Check out our donations

        </div>
            </div>
                <div class="bottomBar">
        <div class="calendar">
 <h3><a href="CalA.aspx">Visiting Specialists</a></h3>
            <asp:GridView ID="home_cal" runat="server" AutoGenerateColumns="false" GridLines="None">
                          <Columns>
                              <asp:TemplateField>
                                  <HeaderTemplate>V</HeaderTemplate>
                                  
                                  <ItemTemplate>
                                      
                                      <asp:Label ID="region_home" runat="server" Text='<%#Eval ("") %>' /> 
                           
                                      </ItemTemplate>
                                  </asp:TemplateField>
                          </Columns>

                      </asp:GridView> 
        </div>

            <div class="Maps">
                <h3><a href="#">Maps</a></h3>

        </div>
              <div class="paybills">
        <h3><a href="#">PayBills</a></h3>

        </div>
                    </div></div>
                    </asp:Content>