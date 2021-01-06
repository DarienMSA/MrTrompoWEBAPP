<%-- 
    Document   : index
    Created on : 29 dic 2020, 12:11:32
    Author     : 52811
--%>

<%@page import="com.mycompany.mrtrompoweb.models.pedido"%>
<%@page import="com.mycompany.mrtrompoweb.models.category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mrtrompoweb.models.products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    List<products> menuProducts = (List<products>) request.getAttribute("menuProducts");
    category categoriaActual = (category) request.getAttribute("categoriaActual");
    List<pedido> pedidosActivosCategoria = (List<pedido>) request.getAttribute("pedidosActivosCategoria");
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
        <link rel="stylesheet" href="https://unpkg.com/intro.js/minified/introjs.min.css">
        <link rel="stylesheet" href="https://unpkg.com/intro.js/themes/introjs-modern.css">
        <!-- jQuery and JS bundle w/ Popper.js -->  <!-- DOMICILIO RADIO BUTTON QUITAR CUANDO CAMBIE A ESCRIBIR-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/jquery.validate.min.js"></script>
        <script src="https://unpkg.com/intro.js/minified/intro.min.js"></script>
        <script src="https://unpkg.com/scrollreveal"></script>
        <script src="js/jqueryValidate.js"></script>
        <script src="js/jqueryMenu.js"></script>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="main.css">
        <link rel="icon" href="assets/img/Logo/logoIcon.ico">
        <title>Mr. Trompo</title>

        <script>



            function agregar(nombre, contador) {

                let nombreProducto = nombre;
                $.ajax({

                    method: 'POST',
                    data: {nombreProducto: nombreProducto},
                    url: 'CarroController',
                    error: function (result) {
                        alert("error");
                    },
                    success: function (result) {
                        $("#a-nav-carro").removeClass("disabled");
                        $(".btn-carro-1-" + contador).last().fadeToggle(400, function () {
                            $(".btn-carro-2-" + contador).fadeToggle();
                        });
                    }
                });
            }

            function eliminar(nombre, contador) {

                let nombreProducto = nombre;
                $.ajax({

                    method: 'POST',
                    data: {nombreProducto: nombreProducto},
                    url: 'CarroEliminarController',
                    error: function (result) {
                        alert("error");
                    },
                    success: function (result) {
                        $(".btn-carro-2-" + contador).last().fadeToggle(400, function () {
                            $(".btn-carro-1-" + contador).fadeToggle();
                        });
                        if (result == 0)
                            $("#a-nav-carro").addClass("disabled");
                    }
                });
            }


        </script>
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
                    <li class="nav-item" id="Nav-Acc" <% if (!session.getAttribute("userType").equals("Cliente")) {%> style="display:none;" <%}%>>
                        <a   class="nav-link" href="javascript:introJs().setOption('showProgress', 'true').setOption('nextLabel', 'Siguiente').setOption('prevLabel', 'Anterior').setOption('doneLabel', 'Entendido').start();" onclick="" tabindex="-1" aria-disabled="false"><span> <i class="fas fa-info-circle"></i> ¿Cómo funciona? </span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="MainPageController"><span> <i class="fas fa-home"></i> Inicio </span> </a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle active-nav" href="#" id="navbarDropdown" role="button"
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

                    <li class="nav-item" id="Nav-Acc" <% if (session.getAttribute("userType").equals("Anon")) {%> style="display:none;" <%}%>>
                        <a   class="nav-link" href="CuentaUsuarioController" tabindex="-1" aria-disabled="false"><span> <i class="fas fa-user-circle"></i> Cuenta </span></a>
                    </li>

                    <li class="nav-item nav-carro" id="Nav-Carr"  <% if (session.getAttribute("userType").equals("Anon")) {%> style="display:none;" <%}%>

                        data-step="6"
                        data-title="TUTORIAL MENÚ"
                        data-intro="En el carrito puedes personalizar cada producto agregándole un comentario. También es donde continúas la compra."
                        data-position="right"
                        >
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


        <!---------------------------------------->


        <div class="p-4 p-md-5 mb-4 text-white rounded bg-dark header-menu" style="background-image: url(assets/img/Banner/banner-menu.jpg);">
            <div class="col-md-6 px-0">
                <h1 class="display-4 font-italic"><%=categoriaActual.getCategoria_nombre()%></h1>
                <p class="lead my-3"><%=categoriaActual.getDescripcion()%></p>
            </div>
        </div>


        <div class="container">




            <%
                int contador = 1;
                boolean en_carro = false;
                for (products productosMenu : menuProducts) {
                    en_carro = false;
                    for (pedido pedidosActivos : pedidosActivosCategoria) {
                        if (pedidosActivos.getNombre_prod().equals(productosMenu.getNombre()) && pedidosActivos.isActivo()) {
                            en_carro = true;

                        }
                    }


            %>
            <form action="CarroController" method="POST" id="scrollProd<%=contador%>">
                <div class="row pt-5 pb-5" id="producto<%=productosMenu.getNombre()%>"
                     <% if (contador == 1) {%>
                     data-step="1"
                     data-title="TUTORIAL MENÚ"
                     data-intro="Aquí está la información completa del pedido. Tienes una imagen para que veas como es el producto."
                     data-position="right"
                     <%}%>
                     >

                    <div class="col-11 menu-images"
                         style="background-image: url(<%=productosMenu.getImagen()%>); border-top-left-radius:50px; border-bottom-left-radius:50px;">

                        <div class="row">
                            <div class="col-8"></div>
                            <div class="col-lg-4 col-md-4 pb-5">
                                <h2 class="text-center pt-3 pb-3 text-white nombreProducto" name="nombreProducto"
                                    <% if (contador == 1) {%>
                                    data-step="2"
                                    data-title="TUTORIAL MENÚ"
                                    data-intro="Este es el nombre del producto."
                                    data-position="right"
                                    <%}%>
                                    ><%=productosMenu.getNombre()%></h2>

                                <div class=" text-center" style="height: 100%;">
                                    <p class="text-white"
                                       <% if (contador == 1) {%>
                                       data-step="3"
                                       data-title="TUTORIAL MENÚ"
                                       data-intro="Esta es la descripción del producto."
                                       data-position="right"
                                       <%}%>
                                       ><%=productosMenu.getDescripción()%></p>
                                </div>


                            </div>
                        </div>
                    </div>
                    <div class="col-1 border-right-radius navbarD-bg" style="width:50px; height:485px;">
                    </div>

                    <div class="col-12 mt-5">
                        <h3 class="text-center"
                            <% if (contador == 1) {%>
                            data-step="4"
                            data-title="TUTORIAL MENÚ"
                            data-intro="Este es el costo del producto."
                            data-position="right"
                            <%}%>
                            >Precio: $<%=productosMenu.getPrecio()%></h3>
                        <div class="text-center">
                            <% if (session.getAttribute("userType").equals("Anon")) {%><p>Para hacer pedidos ocupas iniciar sesión.</p><%}%>
                            <a  href="javascript:void(0)"

                                <% if (!en_carro) {%>
                                style="display:none;"
                                <%}%>

                                id="mainPageEliminar<%=contador%>" value="<%=en_carro%>" onclick="eliminar('<%=productosMenu.getNombre()%>', '<%=contador%>')" class="btn-carro-2-<%=contador%> btn btn-danger"><i class="fas fa-trash-alt"></i> Eliminar del carrito</a>
                            <% if (!session.getAttribute("userType").equals("Anon")) {%> 
                            <a id="mainPageCarro<%=contador%>" href="javascript:void(0)"

                               <% if (en_carro) {%>
                               style="display:none;"
                               <%}%>

                               <% if (contador == 1) {%>
                               data-step="5"
                               data-title="TUTORIAL MENÚ"
                               data-intro="Con este botón podrás realizar un pedido de este producto, o eliminarlo si ya lo tienes en el carro."
                               <%}%>

                               value="<%=en_carro%>" onclick="agregar('<%=productosMenu.getNombre()%>', '<%=contador%>')" class="btn-carro-1-<%=contador%> btn btn-warning"><i class="fas fa-shopping-cart"></i> Añadir al
                                carrito</a>

                            <%}%>
                        </div>
                    </div>
                </div>

                <div class="dropdown-divider dp_div2 col-12"></div>
            </form>
            <%
                    contador++;
                }%>
        </div>


        <jsp:include page="footer.jsp"/>
        <script>
            window.sr = ScrollReveal();
            <%
                int contador2 = 1;

                for (products p : menuProducts) {
            %>
            sr.reveal('#scrollProd<%=contador2%>', {
                viewfactor: 0.4,
                duration: 1000,
                origin: 'left',
                distance: '400px'
            });
            <%contador2++;
    }%>
        </script>
    </body>

</html>
