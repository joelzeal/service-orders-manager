<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SuppliersList.aspx.cs" Inherits="ServiceOrdersWebApplication.Admin.SuppliersList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Suppliers</h1>
<hr />
    <asp:GridView ID="GridView1" Width="100%" runat="server" 
    AutoGenerateColumns="False" CellPadding="4" 
    DataKeyNames="SupplierAccountNumer,SupplierName" 
    DataSourceID="SuppliersSqlDataSource" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="SupplierAccountNumer" 
                HeaderText="SupplierAccountNumer" ReadOnly="True" 
                SortExpression="SupplierAccountNumer" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="SupplierCreditLimit" HeaderText="SupplierCreditLimit" 
                SortExpression="SupplierCreditLimit" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="SupplierCreditTerms" HeaderText="SupplierCreditTerms" 
                SortExpression="SupplierCreditTerms" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="SupplierMemo" HeaderText="SupplierMemo" 
                SortExpression="SupplierMemo" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="SupplierName" 
                HeaderText="SupplierName" SortExpression="SupplierName" ReadOnly="True" >
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
<asp:SqlDataSource ID="SuppliersSqlDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:TopazGeneralConnectionString %>" 
    SelectCommand="SELECT * FROM [SUPPLIER]"></asp:SqlDataSource>
</asp:Content>
