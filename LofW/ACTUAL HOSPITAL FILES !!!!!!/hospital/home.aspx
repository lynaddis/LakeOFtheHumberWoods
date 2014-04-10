<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="content_home" ContentPlaceHolderID="cph_main" runat="server">
<div id="IMGslide">
                
            </div>
     <div class="banner">
            <div id="textDesc">

            
          
   </div>
         </div>

        <div class="contentBody">
         this is a student project. THis is in no way affiliated with the real hosptial.
            
        </div>
        <div class="sidebar">
        <div class="infectBox">
            
                    <div id="heading">
                        <h3><a href="healthconcerns.aspx">Health Concerns</a></h3>

                    </div>
                   
                      <asp:GridView ID="grd_health" runat="server">
                          <PagerTemplate>
                              <asp:Label ID="lbl_illness" runat="server" Text="Current Health Trends" />
                         <asp:Label ID="illname_Home" runat="server" Text='<%#Eval ("InfectionName") %>' />
                          </PagerTemplate>
                      </asp:GridView> 
               
        

        </div>

            <div class="donate">
                <h3><a href="#">Donations Informations</a></h3>
           
              Check out our donations

        </div>
            </div>
                <div class="bottomBar">
        <div class="calendar">
 <h3><a href="CalA.aspx">Visiting Specialists Calendar</a></h3>
           
        </div>

            <div class="Maps">
                <h3><a href="#">Maps</a></h3>

        </div>
              <div class="paybills">
        <h3><a href="#">PayBills</a></h3>

        </div>
                    </div>
                    </asp:Content>