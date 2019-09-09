<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Reset.aspx.cs" Inherits="CinemaWeb_DNP1.Reset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Password reset</title>
    <link href="css/register.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--webfonts-->
    <link href='http://fonts.googleapis.com/css?family=Lobster|Pacifico:400,700,300|Roboto:400,100,100italic,300,300italic,400italic,500italic,500' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,500,600,700,300' rel='stylesheet' type='text/css'>
    <!--webfonts-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="PointBreak" class="wrap" runat="server">
        <div class="Regisration">
            <div class="Regisration-head">
                <h2>Reset password</h2>
            </div>
            <br>
            <asp:TextBox ID="Password" type="password" value="Password" onfocus="if (this.value == 'Password') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Username';}" runat="server" ></asp:TextBox>
            <asp:TextBox ID="Password2" type="password" value="Password" onfocus="if (this.value == 'Password') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Password';}" runat="server"></asp:TextBox>
            <div style="color:#ff0000" runat="server" id="errMSG" ><br></div>
            <div class="submit">
                <asp:Button ID="changebButton" runat="server" Text="Change" OnClick="ChangePass" />
            </div>
            <br />
        </div>
        </div>
    <br />
</asp:Content>
