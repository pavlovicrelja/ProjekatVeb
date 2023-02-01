<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalji.aspx.cs" Inherits="Projekat.Admin.Detalji" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <link href="Style/DetaljiSheet.css" rel="stylesheet" />

    <h1>INFORMACIJE NEWSLETTER</h1>

    <asp:GridView ID="GridView1" runat="server" CssClass="table" EmptyDataText="NO DATA" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"></asp:GridView>


    <asp:Button ID="Button1" runat="server" Text="OBRISI SA LISTE" CssClass="btn btn-danger" OnClick="Button1_Click"/>

    <asp:Label ID="Label1" runat="server" Text="" Font-Bold="true" ForeColor="Green"></asp:Label>

    <h2>INFORMACIJE O PORUDZBINAMA</h2>

    <asp:GridView ID="GridView2" runat="server" CssClass="table" EmptyDataText="NO DATA"></asp:GridView>

</asp:Content>
