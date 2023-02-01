<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Testimonials.aspx.cs" Inherits="Projekat.Testimonials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <link href="Style/TestimonialsSheet.css" rel="stylesheet" />

    <h1>OCENE NASIH KLIJENATA</h1>

    <asp:Panel ID="Panel1" runat="server" CssClass="form-group container">
        <asp:GridView ID="GridView1" runat="server" CssClass="table" EmptyDataText="NO DATA"></asp:GridView>
        <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
    </asp:Panel>


    <h2>OSTAVITE VASU OCENU NA NASE USLUGE</h2>
    <asp:Panel ID="Panel2" runat="server" CssClass="form-group container">
        <asp:Label ID="Label2" runat="server" Text="Ime:"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Relja Pavlovic"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="MORATE UNETI IME!" ControlToValidate="TextBox1" EnableClientScript="false" ForeColor="Red" Font-Bold="true" Display="None"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Komentar:"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="Napisite vas komentar na nase usluge"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="MORATE UNETI KOMENTAR!" ControlToValidate="TextBox3" EnableClientScript="false" ForeColor="Red" Font-Bold="true" Display="None"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Ocena:"></asp:Label><br />
        <asp:TextBox ID="TextBox2" runat="server" placeholder="1-10" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="MORATE UNETI OCENU" ControlToValidate="TextBox2" EnableClientScript="false" ForeColor="Red" Font-Bold="true" Display="None"></asp:RequiredFieldValidator>

        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Ostavite ocenu" CssClass="btn btn-primary" OnClick="Button1_Click" />
        <br />
        <asp:Label ID="Label5" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" DisplayMode="BulletList" HeaderText="INPUT ERROR:" />
    </asp:Panel>
</asp:Content>
