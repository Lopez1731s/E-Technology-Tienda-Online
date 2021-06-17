<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Components.aspx.cs" Inherits="Sistema_VentasBeta3.E_Tecnology.Categories.Components" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container animated fadeInUp">
        <h2>Componentes</h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><asp:LinkButton ID="inicio" runat="server" class="text-decoration-none" OnClick="inicio_Click">Inicio</asp:LinkButton></li>
            <li class="breadcrumb-item"><asp:LinkButton ID="productos_back" runat="server" class="text-decoration-none" OnClick="productos_back_Click">Productos</asp:LinkButton></li>
            <li class="breadcrumb-item active">Componentes</li>
            <div class="col align-self-end"></div>
            <asp:LinkButton ID="ir_carrito" runat="server" OnClick="ir_carrito_Click"><i class="fas fa-shopping-cart" style="color: black;"></i></asp:LinkButton>
        </ol>

        <div class="row">
            <div class="btn-group col-lg-2" style="position: relative; height: 2rem;">
                <button class="btn d-flex rounded" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <h5 class="font-weight-normal"><span style="position: absolute; left: 10px; top: 2px;">Categorias</span></h5>
                    <i class="fas fa-sort-down" style="position: relative; left: 8rem; top: -3px;"></i>
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <div class="nav-pills list-group" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="dropdown-item nav-link active" id="v-pills-procesador-tab" data-toggle="pill" href="#v-pills-procesador" role="tab" aria-controls="v-pills-procesador" aria-selected="false">Procesadores</a>
						<a class="dropdown-item nav-link" id="v-pills-motherboards-tab" data-toggle="pill" href="#v-pills-motherboards" role="tab" aria-controls="v-pills-motherboards" aria-selected="true">Placas Madres</a>
						<a class="dropdown-item nav-link" id="v-pills-videocards-tab" data-toggle="pill" href="#v-pills-videocards" role="tab" aria-controls="v-pills-videocards" aria-selected="false">Tarjetas de Video</a>
						<a class="dropdown-item nav-link" id="v-pills-ram-tab" data-toggle="pill" href="#v-pills-ram" role="tab" aria-controls="v-pills-ram" aria-selected="false">Memorias RAM</a>
						<a class="dropdown-item nav-link" id="v-pills-powersupply-tab" data-toggle="pill" href="#v-pills-powersupply" role="tab" aria-controls="v-pills-powersupply" aria-selected="false">Fuentes de Poder</a>
						<a class="dropdown-item nav-link" id="v-pills-cases-tab" data-toggle="pill" href="#v-pills-cases" role="tab" aria-controls="v-pills-cases" aria-selected="false">Cases</a>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="tab-content" id="v-pills-tabContent">
                <div class="tab-pane fade show active" id="v-pills-procesador" role="tabpanel" aria-labelledby="v-pills-procesador-tab">
                    <div class="row">
                        <asp:Repeater ID="Repeater1" runat="server">
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
                                            <asp:LinkButton ID="agregar_carrito" runat="server" OnClick="agregar_carrito_Click" CommandArgument='<%#Eval("idProducto") %>' class="btn btn-dark float-left"><i class="fas fa-shopping-cart"></i></asp:LinkButton>
                                            <asp:LinkButton ID="btn" runat="server" CommandArgument='<%#Eval("idProducto") %>' CommandName="Click" class="btn btn-dark float-right" OnClick="btn_Click">Mas detalles <i class="fas fa-angle-double-right"></i></asp:LinkButton>
							            </div>
							        </div>
                                <br />
						        </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
				</div>

                <div class="tab-pane fade" id="v-pills-motherboards" role="tabpanel" aria-labelledby="v-pills-motherboards-tab">
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
                                            <asp:LinkButton ID="agregar_carrito" runat="server" OnClick="agregar_carrito_Click" CommandArgument='<%#Eval("idProducto") %>' class="btn btn-dark float-left"><i class="fas fa-shopping-cart"></i></asp:LinkButton>
                                            <asp:LinkButton ID="btn" runat="server" CommandArgument='<%#Eval("idProducto") %>' CommandName="Click" class="btn btn-dark float-right" OnClick="btn_Click">Mas detalles <i class="fas fa-angle-double-right"></i></asp:LinkButton>
							            </div>
							        </div>
                                <br />
						        </div>
                            </ItemTemplate>
                        </asp:Repeater>
					</div>
                </div>

                <div class="tab-pane fade" id="v-pills-videocards" role="tabpanel" aria-labelledby="v-pills-videocards-tab">
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
                                            <asp:LinkButton ID="agregar_carrito" runat="server" OnClick="agregar_carrito_Click" CommandArgument='<%#Eval("idProducto") %>' class="btn btn-dark float-left"><i class="fas fa-shopping-cart"></i></asp:LinkButton>
                                            <asp:LinkButton ID="btn" runat="server" CommandArgument='<%#Eval("idProducto") %>' CommandName="Click" class="btn btn-dark float-right" OnClick="btn_Click">Mas detalles <i class="fas fa-angle-double-right"></i></asp:LinkButton>
							            </div>
							        </div>
                                <br />
						        </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
				</div>

                <div class="tab-pane fade" id="v-pills-ram" role="tabpanel" aria-labelledby="v-pills-ram-tab">
                    <div class="row">
                        <asp:Repeater ID="Repeater4" runat="server">
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
                                            <asp:LinkButton ID="agregar_carrito" runat="server" OnClick="agregar_carrito_Click" CommandArgument='<%#Eval("idProducto") %>' class="btn btn-dark float-left"><i class="fas fa-shopping-cart"></i></asp:LinkButton>
                                            <asp:LinkButton ID="btn" runat="server" CommandArgument='<%#Eval("idProducto") %>' CommandName="Click" class="btn btn-dark float-right" OnClick="btn_Click">Mas detalles <i class="fas fa-angle-double-right"></i></asp:LinkButton>
							            </div>
							        </div>
                                <br />
						        </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
				</div>

                <div class="tab-pane fade" id="v-pills-powersupply" role="tabpanel" aria-labelledby="v-pills-powersupply-tab">
                    <div class="row">
                        <asp:Repeater ID="Repeater5" runat="server">
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
                                            <asp:LinkButton ID="agregar_carrito" runat="server" OnClick="agregar_carrito_Click" CommandArgument='<%#Eval("idProducto") %>' class="btn btn-dark float-left"><i class="fas fa-shopping-cart"></i></asp:LinkButton>
                                            <asp:LinkButton ID="btn" runat="server" CommandArgument='<%#Eval("idProducto") %>' CommandName="Click" class="btn btn-dark float-right" OnClick="btn_Click">Mas detalles <i class="fas fa-angle-double-right"></i></asp:LinkButton>
							            </div>
							        </div>
                                <br />
						        </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
				</div>

                <div class="tab-pane fade" id="v-pills-cases" role="tabpanel" aria-labelledby="v-pills-cases-tab">
                    <div class="row">
                        <asp:Repeater ID="Repeater6" runat="server">
                            <ItemTemplate>
                                <div class="col-md-4" style="max-width: none;">
							        <div class="card">
                                        <img src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"imagenProducto")) %>" alt="Card image cap" class="card-img-top" style="position: relative; height: 225px !important; width: 350px !important;">
							            <div class="card-body">
								            <h5 class="card-title border-bottom pb-3"><%#Eval("nombreProducto")%></h5>
								            <div class="overflow-auto">
                                                <h4>Precio: $<%#Eval("precio")%></h4>
									            <p class="card-text" style="position: relative; height: 8rem;"><%#Eval("descripcionProducto")%></p>
								            </div>
                                            <asp:LinkButton ID="agregar_carrito" runat="server" OnClick="agregar_carrito_Click" CommandArgument='<%#Eval("idProducto") %>' class="btn btn-dark float-left"><i class="fas fa-shopping-cart"></i></asp:LinkButton>
                                            <asp:LinkButton ID="btn" runat="server" CommandArgument='<%#Eval("idProducto") %>' CommandName="Click" class="btn btn-dark float-right" OnClick="btn_Click">Mas detalles <i class="fas fa-angle-double-right"></i></asp:LinkButton>
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
	<script src="../../Scripts/jquery.min.js"></script>
    <script src="../../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
