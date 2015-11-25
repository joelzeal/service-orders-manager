<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zzzzzzzzzzzz.aspx.cs" Inherits="ServiceOrdersWebApplication.zzzzzzzzzzzz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="popup" style="width:700px">
    <h2>Terms and conditions</h2>
    <hr />
        <textarea class="ckeditor" id="Editor1">content</textarea>
        <div style="text-align:right;margin-top:10px"> <asp:Button Text="Save" runat="server" />  &nbsp;&nbsp;<asp:Button ID="Button1" Text="Cancel" runat="server" /></div>
      
    </div>
    </form>
</body>
</html>
