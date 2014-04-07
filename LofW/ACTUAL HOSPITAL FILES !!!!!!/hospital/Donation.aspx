<%@ Page Title="" Language="C#" MasterPageFile="~/pages/MasterPage.master" AutoEventWireup="true" CodeFile="Donation.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph_header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_main" Runat="Server">
     <div class="donation">
        <asp:Table ID="Table2" runat="server" CssClass="donation">
            <asp:TableHeaderRow><asp:TableCell>Donation</asp:TableCell></asp:TableHeaderRow>
            <asp:TableRow >
                <asp:TableCell>Choose Amount</asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="DropDownAmount" Width="145px" runat="server">
                        <asp:ListItem Value="-1" Text="Select Amount"></asp:ListItem>
                        <asp:ListItem Value="10" Text="10"></asp:ListItem>
                        <asp:ListItem Value="50" Text="50"></asp:ListItem>
                        <asp:ListItem Value="100" Text="100"></asp:ListItem>
                        <asp:ListItem Value="4" Text="Choose.."></asp:ListItem>

                    </asp:DropDownList>
                    <asp:TextBox ID="TextBoxAmount" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAmount" ControlToValidate="DropDownAmount" runat="server" ErrorMessage="RequiredField"  Text="*" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Title : </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="DropDownListTitle" runat="server" Width="145px">
                        <asp:ListItem Value="-1" Text="Select Title"></asp:ListItem>
                        <asp:ListItem Value="Mr" Text="Mr."></asp:ListItem>
                        <asp:ListItem Value="Mrs" Text="Mrs."></asp:ListItem>
                        <asp:ListItem Value="Miss" Text="Miss."></asp:ListItem>
                        

                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" ControlToValidate="DropDownListTitle" runat="server" ErrorMessage="RequiredField"  Text="*" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>

                   </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>First Name : </asp:TableCell>
                <asp:TableCell>
                    
                    <asp:TextBox ID="TextBoxFirstName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" ControlToValidate="TextBoxFirstName" runat="server" ErrorMessage="RequiredField"  Text="*" ForeColor="Red" ></asp:RequiredFieldValidator>

                </asp:TableCell>
          
                  </asp:TableRow>
             <asp:TableRow>
                <asp:TableCell>Middle Initial : </asp:TableCell>
                <asp:TableCell>
                    
                    <asp:TextBox ID="TextBoxMiddleInitial" runat="server" Columns="10"></asp:TextBox>

                </asp:TableCell>
          
                  </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Last Name : </asp:TableCell>
                <asp:TableCell>
                    
                    <asp:TextBox ID="TextBoxLastName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" ControlToValidate="TextBoxLastName" runat="server" ErrorMessage="RequiredField"  Text="*" ForeColor="Red"></asp:RequiredFieldValidator>

                </asp:TableCell>
          
                  </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Donor Type : </asp:TableCell>
                <asp:TableCell>
                    
                    <asp:RadioButtonList ID="RadioButtonListDonorType" runat="server">
                        <asp:ListItem Text="Individual" Value="Individual" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Organization" Value="Organization"></asp:ListItem>

                    </asp:RadioButtonList>

                </asp:TableCell>
          
                  </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Company : </asp:TableCell>
                <asp:TableCell>
                    
                    <asp:TextBox ID="TextBoxCompany" runat="server"></asp:TextBox>

                </asp:TableCell>
          
                  </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2"><hr /></asp:TableCell>
                
                  </asp:TableRow>
             <asp:TableRow>
                <asp:TableCell ColumnSpan="2" >Address Information </asp:TableCell>
                
                  </asp:TableRow>
             <asp:TableRow>
                <asp:TableCell>Postal/Zip Code: </asp:TableCell>
                <asp:TableCell>
                    
                    <asp:TextBox ID="TextBoxStreetPostalCode" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPostalCode" ControlToValidate="TextBoxStreetPostalCode" runat="server" ErrorMessage="Please enter Postal code"  Text="*" ForeColor="Red"></asp:RequiredFieldValidator>

                </asp:TableCell>
          
                  </asp:TableRow>
            
            <asp:TableRow>
                <asp:TableCell>P.O. Box : </asp:TableCell>
                <asp:TableCell>
                    
                    <asp:TextBox ID="TextBoxPoBox" runat="server"></asp:TextBox>

                </asp:TableCell>
          
                  </asp:TableRow>
             <asp:TableRow>
                <asp:TableCell>Country : </asp:TableCell>
                <asp:TableCell>
                    
                    <asp:DropDownList ID="DropDownListCountry" runat="server" Width="145px" AutoPostBack="true" OnSelectedIndexChanged="subCountryIndexChange" ></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="DropDownListCountry" runat="server" ErrorMessage="RequiredField"  Text="*" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>

                </asp:TableCell>
          
                  </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Province : </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="DropDownListProvince" AutoPostBack="true" OnSelectedIndexChanged="subCityIndexChange" runat="server" Width="145px"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorProvince" ControlToValidate="DropDownListProvince" runat="server" ErrorMessage="please select province"  Text="*" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>

                </asp:TableCell>
          
                  </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>City : </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="DropDownListCity" Width="145px"  runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" ControlToValidate="DropDownListCity" runat="server" ErrorMessage="RequiredField"  Text="*" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>

                </asp:TableCell>
          
                  </asp:TableRow>
           <asp:TableRow>
                <asp:TableCell>Email: </asp:TableCell>
                <asp:TableCell>
                    
                    <asp:TextBox ID="TextBoxEmail" runat="server" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RequiredFieldValidatorEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="TextBoxEmail" runat="server" ErrorMessage="Please enter Email"  Text="*" ForeColor="Red"></asp:RegularExpressionValidator>

                </asp:TableCell>
          
                  </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Phone(Home): </asp:TableCell>
                <asp:TableCell>
                    
                    <asp:TextBox ID="TextBoxPhoneHome" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RegularExpressionPhone"  ControlToValidate="TextBoxPhoneHome" runat="server" ErrorMessage="Please enter phone"  Text="*" ForeColor="Red"></asp:RequiredFieldValidator>

                </asp:TableCell>
          
                  </asp:TableRow>
             <asp:TableRow>
                <asp:TableCell>Phone(Work): </asp:TableCell>
                <asp:TableCell>
                    
                    <asp:TextBox ID="TextBoxPhoneWork" runat="server" ></asp:TextBox>

                </asp:TableCell>
          
                  </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <asp:CheckBox ID="CheckBox1" runat="server" /><asp:Label ID="LabelMsg" runat="server" Text="The e-receipt will be sent to you by email." Width="400px"></asp:Label> </asp:TableCell>
                
          
                  </asp:TableRow>
             <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                     

                </asp:TableCell>
                
          
                  </asp:TableRow>
        </asp:Table>
<input type="hidden" name="cmd" value="_s-xclick"/>
<input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----
"/>
<asp:ImageButton ID="imgbutton" runat="server"  ImageUrl="https://www.sandbox.paypal.com/en_US/i/btn/btn_donateCC_LG.gif" OnClick="subSubmitForm" PostBackUrl="https://www.sandbox.paypal.com/cgi-bin/webscr"  />
<asp:Image runat="server"  ImageUrl="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" />

    </div>
</asp:Content>
