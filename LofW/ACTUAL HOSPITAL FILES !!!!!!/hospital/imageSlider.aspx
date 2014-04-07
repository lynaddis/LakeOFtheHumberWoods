<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="imageSlider.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">

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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
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
