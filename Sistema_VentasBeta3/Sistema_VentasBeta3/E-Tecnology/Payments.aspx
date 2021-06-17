<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Payments.aspx.cs" Inherits="Sistema_VentasBeta3.E_Tecnology.Payments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="idclienteusuario" runat="server" Text=""></asp:Label>
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
					<span class="badge badge-success badge-pill"><asp:Label ID="total_productos" runat="server" Text=""></asp:Label></span>
				</h4>

				<ul class="list-group mb-3">
                    <asp:Repeater ID="Repeater1" runat="server">
						<ItemTemplate>
							<li class="list-group-item d-flex justify-content-between lh-condensed">
								<div>
									<h6 class="my-0"><%#Eval("nombreProducto")%></h6>
									<small class="text-muted"><%#Eval("nombreCategoria")%></small>
								</div>
								<span class="text-muted">$<%#Eval("total_pagar")%></span>
							</li>
						</ItemTemplate>
                    </asp:Repeater>
					<li class="list-group-item d-flex justify-content-between bg-light">
						<div class="text-success">
							<h6 class="my-0">Descuento</h6>
							<small class="text-muted">Código</small>
						</div>
						<span class="text-muted"><asp:Label ID="porcentaje" runat="server" Text=""></asp:Label></span>
					</li>
					<li class="list-group-item d-flex justify-content-between">
						<span>Total: </span>
						<strong>$<asp:Label ID="total_venta" runat="server" Text=""></asp:Label></strong>
					</li>
				</ul>

				<form class="card p-2">
					<div class="input-group">
                        <asp:TextBox ID="codigo_text" runat="server" class="form-control" placeholder="Promo code"></asp:TextBox>
						<div class="input-group-append">
                            <asp:LinkButton ID="canjear" runat="server" class="btn btn-secondary">Redeem</asp:LinkButton>
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
					<asp:LinkButton ID="cargar_inform" OnClick="cargar_inform_Click" runat="server" class="text-decoration-none">Cargar Info</asp:LinkButton>
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

                <asp:LinkButton ID="confirmar_compra_" OnClick="confirmar_compra__Click" runat="server" class="btn btn-primary btn-lg btn-block">Confirmar Compra</asp:LinkButton>
			</div>
		</div>
	</div>
    <br />
    <br />
    <br />
    <br />
</asp:Content>
