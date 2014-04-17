<%@ Page Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="editWait_times.aspx.cs" Inherits="Admin_editWait_times" %>
<%@ MasterType VirtualPath="~/admin/adminMaster.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
    <div>
        <%-- Displys welcome message to user --%> 
        <asp:LoginName ID="log_name" runat="server" FormatString="Welcome, {0} " />

          <%-- Allows user to logout if logged in --%>  
        <asp:LoginStatus ID="log_status" runat="server" LogoutAction="Redirect" LogoutPageUrl="~/admin_login.aspx" />
            <br />

            <!-- Will display to the user what type of account is currently logged in. 
               Because of the web.config file, access to this page is restricted for everyone but an admin; so only the admin role will display -->
        <asp:LoginView ID="log_view" runat="server" >
            <AnonymousTemplate>
                Public User(s)
            </AnonymousTemplate>
            <LoggedInTemplate>
                Logged In User(s)
            </LoggedInTemplate>
            <RoleGroups>
                <asp:RoleGroup Roles="Admin">
                    <ContentTemplate>
                        Admin(s) only
                    </ContentTemplate>
                </asp:RoleGroup>
                <asp:RoleGroup Roles="User">
                    <ContentTemplate>
                        User(s) only
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>


     <asp:HyperLink ID="hyp_home" runat="server" Text="Back to Home" Font-Underline="false" SkinID="hblink_submit" NavigateUrl="~/Admin/homeadmin.aspx"  />
      
        <br /> <br />

        <asp:Label ID="lbl_update_status" runat="server" />
        <br /> <br />
        
          <br /> <br /> <br />
    <asp:Label ID="lbl_title" runat="server" Text="Update Hospital Wait Times" />


        <%-- displays current hospital status  --%>
       <asp:ListView ID="lv_times" runat="server" OnItemCommand="subChange">
           <ItemTemplate>
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
               <asp:Label ID="lbl_current_time" runat="server" Text='<%#Eval("time") +" minutes" %>' />
               <br /><br />
               <asp:LinkButton ID="lnk_edit" runat="server" Text="Update Time" CommandArgument='<%#Eval("Id") %>' CommandName="Editx" SkinID="link_submit" Font-Underline="false" />
               <br /><br /><br />
           </ItemTemplate>
       </asp:ListView>

        <asp:Panel ID="pnl_update" runat="server">
        <asp:HiddenField ID="hdf_id" runat="server" /> <%-- hidden field for passing data --%>

            <%-- update wait times form --%>
         <asp:Label ID="lbl_beds_u" runat="server" Text="Number of Beds" AssociatedControlID="ddl_beds" />
               <asp:DropDownList ID="ddl_beds" runat="server" AutoPostBack="true" >
                   <asp:ListItem Text="0" Value="20"/>
                   <asp:ListItem Text="1" Value="0" />
                   <asp:ListItem Text="2" Value="-20" />
                   <asp:ListItem Text="3" Value="-30" />
                   <asp:ListItem Text="4" Value="-40" />
                   <asp:ListItem Text="5" Value="-50" />
                   <asp:ListItem Text="6" Value="-60" />
                   <asp:ListItem Text="7" Value="-70" />
                   <asp:ListItem Text="8" Value="-80" />
                   <asp:ListItem Text="9" Value="-90" />
                   <asp:ListItem Text="10" Value="-100" />
               </asp:DropDownList>

         <asp:RequiredFieldValidator ID="rfv_beds" runat="server" ControlToValidate="ddl_beds" Text="*Required" Display="Static" ErrorMessage="The number of available beds is required" ValidationGroup="WaitTimes" />
         <asp:CompareValidator ID="cmv_beds" runat="server" ControlToValidate="ddl_beds" Operator="GreaterThan" ValueToCompare="0" Display="None" ErrorMessage="Please select the number of available beds" ValidationGroup="WaitTimes"/>
           


               <asp:Label ID="lbl_docs_u" runat="server" Text="Number of doctors" AssociatedControlID="ddl_docs" />
               <asp:DropDownList ID="ddl_docs" runat="server" AutoPostBack="true" >
                   <asp:ListItem Text="1" Value="6" />
                   <asp:ListItem Text="2" Value="5" />
                   <asp:ListItem Text="3" Value="4" />
                   <asp:ListItem Text="4" Value="3" />
                   <asp:ListItem Text="5" Value="2" />
               </asp:DropDownList>

         <asp:RequiredFieldValidator ID="rfv_docs" runat="server" ControlToValidate="ddl_docs" Text="*Required" Display="Static" ErrorMessage="The number of doctors on site is required" ValidationGroup="WaitTimes" />
         <asp:CompareValidator ID="cmv_docs" runat="server" ControlToValidate="ddl_docs" Operator="GreaterThan" ValueToCompare="0" Display="None" ErrorMessage="Please select the number of doctors on site" ValidationGroup="WaitTimes" />
           

               <asp:Label ID="lbl_status_u" runat="server" Text="Hospital status" AssociatedControlID="ddl_status" />
               <asp:DropDownList ID="ddl_status" runat="server" AutoPostBack="true">
                   <asp:ListItem Text="Normal" Value="30" />
                   <asp:ListItem Text="Busy" Value="90" />
                   <asp:ListItem Text="Epidemic" Value="135" />
               </asp:DropDownList>

         <asp:RequiredFieldValidator ID="rfv_status" runat="server" ControlToValidate="ddl_status" Text="*Required" Display="Static" ErrorMessage="The current hospital is required" ValidationGroup="WaitTimes" />
         <asp:CompareValidator ID="cmv_status" runat="server" ControlToValidate="ddl_status" Operator="GreaterThan" ValueToCompare="0" Display="None" ErrorMessage="Please select the current hospital status" ValidationGroup="WaitTimes" />
         

               <br />
        <asp:Button ID="btn_update" runat="server" Text="Update" SkinID="btn_submit" OnClick="subAdmin" />
            <br />
            <br />

        </asp:Panel>
    </div>
</asp:Content>
