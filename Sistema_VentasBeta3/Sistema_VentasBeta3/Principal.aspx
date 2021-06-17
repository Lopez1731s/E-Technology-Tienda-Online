<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="Sistema_VentasBeta3.Principal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="hero">
        <div class="hero-container">
            <div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">
                <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active" style="background-image: url('assets/img/banner.jpg');">
                        <div class="carousel-container">
                            <div class="carousel-content container">
                                <h1 class="text-white animated fadeInDown">Bienvenido a E-Tecnology</h1>
                                <p class="animated fadeInUp">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed praesentium numquam maiores, eius itaque provident magnam, explicabo quod optio, blanditiis reiciendis adipisci esse error quasi nostrum mollitia? Similique, sint, quos.</p>
                                <a href="Pages/Register.aspx" class="btn btn-light animated fadeInUp scrollto">Registrarse</a>
                            </div>
                        </div>
                    </div>

                    <div class="carousel-item" style="background-image: url('assets/img/banner.jpeg');">
                        <div class="carousel-container">
                            <div class="carousel-content container">
                                <h1 class="text-white animated fadeInDown">Bienvenido a E-Tecnology</h1>
                                <p class="animated fadeInUp">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed praesentium numquam maiores, eius itaque provident magnam, explicabo quod optio, blanditiis reiciendis adipisci esse error quasi nostrum mollitia? Similique, sint, quos.</p>
                                <a href="Pages/Register.aspx" class="btn btn-light animated fadeInUp scrollto">Registrarse</a>
                            </div>
                        </div>
                    </div>

                    <div class="carousel-item" style="background-image: url('assets/img/banner3.jpg');">
                        <div class="carousel-container">
                            <div class="carousel-content container">
                                <h1 class="text-white animated fadeInDown">Bienvenido a E-Tecnology</h1>
                                <p class="animated fadeInUp">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed praesentium numquam maiores, eius itaque provident magnam, explicabo quod optio, blanditiis reiciendis adipisci esse error quasi nostrum mollitia? Similique, sint, quos.</p>
                                <a href="Pages/Register.aspx" class="btn btn-light animated fadeInUp scrollto">Registrarse</a> 
                            </div>
                        </div>
                    </div>
                </div>
                <a href="#heroCarousel" class="carousel-control-prev" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon icofont-rounded-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>

                <a href="#heroCarousel" class="carousel-control-next" role="button" data-slide="next">
                    <span class="carousel-control-next-icon icofont-rounded-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </section>
    <br />
    <br />
    <br />    
    <br />
    <br />
    <style>
        #marcas_contenedor 
        {
        background: url("https://images.pexels.com/photos/3183156/pexels-photo-3183156.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940");
        height: 500px;
        margin-bottom: 50px;
        background-attachment: fixed;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        }
        
        #marcas_contenedor2
        {
        background: url("https://images.pexels.com/photos/3183190/pexels-photo-3183190.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940");
        height: 500px;
        margin-bottom: 50px;
        background-attachment: fixed;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        }

        .featurette-divider 
        {
            margin: 5rem 0;
        }
    </style>

    <div class="container animated fadeInDown">
        <div class="row">
            <div class="col-12 text-center">
                <h1>Principales Marcas</h1>
            </div>
            <div class="col-lg-4 text-center">
                <img class="rounded-circle" src="https://upload.wikimedia.org/wikipedia/commons/e/eb/Intel-logo.jpg" alt="Generic placeholder image" width="140" height="140">
                <h2>Company</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum recusandae molestiae a laborum blanditiis natus necessitatibus! Alias distinctio expedita accusamus pariatur voluptate! Expedita autem quasi, ipsum omnis ad, fugit distinctio.</p>
                <a href="#" class="btn btn-secondary">Mas Detalles<i class="fas fa-angle-double-right" style="left: 5px; position: relative; top: 2px;"></i></a>
            </div>

            <div class="col-lg-4 text-center">
                <img class="rounded-circle" src="https://logoeps.com/wp-content/uploads/2012/03/amd-vector.jpg" alt="Generic placeholder image" width="140" height="140">
                <h2>Company</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum recusandae molestiae a laborum blanditiis natus necessitatibus! Alias distinctio expedita accusamus pariatur voluptate! Expedita autem quasi, ipsum omnis ad, fugit distinctio.</p>
                <a href="#" class="btn btn-secondary">Mas Detalles<i class="fas fa-angle-double-right" style="left: 5px; position: relative; top: 2px;"></i></a>
            </div>

            <div class="col-lg-4 text-center">
                <img class="rounded-circle" src="https://www.iconninja.com/files/601/374/454/nvidia-icon.svg" alt="Generic placeholder image" width="140" height="140">
                <h2>Company</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum recusandae molestiae a laborum blanditiis natus necessitatibus! Alias distinctio expedita accusamus pariatur voluptate! Expedita autem quasi, ipsum omnis ad, fugit distinctio.</p>
                <a href="#" class="btn btn-secondary">Mas Detalles<i class="fas fa-angle-double-right" style="left: 5px; position: relative; top: 2px;"></i></a>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />    
    <br />
    <br />   
    <div id="marcas_contenedor"></div>
    <br />
    <br />
    <div class="container aos-init aos-animate">
        <div class="row">
            <div class="col-12">
                <h1>Nuevo Ingreso</h1>
                <br />
            </div>
            <div class="col-md-7">
                <h3 class="featurette-heading">Intel Core i7-9700K - Procesador de escritorio (8 núcleos, hasta 4.9 GHz, Turbo desbloqueado, LGA1151 300 Series, 95 W)</h3>
                <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sequi error, nesciunt est, dolor obcaecati distinctio esse, quibusdam ratione natus necessitatibus eos saepe. Officiis alias cumque facere commodi numquam aliquam maxime.</p>
            </div>

            <div class="col-md-5">
                <img class="featurette-image img-fluid mx-auto" data-src="holder.js/500x500/auto" alt="500x500" style="width: 500px; height: 500px;" src="https://images-na.ssl-images-amazon.com/images/I/81-l4X-IM9L._AC_SL1500_.jpg" data-holder-rendered="true">
            </div>
        </div>
        <hr class="featurette-divider " />
        <div class="row">
            <div class="col-md-7 order-md-2">
                <h3 class="featurette-heading">ASUS ROG Strix GeForce RTX 2080 Super Advanced Overclocked 8G GDDR6 HDMI DP 1.4 USB tipo C Tarjeta gráfica para juegos (ROG-STRIX-RTX-2080S-A8G))</h3>
                <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sequi error, nesciunt est, dolor obcaecati distinctio esse, quibusdam ratione natus necessitatibus eos saepe. Officiis alias cumque facere commodi numquam aliquam maxime.</p>
            </div>

            <div class="col-md-5 order-md-1">
                <img class="featurette-image img-fluid mx-auto" data-src="holder.js/500x500/auto" alt="500x500" style="width: 500px; height: 500px;" src="https://images-na.ssl-images-amazon.com/images/I/813nNe0T6hL._AC_SL1500_.jpg" data-holder-rendered="true">
            </div>
        </div>
        <hr class="featurette-divider " />
        <div class="row">
            <div class="col-md-7">
                <h3 class="featurette-heading">NZXT Kraken M22 4.724 in - RL-KRM22-01 - Enfriador líquido de CPU RGB AIO, Negro</h3>
                <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sequi error, nesciunt est, dolor obcaecati distinctio esse, quibusdam ratione natus necessitatibus eos saepe. Officiis alias cumque facere commodi numquam aliquam maxime.</p>
            </div>

            <div class="col-md-5">
                <img class="featurette-image img-fluid mx-auto" data-src="holder.js/500x500/auto" alt="500x500" style="width: 500px; height: 500px;" src="https://images-na.ssl-images-amazon.com/images/I/71y3zcWjraL._AC_SL1500_.jpg" data-holder-rendered="true">
            </div>
        </div>
        <br />
        <br />
    </div>
    <div id="marcas_contenedor2"></div>
    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <h2>Nosotros</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sequi error, nesciunt est.</p>
                <ul>
                    <li>Software</li>
                    <li>Hardware</li>
                    <li>Matenimiento</li>
                    <li>Ensamblaje</li>
                    <li>Limpieza de Equipos</li>
                </ul>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
            </div>
            <div class="col-lg-6">
                <img class="img-fluid rounded" src="assets/img/logo.png" alt="" style="position: relative; left: 125px;">
            </div>
        </div>
        <br />
        <hr />
        <br />
        <div class="row">
            <div class="col-md-8">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
            </div>
            <div class="col-md-4">
                <a class="btn btn-lg btn-secondary btn-block" href="#">Contactanos</a>
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
    

</asp:Content>
