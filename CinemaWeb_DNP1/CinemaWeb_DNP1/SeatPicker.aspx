<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SeatPicker.aspx.cs" Inherits="CinemaWeb_DNP1.SeatPicker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet prefetch" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link href="css/seatPicker.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server" class="cinema">

        <div class="card">
                <div class="row">
                    <div class="preview col-sm-4">
                        <img class=" img-rounded img-responsive " src="https://image.tmdb.org/t/p/original<%:movie.poster %>" />
                        <h4 class="text-center"><%:movie.duration%> minutes</h4>
                    </div>
                    <div class="details col-md-8">
                        <div class="details">
                            <h3 class="product-title"><%:movie.title %></h3>
                            <h4 class="bold-orange"><%:movie.genre %></h4>
                            <p class="product-description"><%:movie.overview %></p>
                            <h4 class="time text-center" runat="server" id="timeField"><%:screening.start.ToString()%></h4>
                        </div>
                    </div>
                </div>
            </div>
           <br />
           <div class="row"> <asp:PlaceHolder runat="server" ID="A" /></div>
           <div class="row"> <asp:PlaceHolder runat="server" ID="B" /></div>
           <div class="row"> <asp:PlaceHolder runat="server" ID="C" /></div>
           <div class="row"> <asp:PlaceHolder runat="server" ID="D" /></div>
           <div class="row"> <asp:PlaceHolder runat="server" ID="E" /></div>
           <div class="row"> <asp:PlaceHolder runat="server" ID="F" /></div>
           <div class="row"> <asp:PlaceHolder runat="server" ID="G" /></div>
           <div class="row"> <asp:PlaceHolder runat="server" ID="H" /></div>
           <div class="row"> <asp:PlaceHolder runat="server" ID="I" /></div>
        <div class="row text-center">
            <h2>Total price: <span runat="server" id="price">0</span> DKK</h2>
            <br>
            <asp:Button CssClass="btn" ID="payment" runat="server" OnClick="Pay" Text="Proceed to payment" />
        </div>
    </div>
</asp:Content>
