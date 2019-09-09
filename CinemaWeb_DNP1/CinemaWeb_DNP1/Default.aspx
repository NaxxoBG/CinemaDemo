<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CinemaWeb_DNP1.MainPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/mainPage.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Carousel with repeater-->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <asp:Repeater ID="Repeater1" DataSourceID="ImageSource" runat="server">
                <ItemTemplate>
                    <div class="item <%# (Container.ItemIndex == 0 ? "active" : "") %>">
                        <img class="d-block img-fluid" src="https://image.tmdb.org/t/p/original/<%# Eval("backdrop")%>">
                        <div class="carousel-caption">
                            <h1><%#Eval("title")%></h1>
                            <p class="hiddenOnMobile"><%#Eval("overview") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="ImageSource" runat="server" ConnectionString="<%$ConnectionStrings:cinemaDBConnectionString %>"
                SelectCommand="SELECT TOP 3 title, backdrop, overview FROM movie WHERE movie_id IN (SELECT DISTINCT movie_id FROM screening WHERE start &gt; GetDate());"></asp:SqlDataSource>
        </div>
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">Previous</span></a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><span class="sr-only">Next</span></a>
    </div>

    <br />

    <!-- FILTERS -->
    <div class="row">
        <div id="filter-panel" class="filter-panel filter_panel_edit">
            <div class="panel panel-default filter-panel">
                <div class="panel-body filter-form">
                    <!--Genre-->
                    <div class="form-group col-md-4">
                        <div class="row">
                            <div class="col-xs-8">
                                <label class="filter-col" style="margin-right: 0;">Genre:</label>
                                <asp:DropDownList class="form-control filter-box" ID="Genre" runat="server">
                                    <asp:ListItem Text="All" Value="%"></asp:ListItem>
                                    <asp:ListItem Text="Adventure" Value="%Adventure%"></asp:ListItem>
                                    <asp:ListItem Text="Action" Value="%Action%"></asp:ListItem>
                                    <asp:ListItem Text="Comedy" Value="%Comedy%"></asp:ListItem>
                                    <asp:ListItem Text="Crime" Value="%Crime%"></asp:ListItem>
                                    <asp:ListItem Text="Drama" Value="%Drama%"></asp:ListItem>
                                    <asp:ListItem Text="Fantasy" Value="%Fantasy%"></asp:ListItem>
                                    <asp:ListItem Text="Horror" Value="%Horror%"></asp:ListItem>
                                    <asp:ListItem Text="Romance" Value="%Romance%"></asp:ListItem>
                                    <asp:ListItem Text="Sci-Fi" Value="%science fiction%"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-xs-4">
                                <label class="filter-col" style="margin-top: 30px;" for="pref-search">
                                    <asp:CheckBox ID="Children" runat="server" />
                                    Children
                                </label>
                            </div>
                        </div>
                    </div>

                    <!--Date-->
                    <div class="calendar col-sm-4 col-md-3">
                        <label class="filter-col" style="margin-right: 0;" for="pref-orderby">From:</label>
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:TextBox class="form-control filter-box txtBoxBg" ID="Date1" runat="server"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender" TargetControlID="Date1" PopupButtonID="Date1" runat="server" />
                    </div>

                    <!-- Order by -->
                    <div class="form-group col-sm-4 col-md-3">
                        <label class="filter-col" style="margin-right: 0;" for="pref-orderby">Order by:</label>
                        <asp:DropDownList class="form-control filter-box" ID="DropDownList2" runat="server">
                            <asp:ListItem Text="Most popular"></asp:ListItem>
                            <asp:ListItem Text="Newest"></asp:ListItem>
                            <asp:ListItem Text="Oldest"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group  col-sm-4 col-md-2">
                        <label class="filter-col" style="margin-right: 0;" for="pref-orderby">Filter:</label>
                        <asp:Button class="btn form-control" ID="Button1" runat="server" Text="Filter" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /FILTER -->
    <!-- LIST VIEW -->
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" PageSize="3" DataKeyNames="movie_id">
        <LayoutTemplate>
            <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
            <br />
            <div class="data-pager">
                <asp:DataPager ID="DataPager1" PageSize="3" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" />
                        <asp:NumericPagerField ButtonType="Link" />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>


        <ItemTemplate>
            <div class="card">
                <div class="row">
                    <div class="preview col-sm-4">
                        <img class=" img-rounded img-responsive " src="https://image.tmdb.org/t/p/original<%#Eval("poster") %>" />
                    </div>
                    <div class="details col-md-8">
                        <div class="details">
                            <h3 class="product-title"><%#Eval("title") %></h3>
                            <h4 class="bold-orange"><%#Eval("genre") %></h4>
                            <p class="product-description"><%#Eval("overview") %></p>
                            <h4 class="bold-orange"></h4>
                            <asp:Label ID="Label1" Visible="false" runat="server" Text='<%#Eval("movie_id") %>'></asp:Label>
                            <asp:ListView ID="ScreeningList" DataSourceID="SqlDataSource2" runat="server">
                                <LayoutTemplate>
                                    <table class="table-screening" id="itemPlaceholderContainer" runat="server" border="1">
                                        <tr runat="server">
                                            <th>Date</th>
                                            <th>Time</th>
                                            <th>Buy</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server"></tr>
                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="screening_idLabel" runat="server" Text='<%# Eval("start","{0:d}") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="movie_idLabel" runat="server" Text='<%# Eval("start","{0:t}") %>' />
                                        </td>
                                        <td>
                                            <asp:Button ID="Button2" class="btn" runat="server" CommandArgument='<%# Eval("screening_id") %>' OnClick="ReserveSeat" Text="BUY" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <div class="action">
                                <asp:Button class="btn" ID="Button3" runat="server" Text="See details" OnClick="SeeDetails" CommandArgument='<%# Eval("movie_id") %>' Style="margin-top: 20px;" />
                            </div>
                        </div>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cinemaDBConnectionString %>"
                        SelectCommand="SELECT * FROM screening WHERE movie_id = @movieId AND start >= @date">
                        <SelectParameters>
                            <asp:ControlParameter Name="movieId" ControlID="Label1" PropertyName="Text" />
                            <asp:ControlParameter Name="date" ControlID="Date1" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </ItemTemplate>

        <EmptyDataTemplate>
            <h3 class="empty">NO SCREENINGS...</h3>
        </EmptyDataTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cinemaDBConnectionString %>"
        SelectCommand="SELECT * FROM movie WHERE movie.movie_id in (SELECT DISTINCT movie_id FROM screening WHERE start >= @date) AND genre LIKE @genre;">
        <SelectParameters>
            <asp:ControlParameter Name="genre" ControlID="Genre" PropertyName="SelectedValue" />
            <asp:ControlParameter Name="date" ControlID="Date1" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br/>
</asp:Content>
