<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lab.aspx.cs" Inherits="lab"   MasterPageFile="~/Master.master"      Culture="en-CA" UICulture="en-CA" %>
     
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">

    <asp:Label ID="lbl_message" runat="server" />
        <br />
        <br />
        <asp:Label ID="lbl_insert" runat="server" />
        <br />
        <br />
           
        <table>
            <tr>
                <th>PatientID</th>
                <th>PatientCode</th>
                <th>D.O.B</th>
                <th>Age</th>
                <th>Sex</th>
                <th>TestType</th>
                <th>TestCode</th>
                <th>Result1</th>
                <th>Result2</th>
                <th>ResultDescription</th>
                <th>Abnormal</th>
                <th>ReferenceRange</th>
                <th>Units</th>
                <th>&nbsp;</th>       
                <th>&nbsp;</th>          
            </tr>
            <tr>
                <td>
                <asp:TextBox ID ="txt_patientidI" runat="server" />
                </td>
                <td>
                <asp:TextBox ID ="txt_patientcodeI" runat="server" />
                </td>
                <td>
                <%--<asp:CompareValidator ID="cv_dob" runat="server" ControlToValidate="txt_dobI" Operator="DataTypeCheck" Type="Date" CultureInvariantValues="true" Display="None" ErrorMessage="invalid form for date of birth, expected: dd-mm-yyyy"  />--%>
                <asp:TextBox ID ="txt_dobI" runat="server" />
                </td>
                 <td>
                <asp:TextBox ID ="txt_ageI" runat="server" />
                </td>
                 <td>
                <asp:TextBox ID ="txt_sexI" runat="server" />
                </td>
                 <td>
                <asp:TextBox ID ="txt_testTypeI" runat="server" />
                </td>
                 <td>
                <asp:TextBox ID ="txt_testCodeI" runat="server" />
                </td>
                 <td>
                <asp:TextBox ID ="txt_result1I" runat="server" />
                </td>
                 <td>
                <asp:TextBox ID ="txt_result2I" runat="server" />
                </td>
                 <td>
                <asp:TextBox ID ="txt_resultDescI" runat="server" />
                </td>
                 <td>
                <asp:TextBox ID ="txt_abnormalI" runat="server" />
                </td>
                 <td>
                <asp:TextBox ID ="txt_refrangeI" runat="server" />
                </td>
                 <td>
                <asp:TextBox ID ="txt_unitsI" runat="server" />
                </td>
                <td>
                <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subAdmin" CommandName="Insert"  />
                <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subAdmin" CommandName="Cancel"  />

               </td>
                </tr>
                <asp:Repeater ID="rpt_all" runat="server" OnItemCommand="subUpDel">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:HiddenField ID="hdf_idE" runat="server" Value ='<%#Eval ("Id") %>' />
                                <asp:TextBox ID="txt_patientidE" runat="server" Text='<%#Bind ("patientID") %>' />
                            </td>
                            <td>
                                 <asp:TextBox ID="txt_patientcodeE" runat="server" Text='<%#Bind ("patientCode") %>' />
                            </td>
                            <td>
                              <%--  <asp:CompareValidator ID="cv_dob" runat="server" ControlToValidate="txt_dobE" Operator="DataTypeCheck" Type="Date" CultureInvariantValues="true" Display="None" ErrorMessage="invalid form for date of birth, expected: dd-mm-yyyy"  />--%>
                             <asp:TextBox ID="txt_dobE" runat="server" Text='<%#Bind ("DateofBirth") %>' />
                           </td>
                            <td>
                                  <asp:TextBox ID="txt_ageE" runat="server" Text='<%#Bind ("age") %>' />
                            </td>
                            <td>
                                  <asp:TextBox ID="txt_sexE" runat="server" Text='<%#Bind ("sex") %>' />
                            </td>
                            <td>
                                 <asp:TextBox ID="txt_testTypeE" runat="server" Text='<%#Bind ("testType") %>' />
                            </td>
                                 <td>
                                 <asp:TextBox ID="txt_testCodeE" runat="server" Text='<%#Bind ("testCode") %>' />
                            </td>
                                 <td>
                                 <asp:TextBox ID="txt_result1E" runat="server" Text='<%#Bind ("resultType1") %>' />
                            </td>
                            <td>
                                 <asp:TextBox ID="txt_result2E" runat="server" Text='<%#Bind ("resultType2") %>' />
                            </td>

                                <td>
                                 <asp:TextBox ID="txt_resultDescE" runat="server" Text='<%#Bind ("resultdescription") %>' />
                            </td>
                                <td>
                                 <asp:TextBox ID="txt_abnormalE" runat="server" Text='<%#Bind ("abnormal") %>' />
                            </td>
                                <td>
                                 <asp:TextBox ID="txt_refrangeE" runat="server" Text='<%#Bind ("referenceRange") %>' />
                            </td>

                                <td>
                                 <asp:TextBox ID="txt_unitsE" runat="server" Text='<%#Bind ("units") %>' />
                            </td>
                               <td> <asp:Button ID="btn_update" runat="server" Text="Update" CommandName ="Update" /></td>
                               <td> <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Confirm Delete?');" /></td>
                               <td> <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" /></td>
                            </td>
                          </tr>
                    </ItemTemplate>
                   </asp:Repeater>
                  </table>
   

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
