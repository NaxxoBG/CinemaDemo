<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CinemaWeb_DNP1.Register" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register-login-form Website Template | Home :: w3layouts</title>
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
                <h2><span></span>Register</h2>
            </div>
            <br>


            <asp:TextBox ID="fname" type="text" value="First Name" onfocus="if (this.value == 'First Name') {this.value = '';}" onblur="if (this.value == '') {this.value = 'First Name';}" runat="server"></asp:TextBox>
            <asp:TextBox ID="lname" type="text" value="Last Name" onfocus="if (this.value == 'Last Name') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Last Name';}" runat="server"></asp:TextBox>
            <asp:TextBox ID="email" type="text" value="Email Address" onfocus="if (this.value == 'Email Address') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Email Address';}" runat="server"></asp:TextBox>
            <asp:TextBox ID="user" type="text" value="User Name" onfocus="if (this.value == 'User Name') {this.value = '';}" onblur="if (this.value == '') {this.value = 'User Name';}" runat="server"></asp:TextBox>
            <asp:TextBox ID="pass" type="password" ToolTip="Password" value="Password" onfocus="if (this.value == 'Password') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Password';}" runat="server"></asp:TextBox>
            <asp:TextBox ID="pass2" type="password" ToolTip="Confirm password" value="Confirm Password" onfocus="if (this.value == 'Confirm Password') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Password';}" runat="server"></asp:TextBox>
            <div style="color: #ff0000" runat="server" id="errMSG">
                <br>
            </div>

            <div class="submit">

                <asp:Button ID="registerButton" runat="server" Text="Sign me up!" OnClick="RegisterButton_Click" />
                <br />
                form provided by <a href="www.w3layouts.com">w3layouts</a>
            </div>


        </div>
    </div>




</asp:Content>
