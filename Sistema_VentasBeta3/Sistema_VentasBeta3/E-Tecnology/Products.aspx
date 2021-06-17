<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Sistema_VentasBeta3.Pages.Producto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="error" runat="server" Text=""></asp:Label>
    <style>
        .card-body i{
            position: relative;
            left: -5px;
        }
    </style>
    <div class="container animated fadeInUp">
        <h1 class="mt-4 mb-3">
            Productos
        </h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><asp:LinkButton ID="Home" runat="server" OnClick="Home_Click" class="text-decoration-none">Inicio</asp:LinkButton></li>
            <li class="breadcrumb-item active">Productos</li>
            <div class="col align-self-end"></div>
            <asp:LinkButton ID="ir_carrito" runat="server" OnClick="ir_carrito_Click"><i class="fas fa-shopping-cart" style="color: black;"></i></asp:LinkButton>
        </ol>
        <div class="row">
            <div class="col-md-4">
                <div class="card mb-4 ">
                    <h5 class="card-header">Buscar</h5>
                    <div class="card-body">
                        <div class="input-group">
                            <asp:TextBox ID="busqueda_rapida" runat="server" class="form-control" placeholder="Nombre Producto"></asp:TextBox>
                            <asp:LinkButton ID="btn_buscar" runat="server" class="btn btn-dark" OnClick="btn_buscar_Click" style="position: relative; left: 10px;">Buscar</asp:LinkButton>
                            <span class="input-group-btn">
                            </span>
                        </div>
                    </div>
                </div>

                <div class="card my-4">
                    <h5 class="card-header">Categorias</h5>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="list-unstyled mb-0" style="position: relative; line-height: 50px; left: 25px; font-size: 18px;">
                                    <li><i class="fas fa-hdd" style="color: #0056B3;"></i><asp:LinkButton ID="btn_almacenamiento" runat="server" class="text-decoration-none" OnClick="btn_almacenamiento_Click">Almacenamiento</asp:LinkButton></li>
                                    <li><i class="fas fa-cogs" style="color: #0056B3;"></i><asp:LinkButton ID="btn_componentes" runat="server" class="text-decoration-none" OnClick="btn_componentes_Click">Componentes</asp:LinkButton></li>
                                    <li><i class="fas fa-fan" style="color: #0056B3;"></i><asp:LinkButton ID="btn_enframiento" runat="server" class="text-decoration-none" OnClick="btn_enframiento_Click">Enfriamiento</asp:LinkButton></li>
                                    <li><i class="fas fa-tv" style="color: #0056B3;"></i><asp:LinkButton ID="btn_monitores" runat="server" class="text-decoration-none" OnClick="btn_monitores_Click">Monitores</asp:LinkButton></li>
                                    <li><i class="fas fa-keyboard" style="color: #0056B3;"></i><asp:LinkButton ID="btn_perifericos" runat="server" class="text-decoration-none" OnClick="btn_perifericos_Click">Perifericos</asp:LinkButton></li>
                                    <li><i class="fas fa-network-wired" style="color: #0056B3;"></i><asp:LinkButton ID="btn_redes" runat="server" class="text-decoration-none" OnClick="btn_redes_Click">Redes</asp:LinkButton></li>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8" runat="server" id="contenedor_productos_repeter1">
                <div class="card mb-4">
                    <img src="../../assets/img/p1.png" alt="" class="card-img-top" style="width: 100%; height: 300px;">
                    <div class="card-body">
                        <h2 class="card-title"><strong>Intel Core i7</strong></h2>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nesciunt accusantium possimus, harum blanditiis expedita sapiente alias, cupiditate, iste recusandae corrupti sint ipsam veritatis esse libero. Hic dignissimos, autem suscipit?</p>
                        <asp:LinkButton ID="agregar_carrito" runat="server" class="btn btn-primary text-white"><i class="fas fa-shopping-cart"></i>Agregar al Carrito</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton3" runat="server" class="btn btn-primary text-white"><i class="fas fa-plus-circle"></i>Más Detalles</asp:LinkButton>
                    </div>
                </div>

                <div class="card mb-4">
                    <img src="../../assets/img/p2.png" alt="" class="card-img-top" style="width: 100%; height: 300px;">
                    <div class="card-body">
                        <h2 class="card-title"><strong>GTX 2080 ti</strong></h2>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nesciunt accusantium possimus, harum blanditiis expedita sapiente alias, cupiditate, iste recusandae corrupti sint ipsam veritatis esse libero. Hic dignissimos, autem suscipit?</p>
                        <asp:LinkButton ID="LinkButton4" runat="server" class="btn btn-primary text-white"><i class="fas fa-shopping-cart"></i>Agregar al Carrito</asp:LinkButton>
                        <a href="" class="btn btn-primary text-white"><i class="fas fa-plus-circle"></i>Más Detalles</a>
                    </div>
                </div>

                <div class="card mb-4">
                    <img src="../../assets/img/p3.png" alt="" class="card-img-top" style="width: 100%; height: 300px;">
                    <div class="card-body">
                        <h2 class="card-title"><strong>Monitor AOC Gaming</strong></h2>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nesciunt accusantium possimus, harum blanditiis expedita sapiente alias, cupiditate, iste recusandae corrupti sint ipsam veritatis esse libero. Hic dignissimos, autem suscipit?</p>
                        <asp:LinkButton ID="LinkButton5" runat="server" class="btn btn-primary text-white"><i class="fas fa-shopping-cart"></i>Agregar al Carrito</asp:LinkButton>
                        <a href="" class="btn btn-primary text-white"><i class="fas fa-plus-circle"></i>Más Detalles</a>
                    </div>
                </div>
            </div>

            <div class="col-md-8" runat="server" id="contenedor_productos_repeter2">
                <header class="jumbotron" runat="server" id="Validar_producto">
                    <h3>E-Tecnology Products</h3>
                    <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa, ipsam, eligendi, in quo sunt possimus non incidunt odit vero aliquid similique quaerat nam nobis illo aspernatur vitae fugiat numquam repellat.</p>
                    <div class="d-flex">
                        <asp:LinkButton ID="seguri_comprando" runat="server" class="btn btn-dark" OnClick="Home_Click">Seguir Comprando</asp:LinkButton>
                    </div>
                </header>

                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                            <div class="card mb-4">
                                <img src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"imagenProducto")) %>" alt="" class="card-img-top" style="width: 100%; height: 300px;">
                                <div class="card-body">
                                    <h2 class="card-title"><strong><%#Eval("nombreProducto")%></strong></h2>
                                    <h3>Precio: <%#Eval("precio")%></h3>
                                    <p class="card-text"><%#Eval("descripcionProducto")%></p>
                                    <asp:LinkButton ID="agregar_carrito" runat="server" class="btn btn-primary text-white" OnClick="agregar_carrito_Click" CommandArgument='<%#Eval("idProducto") %>' CommandName="Click"><i class="fas fa-shopping-cart"></i>Agregar al Carrito</asp:LinkButton>
                                    <asp:LinkButton ID="more_details" class="btn btn-primary text-white" runat="server" CommandArgument='<%#Eval("idProducto") %>' CommandName="Click" OnClick="more_details_Click"><i class="fas fa-plus-circle"></i>Más Detalles</asp:LinkButton>
                                </div>
                            </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
