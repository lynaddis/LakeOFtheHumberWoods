﻿<%@ Page Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="account.aspx.cs" Inherits="Patient_account" %>
<%@ MasterType VirtualPath="~/Master.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
    <div>
     <%-- Displys welcome message to user --%> 
    <asp:LoginName ID="log_name" runat="server" FormatString="Welcome, {0} " />

      <%-- Allows user to logout if logged in --%>  
    <asp:LoginStatus ID="log_status" runat="server" LogoutAction="Redirect" LogoutPageUrl="~/index.aspx" />
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


        <%-- landing page for logged in patients where they can either select paybills or lab results --%>
        <asp:HyperLink ID="hyp_user_bills" runat="server" Text="Pay Bills"  NavigateUrl="~/Patient/payBills.aspx" />
        <asp:HyperLink ID="hyp_user_lab" runat="server" Text="Lab Results"  NavigateUrl="~/Patient/LabResults.aspx" />
        

    </div>
    </asp:Content>
