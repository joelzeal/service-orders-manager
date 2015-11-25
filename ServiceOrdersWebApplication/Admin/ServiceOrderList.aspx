<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ServiceOrderList.aspx.cs" Inherits="ServiceOrdersWebApplication.Admin.ServiceOrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
    Service Order List
</h1>
<hr />
<br />
    <asp:GridView ID="GridView1" Width="100%" runat="server" 
    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ServiceOrderID" 
    DataSourceID="ServiceOrdersSqlDataSource" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ServiceOrderID" 
                DataNavigateUrlFormatString="~/Admin/InsertEditServiceOrders.aspx?sID={0}" 
                NavigateUrl="~/Admin/InsertEditServiceOrders.aspx" Text="Details" />
            <asp:TemplateField HeaderText="ServiceOrderID" InsertVisible="False" 
                SortExpression="ServiceOrderID" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ServiceOrderID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Utils.GetSupplierName((int)Eval("ServiceOrderID")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="SupplierID" HeaderText="Supplier" 
                SortExpression="SupplierID" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="ServiceOrderNumber" HeaderText="Service Order NO." 
                SortExpression="ServiceOrderNumber" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="PercentageOfCompletion" 
                HeaderText="Percentage of Completion" 
                SortExpression="PercentageOfCompletion" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="StatusDescription" HeaderText="Status" 
                SortExpression="StatusDescription" >
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
<asp:SqlDataSource ID="ServiceOrdersSqlDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ServiceOrderManagerConnectionString %>" 
    
        SelectCommand="SELECT ServiceOrders.ServiceOrderID, ServiceOrders.SupplierID, ServiceOrders.ServiceOrderNumber, ServiceOrders.TermsAndConditions, ServiceOrders.AcceptanceName, ServiceOrders.ApprovedBy, ServiceOrders.PaymentTerms, ServiceOrders.PercentageOfCompletion, ServiceOrders.StatusID, ServiceOrders.IsPaid, ServiceOrders.IsApproved, ServiceOrderStatus.Description AS StatusDescription FROM ServiceOrders INNER JOIN ServiceOrderStatus ON ServiceOrders.StatusID = ServiceOrderStatus.ServiceOrderStatusID"></asp:SqlDataSource>
</asp:Content>
