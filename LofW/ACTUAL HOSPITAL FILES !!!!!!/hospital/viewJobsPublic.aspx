<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="viewJobsPublic.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">

     <div class="page_title">
         <h2>Employment Opportunities</h2>
         <p>There are a variety of roles required to deliver world-class health care at Lake of Humber Woods.</p>
     </div>

     <div class="form_back">
         <h3>Current Jobs Available</h3>
  
         <asp:Label ID="lbl_msg" runat="server" />
    <br />
    <br />
                 
 
 <div id="half_form_jobs">

         <asp:DataList ID="dtl_main" runat="server" >
             <ItemTemplate>
                 <span style='font-weight: bold;'><asp:Label ID="lbl_htitle" runat="server" Text="Title: " /></span>
            
                     <asp:Label ID="lbl_title" runat="server" Text='<%#Bind("title")%>' />
               <br />
                  <span style='font-weight: bold;'><asp:Label ID="lbl_hdesc" runat="server" Text="Description: " /></span>
                 
                 <asp:Label ID="lbl_desc" runat="server" Text='<%#Bind("description")%>' />
                <br />
                 <span style='font-weight: bold;'><asp:Label ID="lbl_hdate" runat="server" Text="Closing Date: " /></span>
                 
                         <asp:Label ID="lbl_date" runat="server" Text='<%#Bind("closing_date") %>' />
                 <br />
                <span style='font-weight: bold;'><asp:Label ID="lbl_hdept" runat="server" Text="Department: " /></span>
                
                         <asp:Label ID="lbl_dept" runat="server" Text='<%#Bind("department") %>' />
               <br />
                <span style='font-weight: bold;'> <asp:Label ID="lbl_hstatus" runat="server" Text="Status: "  /></span>
                 
                                        <%--<asp:Label ID="lbl_happly" runat="server" Text="Apply now" />--%>
                         <asp:Label ID="lbl_status" runat="server" Text='<%#Bind("status") %>' />
                 <br />
                        <asp:button ID="btn_apply" runat="server" Text="Apply" OnClientClick="window.open('employment.aspx', 'OtherPage');" CommandArgument='<%#Eval("Id") %>' /> <br /> <br /> <br />
                     
                
             </ItemTemplate>
         </asp:DataList>    
          
     </div>
        </div>
</asp:Content>


