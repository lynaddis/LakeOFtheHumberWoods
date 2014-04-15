<%@ Page Language="C#"  MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Wait_times.aspx.cs" Inherits="Wait_times" %>
<%@ MasterType VirtualPath="~/Master.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
    <div>

        <asp:Label ID="lbl_title" runat="server" Text="Check Wait Times" />

        <ul>
            <li>
                <asp:Label ID="lbl_green" runat="server" Text="Green ( 60 mins and under)" AssociatedControlID="lbl_good" /> <br />
                <asp:Label ID="lbl_good" runat="server" Width="100" Height="100" BackColor="Green" />
             </li>
            <li>
                <asp:Label ID="lbl_orange" runat="server" Text="orange ( 60 mins to 180 mins )" AssociatedControlID="lbl_med" /> <br />
                <asp:Label ID="lbl_med" runat="server" Width="100" Height="100" BackColor="Orange" />
            </li>
            <li>
                <asp:Label ID="lbl_red" runat="server" Text="Green ( 180 mins and above)" AssociatedControlID="lbl_high" /> <br />
                <asp:Label ID="lbl_high" runat="server" Width="100" Height="100" BackColor="red" />
            </li>
        </ul>

        <br /><br />
        <asp:Button ID="btn_times" runat="server" Text="Get Waiting Time" OnClick="subGetTimes" SkinID="btn_submit" />
        <br /><br />

        <asp:Panel ID="pnl_times" runat="server">
      <asp:ListView ID="lv_times" runat="server" OnItemDataBound="subSetBox">
           <ItemTemplate>
               <asp:Label ID="lbl_lv_name" runat="server" Text="Current Hospital Wait Data"  />
               <br /><br />
               <asp:Label ID="lbl_beds" runat="server" Text="Current number of beds available: " AssociatedControlID="lbl_bed_count" />
               <asp:Label ID="lbl_bed_count" runat="server" Text='<%#Eval("number_beds") %>' />
               <br /><br />
               <asp:Label ID="lbl_docs" runat="server" Text="Current number of doctors on site: " AssociatedControlID="lbl_docs_count" />
               <asp:Label ID="lbl_docs_count"  runat="server" Text='<%#Eval("number_doctors") %>' />
               <br /><br />
               <asp:Label ID="lbl_status" runat="server" Text="Current Hospital status: " AssociatedControlID="lbl_current_status" />
               <asp:Label ID="lbl_current_status" runat="server" Text='<%#Eval("status") %>' />
               <br /><br />
               <asp:Label ID="lbl_time" runat="server" Text="Current wait time :" AssociatedControlID="lbl_current_time" />
               <asp:Label ID="lbl_current_time" runat="server" Text='<%#Eval("time") %>' /> <asp:Label ID="lbl_min" runat="server" Text="Minutes" />
               <br /><br /><br />
               <asp:Label ID="lbl_stat" runat="server" Text='<%# "Time Generated: " + DateTime.Now.ToString()  %>' />
           </ItemTemplate>
       </asp:ListView>
               <br /><br />
               <asp:Label ID="lbl_stat_box" runat="server" Width="200" Height="200" />
     </asp:Panel>
    </div>
</asp:Content>
