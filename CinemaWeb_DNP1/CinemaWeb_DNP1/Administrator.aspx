<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Administrator.aspx.cs" Inherits="CinemaWeb_DNP1.Administrator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/MovieManager.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container row" style="padding-bottom: 35em">


            <div class="form-inline filter-box row">
                <span class="col-xs-4"></span>    
                <asp:TextBox CssClass="center-block col-xs-2 padding-fix" ID="searchBox" runat="server"></asp:TextBox>
                    <span class="col-xs-1"></span>
                    <asp:Button ID="searchBtn" runat="server" Text="Search" OnClick="Button1_Click" CssClass="btn padding-fix col-xs-1" />
                    <asp:Label ID="addResult" runat="server" class="padding-fix col-xs-3"></asp:Label>
            </div>

        <div class="table-responsive col padding-fix">
            <asp:GridView ID="GridView1" class="col" runat="server" DataSource='<%# GetData() %>' AutoGenerateColumns="false" BorderWidth="1px" BackColor="White" CellPadding="3" Font-Names="Arial" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                <FooterStyle ForeColor="#000066" BackColor="White"></FooterStyle>
                <PagerStyle ForeColor="#000066" HorizontalAlign="Left"
                    BackColor="White"></PagerStyle>
                <HeaderStyle ForeColor="White" Font-Bold="True"
                    BackColor="#006699"></HeaderStyle>
                <Columns>
                    <asp:ButtonField CommandName="Select" Text="Save" ControlStyle-BorderStyle="Outset" ItemStyle-BorderColor="Black" />
                    <asp:BoundField HeaderText="Information" DataField="Information">
                        <ItemStyle BackColor="Gray" BorderStyle="Ridge" BorderColor="Black" />
                    </asp:BoundField>
                    <asp:ImageField HeaderText="Poster" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" DataImageUrlField="Poster" ControlStyle-Height="400px" ControlStyle-Width="280px" AlternateText="No image, sorry :("></asp:ImageField>
                </Columns>
                <SelectedRowStyle ForeColor="White" Font-Bold="True"
                    BackColor="#669999"></SelectedRowStyle>
                <RowStyle ForeColor="#000066"></RowStyle>
            </asp:GridView>
        </div>
        <br />
        <p>
            <asp:Label ID="resLabel" runat="server" Text="Label"></asp:Label>
        </p>
    </div>
</asp:Content>
