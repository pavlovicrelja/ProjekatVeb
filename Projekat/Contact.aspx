<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Projekat.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Style/ContactSheet.css" rel="stylesheet" />
    <h2>Kontaktirajte nas</h2>
    <address class="adresa">
        Prvomajska, Zemun<br />
        Beograd 11080<br />
        <abbr title="Phone">Phone:</abbr>
        066/5432191
    </address>

    <address>
        <strong>Manager:</strong>   <a href="mailto:relja@gmail.com">relja@gmail.com</a><br />
        <strong>Marketing team:</strong> <a href="mailto:reljamarketing@gmail.com">reljamarketing@gmail.com</a>
    </address>
</asp:Content>
