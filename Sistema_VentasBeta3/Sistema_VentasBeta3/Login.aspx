<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Sistema_VentasBeta3.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i,900" rel="stylesheet">
    <link href="~/Content/icofont.min.css" rel="stylesheet" />
    <link href="~/Content/Style.css" rel="stylesheet" />
    <link href="~/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="~/Content/animate.min.css" rel="stylesheet" />
    <link href="~/Content/aos.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/a02ddcc47f.js" crossorigin="anonymous"></script>
    <title>E-Tecnology</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
<body style="background-image: url(../../assets/img/backg.png); background-repeat: no-repeat; background-size: 40%; background-attachment: fixed;">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <div class="main_bar">
                <div class="container">
                    <div class="row">
                                <div class="col-12 d-flex flex-row-reverse">
                                    <li><asp:Label ID="Nombre_usuario" runat="server" Text=""></asp:Label></li>
                                    <li><asp:LinkButton ID="btn_login" runat="server" OnClick="btn_login_Click">Login</asp:LinkButton></li>
                                    <li><asp:LinkButton ID="btn_registrar" runat="server" OnClick="btn_registrar_Click">Registrarse</asp:LinkButton></li>
                                </div>
                    </div>
                </div>
            </div>
    <header id="header">
        <div class="container">
            <div class="logo float-left">
                <h4 class="font-weight-light"><a href="../Principal.aspx">E-Tecnology<span></span></a></h4>
            </div>
            <nav class="nav-menu float-right d-none d-lg-block">
                <ul>
                    <li><asp:LinkButton ID="btn_Productos" runat="server" OnClick="btn_Productos_Click">Productos</asp:LinkButton></li>
                    <li><asp:LinkButton ID="btn_Servicios" runat="server" OnClick="btn_Servicios_Click">Servicios</asp:LinkButton></li>
                    <li><asp:LinkButton ID="btn_Ofertas" runat="server" OnClick="btn_Ofertas_Click">Ofertas</asp:LinkButton></li>
                    <li><asp:LinkButton ID="btn_Contact" runat="server" OnClick="btn_Contact_Click">Contacto</asp:LinkButton></li>
                    <li><asp:LinkButton ID="btn_faq" runat="server" OnClick="btn_faq_Click">F.A.Q</asp:LinkButton></li>
                </ul>
            </nav>
        </div>
    </header>
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="container animated fadeInUp">
            <div class="row">
                <div class="col-7"></div>
                <div class="col-4">
                    <div class="img-log">
                        <img class="content-align-center" src="https://pluspng.com/img-png/avengers-logo-png-avengers-logo-png-1376.png" alt="" style="height: 80px; width: 80px;">
                    </div>
                    <br>
                    <h4 class="d-flex justify-content-center">E-Tecnology</h4>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Usuario</label>
                        <asp:TextBox ID="user_text" runat="server" class="form-control" aria-describedby="emailHelp"></asp:TextBox>
                        <small id="emailHelp" class="form-text text-muted">Nunca compartas tu información con nadie</small>
                    </div>

                    <div class="form-group">
                        <label for="exampleInputPassword1">Contraseña</label>
                        <asp:TextBox ID="password_text" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                    </div>

                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Recordarme</label>
                    </div>
                    <asp:Button ID="login" class="btn btn-primary" runat="server" Text="Iniciar Sesión" OnClick="login_Click" /><br>
                    <br>
                    <hr />
                    <div class="row mt-3">
                        <div class="col-6">
                            <small><a href="" style="color: black;">¿Olvidaste tu Contraseña?</a></small>
                        </div>

                        <div class="col-6 text-right">
                            <small style="text-decoration: none;"><a href="Register.aspx" class="text-right" style="color: black;">Crear cuenta</a></small>
                            <asp:Label ID="test" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
        </div>
    </body>
        </div>
    </form>
</body>
</html>
