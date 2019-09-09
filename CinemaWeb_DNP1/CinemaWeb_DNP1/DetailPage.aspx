<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetailPage.aspx.cs" Inherits="CinemaWeb_DNP1.DetailPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="galleryCssJs/jquery.bsPhotoGallery.css" rel="stylesheet" />
    <link href="css/detailPage.css" rel="stylesheet" />

    <script src="js/jquery-3.2.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="galleryCssJs/jquery.bsPhotoGallery.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('ul.first').bsPhotoGallery({
                "classes": "col-lg-3 col-sm-4 col-xs-6 col-xxs-12",
                "hasModal": true,
                "fullHeight": true
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--    Info card--%>
    <div class="card">
        <div class="row">
            <div class="preview col-sm-4">
                <img class=" img-rounded img-responsive " src="https://image.tmdb.org/t/p/original<%:movie.poster %>" />
            </div>
            <div class="details col-md-8">
                <div class="details">
                    <h3 class="product-title"><%:movie.title %></h3>
                    <h4 class="bold-orange"><%:movie.genre %></h4>
                    <p class="product-description"><%:movie.overview %></p>
                    
                    <%
                        foreach(string cast in movie.cast.Split(','))
                        {
                            %>
                    <%:cast %><br/>

                    <%
                        }
                    %>
                    <br />
                    <p class="product-description">Budget: <%:movie.budget %> $$$ </p>
                    <h4 class="bold-orange">Ratinng: <%:movie.vote_average %> / 10</h4>
                    <h4 class="bold-orange">Duration: <%:movie.duration%> minutes</h4>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />

    <%--    Image Gallery--%>
    <ul class="row first fullHeight" data-bsp-ul-id="bsp-ND0n" data-bsp-ul-index="0">
        <asp:Repeater ID="RepeaterGallery" runat="server">
            <ItemTemplate>
                <li>
                    <div class="imgWrapper">
                        <img src="https://image.tmdb.org/t/p/w780<%# Container.DataItem %>" class="img">
                    </div>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>

    <div class="modal fade" id="bsPhotoGalleryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-body">
                </div>
            </div>
        </div>
    </div>

    <br />
    <br />

    <%--    Youtube video--%>
    <div class="row">
        <div class="embed-responsive embed-responsive-16by9">
            <iframe runat="server" id="iFrame" frameborder="0" class="col-xs-12 embed-responsive-item"></iframe>
        </div>
    </div>


</asp:Content>
