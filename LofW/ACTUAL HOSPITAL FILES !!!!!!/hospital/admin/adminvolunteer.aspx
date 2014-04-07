<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="adminvolunteer.aspx.cs" Inherits="adminvolunteer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
     <asp:Label ID="lbl_message" runat="server" />
        <br />
               <a href="adminrecommendations.aspx">Review Submitted Reccomendations</a>
 
          
                 <asp:DataList ID="dtl_all" runat="server" OnItemCommand="subUpDel">
                     <ItemTemplate>
                              <br />
                            <asp:HiddenField ID="hdf_IdE" runat="server" Value='<%#Eval("Id") %>' />
                            
                            <asp:Label ID="lbl_nameE" runat="server" Text="Name:" />
                            <asp:TextBox ID="txt_nameE" runat="server" Text='<%#Bind("FullName") %>' />
                          
                             <br />
                             <asp:Label ID="lbl_ageE" runat="server" Text="Age:" />
                              <asp:TextBox ID="txt_ageE" runat="server" Text='<%#Bind("age") %>' />
                           
                             <br />
                            <asp:Label ID="lbl_genderE" runat="server" Text="Gender:" />
                             <asp:TextBox ID="txt_genderE" runat="server" Text='<%#Bind("gender") %>'/>
                        
                            <br />
                            <asp:Label ID="lbl_emailE" runat="server" Text="Email:" />
                             <asp:TextBox ID="txt_emailE" runat="server" Text='<%#Bind("email") %>' />
                       
                          <br />
                         <asp:Label ID="lbl_phoneE" runat="server" Text="Phone:" />
                          <asp:TextBox ID="txt_phoneE" runat="server" Text='<%#Bind("phone") %>' />
                        
                        <br />
                         <asp:Label ID="lbl_reasonE" runat="server" Text="Reason:" />
                         <asp:TextBox ID="txt_reasonE" runat="server" Text='<%#Bind("reason") %>' />
                       
                         <br />
                         <asp:Label ID="lbl_VolExpE" runat="server" Text="Have You Volunteered Here Before?:" />
                         <asp:TextBox ID="txt_VolExpE" runat="server" Text='<%#Bind("VolExp") %>' />
                       
                         <br />
                         <asp:Label ID="lbl_ifyesE" runat="server" Text="If yes, what did they do?:" />
                         <asp:TextBox ID="txt_ifYesE" runat="server" Text='<%#Bind("ifYes") %>' />
               
                          <br />
                         <asp:Label ID="lbl_hoursE" runat="server" Text="No. of Hours:" />
                            <asp:TextBox ID="txt_noHoursE" runat="server" Text='<%#Bind("noHours") %>' />
               
                          <br />
                        <asp:Label ID="lbl_prequestE" runat="server" Text="Requested Person To Volunteer With:" />
                        <asp:TextBox ID="txt_personRequestE" runat="server" Text='<%#Bind("personRequest") %>' />
                
                         <br />
                         <asp:Label ID="lbl_interestE" runat="server" Text="Interests:" />
                         <asp:TextBox ID="txt_interestE" runat="server" Text='<%#Bind("interest") %>'/>
            
                           <br />
                         <asp:Label ID="lbl_allergiesE" runat="server" Text="Allergies:" />
                          <asp:TextBox ID="txt_allergiesE" runat="server" Text='<%#Bind("allergies") %>' />
               
                         <br />
                         <asp:Label ID="lbl_deptRefuseE" runat="server" Text="Departments Refused:" />
                          <asp:TextBox ID="txt_deptRefuseE" runat="server" Text='<%#Bind("deptRefuse") %>' />
                       
                          <br />
                            <asp:Label ID="lbl_deptRequest" runat="server" Text="Preferred Department:" />
                          <asp:TextBox ID="txt_deptRequestE" runat="server" Text='<%#Bind("deptRequest") %>' />
                      
                         <br />  
                                <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" />
                                <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Confirm Delete?');" />
                                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                       
                 
                </ItemTemplate>
            </asp:DataList>
         
    </div>
</asp:Content>
