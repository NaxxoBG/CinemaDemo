<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PaymentPage.aspx.cs" Inherits="CinemaWeb_DNP1.PaymentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/paymentPage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-sm-8 col-sm-offset-2 my-form">
        <div class="row">
            <h2>Payment</h2>
            <div class="form-group">
                <label class="col-md-3 control-label" for="card-holder-name">Name on Card</label>
                <div class="col-md-9">
                    <asp:TextBox ID="HolderName" runat="server" class="form-control" name="card-holder-name" placeholder="Card Holder's Name"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label" for="card-number">Card Number</label>
                <div class="col-md-9">
                    <asp:TextBox ID="CardNumber" runat="server" class="form-control" name="card-number" placeholder="Debit/Credit Card Number"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label" for="expiry-month">Expiration Date</label>
                <div class="col-md-9">
                    <div class="row">
                        <div class="col-md-3 col-xs-6">
                            <asp:DropDownList ID="DropDownList2" runat="server" class="form-control col-sm-2" name="expiry-month">
                                <asp:ListItem>Month</asp:ListItem>
                                <asp:ListItem>January</asp:ListItem>
                                <asp:ListItem>February</asp:ListItem>
                                <asp:ListItem>March</asp:ListItem>
                                <asp:ListItem>April</asp:ListItem>
                                <asp:ListItem>May</asp:ListItem>
                                <asp:ListItem>June</asp:ListItem>
                                <asp:ListItem>July</asp:ListItem>
                                <asp:ListItem>August</asp:ListItem>
                                <asp:ListItem>September</asp:ListItem>
                                <asp:ListItem>Octoeber</asp:ListItem>
                                <asp:ListItem>November</asp:ListItem>
                                <asp:ListItem>December</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-3 col-xs-6">
                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" name="expiry-year">
                                <asp:ListItem>2017</asp:ListItem>
                                <asp:ListItem>2018</asp:ListItem>
                                <asp:ListItem>2019</asp:ListItem>
                                <asp:ListItem>2020</asp:ListItem>
                                <asp:ListItem>2021</asp:ListItem>
                                <asp:ListItem>2022</asp:ListItem>
                                <asp:ListItem>2023</asp:ListItem>
                                <asp:ListItem>2024</asp:ListItem>
                                <asp:ListItem>2025</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label" for="cvv">Card CVV</label>
                <div class="col-md-3">
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" name="cvv" placeholder="Security Code"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-4 col-md-offset-3">
                    <asp:Button ID="Button1" runat="server" name="abc" class="btn" Text="Pay Now" OnClick="Pay" />
                </div>
            </div>
            <asp:Label ID="ErrorMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>
    </div>
</asp:Content>
