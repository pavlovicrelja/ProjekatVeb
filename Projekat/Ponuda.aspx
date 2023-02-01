<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ponuda.aspx.cs" Inherits="Projekat.Ponuda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Style/PonudaSheet.css" rel="stylesheet" />

    <asp:Panel ID="Panel2" runat="server" CssClass="cene d-flex justify-content-around">

            <asp:Panel ID="Panel1" runat="server" CssClass="form-group kartica">
                <asp:Label ID="NaslovDizajnSajta" runat="server" Text="DIZAJN SAJTA" CssClass="naslov"></asp:Label>
            <p class="opis">
                ✔DIZAJN CELOG SAJTA<br />
                ✔VARIJACIJE SVAKE STRANICE<br />
                ✔VISE KOPIJA I RAZLICITIH DIZAJNOVA VASEG SAJTA
            </p>
            <p class="cenaText">800€</p>
                <asp:Button ID="DizajnDugme" runat="server" Text="Kontaktirajte nas" CssClass="btn btn-primary" OnClick="DizajnDugme_Click"/>
        </asp:Panel>

        <asp:Panel ID="Panel3" runat="server" CssClass="kartica form-group">
            <asp:Label ID="NaslovIzradaSajta" runat="server" Text="IZRADA VEB SAJTA" CssClass="naslov"></asp:Label>
            <p class="opis">
                ✔VAS DIZAJN<br />
                ✔IZRADA VASEG SAJTA U ODNOSU NA VAS DIZAJN<br />
                ✔FULL RESPONSIVE<br />
                ✔ANIMACIJE PO ZELJI
            </p>
            <p class="cenaText">1000€</p>
            <asp:Button ID="SajtDugme" runat="server" Text="Kontaktirajte nas" CssClass="btn btn-primary" OnClick="SajtDugme_Click" />
        </asp:Panel>

            <asp:Panel ID="Panel5" runat="server" CssClass="kartica form-group">
                <asp:Label ID="NaslovFullStack" runat="server" Text="FULL-STACK" CssClass="naslov"></asp:Label>
                <p class="opis">
                    ✔DIZAJN CELOG SAJTA<br />
                    ✔VISE OPCIJA SVAKE STRANICE<br />
                    ✔IZDRADA FULL RESPONSIVE SAJTA<br />
                    ✔ANIMACIJE NA SAJTU
                </p>
                <p class="cenaText">1500€</p>
                <asp:Button ID="FullStackDugme" runat="server" Text="Kontaktirajte nas" CssClass="btn btn-primary" OnClick="FullStackDugme_Click" />
            </asp:Panel>

    </asp:Panel>

    <div class="linija"></div>

    <asp:Panel ID="projekatPodatci" runat="server" CssClass="container projekatPodatci">
        <h3>Kontaktirajte nas u vezi projekta</h3>
        <br />
        <asp:Panel ID="NaslovSekcija" runat="server" CssClass="container">
            <asp:Label ID="LabelaNaslov" runat="server" Text="Naslov:" Font-Bold="true"></asp:Label>
            <asp:TextBox ID="NaslovProjekta" runat="server" ReadOnly="true" CssClass="form-control centar"></asp:TextBox>
        </asp:Panel>
        <br />
        <asp:Panel ID="ImeKompanijePodatci" runat="server" CssClass="container">
            <asp:Label ID="LabelImeKompanije" runat="server" Text="Ime kompanije: " Font-Bold="true"></asp:Label>
            <asp:TextBox ID="ImeKompanijeTekst" runat="server" CssClass="form-control centar" placeholder="Youtube"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="MORATE UNETI IME KOMPANIJE!" ControlToValidate="ImeKompanijeTekst" EnableClientScript="false" ForeColor="Red" Font-Bold="true" Display="None"></asp:RequiredFieldValidator>
        </asp:Panel>
        <br />
        <asp:Panel ID="EmailPodatci" runat="server" CssClass="container">
            <asp:Label ID="LabelEmail" runat="server" Text="Email: " Font-Bold="true"></asp:Label>
            <asp:TextBox ID="EmailTekst" runat="server" CssClass="form-control centar" placeholder="primer@gmail.com"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="MORATE UNETI EMAIL!" ControlToValidate="EmailTekst" EnableClientScript="false" ForeColor="Red" Font-Bold="true" Display="None"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="MORATE UNETI EMAIL U DOBROM FORMATU!" ControlToValidate="EmailTekst" EnableClientScript="false" ForeColor="Red" Font-Bold="true" Display="None" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-]+)(\.[a-zA-Z]{2,5}){1,2}$"></asp:RegularExpressionValidator>
        </asp:Panel>
        <br />
        <asp:Panel ID="DetaljiOProjektu" runat="server" CssClass="container">
            <asp:Label ID="LabelDetalji" runat="server" Text="Detalji o projektu:" Font-Bold="true"></asp:Label>
            <asp:TextBox ID="DetaljiTekst" runat="server" CssClass="form-control centar" placeholder="Sta vas zanima iz ponude"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="MORATE UNETI DETALJE" ControlToValidate="DetaljiTekst" EnableClientScript="false" ForeColor="Red" Font-Bold="true" Display="None"></asp:RequiredFieldValidator>
        </asp:Panel>
        <br />
        <asp:Panel ID="DugmeDeo" runat="server" CssClass="container">
            <asp:Button ID="PosaljiDetalje" runat="server" Text="Posalji detalje" CssClass="btn btn-success" OnClick="PosaljiDetalje_Click1" />
            <br />
            <asp:Label ID="Label1" runat="server" Text="" ForeColor="Green" Font-Bold="true"></asp:Label>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="BulletList" HeaderText="INPUT ERROR:" ForeColor="Red" Font-Bold="true"/>
        </asp:Panel>


    </asp:Panel>
</asp:Content>
