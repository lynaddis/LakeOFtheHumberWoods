<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="volunteer.aspx.cs" Inherits="volunteer"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
     <div class="page_title" >

           <h2>Sign Up To Volunteer!</h2>
        <p>If you want to help out in any way, please fill out all applicable fields of this form and we will be sure to contact you!   </p>
    </div>
  
               <div id="vol_form1">
        <asp:Label ID="lbl_fname" runat="server" Text="Full Name: " />
        <br />
                    <asp:TextBox ID="txt_nameI" runat="server" /> 
                     <asp:RequiredFieldValidator ID="rfv_nameI" runat="server" ControlToValidate="txt_nameI" SetFocusOnError="true" ErrorMessage="Enter Name!" ValidationGroup="vol_val" Text="Required!" ForeColor="Red" />

        <br />
          <asp:Label ID="lbl_age" runat="server" Text="Age: " />
              <br />    
                        <asp:TextBox ID="txt_ageI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_ageI" runat="server" ControlToValidate="txt_ageI" SetFocusOnError="true" ErrorMessage="Enter Your Age! (must be 10-100)" ValidationGroup="vol_val" Text="Required!"  ForeColor="Red" /> 
    <asp:RangeValidator ID="rng_age" runat="server" ControlToValidate="txt_ageI" SetFocusOnError="true" Type="Integer" MaximumValue="90" MinimumValue="10" Text="Invalid Age" ErrorMessage="Please enter valid age!" ValidationGroup="vol_val"  ForeColor="Blue" />
                       <br />
          <asp:Label ID="lbl_gender" runat="server" Text="Gender: " />
                 <br />
               <asp:TextBox ID="txt_genderI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_genderI" runat="server" ControlToValidate="txt_genderI" SetFocusOnError="true" ErrorMessage="Please Enter Your Gender!" ValidationGroup="vol_val" Text="Required!"  ForeColor="Red" />
                       <br />
          <asp:Label ID="lbl_email" runat="server" Text="Email:" /> 
       <br />
         <asp:TextBox ID="txt_emailI" runat="server" />
                        <asp:RequiredFieldValidator ID="rfv_emailI" runat="server" ControlToValidate="txt_emailI" SetFocusOnError="true" ErrorMessage="Please enter email!" ValidationGroup="vol_val" Text="Required!"  ForeColor="Red"/>
    <asp:RegularExpressionValidator ID="rg_email" runat="server" ControlToValidate="txt_emailI" SetFocusOnError="true" ErrorMessage="Invalid Email!" ValidationGroup="vol_val" Text="invalid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                      <br />

          <asp:Label ID="lbl_phone" runat="server" Text="Phone: " />
                  <br />  <asp:TextBox ID="txt_phoneI" runat="server" />
                     <asp:RequiredFieldValidator ID="rfv_phoneI" runat="server" ControlToValidate="txt_phoneI" SetFocusOnError="true" ErrorMessage="Enter Phone Number!" ValidationGroup="vol_val" Text="Required!"  ForeColor="Red" />

    <asp:RegularExpressionValidator ID="rge_phone" runat="server" Text="Invalid Phone Number!" ErrorMessage="Phone Number is not valid" ValidationGroup="vol_val" ControlToValidate="txt_phoneI"  ForeColor="Blue" ValidationExpression="(^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$)" />
                   
               <br />
          <asp:Label ID="lbl_reason" runat="server" Text="Reason For Volunteering: " />
                 <br />   <asp:TextBox ID="txt_reasonI" runat="server" TextMode="MultiLine" Rows="4" />
                        <asp:RequiredFieldValidator ID="rfv_reasonI" runat="server" ControlToValidate="txt_reasonI" SetFocusOnError="true" ErrorMessage="Please enter your reason for volunteering" ValidationGroup="vol_val" Text="Enter Reason For Volunteering!"  ForeColor="Red" />
                  <br />

  
          <asp:Label ID="lbl_Experience" runat="server" Text="Have you Volunteered here before?" />
               <br />     <asp:TextBox ID="txt_VolExpI" runat="server" />
                      <asp:RequiredFieldValidator ID="rfv_VolExpI" runat="server" ControlToValidate="txt_VolExpI" SetFocusOnError="true" ErrorMessage="Please Fill out if you have volunteered here before" ValidationGroup="vol_val" Text="Required!"  ForeColor="Red" />
                  <br />
                   </div>
    <div id="vol_form2" />
          <asp:Label ID="lbl_yes" runat="server" Text="If yes, what did you do?" />
               <br />     <asp:TextBox ID="txt_ifYesI" runat="server" />
   
                   <br />  
          <asp:Label ID="lbl_noHours" runat="server" Text="How many hours do you want?" />
                  <br />  <asp:TextBox ID="txt_noHoursI" runat="server" />
   <asp:RequiredFieldValidator ID="rfv_hour" runat="server" ControlToValidate="txt_noHoursI" SetFocusOnError="true" ErrorMessage="Enter # of hours (1-50)" ValidationGroup="vol_val" Text="Required!"  ForeColor="Red" />
    
    
    <asp:RangeValidator ID="rng_hours" runat="server" ControlToValidate="txt_noHoursI" SetFocusOnError="true" Type="Integer" MaximumValue="50" MinimumValue="1" Text="Invalid Amount of Hours" ErrorMessage="Please enter valid number of hours!" ValidationGroup="vol_val"  ForeColor="Blue" />
                   
                <br />
          <asp:Label ID="lbl_PR" runat="server" Text="Is there someone you would like to volunteer with?" />
                <br />    <asp:TextBox ID="txt_personRequestI" runat="server" />
                <br />
          <asp:Label ID="lbl_int" runat="server" Text="Any specific interets (ie. department, practice)" />
                 <br />   <asp:TextBox ID="txt_interestI" runat="server" />
                 <br />
          <asp:Label ID="lbl_allergy" runat="server" Text="Do you have any allergies?" />
                 <br />   <asp:TextBox ID="txt_allergiesI" runat="server" />
                     <br />
          <asp:Label ID="lbl_refuse" runat="server" Text="Departments you refuse to work in: " />
                 <br />   <asp:TextBox ID="txt_deptRefuseI" runat="server" />
                     <br />
          <asp:Label ID="lbl_request" runat="server" Text="Departments you want to work in: " />
                 <br />   <asp:TextBox ID="txt_deptRequestI" runat="server" />
            <br />
        <br />
                    <asp:Button ID="btn_insert" runat="server" Text="Submit" OnCommand="subInsert" CommandName="Insert" ValidationGroup="vol_val" CausesValidation="true" />
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subInsert" CommandName="Cancel" CausesValidation="true" />
    </div>
    <asp:ValidationSummary ID="vld_sum" runat="server" DisplayMode="BulletList" HeaderText="Errors!" ShowSummary="false" ShowMessageBox="true" ValidationGroup="vol_val" />
        
            <%-- end of insert rows--%>
        <br />
        <br />
             <asp:Label ID="lbl_message" runat="server" />
        <br />

         <asp:DataList ID="dtl_all" runat="server" >
                <ItemTemplate>
                    </ItemTemplate>
             </asp:DataList>


    </asp:Content>

