<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"  ValidateRequest="false"
    CodeBehind="InsertEditServiceOrders.aspx.cs" Inherits="ServiceOrdersWebApplication.Admin.InsertEditServiceOrders" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 165px;
        }
    </style>
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td> <h1>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        Service Order Details
        <asp:Literal ID="litServiceOrderNumber" runat="server"></asp:Literal></h1>
            </td>
            <td>
                <asp:ImageButton ID="btnSave" runat="server" onclick="btnSave_Click" />
            </td>
        </tr>
    </table>
    <hr />
    <br />
    <table style="width: 100%;">
        <tr>
            <td class="style2">
                &nbsp; Supplier:
            </td>
            <td>
                &nbsp;
                <asp:DropDownList ID="cboSuppliers" runat="server" DataSourceID="SuppliersSqlDataSource"
                    DataTextField="SupplierName" DataValueField="SupplierID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SuppliersSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TopazGeneralConnectionString %>"
                    SelectCommand="SELECT [SupplierID], [SupplierAccountNumer], [SupplierName] FROM [SUPPLIER] ORDER BY [SupplierName]">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp; Terms and Conditions:
            </td>
            <td>
                &nbsp;
                <asp:LinkButton ID="LinkButton1" runat="server">Edit</asp:LinkButton>
                <asp:ModalPopupExtender ID="termsAndConditions_ModalPopupExtender" 
                    runat="server" DynamicServicePath="" Enabled="True" PopupControlID="termsAndConditionsPopup"
                    RepositionMode="RepositionOnWindowResizeAndScroll" 
                    TargetControlID="LinkButton1">
                </asp:ModalPopupExtender>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                <div class="termsAndConditions">
                    <asp:Literal ID="litTermsAndConditions" runat="server"></asp:Literal></div>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="margin-left: 15px">
                <table width="100%">
                    <tr>
                        <td>
                            Service Summary:
                        </td>
                        <td align="right">
                            <asp:ImageButton ID="ImageButton1" Width="28px" runat="server" ImageUrl="~/Images/Add.png" />
                            <asp:ModalPopupExtender ID="ImageButton1_ModalPopupExtender" runat="server" 
                                DynamicServicePath="" PopupControlID="popupDiv" Enabled="True" TargetControlID="ImageButton1">
                            </asp:ModalPopupExtender>
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False"
                    CellPadding="4" DataKeyNames="ServiceOrderDetailID" DataSourceID="ServiceOrderDetailsSqlDataSource"
                    ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                            <HeaderStyle Width="50px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="ServiceOrderDetailID" HeaderText="ServiceOrderDetailID"
                            InsertVisible="False" ReadOnly="True" SortExpression="ServiceOrderDetailID" Visible="False" />
                        <asp:BoundField DataField="ServiceOrderID" HeaderText="ServiceOrderID" SortExpression="ServiceOrderID"
                            Visible="False" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice">
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
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
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:SqlDataSource ID="ServiceOrderDetailsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ServiceOrderManagerConnectionString %>"
        DeleteCommand="DELETE FROM [ServiceOrderDetails] WHERE [ServiceOrderDetailID] = @ServiceOrderDetailID"
        InsertCommand="INSERT INTO [ServiceOrderDetails] ([ServiceOrderID], [Qty], [Description], [UnitPrice]) VALUES (@ServiceOrderID, @Qty, @Description, @UnitPrice)"
        SelectCommand="SELECT * FROM [ServiceOrderDetails] WHERE ([ServiceOrderID] = @ServiceOrderID)"
        UpdateCommand="UPDATE [ServiceOrderDetails] SET [ServiceOrderID] = @ServiceOrderID, [Qty] = @Qty, [Description] = @Description, [UnitPrice] = @UnitPrice WHERE [ServiceOrderDetailID] = @ServiceOrderDetailID">
        <DeleteParameters>
            <asp:Parameter Name="ServiceOrderDetailID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ServiceOrderID" Type="Int32" />
            <asp:Parameter Name="Qty" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ServiceOrderID" QueryStringField="sID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ServiceOrderID" Type="Int32" />
            <asp:Parameter Name="Qty" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="ServiceOrderDetailID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <div class="popup" id="popupDiv" style="width:500px">
    <h2>add service order detail</h2>
    <hr />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ServiceOrderDetailID" 
            DataSourceID="SqlDataSource1" DefaultMode="Insert" 
            oniteminserted="FormView1_ItemInserted">
            <EditItemTemplate>
                ServiceOrderDetailID:
                <asp:Label ID="ServiceOrderDetailIDLabel1" runat="server" 
                    Text='<%# Eval("ServiceOrderDetailID") %>' />
                <br />
                ServiceOrderID:
                <asp:TextBox ID="ServiceOrderIDTextBox" runat="server" 
                    Text='<%# Bind("ServiceOrderID") %>' />
                <br />
                Qty:
                <asp:TextBox ID="QtyTextBox" runat="server" Text='<%# Bind("Qty") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" 
                    Text='<%# Bind("Description") %>' />
                <br />
                UnitPrice:
                <asp:TextBox ID="UnitPriceTextBox" runat="server" 
                    Text='<%# Bind("UnitPrice") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <table style="width:100%;">
                    <tr>
                        <td>
                            Description:
                        </td>
                        <td>
                            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                                Text='<%# Bind("Description") %>' Width="350px" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="DescriptionTextBox" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Qty:</td>
                        <td>
                            <asp:TextBox ID="QtyTextBox" runat="server" Text='<%# Bind("Qty") %>' 
                                Width="350px" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="QtyTextBox" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Unit Price:
                        </td>
                        <td>
                            <asp:TextBox ID="UnitPriceTextBox" runat="server" 
                                Text='<%# Bind("UnitPrice") %>' Width="350px" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="UnitPriceTextBox" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="Save" />
                            &nbsp;
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="Cancel" onclick="InsertCancelButton_Click" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <ItemTemplate>
                ServiceOrderDetailID:
                <asp:Label ID="ServiceOrderDetailIDLabel" runat="server" 
                    Text='<%# Eval("ServiceOrderDetailID") %>' />
                <br />
                ServiceOrderID:
                <asp:Label ID="ServiceOrderIDLabel" runat="server" 
                    Text='<%# Bind("ServiceOrderID") %>' />
                <br />
                Qty:
                <asp:Label ID="QtyLabel" runat="server" Text='<%# Bind("Qty") %>' />
                <br />
                Description:
                <asp:Label ID="DescriptionLabel" runat="server" 
                    Text='<%# Bind("Description") %>' />
                <br />
                UnitPrice:
                <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Bind("UnitPrice") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ServiceOrderManagerConnectionString %>" 
            DeleteCommand="DELETE FROM [ServiceOrderDetails] WHERE [ServiceOrderDetailID] = @ServiceOrderDetailID" 
            InsertCommand="INSERT INTO [ServiceOrderDetails] ([ServiceOrderID], [Qty], [Description], [UnitPrice]) VALUES (@ServiceOrderID, @Qty, @Description, @UnitPrice)" 
            SelectCommand="SELECT * FROM [ServiceOrderDetails] WHERE ([ServiceOrderID] = @ServiceOrderID)" 
            UpdateCommand="UPDATE [ServiceOrderDetails] SET [ServiceOrderID] = @ServiceOrderID, [Qty] = @Qty, [Description] = @Description, [UnitPrice] = @UnitPrice WHERE [ServiceOrderDetailID] = @ServiceOrderDetailID">
            <DeleteParameters>
                <asp:Parameter Name="ServiceOrderDetailID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ServiceOrderID" Type="Int32" />
                <asp:Parameter Name="Qty" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="ServiceOrderID" QueryStringField="sID" 
                    Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ServiceOrderID" Type="Int32" />
                <asp:Parameter Name="Qty" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="ServiceOrderDetailID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    <div class="popup" id="termsAndConditionsPopup" style="width:700px">
    <h2>Terms and conditions</h2>
    <hr />
        <textarea runat="server" class="ckeditor" id="Editor1">content</textarea>
        <div style="text-align:right;margin-top:10px"> <asp:Button ID="Button1" Text="Save" 
                runat="server" onclick="Button1_Click" />  &nbsp;&nbsp;<asp:Button 
                ID="Button2" Text="Cancel" runat="server" onclick="Button2_Click" /></div>
      
    </div>

</asp:Content>
