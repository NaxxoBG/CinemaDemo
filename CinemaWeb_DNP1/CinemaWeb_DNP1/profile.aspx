<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="CinemaWeb_DNP1.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/register.css" rel='stylesheet' type='text/css' />
    <link href="css/profile.css" rel='stylesheet' type='text/css' />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <span class="col-sm-2"></span>
        <h2 class="col-sm-8">Profile information</h2>
    </div>
    <hr>
    <div class="row">
        <span class="col-sm-3"></span>
        <p class="col-sm-4">First name:</p>
        <p class="col-sm-4"><%:Session["fname"]%></p>
    </div>
     <div class="row">
        <span class="col-sm-3"></span>
        <p class="col-sm-4">Last name:</p>
        <p class="col-sm-4"><%:Session["lname"]%></p>
    </div>
     <div class="row">
        <span class="col-sm-3"></span>
        <p class="col-sm-4">Email address:</p>
        <p class="col-sm-4"><%:Session["email"]%></p>
    </div>
     <div class="row">
        <span class="col-sm-3"></span>
        <p class="col-sm-4">Username:</p>
        <p class="col-sm-4"><%:Session["username"]%></p>
    </div>
   <div class="row">
        <span class="col-sm-2"></span>
        <h2 class="col-sm-8">Password change</h2>
    </div>
    <hr>

    <div class="wrap">
        <div class="Regisration">
            <div class="Regisration-head">
                <h2>Password reset</h2>
            </div>
            <br>
            <p>Current password:</p> <asp:TextBox ID="currentPass" type="password" value="Password" onfocus="if (this.value == 'Password') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Password';}" runat="server"></asp:TextBox>
            <p>New password:</p> <asp:TextBox ID="password" type="password" value="Password" onfocus="if (this.value == 'Password') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Password';}" runat="server"></asp:TextBox>
            <p>Repeat new password:</p> <asp:TextBox ID="passwordRe" type="password" value="Password" onfocus="if (this.value == 'Password') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Password';}" runat="server"></asp:TextBox>
            <div style="color:#ff0000" runat="server" id="errMSG" ><br></div>
            <div class="submit">
                <asp:Button ID="loginButton" runat="server" Text="Submit" OnClick="ChangePassword" />
            </div>
            <br />
        </div>
        </div>
    <br />
    

</asp:Content>
