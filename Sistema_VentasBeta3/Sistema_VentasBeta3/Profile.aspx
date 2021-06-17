<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Sistema_VentasBeta3.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <div class="container animated fadeInUp">
        <div class="row">
            <div class="col-sm-10">
                <h1 class="font-weight-light">Perfil de Usuario</h1>
            </div>
            <div class="col-sm-2">
                <img src="assets/img/logo.png" style="position: relative; width: 100px !important; height: 100px !important;" alt="Alternate Text" />
            </div>
        </div>

        <div class="row">
            <div class="col-sm-3">
                <div class="text-center">
                    <img runat="server" id="default_img" class="rounded-circle" src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" alt="Alternate Text" />
                    <asp:Image ID="Image1" runat="server" class="rounded-circle" style="position: relative; width: 200px !important; height: 200px !important;" />
                    <p>Subir imagen de perfil</p>
                </div>
                <asp:FileUpload ID="FileUpload1" runat="server" style="position: relative; width: 250px;" />
                <br />
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" class="btn btn-secondary">Subir Foto</asp:LinkButton>
                <br />
                <br />
                <ul class="list-group">
                    <li class="list-group-item text-muted">Activity</li>
                    <li class="list-group-item"><span class="pull-left"><strong>Dinero Gastado</strong></span> $<asp:Label ID="totalgastado" runat="server" Text="0"></asp:Label></li>
                    <li class="list-group-item"><span class="pull-left"><strong>Productos C.</strong></span> <asp:Label ID="count" runat="server" Text=""></asp:Label></li>
                </ul>
            </div>
            <div class="col-sm-9">
                <h3>Detalles del Cliente</h3>
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="info-tab" data-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="true">Datos Personales</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" id="compras-tab" data-toggle="tab" href="#compras" role="tab" aria-controls="compras" aria-selected="true">Historial Compras</a>
                    </li>

                </ul>

                <div runat="server" id="contenedor_1">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="info" role="tabpanel" aria-labelledby="info-tab">
                            <br />
                            <h3>Datos</h3>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <h5>Nombres</h5>
                                    <asp:Label ID="nombre" runat="server" Text="Label"></asp:Label>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <h5>Apellidos</h5>
                                    <asp:Label ID="apellidos" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <h5>Correo Electronico</h5>
                                    <asp:Label ID="correo" runat="server" Text="Label"></asp:Label>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <h5>Usuario</h5>
                                    <asp:Label ID="usuario" runat="server" Text="Label"></asp:Label>
                                </div>


                                <div class="col-md-12 mb-3">
                                <br />
                                    <h5>Dirección</h5>
                                    <asp:Label ID="direccion" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-5 mb-3">
                                    <h5>Pais</h5>
                                    <asp:Label ID="pais" runat="server" Text="Label"></asp:Label>
                                </div>

                                <div class="col-md-4 mb-3">
                                    <h5>Estado</h5>
                                    <asp:Label ID="estado" runat="server" Text="Label"></asp:Label>
                                </div>

                                <div class="col-md-3 mb-3">
                                    <h5>ZIP</h5>
                                    <asp:Label ID="zip" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="col-9">
                                <br />
                                <br />
                                    <asp:LinkButton ID="update" runat="server" class="btn btn-success" style="position: relative; left: 100%;" OnClick="update_Click">Actualizar</asp:LinkButton>
                                </div>
                            </div>
                            <br />
                        </div>

                        <div class="tab-pane fade" id="compras" role="tabpanel" aria-labelledby="info-tab">
                            <br />
                            <br />
                            <h5>Historial de Compras</h5>
                            <table class="table table-hover">
                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">Nombre del Producto</th>
                                        <th scope="col">Cantidad</th>
                                        <th scope="col">Total</th>
                                        <th scope="col">Fecha Compra</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <th><%#Eval("nombreProducto")%></th>
                                                <td><%#Eval("cantidadProducto")%></td>
                                                <td><%#Eval("Total")%></td>
                                                <td><%#Eval("fechaVentaCliente")%></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>




                <div runat="server" id="contenedor_2">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="info" role="tabpanel" aria-labelledby="info-tab">
                            <br />
                            <h3>Datos</h3>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <h5>Nombres</h5>
                                    <asp:TextBox ID="name" runat="server" class="form-control" required=""></asp:TextBox>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <h5>Apellidos</h5>
                                    <asp:TextBox ID="lastname" runat="server" class="form-control" required=""></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <h5>Correo Electronico</h5>
                                    <asp:TextBox ID="mail" runat="server" class="form-control" required=""></asp:TextBox>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <h5>Usuario</h5>
                                    <fieldset disabled>
                                        <asp:TextBox ID="user" runat="server" class="form-control" required=""></asp:TextBox>
                                    </fieldset>
                                </div>

                                <br />

                                <div class="col-md-6 mb-3">
                                    <h5 runat="server" id="H1">Contraseña</h5>
                                    <asp:TextBox ID="Password" runat="server" class="form-control" required="" TextMode="Password" onclick="Password_Click"></asp:TextBox>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <h5 runat="server" id="H2">Confirmar Contraseña</h5>
                                    <asp:TextBox ID="Password2" runat="server" class="form-control" required="" TextMode="Password"></asp:TextBox>
                                </div>

                                <br />

                                <div class="col-md-12 mb-3">
                                    <h5>Dirección</h5>
                                    <asp:TextBox ID="address" runat="server" class="form-control" required=""></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-5 mb-3">
                                    <h5>Pais</h5>
                                    <asp:TextBox ID="country" runat="server" class="form-control" required=""></asp:TextBox>
                                </div>

                                <div class="col-md-4 mb-3">
                                    <h5>Estado</h5>
                                    <asp:TextBox ID="state" runat="server" class="form-control" required=""></asp:TextBox>
                                </div>

                                <div class="col-md-3 mb-3">
                                    <h5>ZIP</h5>
                                    <asp:TextBox ID="zip_" runat="server" class="form-control" required=""></asp:TextBox>
                                </div>
                                <div class="col-12">
                                    <asp:LinkButton ID="update2" runat="server" class="btn btn-success" style="position: relative; left: 88%;" OnClick="update2_Click">Actualizar</asp:LinkButton>
                                </div>
                            </div>
                            <br />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</asp:Content>
