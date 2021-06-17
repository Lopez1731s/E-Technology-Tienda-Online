<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Sistema_VentasBeta3.Pages.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container animated fadeIn">
        <h1>Contacto</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><asp:LinkButton ID="Inicio" runat="server" OnClick="Inicio_Click" class="text-decoration-none">Inicio</asp:LinkButton></li>
            <li class="breadcrumb-item active">Contacto</li>
        </ol>
    </div>
    <br />
    <div class="container">
        <h4>Ubicación</h4>
        <iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d8085069.145948731!2d-96.76140183829065!3d38.24792821768069!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses!2ssv!4v1588012352990!5m2!1ses!2ssv" width="1120"; height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
    </div>
    <br />
    <br />

    <div class="container animated fadeInUp">
        <div class="row">
            <div class="col-lg-8 mb-4">
                <h3>Escribe un Mensaje</h3>
                <label>Nombre Completo</label>
                <asp:TextBox runat="server" class="form-control" style="margin-bottom: 1rem;"></asp:TextBox>
                <label>Numero de celular</label>
                <asp:TextBox runat="server" class="form-control" style="margin-bottom: 1rem;"></asp:TextBox>
                <label>Correo</label>
                <asp:TextBox runat="server" class="form-control" style="margin-bottom: 1rem;"></asp:TextBox>
                <label>Mensaje</label>
                <textarea rows="10" cols="100" class="form-control" maxlength="999" style="resize:none" aria-invalid="false"></textarea>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Enviar Mensaje" class="btn btn-dark" />
            </div>
            <div class="col-lg-4 mb-4">
                <h4>Detalles Contacto</h4>
                <p>Dirección: Lorem Itsum Av 513</p>
                <p>Numero de Contacto: (503) 2553-6462</p>
                <p>Correo de Contacto: E-Tecnology@example.com</p>
                <p>Horario: 7:00am - 4:00pm</p>
            </div>
        </div>
    </div>
</asp:Content>
