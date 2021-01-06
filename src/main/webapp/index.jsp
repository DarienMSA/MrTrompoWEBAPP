<%-- 
    Document   : index
    Created on : 29 dic 2020, 12:11:32
    Author     : 52811
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.mrtrompoweb.models.products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    List<products> bestSellers = (List<products>) request.getAttribute("prodBestSellers");
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
        <!-- jQuery and JS bundle w/ Popper.js -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/jquery.validate.min.js"></script>
        <script src="https://unpkg.com/scrollreveal"></script>
        <script src="js/jqueryValidate.js"></script>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="main.css">
        
        <link rel="icon" href="assets/img/Logo/logoIcon.ico">
        <title>Mr. Trompo</title>
    </head>

    <body>

        <nav class="navbar navbar-expand-lg navbar-dark navbarD-bg">
            <a class="navbar-brand ml-5" href="MainPageController">
                <img src="assets/img/Logo/Mr Trompo2.png" class="img-fluid" width="150" height="47" alt="" loading="lazy" /></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav nav-pills ml-auto mr-5">
                    <li class="nav-item">
                        <a class="nav-link  active-nav" href="MainPageController"><span> <i class="fas fa-home"></i> Inicio </span> </a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span>
                                <i class="fas fa-utensils"></i> Menú
                            </span>
                        </a>
                        <div class="dropdown-menu bg-light" aria-labelledby="navbarDropdown">
                            <form action="MenuController" method="GET">
                                <button type="submit" name="categoria" class="btn btn-light mx-auto d-flex" value="Tacos de harina" >Tacos de harina</button>
                            </form>
                            <form action="MenuController" method="GET">
                                <button type="submit" name="categoria" class="btn btn-light mx-auto d-flex" value="Tacos de maíz" >Tacos de maíz</button>
                            </form>
                            <div class="dropdown-divider"></div>
                            <form action="MenuController" method="GET">
                                <button type="submit" name="categoria" class="btn btn-light mx-auto d-flex" value="Burgers" >Burgers</button>
                            </form>
                            <form action="MenuController" method="GET">
                                <button type="submit" name="categoria" class="btn btn-light mx-auto d-flex" value="Parrilladas" >Parrilladas</button>
                            </form>
                            <div class="dropdown-divider"></div>
                            <form action="MenuController" method="GET">
                                <button type="submit" name="categoria" class="btn btn-light mx-auto d-flex" value="Para acompañar" >Para acompañar</button>
                            </form>
                        </div>
                    </li>
                    <% if (session.getAttribute("userType").equals("Admin")) {%>
                    <li class="nav-item" id="Nav-Acc" <% if (session.getAttribute("userType").equals("Anon")) {%> style="display:none;" <%}%>>
                        <a   class="nav-link" href="AdminPerfil" tabindex="-1" aria-disabled="false"><span> <i class="fas fa-user-circle"></i> Cuenta </span></a>
                    </li>
                    <%} else {%>
                    <li class="nav-item" id="Nav-Acc" <% if (session.getAttribute("userType").equals("Anon")) {%> style="display:none;" <%}%>>
                        <a   class="nav-link" href="CuentaUsuarioController" tabindex="-1" aria-disabled="false"><span> <i class="fas fa-user-circle"></i> Cuenta </span></a>
                    </li>
                    <%}%>
                    <li class="nav-item nav-carro" id="Nav-Carr"  <% if (session.getAttribute("userType").equals("Anon")) {%> style="display:none;" <%}%>>
                        <a id="a-nav-carro"  class="nav-link navg <% if (session.getAttribute("tienePedidos").equals("0")) {%> disabled <%}%>" href="MostrarCarroController" tabindex="-1" aria-disabled="false"><span class="carro"> <i class="fas fa-shopping-cart"></i>  Carrito </span></a>

                    </li>

                    <li class="nav-item" id="Nav-Is" <% if (!session.getAttribute("userType").equals("Anon")) {%> style="display:none;" <%}%>>
                        <a  class="nav-link" href="#" tabindex="-1" aria-disabled="false" data-toggle="modal" data-target="#iniciarSesion"><span> <i class="fas fa-sign-in-alt"></i> Iniciar Sesión </span></a>
                    </li>
                    <li class="nav-item" id='Nav-Reg' <% if (!session.getAttribute("userType").equals("Anon")) {%> style="display:none;" <%}%>>
                        <a  class="nav-link" href="#" tabindex="-1" aria-disabled="false" data-toggle="modal" data-target="#registrarse"><span> <i class="fas fa-user-plus"></i> Registrarse </span></a>
                    </li>
                    <li class="nav-item" id='Nav-Cerrar' <% if (session.getAttribute("userType").equals("Anon")) {%> style="display:none;" <%}%>>
                        <a  class="nav-link" href="CerrarSesionController"><span> <i class="fas fa-sign-out-alt"></i> Cerrar Sesión </span></a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="modal fade" id="registrarse" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <form id="formReg" action='RegistroController' method="post">
                        <div class="modal-header text-center text-white navbarD-bg" >
                            <h4 class="modal-title text-center w-100 font-weight-bold">Regístrate</h4>
                            <button type="button" class="close text-white" data-dismiss="modal" aria-lable="close">&times;</button>
                        </div>
                        <div class="modal-body mx-3">
                            <div class="md-form mb-5">
                                <i class="fas fa-user prefix grey-text"></i> <label data-error="wrong" data-success="right" > &nbsp;Ingresa un nombre</label>
                                <input type="text" class="form-control validate" name="nameReg" id="nameReg">


                            </div>
                            <div class="md-form mb-5">
                                <i class="fas fa-envelope prefix grey-text"></i><label data-error="wrong" data-success="right" >&nbsp;Ingresa un correo electrónico</label>
                                <input type="email" class="form-control validate" name="emailReg" id="emailReg">
                                <label id="nameReg-error-db" >Ya existe un usuario con ese Correo Electrónico</label>

                            </div>
                            <div class="dropdown-divider dp_div2 col-12"></div>
                            <div class="md-form mb-3">
                                <i class="fas fa-key prefix grey-text"></i> <label data-error="wrong" data-success="right" > &nbsp;Ingresa una contraseña</label>
                                <input type="password" class="form-control validate" name="passwordReg" id="passwordReg">

                            </div>
                            <div class="md-form mb-5">
                                <i class="fas fa-key prefix grey-text"></i> <label data-error="wrong" data-success="right" > &nbsp;Confirma la contraseña</label>
                                <input type="password" class="form-control validate" name="password2Reg">

                            </div>
                        </div>

                        <div class="modal-footer d-flex justify-content-center">
                            <button class="btn btn-success" id="botonReg">Registrarse</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal fade" id="iniciarSesion">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <form id="formIS" action="InicioSesionController" method="post">
                        <div class="modal-header text-center navbarD-bg">
                            <h4 class="modal-title text-center w-100 font-weight-bold text-white">Inicia Sesión</h4>
                            <button type="button" class="close text-white" data-dismiss="modal" aria-lable="close">&times;</button>
                        </div>
                        <div class="modal-body mx-3">

                            <div class="md-form mb-5">
                                <i class="fas fa-envelope prefix grey-text"></i> <label data-error="wrong" data-success="right">&nbsp;Ingresa tu correo electrónico</label>
                                <input type="email" class="form-control validate" name="emailIS" id="emailIS">
                                <label id="emailIS-error-db" >El correo que ha ingresado es incorrecto</label>

                            </div>

                            <div class="md-form mb-3">
                                <i class="fas fa-key prefix grey-text"></i> <label data-error="wrong" data-success="right">&nbsp;Ingresa tu contraseña</label>
                                <input type="password" class="form-control validate" name="passwordIS" id="passwordIS">
                                <label id="passwordIS-error-db" >La contraseña que ha ingresado es incorrecta</label>
                            </div>

                        </div>

                        <div class="modal-footer d-flex justify-content-center">
                            <button class="btn btn-success" id="botonIS">Iniciar Sesión</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal fade" id="usuarioregistrado" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <div class="modal-header text-center navbarD-bg">
                        <h4 class="modal-title text-center w-100 font-weight-bold text-white">Enhorabuena</h4>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-lable="close">&times;</button>
                    </div>
                    <div class="modal-body mx-3 text-center">
                        <h3>¡Te has registrado e iniciado sesión con éxito!</h3>
                    </div>

                    <div class="modal-footer d-flex justify-content-center">
                        <form action="MainPageController" method="GET">
                            <button class="btn btn-primary" id="botonIS">Confirmar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="usuarioiniciado" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <div class="modal-header text-center navbarD-bg">
                        <h4 class="modal-title text-center w-100 font-weight-bold text-white">Enhorabuena</h4>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-lable="close">&times;</button>
                    </div>
                    <div class="modal-body mx-3 text-center">
                        <h3>¡Has iniciado sesión con éxito!</h3>
                    </div>

                    <div class="modal-footer d-flex justify-content-center">
                        <form action="MainPageController" method="GET">
                            <button class="btn btn-primary" id="botonIS">Confirmar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <div class="header">
            <div class="text-header d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8">
                            <h2>Mr. <span>Trompo</span></h2>
                            <br>
                            <p>
                                Hace 20 años da inicio nuestro concepto de sabor y sazón. Los colores y sabores de nuestros deliciosos
                                guisos fueron parte fundamental para que ahora nuestro negocio sea una de las cadenas restauranteras más
                                pedidas por la gente de nuestro Estado. Nuevo León.</p>
                            <br>
                            <p>Mr. Trompo tiene como misión, ser la mejor cadena de restaurantes de comida regional mas pedida, con el
                                objetivo de satisfacer al comenzal desde el más simple hasta el paladar mas exigente.</p>
                            <br>
                            <p>
                                Actualmente nos encontramos en la etapa de desarrollo de nuestro paquete de franquicias para ofrecerle a
                                usted una oportunidad de negocio.
                            </p>
                            <a href=""><span></span></a>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!--
        <div class="row">
          <div class="col-12">
            <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-ride="carousel">
              <ol class="carousel-indicators">
                <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
              </ol>
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="/assets/img//Comida/trompo.jpg" class="d-block w-100" alt="...">
                  <div class="carousel-caption d-md-block">
      
                    <h5 class="col-12">Tacos incomparables</h5>
                    <p class="col-12">¡Los tacos que prepara Mr. Trompo son inigualables!</p>
      
                  </div>
                </div>
                <div class="carousel-item">
                  <img src="/assets/img/Comida/Hamburguesa.jpg" class="d-block w-100" alt="...">
                  <div class="carousel-caption d-md-block">
                    <h5>Ricas hamburguesas</h5>
                    <p>¡Prueba nuestras hamburguesas de la casa!</p>
                  </div>
                </div>
                <div class="carousel-item">
                  <img src="/assets/img/Comida/papasfritas.jpg" class="d-block w-100" alt="...">
                  <div class="carousel-caption d-md-block">
                    <h5>Complementos</h5>
                    <p>¿Quieres papas fritas o refresco? !Pídelo sin dudar!</p>
                  </div>
                </div>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
          </div>
        </div>
        -->



        <div class="container-fluid mt-5" id="masV">
            <div class="row">
                <div class="col-12">
                    <h2 class="text-center text-danger">LO MÁS PEDIDO</h2>
                </div>
            </div>
            <div class="row">
                <%
                    int contador = 1;

                    for (products masVendidos : bestSellers) {
                %>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 pb-5" id="cardProd<%=contador%>">
                    <div class="card mx-auto shadow" >
                        <img class="card-img-top" src="<%=masVendidos.getImagen()%>" alt="Card image cap">
                        <div class="card-body" >
                            <h5 class="card-title"><%=masVendidos.getNombre()%></h5>
                            <p class="card-text" style="height:100px;"><%=masVendidos.getDescripción()%></p>
                            <div class="card-footer text-center">
                                <a href="MenuController?categoria=<%=masVendidos.getCategoria()%>#producto<%=masVendidos.getNombre()%>" class="btn btn-info"><i class="fas fa-search"></i>&nbsp;&nbsp;&nbsp;Ver más</a>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                        contador++;
                    }%>


            </div>

        </div>

        <jsp:include page="footer.jsp"/>
        
        <script>
            window.sr = ScrollReveal();
            <%
                    int contador2 = 1;

                    for (products masVendidos : bestSellers) {
            %>
            sr.reveal('#cardProd<%=contador2%>', {
                viewfactor:0.2,
                duration: 2000,
                origin: 'bottom',
                distance:'400px'
            });
<%contador2++;}%>
        </script>
    </body>

</html>

