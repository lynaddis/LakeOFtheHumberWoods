<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Master.master" CodeFile="newsupdates.aspx.cs" Inherits="newsupdates" %>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">

    <div class="page_title">
        <h2>Hospital News</h2>
              <p>Here you can View Our News Events & Activities for the hospital</p>
    </div>
    

         
            
       <div class="form_back_news">
           <asp:Button ID="btn_news" runat="server" Text="Find News" CommandName="ViewNews" OnClick="btn_news_Click" SkinID="btn_submit" /> <%--button to view dropdown of departments--%>
    
        <asp:Panel ID="panel3" runat="server">
           <h3> <asp:DropDownList ID="ddl_news" AutoPostBack="true" runat="server"  OnSelectedIndexChanged="ddl_news_SelectedIndexChanged"></asp:DropDownList></h3>
            <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand"> <%--List view data bound control --%>
                <ItemTemplate>
               
                    <asp:HiddenField ID="hdf_idE" runat="server" Value ='<%#Eval ("Id") %>' /> 
                    <asp:Label ID="lbl_DateT" runat="server" Text="Date: " />
                             <asp:label ID="lbl_date" runat="server" Text='<%#Eval("Date") %>' />
                    <br /><br />
                            <asp:Label ID="lbl_DepartmentT" runat="server" Text="Department: " />
                            <asp:label ID="lbl_department" runat="server" Text='<%#Eval("Department") %>' />
                            <br /><br />
                            <asp:Label ID="lbl_DetailsT" runat="server" Text="Details: " />
                             <asp:label ID="lbl_details" runat="server" Text='<%#Eval("Details") %>' />
                            <br /><br />

                            <asp:Label ID="lbl_seemoreT" runat="server" Text="See More....: " />
                            <asp:HyperLink ID="hyp_link" runat="server" Text="Link" NavigateUrl='<%#Eval("Url") %>'></asp:HyperLink>
                 <br /><hr />
                </ItemTemplate>
               
            </asp:ListView>
        </asp:Panel>
          </div>
    </asp:Content>
