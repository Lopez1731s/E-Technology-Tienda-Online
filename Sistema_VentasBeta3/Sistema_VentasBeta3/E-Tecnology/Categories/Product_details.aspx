<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Product_details.aspx.cs" Inherits="Sistema_VentasBeta3.E_Tecnology.Categories.Product_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="error" runat="server" Text=""></asp:Label>
    <br />
    <asp:Label ID="idproducto" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="idcliente" runat="server" Text="Label"></asp:Label>
    <div class="container animated fadeInUp" runat="server" id="contenedor_principal">
        <br />
        <h2><asp:Label ID="nombreProducto" runat="server" Text=""></asp:Label></h2>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><asp:LinkButton ID="inicio" runat="server" class="text-decoration-none" OnClick="inicio_Click">Inicio</asp:LinkButton></li>
            <li class="breadcrumb-item"><asp:LinkButton ID="productos_back" runat="server" class="text-decoration-none" OnClick="productos_back_Click">Productos</asp:LinkButton></li>
            <li class="breadcrumb-item active">Detalles</li>
            <div class="col align-self-end"></div>
            <asp:LinkButton ID="LinkButton1" runat="server"><i class="fas fa-shopping-cart" style="color: black;"></i></asp:LinkButton>
        </ol>

		<div class="row">
            <br />
			<div class="col-md-8">
                <asp:Image ID="Image1" runat="server" class="img-fluid" style="position: relative; width: 700px !important; height: 400px !important;" />
			</div>

			<div class="col-md-4">
				<h3 class="my-3">Descripción del Producto</h3>
				<h4 class="my-3">Precio: $<asp:Label ID="precio" runat="server" Text="Label"></asp:Label></h4>
                <asp:Label ID="descipcionProducto" runat="server" Text="Label"></asp:Label>
				<div class="my-3">
                    <asp:LinkButton ID="agregar_carrito" runat="server" class="btn btn-primary text-white"><i class="fas fa-shopping-cart"></i>Agregar al Carrito</asp:LinkButton>
                    <asp:LinkButton ID="comprar_ahora" runat="server" class="btn btn-primary text-white" OnClick="comprar_ahora_Click"><i class="fas fa-shopping-cart"></i>Comprar Ahora</asp:LinkButton>
				</div>
			</div>
		</div>
        <br />
        <br />
        <br />
        <br />
		<h3 class="my-4">Productos Recomendados</h3>
		<div class="row">
			<div class="col-md-3 col-sm-6 mb-4">
				<img src="https://static1.caseking.de/media/image/thumbnail/hpit-529_hpit_529_01_800x800.jpg" alt="" class="img-fluid"  style="position: relative; width: 200px !important; height: 200px !important;">
			</div>

			<div class="col-md-3 col-sm-6 mb-4">
				<img src="https://images-na.ssl-images-amazon.com/images/I/51GjnJrTWhL._AC_SX466_.jpg" alt="" class="img-fluid" style="position: relative; width: 200px !important; height: 200px !important;">
			</div>

			<div class="col-md-3 col-sm-6 mb-4">
				<img src="https://images-na.ssl-images-amazon.com/images/I/A1Xq9dT0r6L._AC_SL1500_.jpg" alt="" class="img-fluid" style="position: relative; width: 200px !important; height: 200px !important;">
			</div>

			<div class="col-md-3 col-sm-6 mb-4">
				<img src="https://aerocool.io/wp-content/uploads/2018/11/SI-5200-Window-Infographic700x700px-600x600.jpg" alt="" class="img-fluid" style="position: relative; width: 200px !important; height: 200px !important;">
			</div>

		</div>
        <hr />
		<div class="col-12" runat="server" id="contenedor_comentario">
			<div class="card my-4">
				<h5 class="card-header">Comentario:</h5>
				<div class="card-body">
					<div class="form-group">
                        <asp:TextBox ID="text_coment" runat="server" TextMode="multiline" class="form-control" rows="3" style="margin-top: 0px; margin-bottom: 0px; height: 105px;"></asp:TextBox>
					</div>
                    <asp:LinkButton ID="comentario" runat="server" class="btn btn-primary" OnClick="comentario_Click">Enviar</asp:LinkButton>
				</div>
			</div>
			<br>
            <asp:Repeater ID="Repeater1" runat="server">
				<ItemTemplate>
					<div class="media md-4">
						<img class="d-flex mr-3 rounded-circle" src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem, "Profile_img"))%>" alt="" style="position: relative; width: 50px !important; height: 50px !important;">
						<div class="media-body">
							<h5 class="mt-0"><%#Eval("Usuario")%></h5>
							<p><%#Eval("descripcionComentario")%></p><br><br>
						</div>
					</div>
				</ItemTemplate>
            </asp:Repeater>
		</div>
    </div>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</asp:Content>
