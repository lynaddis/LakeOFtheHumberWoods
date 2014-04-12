<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="adminvolunteer.aspx.cs" Inherits="adminvolunteer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
  
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">


        <div id="adminvol_title" >

           <h2>Submitted Volunteer Froms</h2>
  
    </div>
    <input type='hidden' id='current_page' />  
<input type='hidden' id='show_per_page' /> 

    <div id='page_navigation'></div>  
     <div id="pagingControls"></div>

     <asp:Label ID="lbl_message" runat="server" />
        <br />
    <div id="content" >
              <a href="homeadmin.aspx">Back To Home</a>
 
          
               <asp:ListView ID="ltv_all" runat="server" OnItemCommand="subEdit">
  
        <ItemTemplate>
                              <br />
                            <asp:HiddenField ID="hdf_IdE" runat="server" Value='<%#Eval("Id") %>' />
                            
                            <asp:Label ID="lbl_nameE" runat="server" Text="Name:" />
                            <asp:TextBox ID="txt_nameE" runat="server" Text='<%#Bind("FullName") %>' /> 
                           <asp:RequiredFieldValidator ID="rfv_nameE" runat="server" ControlToValidate="txt_nameE" SetFocusOnError="true" ErrorMessage="Enter Name!" ValidationGroup="admin_vol" Text="Required!" ForeColor="Red" />

                             <br />
                             <asp:Label ID="lbl_ageE" runat="server" Text="Age:" />
                              <asp:TextBox ID="txt_ageE" runat="server" Text='<%#Bind("age") %>' />
                            <asp:RequiredFieldValidator ID="rfv_ageE" runat="server" ControlToValidate="txt_ageE" SetFocusOnError="true" ErrorMessage="Enter Your Age! (must be 10-100)" ValidationGroup="vol_val" Text="Required!"  ForeColor="Red" /> 
    <asp:RangeValidator ID="rng_age" runat="server" ControlToValidate="txt_ageE" SetFocusOnError="true" Type="Integer" MaximumValue="90" MinimumValue="10" Text="Invalid Age" ErrorMessage="Please enter valid age!" ValidationGroup="admin_vol"  ForeColor="Blue" />
                             <br />
                            <asp:Label ID="lbl_genderE" runat="server" Text="Gender:" />
                             <asp:TextBox ID="txt_genderE" runat="server" Text='<%#Bind("gender") %>'/>
                        <asp:RequiredFieldValidator ID="rfv_genderE" runat="server" ControlToValidate="txt_genderE" SetFocusOnError="true" ErrorMessage="Please Enter Your Gender!" ValidationGroup="admin_vol" Text="*Required!"  ForeColor="Red" />
                            <br />
                            <asp:Label ID="lbl_emailE" runat="server" Text="Email:" />
                             <asp:TextBox ID="txt_emailE" runat="server" Text='<%#Bind("email") %>' />
                        <asp:RequiredFieldValidator ID="rfv_emailE" runat="server" ControlToValidate="txt_emailE" SetFocusOnError="true" ErrorMessage="Please enter email!" ValidationGroup="admin_vol" Text="Required!"  ForeColor="Red"/>
    <asp:RegularExpressionValidator ID="rg_emailE" runat="server" ControlToValidate="txt_emailE" SetFocusOnError="true" ErrorMessage="Invalid Email!" ValidationGroup="admin_vol" Text="invalid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                          <br />
                         <asp:Label ID="lbl_phoneE" runat="server" Text="Phone:" />
                          <asp:TextBox ID="txt_phoneE" runat="server" Text='<%#Bind("phone") %>' />
                         <asp:RequiredFieldValidator ID="rfv_phoneE" runat="server" ControlToValidate="txt_phoneE" SetFocusOnError="true" ErrorMessage="Enter Phone Number!" ValidationGroup="admin_vol" Text="Required!"  ForeColor="Red" />

    <asp:RegularExpressionValidator ID="rge_phoneE" runat="server" Text="Invalid Phone Number!" ErrorMessage="Phone Number is not valid" ValidationGroup="admin_vol" ControlToValidate="txt_phoneE"  ForeColor="Blue" ValidationExpression="(^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$)" />
              
                        <br />
                         <asp:Label ID="lbl_reasonE" runat="server" Text="Reason:" />
                         <asp:TextBox ID="txt_reasonE" runat="server" Text='<%#Bind("reason") %>' />
                       <asp:RequiredFieldValidator ID="rfv_reasonE" runat="server" ControlToValidate="txt_reasonE" SetFocusOnError="true" ErrorMessage="Please enter your reason for volunteering" ValidationGroup="admin_vol" Text="Enter Reason For Volunteering!"  ForeColor="Red" />
                         <br />
                         <asp:Label ID="lbl_VolExpE" runat="server" Text="Have You Volunteered Here Before?:" />
                         <asp:TextBox ID="txt_VolExpE" runat="server" Text='<%#Bind("VolExp") %>' />
                         <asp:RequiredFieldValidator ID="rfv_VolExpE" runat="server" ControlToValidate="txt_VolExpE" SetFocusOnError="true" ErrorMessage="Please Fill out if you have volunteered here before" ValidationGroup="admin_vol" Text="Required!"  ForeColor="Red" />
                         <br />
                         <asp:Label ID="lbl_ifyesE" runat="server" Text="If yes, what did they do?:" />
                         <asp:TextBox ID="txt_ifYesE" runat="server" Text='<%#Bind("ifYes") %>' />
               
                          <br />
                         <asp:Label ID="lbl_hoursE" runat="server" Text="No. of Hours:" />
                            <asp:TextBox ID="txt_noHoursE" runat="server" Text='<%#Bind("noHours") %>' />
               <asp:RequiredFieldValidator ID="rfv_noHoursE" runat="server" ControlToValidate="txt_noHoursE" SetFocusOnError="true" ErrorMessage="Enter # of hours (1-50)" ValidationGroup="admin_vol" Text="Required!"  ForeColor="Red" />
    
    
    <asp:RangeValidator ID="rv_hours" runat="server" ControlToValidate="txt_noHoursE" SetFocusOnError="true" Type="Integer" MaximumValue="50" MinimumValue="1" Text="Invalid Amount of Hours" ErrorMessage="Please enter valid number of hours!" ValidationGroup="admin_vol"  ForeColor="Blue" />
                   
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
                          <asp:LinkButton ID="update" runat="server" Text="Update" CommandName="UpdateE" ValidationGroup="vs_adminVol" />
        <br />
        <asp:LinkButton ID="delete" runat="server" Text="Delete" CommandName="DeleteE" OnClientClick="return confirm('Confirm Delete?')" />
             <br />
         <asp:LinkButton ID="Cancel" runat="server" Text="Cancel" CommandName="CancelE" CausesValidation="false" />


       
                       <asp:ValidationSummary ID="vs_adminVol" runat="server" DisplayMode="BulletList" HeaderText="Errors!" ShowMessageBox="true" ValidationGroup="admin_vol" />
                 
                </ItemTemplate>
            </asp:ListView>
             <asp:DataPager ID="dp_listAll" runat="server" PagedControlID="ltv_all" PageSize="1">
                <Fields>
                   
                    <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowNextPageButton="false" />
                    <asp:NumericPagerField ButtonType="Link" />
                    <asp:NextPreviousPagerField ShowNextPageButton="true" ShowLastPageButton="true" ShowPreviousPageButton="false" />
                </Fields>
</asp:DataPager>

</asp:Content> 
