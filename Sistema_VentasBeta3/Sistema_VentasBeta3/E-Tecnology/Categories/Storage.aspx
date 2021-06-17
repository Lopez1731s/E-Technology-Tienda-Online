
<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Storage.aspx.cs" Inherits="Sistema_VentasBeta3.E_Tecnology.Categories.Storage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />

    <asp:Label ID="id_producto" runat="server" Text=""></asp:Label>
    <asp:Label ID="error" runat="server" Text=""></asp:Label>
    <div class="container animated fadeInUp">
        <h2>Almacenamiento</h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><asp:LinkButton ID="inicio" runat="server" class="text-decoration-none" OnClick="inicio_Click">Inicio</asp:LinkButton></li>
            <li class="breadcrumb-item"><asp:LinkButton ID="productos_back" runat="server" class="text-decoration-none" OnClick="productos_back_Click">Productos</asp:LinkButton></li>
            <li class="breadcrumb-item active">Almacenamiento</li>
            <div class="col align-self-end"></div>
            <asp:LinkButton ID="ir_carrito" OnClick="ir_carrito_Click" runat="server"><i class="fas fa-shopping-cart" style="color: black;"></i></asp:LinkButton>
        </ol>

        <div class="row">
            <div class="btn-group col-lg-2" style="position: relative; height: 2rem;">
                <button class="btn d-flex rounded" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <h5 class="font-weight-normal"><span style="position: absolute; left: 10px; top: 2px;">Categorias</span></h5>
                    <i class="fas fa-sort-down" style="position: relative; left: 8rem; top: -3px;"></i>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <div class="nav-pills list-group" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="dropdown-item nav-link active" id="v-pills-ssd-tab" data-toggle="pill" href="#v-pills-ssd" role="tab" aria-controls="v-pills-ssd" aria-selected="false">SSD</a>
						<a class="dropdown-item nav-link" id="v-pills-disco_d-tab" data-toggle="pill" href="#v-pills-disco_d" role="tab" aria-controls="v-pills-disco_d" aria-selected="true">Discos Duros</a>
						<a class="dropdown-item nav-link" id="v-pills-disco_e-tab" data-toggle="pill" href="#v-pills-disco_e" role="tab" aria-controls="v-pills-disco_e" aria-selected="false">Discos Extraibles</a>
						<a class="dropdown-item nav-link" id="v-pills-m2-tab" data-toggle="pill" href="#v-pills-m2" role="tab" aria-controls="v-pills-m2" aria-selected="false">M.2</a>
                    </div>

                </div>
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="tab-content" id="v-pills-tabContent">
				<div class="tab-pane fade show active" id="v-pills-ssd" role="tabpanel" aria-labelledby="v-pills-ssd-tab">
                    <div class="row">
                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                            <ItemTemplate>
                                <div class="col-md-4">
							        <div class="card">
                                        <img src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"imagenProducto")) %>" alt="Card image cap" class="card-img-top" style="position: relative; height: 225px !important; width: 350px !important;">
							            <div class="card-body">
								            <h5 class="card-title border-bottom pb-3"><%#Eval("nombreProducto")%> </h5>
								            <div class="overflow-auto">
                                                <h4>Precio: $<%#Eval("precio")%></h4>
									            <p class="card-text" style="position: relative; height: 8rem;"><%#Eval("descripcionProducto")%></p>
								            </div>
                                            <asp:LinkButton ID="agregar_carrito" OnClick="agregar_carrito_Click" CommandArgument='<%#Eval("idProducto") %>' runat="server" class="btn btn-dark float-left"><i class="fas fa-shopping-cart"></i></asp:LinkButton>
                                            <asp:LinkButton ID="btn" runat="server" CommandArgument='<%#Eval("idProducto") %>' CommandName="Click" class="btn btn-dark float-right" OnClick="ver_detalles_Click">Mas detalles <i class="fas fa-angle-double-right"></i></asp:LinkButton>
							            </div>
							        </div>
                                <br />
						        </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
				</div>

                <div class="tab-pane fade" id="v-pills-disco_d" role="tabpanel" aria-labelledby="v-pills-disco_d-tab">
					<div class="row">
                        <asp:Repeater ID="Repeater2" runat="server">
                            <ItemTemplate>
                                <div class="col-md-4">
							        <div class="card">
                                        <img src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"imagenProducto")) %>" alt="Card image cap" class="card-img-top" style="position: relative; height: 225px !important; width: 350px !important;">
							            <div class="card-body">
								            <h5 class="card-title border-bottom pb-3"><%#Eval("nombreProducto")%></h5>
								            <div class="overflow-auto">
                                                <h4>Precio: $<%#Eval("precio")%></h4>
									            <p class="card-text" style="position: relative; height: 8rem;"><%#Eval("descripcionProducto")%></p>
								            </div>
                                            <asp:LinkButton ID="agregar_carrito" OnClick="agregar_carrito_Click" CommandArgument='<%#Eval("idProducto") %>' runat="server" class="btn btn-dark float-left"><i class="fas fa-shopping-cart"></i></asp:LinkButton>
                                            <asp:LinkButton ID="btn" runat="server" CommandArgument='<%#Eval("idProducto") %>' CommandName="Click" class="btn btn-dark float-right" OnClick="ver_detalles_Click">Mas detalles <i class="fas fa-angle-double-right"></i></asp:LinkButton>
							            </div>
							        </div>
                                <br />
						        </div>
                            </ItemTemplate>
                        </asp:Repeater>
					</div>
                </div>

                <div class="tab-pane fade" id="v-pills-disco_e" role="tabpanel" aria-labelledby="v-pills-disco_e-tab">
                    <div class="row">
                        <asp:Repeater ID="Repeater3" runat="server">
                            <ItemTemplate>
                                <div class="col-md-4">
							        <div class="card">
                                        <img src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"imagenProducto")) %>" alt="Card image cap" class="card-img-top" style="position: relative; height: 225px !important; width: 350px !important;">
							            <div class="card-body">
								            <h5 class="card-title border-bottom pb-3"><%#Eval("nombreProducto")%></h5>
								            <div class="overflow-auto">
                                                <h4>Precio: $<%#Eval("precio")%></h4>
									            <p class="card-text" style="position: relative; height: 8rem;"><%#Eval("descripcionProducto")%></p>
								            </div>
                                            <asp:LinkButton ID="agregar_carrito" OnClick="agregar_carrito_Click" CommandArgument='<%#Eval("idProducto") %>' runat="server" class="btn btn-dark float-left"><i class="fas fa-shopping-cart"></i></asp:LinkButton>
                                            <asp:LinkButton ID="btn" runat="server" CommandArgument='<%#Eval("idProducto") %>' CommandName="Click" class="btn btn-dark float-right" OnClick="ver_detalles_Click">Mas detalles <i class="fas fa-angle-double-right"></i></asp:LinkButton>
							            </div>
							        </div>
                                <br />
						        </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
				</div>

				<div class="tab-pane fade" id="v-pills-m2" role="tabpanel" aria-labelledby="v-pills-m2-tab">
					<div class="row">
                        <asp:Repeater ID="Repeater4" runat="server">
                            <ItemTemplate>
                                <div class="col-md-4">
							        <div class="card">
                                        <img src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"imagenProducto")) %>" alt="Card image cap" class="card-img-top" >
							            <div class="card-body">
								            <h5 class="card-title border-bottom pb-3"><%#Eval("nombreProducto")%></h5>
								            <div class="overflow-auto">
                                                <h4>Precio: $<%#Eval("precio")%></h4>
									            <p class="card-text" style="position: relative; height: 8rem;"><%#Eval("descripcionProducto")%></p>
								            </div>
                                            <asp:LinkButton ID="agregar_carrito" OnClick="agregar_carrito_Click" CommandArgument='<%#Eval("idProducto") %>' runat="server" class="btn btn-dark float-left"><i class="fas fa-shopping-cart"></i></asp:LinkButton>
                                            <asp:LinkButton ID="btn" runat="server" CommandArgument='<%#Eval("idProducto") %>' CommandName="Click" class="btn btn-dark float-right" OnClick="ver_detalles_Click">Mas detalles <i class="fas fa-angle-double-right"></i></asp:LinkButton>
							            </div>
							        </div>
                                <br />
						        </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
				</div>

            </div>
        </div>

    </div>
    <br />
    <br />
    <br />
    <br />
	<script src="../../Scripts/jquery.min.js"></script>
    <script src="../../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
