<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Sistema_VentasBeta3.Pages.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body style="background-image: url(../../assets/img/backg.png); background-repeat: no-repeat; background-size: 40%;">
        <br>
        <br>
        <br>
    <div class="container animated fadeInUp">
            <div class="row">
                <h3 style="position: relative; left: 43%;">Crear nueva Cuenta</h3>
                <div class="col-12"></div>
                <div class="col-5"></div>
                <div class="col-md-7 order-md-1">
                    <h4 class="mb-3">Datos Personales</h4>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label>Nombres</label>
                            <asp:TextBox ID="name" runat="server" class="form-control" required=""></asp:TextBox>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label>Apellidos</label>
                            <asp:TextBox ID="lastname" runat="server" class="form-control" required=""></asp:TextBox>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="">Usuario</label>
                        <div class="input-group">
                            <asp:TextBox ID="user" runat="server" class="form-control" required=""></asp:TextBox>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="">Correo</label>
                        <div class="input-group">
                            <asp:TextBox ID="mail" runat="server" class="form-control" required="" placeholder="usuario@example.com"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="firstName">Contraseña</label>
                            <asp:TextBox ID="Password" runat="server" class="form-control" required="" TextMode="Password" onclick="Password_Click"></asp:TextBox>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label for="firstName">Confirmar Contraseña</label>
                            <asp:TextBox ID="Password2" runat="server" class="form-control" required="" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <hr />
                    <div class="mb-3">
                        <label for="">Dirección</label>
                        <div class="input-group">
                            <asp:TextBox ID="adress" runat="server" class="form-control" required="" placeholder="Av. 6542 Calle 9"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-5 mb-3">
                            <label for="">Pais</label>
                            <asp:TextBox ID="pais" runat="server" class="form-control" required=""></asp:TextBox>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label for="">Estado</label>
                            <asp:TextBox ID="estado" runat="server" class="form-control" required=""></asp:TextBox>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label for="">Zip</label>
                            <asp:TextBox ID="zip" runat="server" class="form-control" required=""></asp:TextBox>
                        </div>

                    </div>
                    <br><br>
                    <asp:Button ID="Registrarse_btn" runat="server" Text="Registrarse" class="btn btn-secondary btn-lg btn-block" OnClick="Registrarse_btn_Click"/>
                    <hr />
                    <small><p>¿Ya tienes una Cuenta? Click <a href="#" data-toggle="modal" data-target="#exampleModal">Aqui</a></p></small>
                    <hr />
                </div>
            </div>
        </div>
        <asp:Label ID="error" runat="server" Text="" class="text-danger"></asp:Label>

        <asp:Image ID="Image1" runat="server" ImageUrl="~/assets/img/user.jpg" />
    </body>
</asp:Content>
