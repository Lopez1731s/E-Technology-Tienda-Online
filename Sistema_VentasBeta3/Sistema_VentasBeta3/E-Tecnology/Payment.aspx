<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Sistema_VentasBeta3.E_Tecnology.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="idproducto" runat="server" Text=""></asp:Label>
    <asp:Label ID="new_stock" runat="server" Text=""></asp:Label>

    <br />
    <br />
	<div class="container animated fadeInUp">
		<div class="row">
			<div class="col-12">
				<h2>Pago</h2>
			</div>
			<div class="col-md-3 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">Articulos</span>
					<span class="badge badge-success badge-pill">1</span>
				</h4>

				<ul class="list-group mb-3">
					<li class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0"><asp:Label ID="nombre_producto" runat="server" Text=""></asp:Label></h6>
							<small class="text-muted"><asp:Label ID="categoria" runat="server" Text=""></asp:Label></small>
						</div>
						<span class="text-muted">$<asp:Label ID="precio" runat="server" Text=""></asp:Label></span>
					</li>
					<li class="list-group-item d-flex justify-content-between bg-light">
						<div class="text-success">
							<h6 class="my-0">Descuento</h6>
							<small class="text-muted">Código</small>
						</div>
						<span class="text-muted"><asp:Label ID="porcentaje" runat="server" Text=""></asp:Label></span>
					</li>
					<li class="list-group-item d-flex justify-content-between">
						<span>Total: </span>
						<strong>$ <asp:Label ID="total" runat="server" Text=""></asp:Label></strong>
					</li>
				</ul>

				<form class="card p-2">
					<div class="input-group">
                        <asp:TextBox ID="codigo_text" runat="server" class="form-control" placeholder="Promo code"></asp:TextBox>
						<div class="input-group-append">
                            <asp:LinkButton ID="canjear" runat="server" class="btn btn-secondary" OnClick="canjear_Click">Redeem</asp:LinkButton>
						</div>
					</div>
					<small class="text-muted"><asp:Label ID="denegado" runat="server" Text=""></asp:Label></small>
				</form>
			</div>

			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">Datos Personales</h4>
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="firstName">Primer nombre</label>
                        <asp:TextBox ID="name" runat="server" class="form-control"></asp:TextBox>
					</div>

					<div class="col-md-6 mb-3">
						<label for="firstName">Segundo nombre</label>
                        <asp:TextBox ID="lastname" runat="server" class="form-control"></asp:TextBox>
					</div>
				</div>

				<div class="mb-3">
					<label for="">Usuario</label>
					<div class="input-group">
                        <asp:TextBox ID="user" runat="server" class="form-control"></asp:TextBox>
					</div>
				</div>

				<div class="mb-3">
					<label for="">Correo</label>
					<div class="input-group">
                        <asp:TextBox ID="mail" runat="server" class="form-control"></asp:TextBox>
					</div>
				</div>

				<div class="mb-3">
					<label for="">Dirección</label>
					<div class="input-group">
                        <asp:TextBox ID="address" runat="server" class="form-control"></asp:TextBox>
					</div>
				</div>

				<div class="row">
					<div class="col-md-5 mb-3">
						<label for="">Pais</label>
                        <asp:TextBox ID="country" runat="server" class="form-control"></asp:TextBox>
					</div>

					<div class="col-md-4 mb-3">
						<label for="">Estado</label>
                        <asp:TextBox ID="state" runat="server" class="form-control"></asp:TextBox>
					</div>

					<div class="col-md-3 mb-3">
						<label for="">Zip</label>
                        <asp:TextBox ID="zip" runat="server" class="form-control"></asp:TextBox>
					</div>

                    <div class="col-md-10 align-self-end">
                    </div>
					<asp:LinkButton ID="cargar_inform" runat="server" OnClick="cargar_inform_Click" class="text-decoration-none">Cargar Info</asp:LinkButton>
				</div>

				<hr class="mb-4">

				<div class="custom-control custom-checkbox">
					<input type="checkbox" style="position: relative; left: -8px;"><label for="">Guardar esta información para siguiente compra</label>
				</div>

				<hr class="mb-4">

				<h4 class="mb-3">Pago</h4>
				<div class="d-block">
                    <asp:RadioButton ID="RadioButton1" runat="server" Text="Tarjeta de Credito" style="position: relative; margin-bottom: 0;"/>
				</div>
				<div class="d-block">
					<asp:RadioButton ID="RadioButton2" runat="server" Text="Tarjeta de Debido" style="position: relative; margin-bottom: 0;"/>
				</div>
                <br />
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label>Nombre del Titular</label>
						<input type="text" class="form-control" placeholder="">
						<small class="text-muted">Full name as displayed on card</small>
                    </div>

					<div class="col-md-6 mb-3">
						<label for="cc-number">Numero de Tarjeta</label>
						<input type="text" class="form-control" placeholder="">
					</div>
                </div>

                <div class="row">
					<div class="col-md-3 mb-3">
						<label for="cc-expiration">Expiration</label>
						<input type="text" class="form-control" placeholder="">
					</div>
					<div class="col-md-3 mb-3">
						<label for="cc-expiration">CVV</label>
						<input type="text" class="form-control" placeholder="">
					</div>
                </div>

                <hr class="mb-4"/>

                <asp:LinkButton ID="confrimar_compra" runat="server" OnClick="confrimar_compra_Click" class="btn btn-primary btn-lg btn-block">Confirmar Compra</asp:LinkButton>
			</div>
		</div>
	</div>
    <br />
    <br />
    <br />
    <br />
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script>	
        console.log(viewed)

        if (viewed == "true") {
            $("#exampleModalCenter").fadeOut();
        } else if (viewed == undefined) {
            $("#exampleModalCenter").fadeIn();
            Cookies.set('viewed', true);
    </script>
</asp:Content>
