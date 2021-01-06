<%-- 
    Document   : index
    Created on : 29 dic 2020, 12:11:32
    Author     : 52811
--%>

<%@page import="com.mycompany.mrtrompoweb.models.pedido"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mrtrompoweb.models.products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    List<pedido> pedidosActivosUser = (List<pedido>) request.getAttribute("pedidosActivosUser");
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
        <!-- jQuery and JS bundle w/ Popper.js -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/jquery.validate.min.js"></script>
        <script src="https://unpkg.com/intro.js/minified/intro.min.js"></script>
        <script src="js/jqueryValidate.js"></script>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="main.css">

        <script>

            function menos(id, contador) {
                //alert("menos " + id + " " + contador);
                let cantidadActual = $("#cantidad" + contador).text();
                let precioProducto = $("#precio" + contador).text();
                let precioFinal = $("#precioTotal").text();
                if (cantidadActual != 1) {
                    cantidadActual--;
                    $("#cantidad" + contador).text(cantidadActual);

                    precioFinal = Number(precioFinal) - Number(precioProducto);
                    $("#precioTotal").text(precioFinal);
                    let idPedidoProd = id;
                    $.ajax({

                        method: 'POST',
                        data: {idPedidoProd: idPedidoProd,
                            agregar: 0},
                        url: 'CantidadPedidoController',
                        error: function (result) {
                            alert("error");
                        },
                        success: function (result) {


                        }
                    });
                }
            }

            function mas(id, contador) {
                //alert("mas " + id + " " + contador);
                let cantidadActual = $("#cantidad" + contador).text();
                let precioProducto = $("#precio" + contador).text();
                let precioFinal = $("#precioTotal").text();
                cantidadActual++;
                $("#cantidad" + contador).text(cantidadActual);

                precioFinal = Number(precioFinal) + Number(precioProducto);
                $("#precioTotal").text(precioFinal);
                let idPedidoProd = id;
                $.ajax({

                    method: 'POST',
                    data: {idPedidoProd: idPedidoProd,
                        agregar: 1},
                    url: 'CantidadPedidoController',
                    error: function (result) {
                        alert("error");
                    },
                    success: function (result) {


                    }

                });
            }

            function añadirComentario(id, contador) {
                let comentario = $("#comentario" + contador).val();
                let idPedidoProd = id;
                if (comentario == "")
                    comentario = "No hay comentarios.";
                $.ajax({

                    method: 'POST',
                    data: {idPedidoProd: idPedidoProd,
                        comentario: comentario},
                    url: 'ActualizarComentarioController',
                    error: function (result) {
                        alert("error");
                    },
                    success: function (result) {


                    }

                });
            }

            function eliminarPed(nombre) {
                var nombreProducto = nombre;

                //$("#pedido" + idPedido).slideUp();
                //$("#MPC").submit();

                $.ajax({

                    method: 'POST',
                    data: {nombreProducto: nombreProducto},
                    url: 'CarroEliminarController',
                    error: function (result) {
                        alert("error");
                    },
                    success: function (result) {
                        if (result == 0) {
                            $("#MPC").submit();
                        } else {
                            $("#pedido" + nombre).slideUp(400, function () {
                                $("#pedido" + nombre).remove();
                            });

                        }

                    }
                });
            }



        </script>
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
                    <li class="nav-item" id="Nav-Acc" <% if (!session.getAttribute("userType").equals("Cliente")) {%> style="display:none;" <%}%>>
                        <a   class="nav-link" href="javascript:introJs().setOption('showProgress', 'true').setOption('nextLabel', 'Siguiente').setOption('prevLabel', 'Anterior').setOption('doneLabel', 'Entendido').start();" onclick="" tabindex="-1" aria-disabled="false"><span> <i class="fas fa-info-circle"></i> ¿Cómo funciona? </span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="MainPageController"><span> <i class="fas fa-home"></i> Inicio </span> </a>
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

                    <li class="nav-item" id="Nav-Acc" <% if (session.getAttribute("userType").equals("Anon")) {%> style="display:none;" <%}%>>
                        <a   class="nav-link" href="CuentaUsuarioController" tabindex="-1" aria-disabled="false"><span> <i class="fas fa-user-circle"></i> Cuenta </span></a>
                    </li>

                    <li class="nav-item nav-carro" id="Nav-Carr"  <% if (session.getAttribute("userType").equals("Anon")) {%> style="display:none;" <%}%>>
                        <a id="a-nav-carro"  class="nav-link active-nav navg <% if (session.getAttribute("tienePedidos").equals("0")) {%> disabled <%}%>" href="MostrarCarroController" tabindex="-1" aria-disabled="false"><span class="carro"> <i class="fas fa-shopping-cart"></i>  Carrito </span></a>

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

        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
               <li class="breadcrumb-item active" aria-current="page">Carrito</li>
                
            </ol>
        </nav>

        <div class="container mt-5">
            <div class="row">

                <!--Title-->
                <div class="col-12 text-center ">
                    <h3 class="text-warning text-uppercase h6">productos en el carro</h3>
                    <h2 class="">Termina de configurar tu pedido</h2>
                </div>
                <%
                    int precioTotal = 15;
                    int contador = 1;
                    for (pedido pedidosActivos : pedidosActivosUser) {
                        precioTotal += pedidosActivos.getPrecio_total();

                %>
                <!--Pedido-->
                <div class="col-12" id="pedido<%=pedidosActivos.getNombre_prod()%>"

                     data-step="1"
                     data-title="TUTORIAL CARRO"
                     data-intro="Esto engloba un pedido."
                     data-position="right"

                     >
                    <div class="col-12 navbarD-bg border-top-radius mt-5 mb-3 text-white text-center" style="height: 60px;"> Pedido #<%=pedidosActivos.getId_pedido()%>: <%=pedidosActivos.getNombre_prod()%> </div>

                    <ul class="col-12 border rounded"

                        data-step="2"
                        data-title="TUTORIAL CARRO"
                        data-intro="Aquí se muestra la información del producto."
                        data-position="right"

                        >
                        <li class="media">

                            <img src="<%=pedidosActivos.getImagen()%>" class="media-object-img rounded" alt="">
                            <div class="media-body">
                                <h5 class="h6 mb-0 mb-1"><%=pedidosActivos.getCategoria()%></h5>
                                <h4 class="h5 mr-4" style="display:inline;"><%=pedidosActivos.getNombre_prod()%></h4>
                                <h4 class="h5" style="display:inline;">$</h4>
                                <h4 class="h5" id="precio<%=contador%>" style="display:inline;"><%=pedidosActivos.getPrecio()%></h4>
                                <p>
                                    <%=pedidosActivos.getDescripcion()%>
                                </p>
                            </div>
                        </li>
                    </ul>
                    <ul class="col-12 d-flex my-auto mx-auto text-center">
                        <li class="media mx-auto d-flex"

                            data-step="3"
                            data-title="TUTORIAL CARRO"
                            data-intro="Con esto puedes agregar o quitar la cantidad del mismo producto que quieras."
                            data-position="right"

                            >
                            <a  href="javascript:void(0)" onclick="menos('<%=pedidosActivos.getId_pedido()%>', '<%=contador%>')" class="text-reset" style="text-decoration: none;"><i class="fas fa-minus pointer mr-5 d-flex fa-lg"></i></a>
                            <p id="cantidad<%=contador%>" class="fa-lg"><%=pedidosActivos.getCantidad()%></p>
                            <a  href="javascript:void(0)" onclick="mas('<%=pedidosActivos.getId_pedido()%>', '<%=contador%>')" class="text-reset" style="text-decoration: none;"><i class="fas fa-plus pointer ml-5 d-flex fa-lg"></i></a>
                        </li>
                    </ul>
                    <div class="form-group col-12 "

                         data-step="4"
                         data-title="TUTORIAL CARRO"
                         data-intro="Añade un comentario para personalizar tu pedido."
                         data-position="right"

                         >
                        <label for="exampleFormControlTextarea1">Comentarios acerca del pedido</label>
                        <textarea class="form-control" id="comentario<%=contador%>" onfocusout="añadirComentario('<%=pedidosActivos.getId_pedido()%>','<%=contador%>')" rows="3" placeholder="Personaliza tu <%=pedidosActivos.getNombre_prod()%>"><%if (!pedidosActivos.getComentario().equals("No hay comentarios.")) {%><%=pedidosActivos.getComentario()%><%}%></textarea>
                    </div>

                    <div class="col-12 mb-5 text-right">
                        <form id="MPC" action="MainPageController" method="GET">
                            <button id="EliminarPedido<%=pedidosActivos.getNombre_prod()%>" onclick="eliminarPed('<%=pedidosActivos.getNombre_prod()%>')" type="button" class="btn btn-danger"

                                    data-step="5"
                                    data-title="TUTORIAL CARRO"
                                    data-intro="Con este botón puedes eliminar el pedido."
                                    data-position="right"

                                    > <i class="fas fa-trash-alt"></i> Eliminar pedido
                            </button>
                        </form>
                    </div>


                    <div class="row">
                        <div class="col-3"></div>
                        <div class="col-6 navbarD-bg border-bottom-radius" style="height: 60px;"></div>
                        <div class="col-3"></div>
                    </div>
                </div>
                <!--Pedido-->
                <%contador++;
                    }%>
                <div class="col-xl-10 col-md-12"></div>
                <div class="col-xl-2 	col-md-12 text-center"

                     data-step="6"
                     data-title="TUTORIAL CARRO"
                     data-intro="Este es el precio total de la orden."
                     data-position="right"

                     >
                    <h3>Monto Total:</h3>
                    <h2 style="display:inline;">$</h2>
                    <h2 id="precioTotal" style="display:inline;"><%=precioTotal%></h2>
                </div>
                <span class=" col-12 text-muted text-right">Se incluye 15 pesos por el envío.</span>
                <div class="col-12 text-right mt-5">
                    <form action="DomicilioController" method="POST">
                        <button type="submit" class="btn btn-success"> <i class="fas fa-arrow-alt-circle-right"></i> Continuar
                            con la compra </button>
                    </form>
                </div>
            </div>



        </div>

        <jsp:include page="footer.jsp"/>
    </body>

</html>
