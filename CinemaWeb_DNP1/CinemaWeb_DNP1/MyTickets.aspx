<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MyTickets.aspx.cs" Inherits="CinemaWeb_DNP1.MyTickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/myTicket.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <asp:ListView ID="list" PageSize="9" DataSourceID="SqlDataSource1" runat="server">

          <LayoutTemplate>
            <div class="row">
            <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
            </div>
            <br />
            <div class="data-pager text-center row">
                <asp:DataPager ID="DataPager1" PageSize="9" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" />
                        <asp:NumericPagerField ButtonType="Link" />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" />
                    </Fields>
                </asp:DataPager>
                <br>
            </div>
        </LayoutTemplate>


        <ItemTemplate>
            <div class="col-sm-6 col-md-4">
            <div class="cardWrap">
                <div class="card cardLeft">
                    <h1>VIA <span>Cinema</span></h1>
                    <div class="title">
                        <h2><%#Eval("title")%></h2>
                        <span>movie</span>
                    </div>
                    <div class="name">
                        <h2><%:Session["fname"]+" "+Session["lname"]%></h2>
                        <span>name</span>
                    </div>
                    <div class="seat">
                        <h2><%#Eval("row")+""+Eval("number")%></h2>
                        <span>seat</span>
                    </div>
                    <div class="time">
                        <h2><%#Eval("start")%></h2>
                        <span>time</span>
                    </div>

                </div>
                <div class="card cardRight">
                    <div class="eye"></div>
                    <div class="number">
                        <h3><%#Eval("row")+""+Eval("number")%></h3>
                        <span>seat</span>
                    </div>
                    <div class="barcode"></div>
                </div>
            </div>
                </div>

        </ItemTemplate>
        <EmptyDataTemplate>
            <img class="img-responsive center-block noTicket" src="images/no%20tickets.jpg" />
        </EmptyDataTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cinemaDBConnectionString %>"
        SelectCommand="SELECT seat.row, seat.number, screening.start, movie.title FROM ticket
                        INNER JOIN seat ON ticket.seat_id = seat.seat_id
                        INNER JOIN screening ON ticket.screen_id = screening.screening_id 
                        INNER JOIN movie ON movie.movie_id = screening.movie_id
                        WHERE ticket.user_id = @userId ORDER BY start DESC;">
        <SelectParameters>
            <asp:SessionParameter Name="userId" SessionField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
