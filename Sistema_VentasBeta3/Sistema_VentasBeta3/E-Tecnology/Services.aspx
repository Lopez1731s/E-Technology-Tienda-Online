<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="Sistema_VentasBeta3.Pages.Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container animated fadeInUp">
        <br />
        <h1>Servicios</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><asp:LinkButton ID="Inicio" runat="server" OnClick="Inicio_Click" class="text-decoration-none">Inicio</asp:LinkButton></li>
            <li class="breadcrumb-item active">Servicios</li>
        </ol>
        <header class="jumbotron my-4">
            <h1 class="display-4">E-Tecnology Services</h1>
            <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa, ipsam, eligendi, in quo sunt possimus non incidunt odit vero aliquid similique quaerat nam nobis illo aspernatur vitae fugiat numquam repellat.</p>
        </header>
        <br />
        <div class="row">
            <div class="col-lg-4 mb-4">
                <div class="card h-100">
                    <h4 class="card-header">Limpieza de Equipo</h4>
                    <div class="card-body">
                        <h5 class="display-4">$20.00</h5>
                        <div class="font-italic">Incluye</div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Lorem ipsum dolor sit amet</li>
                            <li class="list-group-item">Etiam diam ipsum, luctus sit amet purus non</li>
                            <li class="list-group-item">Pellentesque eget porta justo.</li>
                        </ul>
                    </div>
                    <div class="card-footer">
                        <asp:LinkButton ID="Info1" runat="server" class="btn btn-dark">Mas Información</asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card h-100">
                    <h4 class="card-header">Ensamblaje</h4>
                    <div class="card-body">
                        <h5 class="display-4">$50.00</h5>
                        <div class="font-italic">Incluye</div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Lorem ipsum dolor sit amet</li>
                            <li class="list-group-item">Etiam diam ipsum, luctus sit amet purus non</li>
                            <li class="list-group-item">Pellentesque eget porta justo.</li>
                        </ul>
                    </div>
                    <div class="card-footer">
                        <asp:LinkButton ID="Info2" runat="server" class="btn btn-dark">Mas Información</asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card h-100">
                    <h4 class="card-header">Mantenimiento Laptops</h4>
                    <div class="card-body">
                        <h5 class="display-4">$15.00</h5>
                        <div class="font-italic">Incluye</div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Lorem ipsum dolor sit amet</li>
                            <li class="list-group-item">Etiam diam ipsum, luctus sit amet purus non</li>
                            <li class="list-group-item">Pellentesque eget porta justo.</li>
                        </ul>
                    </div>
                    <div class="card-footer">
                        <asp:LinkButton ID="Info3" runat="server" class="btn btn-dark">Mas Información</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
