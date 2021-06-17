<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Session_Validation.aspx.cs" Inherits="Sistema_VentasBeta3.Pages.Session_Validation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body{
            background: url("../assets/img/validacion.png") center top no-repeat fixed;
        }
    </style>
    <body>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="container animated fadeInUp">
            <div class="row">
                <div class="col-md-5">
                    <h2>E-Tecnology</h2>
                        <p class="mb-0">Para agreagar productos a nuestro carrito de compras necesitas tener una cuenta E-Tecnology.</p>
                        <br />
                        <p class="mb-0">Registrate si aun no tienes una cuenta o inicia sesión para seguir haciendo compras.</p>
                    <br />
                <div class="col-12 d-flex">
                    <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-dark" OnClick="LinkButton1_Click">Iniciar Sesión</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" class="btn btn-dark" style="left: 1em; position:relative;" OnClick="LinkButton2_Click">Registrarse</asp:LinkButton>
                </div>
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

        </div>
    </body>
</asp:Content>
