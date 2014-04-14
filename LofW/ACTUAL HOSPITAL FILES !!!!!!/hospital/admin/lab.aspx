<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lab.aspx.cs" Inherits="lab"   MasterPageFile="~/Master.master"      Culture="en-CA" UICulture="en-CA" %>
     
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
    
    <br />
     <div class="page_title"><h2>Edit Lab Results</h2></div>
    <br />
     <input type='hidden' id='current_page' />  
     <input type='hidden' id='show_per_page' /> 
     <div id='page_navigation'></div>  
     <div id="pagingControls"></div>
    <a href="homeadmin.aspx">Back To Home</a><br />
                    <asp:Label ID="lbl_message" runat="server" /><br />
                    <asp:Label ID="patientidI" Text="PatientID" runat="server" />
                    <asp:TextBox ID="txt_patientidI" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_patientidI" runat="server" ControlToValidate="txt_patientidI" SetFocusOnError="true"                     ErrorMessage="Enter Patient ID" ValidationGroup="edit" Text="Required!" />
                    <br />
                    <asp:Label ID="patientcodeI" Text="Patient Code" runat="server" /> 
                    <asp:TextBox ID="txt_patientcodeI" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_patientcodeI" runat="server" ControlToValidate="txt_patientcodeI"                                       SetFocusOnError="true" ErrorMessage="Enter patientCode" ValidationGroup="edit" Text="Required!" />
                    <br />      
                    <asp:Label ID="lbl_dobI" Text="Date of Birth" runat="server" /> 
                    <asp:TextBox ID="txt_dobI" runat="server"  />
                    <asp:RequiredFieldValidator ID="rfv_dobI" runat="server" ControlToValidate="txt_dobI"                                                       SetFocusOnError="true" ErrorMessage="Enter Date of Birth" ValidationGroup="edit" Text="Required!" />
                    <br />      
                    <asp:Label ID="lbl_ageI" Text="Age" runat="server" />
                    <asp:TextBox ID="txt_ageI" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_ageI" runat="server" ControlToValidate="txt_ageI"                                                       SetFocusOnError="true" ErrorMessage="Enter Age" ValidationGroup="edit" Text="Required!" />
                    <br />        
                    <asp:Label ID="lbl_sexI" Text="Gender" runat="server" />
                    <asp:TextBox ID="txt_sexI" runat="server"  />
                    <br />
                    <asp:Label ID="lbl_testTypeI" Text="Test Type" runat="server" />
                    <asp:TextBox ID="txt_testTypeI" runat="server" />
                    <br />
                    <asp:Label ID="lbl_testCodeI" Text="Test Code" runat="server" />
                    <asp:TextBox ID="txt_testCodeI" runat="server"  />
                    <br />
                    <asp:Label ID="lbl_result1I" Text="Result A" runat="server" />  
                    <asp:TextBox ID="txt_result1I" runat="server"  />
                    <br />
                    <asp:Label ID="lbl_result2I" Text="Result B" runat="server" />       
                    <asp:TextBox ID="txt_result2I" runat="server"  />
                    <br />
                    <asp:Label ID="lbl_resultDescI" Text="Result Description" runat="server" />
                    <asp:TextBox ID="txt_resultDescI" runat="server"  />
                    <br />
                    <asp:Label ID="lbl_abnormalI" Text="Abnormalities" runat="server" />
                    <asp:TextBox ID="txt_abnormalI" runat="server"  />
                    <br />
                    <asp:Label ID="lbl_refrangeI" Text="Reference Range" runat="server" />
                    <asp:TextBox ID="txt_refrangeI" runat="server"  />
                    <br />
                    <asp:Label ID="lbl_unitsI" Text="Units" runat="server" />
                    <asp:TextBox ID="txt_unitsI" runat="server"  />
                    <br />
                
                <br />
                <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subAdmin" CommandName="Insert"  />
                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subAdmin" CommandName="Cancel"  />
                <asp:ValidationSummary ID="vds_summary" runat="server"  HeaderText="Errors!" ShowMessageBox="true"                                          ValidationGroup="insert" />
                    <br />
                    <hr />
                    <asp:ListView ID="lst_all" runat="server" OnItemCommand="subUpDel" >
                    <ItemTemplate>
                    <asp:HiddenField ID="hdf_idE" runat="server" Value ='<%#Eval ("Id") %>' />
                    <asp:Label ID="patientidE" Text="PatientID" runat="server" />
                    <asp:TextBox ID="txt_patientidE" runat="server" Text='<%#Bind ("patientID") %>' />
                    <asp:RequiredFieldValidator ID="rfv_patientidE" runat="server" ControlToValidate="txt_patientidE" SetFocusOnError="true"                     ErrorMessage="Enter Patient ID" ValidationGroup="edit" Text="Required!" />
                    <br />
                    <asp:Label ID="patientcodeE" Text="Patient Code" runat="server" /> 
                    <asp:TextBox ID="txt_patientcodeE" runat="server" Text='<%#Bind ("patientCode") %>' />
                    <asp:RequiredFieldValidator ID="rfv_patientcodeE" runat="server" ControlToValidate="txt_patientcodeE"                                       SetFocusOnError="true" ErrorMessage="Enter patientCode" ValidationGroup="edit" Text="Required!" />
                    <br />      
                    <asp:Label ID="lbl_dobE" Text="Date of Birth" runat="server" /> 
                    <asp:TextBox ID="txt_dobE" runat="server" Text='<%#Bind ("DateofBirth") %>' />
                    <asp:RequiredFieldValidator ID="rfv_dobE" runat="server" ControlToValidate="txt_dobE"                                                       SetFocusOnError="true" ErrorMessage="Enter Date of Birth" ValidationGroup="edit" Text="Required!" />
                    <br />      
                    <asp:Label ID="lbl_ageE" Text="Age" runat="server" />
                    <asp:TextBox ID="txt_ageE" runat="server" Text='<%#Bind ("age") %>' />
                    <asp:RequiredFieldValidator ID="rfv_ageE" runat="server" ControlToValidate="txt_ageE"                                                       SetFocusOnError="true" ErrorMessage="Enter Age" ValidationGroup="edit" Text="Required!" />
                    <br />        
                    <asp:Label ID="lbl_sexE" Text="Gender" runat="server" />
                    <asp:TextBox ID="txt_sexE" runat="server" Text='<%#Bind ("sex") %>' />
                    <br />
                    <asp:Label ID="lbl_testTypeE" Text="Test Type" runat="server" />
                    <asp:TextBox ID="txt_testTypeE" runat="server" Text='<%#Bind ("testType") %>' />
                    <br />
                    <asp:Label ID="lbl_testCodeE" Text="Test Code" runat="server" />
                    <asp:TextBox ID="txt_testCodeE" runat="server" Text='<%#Bind ("testCode") %>' />
                    <br />
                    <asp:Label ID="lbl_result1E" Text="Result A" runat="server" />  
                    <asp:TextBox ID="txt_result1E" runat="server" Text='<%#Bind ("resultType1") %>' />
                    <br />
                    <asp:Label ID="lbl_result2E" Text="Result B" runat="server" />       
                    <asp:TextBox ID="txt_result2E" runat="server" Text='<%#Bind ("resultType2") %>' />
                    <br />
                    <asp:Label ID="lbl_resultDescE" Text="Result Description" runat="server" />
                    <asp:TextBox ID="txt_resultDescE" runat="server" Text='<%#Bind ("resultdescription") %>' />
                    <br />
                    <asp:Label ID="lbl_abnomalE" Text="Abnormalities" runat="server" />
                    <asp:TextBox ID="txt_abnormalE" runat="server" Text='<%#Bind ("abnormal") %>' />
                    <br />
                    <asp:Label ID="lbl_refrangeE" Text="Reference Range" runat="server" />
                    <asp:TextBox ID="txt_refrangeE" runat="server" Text='<%#Bind ("referenceRange") %>' />
                    <br />
                    <asp:Label ID="lbl_unitsE" Text="Units" runat="server" />
                    <asp:TextBox ID="txt_unitsE" runat="server" Text='<%#Bind ("units") %>' />
                    <br />
                     <asp:Button ID="btn_update" runat="server" Text="Update" CommandName ="Update" /></td>
                     <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm                                 ('Confirm Delete?');" />
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" /></td>
                    <asp:ValidationSummary ID="vds_sum" runat="server"  HeaderText="Errors!" ShowMessageBox="true"                                          ValidationGroup="edit" />
                    <br />
                   </ItemTemplate>
                   </asp:ListView>
                 <asp:DataPager ID="dp_listAll" runat="server" PagedControlID="lst_all" PageSize="1">
                <Fields>
                    <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowNextPageButton="true" />
                    <asp:NumericPagerField ButtonType="link" />
                    <asp:NextPreviousPagerField ShowNextPageButton="true" ShowLastPageButton="true" ShowPreviousPageButton="true" />
                </Fields>
                </asp:DataPager>
                </asp:Content>
