<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Sistema_VentasBeta3.Pages.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="cantidad_" runat="server" Text="1"></asp:Label>
    <asp:Label ID="cantidad_selected" runat="server" Text="1"></asp:Label>
    <asp:Label ID="cantidad_stock" runat="server" Text="1"></asp:Label>
    <asp:Label ID="idproducto_" runat="server" Text="1"></asp:Label>
	<section class="jumbotron text-center">
	    <div class="container">
	        <h1 class="jumbotron-heading">Shopping Cart</h1>
	     </div>
	</section>
    <br />
    <br />
	<div class="container" runat="server" id="container_cart">
		<div class="row">
			<div class="col align-self-end"></div>
            <asp:LinkButton ID="terminar_compra" runat="server" OnClick="terminar_compra_Click">Terminar comprar</asp:LinkButton>
		</div>
		<br />
		<br />
        <asp:Repeater ID="Repeater1" runat="server" EnableViewState="false" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
				<div class="row">
					<div class="col-2 md-2">
						<img src="data:image/jpg;base64,<%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"imagenProducto")) %>" alt="" class="card-img-top" style="position: relative; height: 170px !important; width: 170px !important;">
					</div>
					<div class="col-10">
						<div class="d-flex">
							<div class="flex-grow-1">
								<h6>Nombre Producto: <%#Eval("nombreProducto")%></h6>
								Descripción: <%#Eval("nombreCategoria")%>
							</div>
							<div class="ml-auto p-2"><asp:LinkButton ID="eliminar_item" runat="server" OnClick="eliminar_item_Click" CommandArgument='<%#Eval("idProducto") %>'><i class="fas fa-times" style="color: black;"></i></asp:LinkButton></div>
						</div>

						<br>

						<div class="row">
							<div class="col-3">
								Precio /Unidad: $<%#Eval("precio")%>
							</div>
							<div class="d-flex col-6">
								<asp:Label ID="Label1" runat="server" Text="Cantidad:"></asp:Label>
								<asp:TextBox ID="cantidad" runat="server" class="form-control" style="position: relative; left: 5px; height: 30px; width: 3rem;" Text='<%#Eval("cantidad")%>'></asp:TextBox>
                                <small><asp:LinkButton ID="actualizar" runat="server" OnClick="actualizar_Click" CommandArgument='<%#Eval("idProducto") %>' class="btn btn-sm btn-dark" style="position:relative; left: 25px;">Actualizar</asp:LinkButton></small>
							</div>
							<div class="col-3">
								Total: $<%#Eval("total_pagar")%>
							</div>
						</div>
						<hr style="margin-bottom: 25px;">
						<div class="d-flex">
							<div class="flex-grow-1"><small>Cargos adicionales: $0.00</small></div>
							<div class="ml-auto p-2"><small>Entrega en: 5-7 habiles</small></div>
						</div>
					</div>
				</div>
                <br />
                <br />
            </ItemTemplate>
        </asp:Repeater>
	</div>

    <div class="container" runat="server" id="noitemscart">
        <div class="row">
            <div class="col-12">
                <img class="justify-content-center" src="https://image.flaticon.com/icons/png/512/107/107831.png" alt="Alternate Text" style="position: relative; height:125px; left: 45%;"/>
                <br />
                <br />
                <h2 class="text-center display-4">Aun no has agreagado productos al carro</h2>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</asp:Content>
