<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminScreenings.aspx.cs" Inherits="CinemaWeb_DNP1.Screenings" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/AdminScreenings.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>

    <div class="row selector">
        <asp:DropDownList CssClass="center-block text-center" runat="server" ID="selector" AutoPostBack="True" OnSelectedIndexChanged="onChange">
        </asp:DropDownList>
    </div>

    <div runat="server" id="hideVariable">
        <div class="card">
            <div class="row">
                <div class="preview col-sm-4">
                    <img class=" img-rounded img-responsive " src="https://image.tmdb.org/t/p/w500/<%:selectedMovie.poster%>" />
                </div>
                <div class="details col-md-8">
                    <div class="details">
                        <h3 class="product-title"><%:selectedMovie.title %></h3>
                        <h4 class="bold-orange"><%:selectedMovie.genre %></h4>
                        <p class="product-description"><%:selectedMovie.overview %></p>
                        <h4 class="bold-orange"></h4>



                        <asp:Repeater runat="server" ID="screeningRepeater">
                            <HeaderTemplate>
                                <table class="table-screening" id="itemPlaceholderContainer" border="1">
                                    <tr>
                                        <th>Date</th>
                                        <th>Time</th>
                                        <th>Cancel</th>
                                    </tr>
                            </HeaderTemplate>

                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%# Eval("start","{0:d}") %>
                                    </td>
                                    <td>
                                        <%# Eval("start","{0:t}") %>
                                    </td>
                                    <td>
                                        <asp:Button ID="baab" class="btn" runat="server" CommandArgument='<%# Eval("screening_id") %>' OnClick="RemoveScreening" Text="cancel" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                         <tr>
                                    <td>
                                        <div class="calendar">
                                            <asp:TextBox class="form-control filter-box txtBoxBg" ID="date" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="calendaris" TargetControlID="date" PopupButtonID="date" runat="server" />
                                        </div>
                                    </td>
                                    <td><asp:TextBox class="form-control filter-box txtBoxBg" ID="time" runat="server"></asp:TextBox>
                                    </td>
                                    <td><asp:Button class="btn" runat="server" CommandArgument='<%#selectedMovie.movie_id%>' OnClick="AddScreening" Text="ADD" />
                                    </td>
                                </tr>
                                </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </br></br>


</asp:Content>
