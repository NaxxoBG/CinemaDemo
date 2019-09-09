<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="CinemaWeb_DNP1.LogIn2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login</title>
    <link href="css/register.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--webfonts-->
    <link href='http://fonts.googleapis.com/css?family=Lobster|Pacifico:400,700,300|Roboto:400,100,100italic,300,300italic,400italic,500italic,500' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,500,600,700,300' rel='stylesheet' type='text/css'>
    <!--webfonts-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrap">
        <div class="Regisration">
            <div class="Regisration-head">
                <h2><span></span>Log in</h2>
            </div>
            <br>
            <asp:TextBox ID="username" type="text" value="Username" onfocus="if (this.value == 'Username') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Username';}" runat="server" ></asp:TextBox>
            <asp:TextBox ID="password" type="password" value="Password" onfocus="if (this.value == 'Password') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Password';}" runat="server"></asp:TextBox>
            <div style="color:#ff0000" runat="server" id="errMSG" ><br></div>
            <div class="Forget-pass">
                <a style="padding-right:25%" href="ForgottenPass.aspx">Forgot password ?</a>
                <a href="Register.aspx">Register !</a>
            </div>
            <div class="submit">
                <asp:Button ID="loginButton" runat="server" Text="Log in" OnClick="LogIn" />
            </div>
            <br />
        </div>
        </div>
    <br />

</asp:Content>
