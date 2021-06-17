<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Deals.aspx.cs" Inherits="Sistema_VentasBeta3.Pages.Deals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="container animated fadeInUp">
        <h1>Ofertas</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><asp:LinkButton ID="Inicio" runat="server" OnClick="Inicio_Click" class="text-decoration-none">Inicio</asp:LinkButton></li>
            <li class="breadcrumb-item active">Ofertas</li>
        </ol>

        <div class="alert alert-dismissible fade show" role="alert">
            <h5 class="text-center text-danger">Ofertas disponible hasta: 01/08/2020</h5>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="row">
            <div class="col-md-4 mb-5" style="position: relative; top: 5rem;">
                <h4 class="card-title font-weight-bold mb-2">Cloud Gaming Headset</h4>
                <p class="card-text"><i class="far fa-clock pr-2"></i>07/24/2020</p>

                  <div class="view overlay">
                      <img class="card-img-top rounded-0" src="https://media.kingston.com/hyperx/features/hx-features-headset-cloud-black.jpg" alt="Card image cap" style="position: relative; height: 50% !important;">
                      <a href="#!">
                        <div class="mask rgba-white-slight"></div>
                      </a>
                  </div>

                <div class="card-body">
                    <div class="collapse-content">
                        <h5>Precio: $150.00</h5>
                          <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                          <asp:LinkButton ID="agregar_carrito" runat="server" class="btn btn-primary text-white"><i class="fas fa-shopping-cart"></i>Agregar al Carrito</asp:LinkButton>
                          <i class="fas fa-share-alt text-muted float-right p-1 my-1"></i>
                          <i class="fas fa-heart text-muted float-right p-1 my-1 mr-3"></i>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-5" style="position: relative; top: 5rem;">
                <h4 class="card-title font-weight-bold mb-2">Asrock h310cm</h4>
                <p class="card-text"><i class="far fa-clock pr-2"></i>07/24/2020</p>

                  <div class="view overlay">
                      <img class="card-img-top rounded-0" src="https://media.ldlc.com/r1600/ld/products/00/05/18/05/LD0005180552_2.jpg" alt="Card image cap" style="position: relative; height: 50%;">
                      <a href="#!">
                        <div class="mask rgba-white-slight"></div>
                      </a>
                  </div>

                <div class="card-body">
                    <div class="collapse-content">
                        <h5>Precio: $150.00</h5>
                          <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                          <asp:LinkButton ID="ghf" runat="server" class="btn btn-primary text-white"><i class="fas fa-shopping-cart"></i>Agregar al Carrito</asp:LinkButton>
                          <i class="fas fa-share-alt text-muted float-right p-1 my-1"></i>
                          <i class="fas fa-heart text-muted float-right p-1 my-1 mr-3"></i>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-5" style="position: relative; top: 5rem;">
                <h4 class="card-title font-weight-bold mb-2">Kingston HyperX</h4>
                <p class="card-text"><i class="far fa-clock pr-2"></i>07/24/2020</p>

                  <div class="view overlay">
                      <img class="card-img-top rounded-0" src="https://cdn.mwave.com.au/images/400/kingston_hyperx_fury_rgb_16gb_2x_8gb_ddr4_2666mhz_memory_ac26495_13.jpg" alt="Card image cap" style="position: relative; height: 50%;">
                      <a href="#!">
                        <div class="mask rgba-white-slight"></div>
                      </a>
                  </div>

                <div class="card-body">
                    <div class="collapse-content">
                        <h5>Precio: $150.00</h5>
                          <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                          <asp:LinkButton ID="dds" runat="server" class="btn btn-primary text-white"><i class="fas fa-shopping-cart"></i>Agregar al Carrito</asp:LinkButton>
                          <i class="fas fa-share-alt text-muted float-right p-1 my-1"></i>
                          <i class="fas fa-heart text-muted float-right p-1 my-1 mr-3"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 mb-5" style="position: relative; top: 5rem;">
                <h4 class="card-title font-weight-bold mb-2">Cloud Gaming Headset</h4>
                <p class="card-text"><i class="far fa-clock pr-2"></i>07/24/2020</p>

                  <div class="view overlay">
                      <img class="card-img-top rounded-0" src="https://media.kingston.com/hyperx/features/hx-features-headset-cloud-black.jpg" alt="Card image cap" style="position: relative; height: 50% !important;">
                      <a href="#!">
                        <div class="mask rgba-white-slight"></div>
                      </a>
                  </div>

                <div class="card-body">
                    <div class="collapse-content">
                        <h5>Precio: $150.00</h5>
                          <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                          <asp:LinkButton ID="f" runat="server" class="btn btn-primary text-white"><i class="fas fa-shopping-cart"></i>Agregar al Carrito</asp:LinkButton>
                          <i class="fas fa-share-alt text-muted float-right p-1 my-1"></i>
                          <i class="fas fa-heart text-muted float-right p-1 my-1 mr-3"></i>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-5" style="position: relative; top: 5rem;">
                <h4 class="card-title font-weight-bold mb-2">Asrock h310cm</h4>
                <p class="card-text"><i class="far fa-clock pr-2"></i>07/24/2020</p>

                  <div class="view overlay">
                      <img class="card-img-top rounded-0" src="https://media.ldlc.com/r1600/ld/products/00/05/18/05/LD0005180552_2.jpg" alt="Card image cap" style="position: relative; height: 50%;">
                      <a href="#!">
                        <div class="mask rgba-white-slight"></div>
                      </a>
                  </div>

                <div class="card-body">
                    <div class="collapse-content">
                        <h5>Precio: $150.00</h5>
                          <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                          <asp:LinkButton ID="l" runat="server" class="btn btn-primary text-white"><i class="fas fa-shopping-cart"></i>Agregar al Carrito</asp:LinkButton>
                          <i class="fas fa-share-alt text-muted float-right p-1 my-1"></i>
                          <i class="fas fa-heart text-muted float-right p-1 my-1 mr-3"></i>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-5" style="position: relative; top: 5rem;">
                <h4 class="card-title font-weight-bold mb-2">Kingston HyperX</h4>
                <p class="card-text"><i class="far fa-clock pr-2"></i>07/24/2020</p>

                  <div class="view overlay">
                      <img class="card-img-top rounded-0" src="https://cdn.mwave.com.au/images/400/kingston_hyperx_fury_rgb_16gb_2x_8gb_ddr4_2666mhz_memory_ac26495_13.jpg" alt="Card image cap" style="position: relative; height: 50%;">
                      <a href="#!">
                        <div class="mask rgba-white-slight"></div>
                      </a>
                  </div>

                <div class="card-body">
                    <div class="collapse-content">
                        <h5>Precio: $150.00</h5>
                          <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                          <asp:LinkButton ID="j" runat="server" class="btn btn-primary text-white"><i class="fas fa-shopping-cart"></i>Agregar al Carrito</asp:LinkButton>
                          <i class="fas fa-share-alt text-muted float-right p-1 my-1"></i>
                          <i class="fas fa-heart text-muted float-right p-1 my-1 mr-3"></i>
                    </div>
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
    </div>
    <script src="../Scripts/jquery.min.js"></script>
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
