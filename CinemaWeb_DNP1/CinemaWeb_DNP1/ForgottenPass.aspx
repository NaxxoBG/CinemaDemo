<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ForgottenPass.aspx.cs" Inherits="CinemaWeb_DNP1.ForgottenPass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <title>CinemaWeb - Password reset</title>
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
                <h2>Password recovery</h2>
            </div>
            <br>
            <asp:TextBox ID="email" type="text" value="Email address" onfocus="if (this.value == 'Email address') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Email address';}" runat="server" ></asp:TextBox>
            <div style="color:#ff0000" runat="server" id="errMSG" ><br></div>
            <div class="submit">
                <asp:Button ID="sendButton" runat="server" Text="Send!" OnClick="Send" />
            </div>
            <br />
        </div>
        </div>
    <br />
</asp:Content>
