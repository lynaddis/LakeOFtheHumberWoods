<%@ Page Language="C#" AutoEventWireup="true" CodeFile="administrative.aspx.cs" Inherits="Admin_administrative" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/App_Themes/Donation.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="vsContainer">
    <div class="vsheader"></div>
        <div class="vsSideNav">
            <asp:LinkButton ID="LinkButtonCheckDonor" runat="server" OnClick="LinkButtonCheckDonor_Click">Check Donor Information</asp:LinkButton><br />
            <asp:LinkButton ID="LinkButtonSearchBedding" runat="server" OnClick="LinkButtonSearchBedding_Click">Search Badding</asp:LinkButton><br />
            <asp:LinkButton ID="LinkButtonCarParking" runat="server" OnClick="LinkButtonCarParking_Click">Check Car Parking Availability</asp:LinkButton><br />


        </div>
        <div class="vsContent">
            <asp:Panel ID="PanelDonorInfo" runat="server">
                <asp:GridView ID="gridviewDonorInformation"  DataKeyNames="donorId" OnSelectedIndexChanging="gridviewDonorInformation_SelectedIndexChanged" runat="server" SelectedRowStyle-Wrap="true"   AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnSelectedIndexChanged="gridviewDonorInformation_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField HeaderText="donor Id" DataField="donorId" ReadOnly="True" SortExpression="donorId"  />
                        <asp:TemplateField HeaderText=" Amount " SortExpression="donorAmount">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxDonorAmount" runat="server" Text='<%# Eval("donorAmount") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("donorAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Title" SortExpression="donorTitle">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("donorTitle") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("donorTitle") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name" SortExpression="donorFirstName">
                            <EditItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("donorFirstName") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("donorFirstName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Middle Name" SortExpression="donorMiddleName">
                            <EditItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("donorMiddleName") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("donorMiddleName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name" SortExpression="donorLastName">
                            <EditItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("donorLastName") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("donorLastName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Country" SortExpression="donorCountry">
                            <EditItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("donorCountry") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("donorCountry") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Province" SortExpression="donorProvince">
                            <EditItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("donorProvince") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("donorProvince") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City" SortExpression="donorCity">
                            <EditItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("donorCity") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("donorCity") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="P o Box" SortExpression="donorPoBox">
                            <EditItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("donorPoBox") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("donorPoBox") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="donorEmail">
                            <EditItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("donorEmail") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("donorEmail") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone (Home)" SortExpression="donorPhoneHome">
                            <EditItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("donorPhoneHome") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("donorPhoneHome") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone (Work)" SortExpression="donorPhoneWork">
                            <EditItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("donorPhoneWork") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Bind("donorPhoneWork") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Type" SortExpression="DonorType">
                            <EditItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("DonorType") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label13" runat="server" Text='<%# Bind("DonorType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company" SortExpression="DonorCompany">
                            <EditItemTemplate>
                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("DonorCompany") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label14" runat="server" Text='<%# Bind("DonorCompany") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Zip Code" SortExpression="donorZipCode">
                            <EditItemTemplate>
                                <asp:Label ID="Label15" runat="server" Text='<%# Eval("donorZipCode") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label15" runat="server" Text='<%# Bind("donorZipCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerSettings PageButtonCount="20" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:DetailsView ID="detailViewDonorIOnformation" runat="server" AutoGenerateRows="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPreRender="detailViewDonorIOnformation_PreRender" DataKeyNames="donorId" OnItemCommand="detailViewDonorIOnformation_ItemCommand">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="donorId" HeaderText="Id" />
                        <asp:TemplateField HeaderText="Amount">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxAmount" Text='<%#Bind("donorAmount") %>' runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Title">
                             <ItemTemplate>
                                <asp:TextBox ID="TextBoxTitle" Text='<%#Bind("donorTitle") %>' runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                             <ItemTemplate>
                                <asp:TextBox ID="TextBoxFirstName" Text='<%#Bind("donorFirstName") %>' runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Middle Name">
                             <ItemTemplate>
                                <asp:TextBox ID="TextBoxMiddle" Text='<%#Bind("donorMiddleName") %>' runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxlastName" Text='<%#Bind("donorLastName") %>' runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Country">
                            <ItemTemplate>
                                <asp:DropDownList ID="dropDownCountry" AutoPostBack="true" runat="server"></asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Province">
                           <ItemTemplate>
                                <asp:DropDownList ID="dropDownProvince" AutoPostBack="true" runat="server"></asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City">
                            <ItemTemplate>
                                <asp:DropDownList ID="dropDownCity" runat="server"></asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="P.O.Box">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxPoBox" Text='<%#Bind("donorPoBox") %>' runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxEmail" Text='<%#Bind("donorEmail") %>' runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone(Home)">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxPhoneHome" Text='<%#Bind("donorPhoneHome") %>' runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone(Work)">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxPhoneWork" Text='<%#Bind("donorPhoneWork") %>' runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Type">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxType" Text='<%#Bind("donorType") %>' runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxCompany" Text='<%#Bind("donorCompany") %>' runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Zip Code">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxZipCode" Text='<%#Bind("donorZipCode") %>' runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email Send">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBoxEmailSend" Text='<%#Bind("donorEmailSend") %>' runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Operation">
                            <ItemTemplate>
                                <asp:Button ID="btnUpdate" Text="Update" runat="server" CommandName="EditUpdate"></asp:Button>
                                <asp:Button ID="ButtonCancel" Text="Cancel" runat="server" CommandName="CancelUpdate"></asp:Button>

                            </ItemTemplate>
                        </asp:TemplateField>
                        
                    
                    </Fields>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                </asp:DetailsView>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </asp:Panel>
            <asp:Panel ID="PanelBedRoomSearch" runat="server">
                <div>
                    <asp:Button ID="ButtonAllSearch" runat="server" Text="Search All Type" />
                    <asp:Button ID="ButtonPrivateSearch" runat="server" Text="Search Private Rooms" />
                    <asp:Button ID="ButtonSemiSearch" runat="server" Text="Search Semi Rooms" />
                    <asp:Button ID="ButtonGenralSearch" runat="server" Text="Search General Rooms" />

                   <asp:Panel ID="panelTest" runat="server">
                        <asp:GridView ID="GridView1" runat="server">
                    </asp:GridView>
                   </asp:Panel>
                     <asp:GridView ID="GridViewSearchAll" runat="server" AutoGenerateColumns="False" DataKeyNames="bedId" OnRowDataBound="GridViewSearchAll_RowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None" BackColor="#999999" OnRowCommand="GridViewSearchAll_RowCommand" DataSourceID="SqlDataSource1" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="bedId" HeaderText="bedId" InsertVisible="False" ReadOnly="True" SortExpression="bedId" />
                <%--<asp:BoundField DataField="bedRoomId" HeaderText="bedRoomId" SortExpression="bedRoomId" />--%>
                <asp:TemplateField HeaderText="bedCount" SortExpression="bedCount">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxbedCount" runat="server" Text='<%# Bind("bedCount") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelbedCount" runat="server" Text='<%# Bind("bedCount") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="bedAvailable" SortExpression="bedAvailable">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxbedAvailable" runat="server" Text='<%# Bind("bedAvailable") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelbedAvailable" runat="server" Text='<%# Bind("bedAvailable") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="roomType" SortExpression="roomType">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxroomType" runat="server" Text='<%# Bind("roomType") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelroomType" runat="server" Text='<%# Bind("roomType") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="roomTotleBed" SortExpression="roomTotleBed">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxroomTotleBed" runat="server" Text='<%# Bind("roomTotleBed") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelroomTotleBed" runat="server" Text='<%# Bind("roomTotleBed") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="room NO" SortExpression="roomNo">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxroomNo" runat="server" Text='<%# Bind("roomNo") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LabelroomNo" runat="server" Text='<%# Bind("roomNo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            
                <asp:TemplateField HeaderText="Operation ">
                    <ItemTemplate>
                        <asp:Button ID="ButtonBook" runat="server" Text="Book Room" CommandName="bookBed" CommandArgument='<%#Bind("bedId") %>' />
                        <asp:Button ID="ButtonCheckOut" runat="server" Text="Check Out" CommandName="checkOut" CommandArgument='<%#Bind("bedId") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
                </div>
            </asp:Panel>
        </div>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="dropDownFillDataContext" EntityTypeName="" Select="new (donorId, donorAmount, donorTitle, donorFirstName, donorMiddleName, donorLastName, donorCountry, donorProvince, donorCity, donorPoBox, donorEmail, donorPhoneHome, donorPhoneWork, DonorType, DonorCompany, donorZipCode)" TableName="donorInformations">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LinqDataSource2" runat="server">
        </asp:LinqDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_66299_aspprojectConnectionString %>" SelectCommand="SELECT tblBedRooms.bedId, tblBedRooms.bedCount, tblBedRooms.bedAvailable, tblBedRooms.bedRoomId, tblRoomType.roomType, tblRoomType.roomTotleBed, tblBedRooms.roomNo FROM tblBedRooms INNER JOIN tblRoomType ON tblBedRooms.bedRoomId = tblRoomType.roomId"></asp:SqlDataSource>
       
        <asp:Label ID="lblSearch" runat="server"></asp:Label>
         <br />
        <asp:Panel ID="panelSearchTicket" runat="server">
            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBoxTicket" runat="server"></asp:TextBox>
                        <asp:Button ID="ButtonSearchTicket" runat="server" Text="Confirm Ticket" OnClick="subConfirmTicket"  /></td>
                    <asp:GridView ID="GridViewTicket" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GridViewTicket_RowCommand">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="ticketId" HeaderText="Ticket Id" />
                            <asp:BoundField DataField="ticketNo" HeaderText="Ticket No" />
                            <asp:TemplateField HeaderText="Confirm">
                                <ItemTemplate>
                                    <asp:Button ID="btnConfirm" runat="server" Text="Confirm" CommandName="confirm" CommandArgument='<%#Eval("ticketId") %>'  />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:Label ID="lblTicket" runat="server"></asp:Label>
                     </tr>
            </table>
        </asp:Panel>
    </div>

    </form>
</body>
</html>
