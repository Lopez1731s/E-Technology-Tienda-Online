<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="Sistema_VentasBeta3.Pages.FAQ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container animated fadeInUp">
        <h1>F.A.Q</h1>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><asp:LinkButton ID="Inicio" runat="server" OnClick="Inicio_Click" class="text-decoration-none">Inicio</asp:LinkButton></li>
            <li class="breadcrumb-item active">F.A.Q</li>
        </ol>

        <div class="accordion" id="faqExample">
            <br />
            <h4>Preguntas Generales</h4>
            <div class="card">
                <div class="card-header p-2" id="headingOne">
                    <h5 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            Pregunta #1
                        </button>
                        </h5>
                </div>

                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#faqExample">
                    <div class="card-body">
                        <b>Lorem ipsum dolor sit amet consectetur adipiscing elit tincidunt?</b><br />
                        Lorem ipsum dolor sit amet consectetur adipiscing elit tincidunt, quam tellus commodo magnis lacus nibh eleifend luctus morbi, dictumst nec malesuada ultricies facilisis hendrerit phasellus. Consequat ad potenti urna posuere torquent commodo curae elementum mauris mattis et massa tempor arcu enim, cursus natoque sodales vel primis ut est dignissim taciti ornare placerat donec volutpat curabitur.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header p-2" id="headingTwo">
                    <h5 class="mb-0">
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        Pregunta #2
                    </button>
                    </h5>
                </div>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#faqExample">
                    <div class="card-body">
                        <b>Lorem ipsum dolor sit amet consectetur adipiscing elit tincidunt?</b><br />
                        Primis tincidunt mollis egestas netus ac dui parturient dapibus per vestibulum hac iaculis, platea odio porttitor nisi felis dis diam varius fames litora pretium. Dictumst cubilia pulvinar magna tempor dignissim commodo ridiculus, libero proin turpis euismod velit est aptent facilisi, nibh cras montes diam inceptos natoque. Tincidunt viverra dui quisque dignissim dapibus penatibus quis, metus suspendisse conubia aliquam taciti mollis.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header p-2" id="headingThree">
                    <h5 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            Pregunta #3
                        </button>
                        </h5>
                </div>
                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#faqExample">
                    <div class="card-body">
                        <b>Lorem ipsum dolor sit amet consectetur adipiscing elit tincidunt?</b><br />
                        Vel eros donec ac odio tempor orci. Nisi lacus sed viverra tellus in hac habitasse. Sollicitudin tempor id eu nisl. A diam sollicitudin tempor id eu. Ac feugiat sed lectus vestibulum mattis ullamcorper velit. Consequat interdum varius sit amet. Cras tincidunt lobortis feugiat vivamus at augue.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header p-2" id="headingFour">
                    <h5 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            Pregunta #4
                        </button>
                        </h5>
                </div>
                <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#faqExample">
                    <div class="card-body">
                        <b>Lorem ipsum dolor sit amet consectetur adipiscing elit tincidunt?</b><br />
                        Tortor id aliquet lectus proin nibh nisl condimentum. Mi eget mauris pharetra et ultrices neque ornare aenean euismod. Volutpat diam ut venenatis tellus in metus.
                    </div>
                </div>
            </div>
        </div>

        <div class="accordion" id="faqExample2">
            <br />
            <h4>Provedores</h4>
            <div class="card">
                <div class="card-header p-2" id="headingFive">
                    <h5 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                            Pregunta #3
                        </button>
                        </h5>
                </div>
                <div id="collapseFive" class="collapse show" aria-labelledby="headingFive" data-parent="#faqExample2">
                    <div class="card-body">
                        <b>Lorem ipsum dolor sit amet consectetur adipiscing elit tincidunt?</b><br />
                        Vel eros donec ac odio tempor orci. Nisi lacus sed viverra tellus in hac habitasse. Sollicitudin tempor id eu nisl. A diam sollicitudin tempor id eu. Ac feugiat sed lectus vestibulum mattis ullamcorper velit. Consequat interdum varius sit amet. Cras tincidunt lobortis feugiat vivamus at augue.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header p-2" id="headingSix">
                    <h5 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                            Pregunta #4
                        </button>
                        </h5>
                </div>
                <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#faqExample2">
                    <div class="card-body">
                        <b>Lorem ipsum dolor sit amet consectetur adipiscing elit tincidunt?</b><br />
                        Tortor id aliquet lectus proin nibh nisl condimentum. Mi eget mauris pharetra et ultrices neque ornare aenean euismod. Volutpat diam ut venenatis tellus in metus.
                    </div>
                </div>
            </div>
        </div>

        <div class="accordion" id="faqExample3">
            <br />
            <h4>Otros</h4>
            <div class="card">
                <div class="card-header p-2" id="headingO">
                    <h5 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseO" aria-expanded="true" aria-controls="collapseO">
                            Pregunta #1
                        </button>
                        </h5>
                </div>
                <div id="collapseO" class="collapse show" aria-labelledby="headingO" data-parent="#faqExample3">
                    <div class="card-body">
                        <b>Lorem ipsum dolor sit amet consectetur adipiscing elit tincidunt?</b><br />
                        Lorem ipsum dolor sit amet consectetur adipiscing elit tincidunt, quam tellus commodo magnis lacus nibh eleifend luctus morbi, dictumst nec malesuada ultricies facilisis hendrerit phasellus. Consequat ad potenti urna posuere torquent commodo curae elementum mauris mattis et massa tempor arcu enim, cursus natoque sodales vel primis ut est dignissim taciti ornare placerat donec volutpat curabitur.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header p-2" id="headingT">
                    <h5 class="mb-0">
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseT" aria-expanded="false" aria-controls="collapseT">
                        Pregunta #2
                    </button>
                    </h5>
                </div>
                <div id="collapseT" class="collapse" aria-labelledby="headingT" data-parent="#faqExample3">
                    <div class="card-body">
                        <b>Lorem ipsum dolor sit amet consectetur adipiscing elit tincidunt?</b><br />
                        Primis tincidunt mollis egestas netus ac dui parturient dapibus per vestibulum hac iaculis, platea odio porttitor nisi felis dis diam varius fames litora pretium. Dictumst cubilia pulvinar magna tempor dignissim commodo ridiculus, libero proin turpis euismod velit est aptent facilisi, nibh cras montes diam inceptos natoque. Tincidunt viverra dui quisque dignissim dapibus penatibus quis, metus suspendisse conubia aliquam taciti mollis.
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header p-2" id="headingTh">
                    <h5 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTh" aria-expanded="false" aria-controls="collapseTh">
                            Pregunta #3
                        </button>
                        </h5>
                </div>
                <div id="collapseTh" class="collapse" aria-labelledby="headingTh" data-parent="#faqExample3">
                    <div class="card-body">
                        <b>Lorem ipsum dolor sit amet consectetur adipiscing elit tincidunt?</b><br />
                        Vel eros donec ac odio tempor orci. Nisi lacus sed viverra tellus in hac habitasse. Sollicitudin tempor id eu nisl. A diam sollicitudin tempor id eu. Ac feugiat sed lectus vestibulum mattis ullamcorper velit. Consequat interdum varius sit amet. Cras tincidunt lobortis feugiat vivamus at augue.
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />

    </div>
    <script src="../Scripts/jquery.min.js"></script>
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</asp:Content>
