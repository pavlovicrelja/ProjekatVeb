<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Projekat._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Style/PocetnaSheet.css" rel="stylesheet" />


    <div class="jumbotron">
        <h1>Relja Pavlovic</h1>
        <p class="lead">Izrada sajtova za vasu kompaniju</p>
        <p><a href="Ponuda.aspx" class="btn btn-primary btn-lg">Saznajte vise &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>DIZAJN SAJTA</h2>
            <p>
                Ako vam je potreban dizajn za vas sajt dosli ste na pravo mesto. Uz izradu sajtova i odrzavanja istih, radimo i dizajn sajtova
                uz vas i vase ideje.
            </p>
            <p>
                <a class="btn btn-primary" href="Ponuda.aspx">Saznajte vise o izradi dizajna &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>SAJT</h2>
            <p>
                Ako imate vas dizajn i spremni ste da krenete sa izradom sajta koji ce biti odrzavan na pravom ste mestu. 
                Klikom na dugme saznajte cenu izrade sajta.
            </p>
            <p>
                <a class="btn btn-primary" href="Ponuda.aspx">Saznajte cene izrada sajtova &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>FULL-STACK</h2>
            <p>
                Zelite izradu i dizajna i sajta u istom paketu! Proverite klikom na dugme sta sve spada u ovaj paket!
            </p>
            <p>
                <a class="btn btn-primary" href="Ponuda.aspx">Saznaj vise &raquo;</a>
            </p>
        </div>
    </div>

    <div class="container newsletter">
        <h3>PRIJAVITE SE DA DOBIJATE OBAVESTENJA O POPUSTIMA I NOVIM PONUDAMA</h3>
        <br />
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Ime i prezime:" Font-Bold="true"></asp:Label>
            <asp:TextBox ID="ImeTekst" runat="server" CssClass="form-control centriraj" placeholder="Relja Pavlovic"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="MORATE UNETI IME!" ControlToValidate="ImeTekst" EnableClientScript="false" ForeColor="Red" Font-Bold="true" Display="None"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Email:" Font-Bold="true"></asp:Label>
            <asp:TextBox ID="EmailTekst" runat="server" CssClass="form-control centriraj" placeholder="primer@gmail.com"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="MORATE UNETI EMAIL!" ControlToValidate="EmailTekst" EnableClientScript="false" ForeColor="Red" Font-Bold="true" Display="None"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="MORATE UNETI EMAIL U PRAVOM FORMATU!" ControlToValidate="EmailTekst" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-]+)(\.[a-zA-Z]{2,5}){1,2}$" EnableClientScript="false" ForeColor="Red" Font-Bold="true" Display="None"></asp:RegularExpressionValidator>
        </div>

        <asp:Button ID="Button1" runat="server" Text="PRIJAVI SE"  CssClass="btn btn-success" OnClick="Button1_Click"/>
        <asp:Label ID="UspesnoUpisanoLabel" runat="server" Text="" Font-Bold="true" ForeColor="Green"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="BulletList" HeaderText="INPUT ERROR:" ForeColor="Red" Font-Bold="true"/>
        <br />
        <asp:Label ID="Label3" runat="server" Text="" Font-Bold="true" ForeColor="Green"></asp:Label>
    </div>
    

</asp:Content>
