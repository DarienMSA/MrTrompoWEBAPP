<%-- 
    Document   : index
    Created on : 29 dic 2020, 12:11:32
    Author     : 52811
--%>

<%@page import="com.mycompany.mrtrompoweb.models.orden"%>
<%@page import="com.mycompany.mrtrompoweb.models.pedido"%>
<%@page import="com.mycompany.mrtrompoweb.models.user"%>
<%@page import="com.mycompany.mrtrompoweb.models.address"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    user User = (user) request.getAttribute("UserCuenta");
    List<address> direccionesUser = (List<address>) request.getAttribute("direccionesUser");
    List<orden> ordenesUser = (List<orden>) request.getAttribute("ordenesUser");
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

        <script src="js/jqueryValidate.js"></script>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="main.css">

        <script>


            $(document).ready(function () {





                $("#btn-Modif-Dom").click(function () {
                    let faltaDatos = 0;
                    let CodigoPostal = $('#CodigoPostalEM').val();
                    let Colonia = $('#ColoniaEM').val();
                    let Calle = $('#CalleEM').val();
                    let Referencias = $('#ReferenciasEM').val();
                    let NumExterior = $('#NumExteriorEM').val();
                    let NumInterior = $('#NumInteriorEM').val();
                    let Telefono = $('#TelefonoEM').val();
                    let Nombre = $('#NombreEM').val();
                    let id = $('#idDomicilio').val();

                    if (CodigoPostal == "" || CodigoPostal == "Dato necesario.") {
                        $('#CodigoPostalEM').val("Dato necesario.");
                        faltaDatos = 1;
                    }
                    if (Colonia == "" || Colonia == "Dato necesario.") {
                        $('#ColoniaEM').val("Dato necesario.");
                        faltaDatos = 1;
                    }
                    if (Calle == "" || Calle == "Dato necesario.") {
                        $('#CalleEM').val("Dato necesario.");
                        faltaDatos = 1;
                    }
                    if (NumInterior == "" || NumInterior == "Dato necesario.") {
                        $('#NumInteriorEM').val("Dato necesario.");
                        faltaDatos = 1;
                    }
                    if (Telefono == "" || Telefono == "Dato necesario.") {
                        $('#TelefonoEM').val("Dato necesario.");
                        faltaDatos = 1;
                    }
                    if (Nombre == "" || Nombre == "Dato necesario.") {
                        $('#NombreEM').val("Dato necesario.");
                        faltaDatos = 1;
                    }
                    if (faltaDatos == 0) {
                        $.ajax({

                            method: 'POST',
                            data: {CodigoPostal: CodigoPostal,
                                Colonia: Colonia,
                                Calle: Calle,
                                Referencias: Referencias,
                                NumExterior: NumExterior,
                                NumInterior: NumInterior,
                                Telefono: Telefono,
                                Nombre: Nombre,
                                id: id},
                            url: 'ModificarDomicilio',
                            error: function (result) {
                                alert("error");
                            },
                            success: function (result) {

                                $('#ColoniaCalleNumInterior' + id).text(Colonia + ", " + Calle + ", " + NumInterior);
                                $('#NombreDireccion' + id).text(Nombre);

                                $("#mostrarDomicilio").modal('hide');
                            }
                        });
                    }
                });

                $("#btn-Crear-Dom").click(function () {
                    let faltaDatos = 0;
                    let CodigoPostal = $('#CodigoPostalC').val();
                    let Colonia = $('#ColoniaC').val();
                    let Calle = $('#CalleC').val();
                    let Referencias = $('#ReferenciasC').val();
                    let NumExterior = $('#NumExteriorC').val();
                    let NumInterior = $('#NumInteriorC').val();
                    let Telefono = $('#TelefonoC').val();
                    let Nombre = $('#NombreC').val();


                    if (CodigoPostal == "" || CodigoPostal == "Dato necesario.") {
                        $('#CodigoPostalC').val("Dato necesario.");
                        faltaDatos = 1;
                    }
                    if (Colonia == "" || Colonia == "Dato necesario.") {
                        $('#ColoniaC').val("Dato necesario.");
                        faltaDatos = 1;
                    }
                    if (Calle == "" || Calle == "Dato necesario.") {
                        $('#CalleC').val("Dato necesario.");
                        faltaDatos = 1;
                    }
                    if (NumInterior == "" || NumInterior == "Dato necesario.") {
                        $('#NumInteriorC').val("Dato necesario.");
                        faltaDatos = 1;
                    }
                    if (Telefono == "" || Telefono == "Dato necesario.") {
                        $('#TelefonoC').val("Dato necesario.");
                        faltaDatos = 1;
                    }
                    if (Nombre == "" || Nombre == "Dato necesario.") {
                        $('#NombreC').val("Dato necesario.");
                        faltaDatos = 1;
                    }
                    if (faltaDatos == 0) {
                        $.ajax({

                            method: 'POST',
                            data: {CodigoPostal: CodigoPostal,
                                Colonia: Colonia,
                                Calle: Calle,
                                Referencias: Referencias,
                                NumExterior: NumExterior,
                                NumInterior: NumInterior,
                                Telefono: Telefono,
                                Nombre: Nombre},
                            dataType: 'JSON',
                            url: 'CrearDomicilioPerfil',
                            error: function (result) {
                                alert("error");
                            },
                            success: function (result) {

                                var div = "<a id='domicilioID" + result.nuevoId + "' href='javascript:void(0)' style='width:106%;' onclick=\"mostrarDireccion('" + result.nuevoId + "', '1')\" class='list-group-item list-group-item-action' aria-current='true' data-toggle='modal'>" +
                                        "<div class='d-flex w-100 justify-content-between'>" +
                                        "<h5 id='NombreDireccion" + result.nuevoId + "' class='mb-1'>" + Nombre + "</h5>" +
                                        "<small >" + result.fechaHoy + "</small>" +
                                        "</div>" +
                                        "<p id='ColoniaCalleNumInterior" + result.nuevoId + "'>" + Colonia + ", " + Calle + ", " + result.nuevoId + ", " + NumInterior + "</p>" +
                                        "<br>" +
                                        "<p>Click para modificar o eliminar.</p>" +
                                        "</a>";

                                $("#ListaDirecciones").append(div);
                                $("#SinDomicilios").hide();
                                $("#crearDomicilio").modal('hide');
                            }
                        });
                    }
                });

                $("#btn-Elim-Dom").click(function () {
                    let id = $('#idDomicilio').val();

                    $.ajax({

                        method: 'POST',
                        data: {id: id},
                        url: 'EliminarDomicilio',
                        error: function (result) {
                            alert("error");
                        },
                        success: function (result) {
                            $("#domicilioID" + id).empty();
                            $("#domicilioID" + id).remove();

                            $("#mostrarDomicilio").modal('hide');
                            $("#ConfirmarElim").modal('hide');
                            let contenido = $("#ListaDirecciones").text();
                        }
                    });
                });

            });

            function mostrarOrden(id, contador) {
                let orden = $("#orden" + contador).val();
                let idOrden = id;

                $("#info").empty();
                //alert("orden: " + idOrden + " contador: " + contador);
                $.ajax({

                    method: 'POST',
                    data: {idOrden: idOrden},
                    dataType: 'JSON',
                    url: 'MostrarOrden',
                    error: function (result) {
                        alert("error");
                    },
                    success: function (result) {
                        $("#ordenID").text(idOrden);
                        $("#PrecioTotalOrden").text($("#precioTotal" + contador).text());

                        $.each(result, function (k, v) {

                            var div = "<div class='container-fluid'> <h2 class='text-center'> Pedido: #" + v.id_pedido + "</h2> </div>" +
                                    "<div class='row text-center pt-5'>" +
                                    "<div class='col-lg-12 col-md-12 py-5 grid-blue1 display-images' style='background-image: url(" + v.imagen + "); border-top-left-radius:50px; border-top-right-radius:50px;'></div>" +
                                    "<div class='col-lg-4 col-md-6 py-5 grid-blue1'>" +
                                    "<h5>Nombre del producto</h5>" +
                                    "<p>" + v.nombre_prod + "</p>" +
                                    "</div>" +
                                    "<div class='col-lg-4 col-md-6 py-5 grid-blue2''>" +
                                    "<h5>Categoría</h5>" +
                                    "<p>" + v.categoria + "</p>" +
                                    "</div>" +
                                    "<div class='col-lg-4 col-md-6 py-5 grid-blue1''>" +
                                    "<h5>Comentario</h5>" +
                                    "<p>" + v.comentario + "</p>" +
                                    "</div>" +
                                    "<div class='col-lg-6 col-md-6 py-5 grid-blue2''>" +
                                    "<h5>Descripción</h5>" +
                                    "<p>" + v.descripcion + "</p>" +
                                    "</div>" +
                                    "<div class='col-lg-3 col-md-6 py-5 grid-blue1'>" +
                                    "<h5>Precio</h5>" +
                                    "<p>" + v.precio + "</p>" +
                                    "</div>" +
                                    "<div class='col-lg-3 col-md-6 py-5 grid-blue2'>" +
                                    "<h5>Cantidad</h5>" +
                                    "<p>" + v.cantidad + "</p>" +
                                    "</div>" +
                                    "</div>" +
                                    "<div class=dropdown-divider dp_div2 col-12'></div>";
                            $("#info").append(div);



                        });



                    }

                });
            }

            function mostrarDireccion(id, contador) {
                let idAddress = id;

                $("#info").empty();
                //alert("orden: " + idOrden + " contador: " + contador);
                $.ajax({

                    method: 'POST',
                    data: {idAddress: idAddress},
                    dataType: 'JSON',
                    url: 'MostrarDireccionController',
                    error: function (result) {
                        alert("error");
                    },
                    success: function (result) {
                        $('#CodigoPostalEM').val(result.CodigoPostal);
                        $('#ColoniaEM').val(result.Colonia);
                        $('#CalleEM').val(result.Calle);
                        $('#ReferenciasEM').val(result.Referencias);
                        $('#NumExteriorEM').val(result.NumExterior);
                        $('#NumInteriorEM').val(result.NumInterior);
                        $('#TelefonoEM').val(result.Telefono);
                        $('#NombreEM').val(result.Nombre);
                        $('#idDomicilio').val(result.Id);



                        $("#mostrarDomicilio").modal('show');
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
                        <a   class="nav-link active-nav" href="CuentaUsuarioController" tabindex="-1" aria-disabled="false"><span> <i class="fas fa-user-circle"></i> Cuenta </span></a>
                    </li>

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


        <div class="p-4 p-md-5 mb-4 text-white rounded bg-dark header-menu" style="background-image: url(assets/img/Banner/banner-perfil.jpg);">
            <div class="col-md-12 px-0 text-center">
                <h3 class="font-italic" style="display:inline;">Es bueno verte otra vez,   </h3><h1 class="display-4 font-italic text-center" style="display:inline;"> <%=User.getName()%></h1>

                <p class="lead my-3"><%=User.getEmail()%></p>
            </div>
        </div>

        <div class="container">
            <div class="row pt-5">
                <div class="col-lg-4 col-md-12 col-sm-12">
                    <h1 class="col-12 text-center">Tus ordenes</h1>
                    <div class="list-group col-12 border" style="overflow-y: scroll; height: 450px;">
                        <%if (ordenesUser.isEmpty()) {%>
                        <small class="text-center text-muted" id="SinPedidos">No has hecho pedidos.</small>
                        <%}%>
                        <%
                            int contador = 1;
                            for (orden o : ordenesUser) {

                        %>

                        <a id="orden<%=contador%>" href="javascript:void(0)" style="width:106%;" onclick="mostrarOrden('<%=o.getId_orden()%>', '<%=contador%>')" class="list-group-item list-group-item-action" aria-current="true" data-toggle="modal"
                           data-target="#mostrarPedido">
                            <div class="d-flex w-100 justify-content-between">
                                <h5 id="id_pedido" class="mb-1">No. de Orden: #<%=o.getId_orden()%></h5>
                                <small><%=o.getFecha()%></small>
                            </div>
                            <br>
                            <p style="display:inline;">Precio: $<p style="display:inline;" id="precioTotal<%=contador%>"><%=o.getPrecio_final()%></p></p>
                        </a>

                        <%        contador++;
                            }

                        %>

                    </div>

                </div>
                <div class="col-4 " style="height: 225px;"></div>
                <div class="col-lg-4 col-md-12 col-sm-12">
                    <h1 class="col-12 text-center">Domicilios</h1>
                    <div class="list-group col-12 border" style="overflow-y: scroll; height: 450px;" id="ListaDirecciones"> <!--max-height-->

                        <%if (direccionesUser.isEmpty()) {%>
                        <small class="text-center text-muted" id="SinDomicilios">No tienes domicilios guardados.</small>
                        <%}%>

                        <%                            int contador2 = 1;
                            for (address a : direccionesUser) {

                        %>
                        <a id="domicilioID<%=a.getId_address()%>" href="javascript:void(0)" style="width:106%;" onclick="mostrarDireccion('<%=a.getId_address()%>', '<%=contador2%>')" class="list-group-item list-group-item-action" aria-current="true" data-toggle="modal"
                           >
                            <div class="d-flex w-100 justify-content-between">
                                <h5 id="NombreDireccion<%=a.getId_address()%>" class="mb-1"><%=a.getNombreDireccion()%></h5>
                                <small ><%=a.getFechaCreacion()%></small>
                            </div>
                            <p id="ColoniaCalleNumInterior<%=a.getId_address()%>"><%=a.getColonia()%>, <%=a.getCalle()%>, <%=a.getNum_interior()%></p>

                            <br>
                            <p>Click para modificar o eliminar.</p>
                        </a>

                        <%        contador2++;
                            }

                        %>
                    </div>
                    <div class="col-12 text-center pt-3">
                        <button class="btn btn-primary" data-toggle="modal" data-target="#crearDomicilio"> Agregar Domicilio
                        </button>
                    </div>
                </div>
            </div>
        </div>





        <div class="modal fade" id="crearDomicilio">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">

                    <div class="modal-header text-center navbarD-bg">
                        <h4 class="modal-title text-center w-100 font-weight-bold text-white">Agrega un Domicilio</h4>
                        <button type="button" class="close text-white" data-dismiss="modal"
                                aria-lable="close">&times;</button>
                    </div>
                    <div class="modal-body mx-3">

                        <div class="container-fluid">
                            <div class="row m-0 p-0">
                                <div class="col-lg-4 col-md-6">
                                    <div class="md-form mb-5">
                                        <i class="fas fa-mail-bulk fa-2x"></i> <label data-error="wrong"
                                                                                      data-success="right">&nbsp;Código
                                            Postal</label>
                                        <input type="number" class="form-control validate" id="CodigoPostalC" validate>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="md-form mb-5">
                                        <i class="fas fa-map-signs fa-2x"></i></i> <label data-error="wrong"
                                                                                          data-success="right">&nbsp;Colonia</label>
                                        <input type="text" class="form-control validate" id="ColoniaC" validate>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="md-form mb-5">
                                        <i class="fas fa-street-view fa-2x"></i> <label data-error="wrong"
                                                                                        data-success="right">&nbsp;Calle</label>
                                        <input type="text" class="form-control validate" id="CalleC" validate>

                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="md-form mb-5">
                                        <i class="far fa-sticky-note fa-2x"></i> <label data-error="wrong" data-success="right">
                                            &nbsp;Referencias
                                        </label>
                                        <input type="text" class="form-control validate" placeholder="(Color de casa, entre calles)" id="ReferenciasC">

                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="md-form mb-5">
                                        <i class="fas fa-list-ol fa-2x"></i> <label data-error="wrong"
                                                                                    data-success="right">&nbsp;Núm.
                                            Exterior</label>
                                        <input type="text" class="form-control validate" id="NumExteriorC" >

                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="md-form mb-5">
                                        <i class="fas fa-list-ol fa-2x"></i><label data-error="wrong"
                                                                                   data-success="right">&nbsp;Núm. Interior</label>
                                        <input type="text" class="form-control validate" id="NumInteriorC" validate>

                                    </div>
                                </div>
                                <div class="col-lg-4"></div>
                                <div class="col-lg-4">
                                    <div class="md-form mb-5">
                                        <i class="fas fa-phone fa-2x"></i></i> <label data-error="wrong"
                                                                                      data-success="right">&nbsp;Teléfono</label>
                                        <input type="number" class="form-control validate" id="TelefonoC" validate>

                                    </div>
                                </div>

                                <div class="col-lg-4"></div>
                                <div class="col-lg-4"></div>
                                <div class="col-lg-4">
                                    <div class="md-form mb-5">
                                        <i class="fas fa-pencil-alt fa-2x"></i> <label data-error="wrong"
                                                                                       data-success="right">&nbsp;Nombre </label>
                                        <input type="text" class="form-control validate" id="NombreC" validate>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer d-flex justify-content-center">

                        <button type="submit" class="btn btn-success" id="btn-Crear-Dom">Crear Domicilio</button>

                    </div>




                </div>

            </div>
        </div>

        <div class="modal fade" id="mostrarDomicilio">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">

                    <div class="modal-header text-center navbarD-bg">
                        <h4 class="modal-title text-center w-100 font-weight-bold text-white">Modifica o Elimina un
                            Domicilio</h4>
                        <button type="button" class="close text-white" data-dismiss="modal"
                                aria-lable="close">&times;</button>
                    </div>
                    <div class="modal-body mx-3">
                        <div class="container-fluid">
                            <div class="row m-0 p-0">
                                <div class="col-lg-4 col-md-6">
                                    <div class="md-form mb-5">
                                        <i class="fas fa-mail-bulk fa-2x"></i> <label data-error="wrong"
                                                                                      data-success="right">&nbsp;Código
                                            Postal</label>
                                        <input type="number" class="form-control validate" id="CodigoPostalEM" >

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="md-form mb-5">
                                        <i class="fas fa-map-signs fa-2x"></i></i> <label data-error="wrong"
                                                                                          data-success="right">&nbsp;Colonia</label>
                                        <input type="text" class="form-control validate" id="ColoniaEM">

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="md-form mb-5">
                                        <i class="fas fa-street-view fa-2x"></i> <label data-error="wrong"
                                                                                        data-success="right">&nbsp;Calle</label>
                                        <input type="text" class="form-control validate" id="CalleEM">

                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="md-form mb-5">
                                        <i class="far fa-sticky-note fa-2x"></i>
                                        <label data-error="wrong"data-success="right">
                                            &nbsp;Referencias
                                        </label>
                                        <input type="text" class="form-control validate" id="ReferenciasEM" placeholder="(Color de casa, entre calles)">

                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="md-form mb-5">
                                        <i class="fas fa-list-ol fa-2x"></i> <label data-error="wrong"
                                                                                    data-success="right">&nbsp;Núm.
                                            Exterior</label>
                                        <input type="text" class="form-control validate" id="NumExteriorEM">

                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="md-form mb-5 ">
                                        <i class="fas fa-list-ol fa-2x"></i><label data-error="wrong"
                                                                                   data-success="right">&nbsp;Núm. Interior</label>
                                        <input type="text" class="form-control validate" id="NumInteriorEM">

                                    </div>
                                </div>
                                <div class="col-lg-4"></div>
                                <div class="col-lg-4 ">
                                    <div class="md-form mb-5">
                                        <i class="fas fa-phone fa-2x"></i></i> <label data-error="wrong"
                                                                                      data-success="right">&nbsp;Teléfono</label>
                                        <input type="text" class="form-control validate" id="TelefonoEM">

                                    </div>
                                </div>

                                <div class="col-lg-4"></div>
                                <div class="col-lg-4"></div>
                                <div class="col-lg-4">
                                    <div class="md-form mb-5">
                                        <i class="fas fa-pencil-alt fa-2x"></i> <label data-error="wrong"
                                                                                       data-success="right">&nbsp;Nombre </label>
                                        <input type="text" class="form-control validate" id="NombreEM">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer d-flex justify-content-center navbarD-bg">
                        <button class="btn btn-danger" data-toggle="modal" data-target="#ConfirmarElim">Eliminar domicilio</button>
                        <input type="text" class="form-control validate" id="idDomicilio" style="display:none;">
                        <button class="btn btn-success" id="btn-Modif-Dom">Modificar domicilio</button>

                    </div>



                </div>
            </div>
        </div>

        <div class="modal fade" id="mostrarPedido">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">

                    <div class="modal-header text-center navbarD-bg">
                        <h4 class="modal-title text-center font-weight-bold text-white" style="display:inline;">Orden #<h4 class="modal-title text-center font-weight-bold text-white" style="display:inline;" id="ordenID"></h4></h4>
                        <button type="button" class="close text-white" data-dismiss="modal"
                                aria-lable="close">&times;</button>
                    </div>
                    <div class="modal-body mx-3">
                        <div class="container-fluid">
                            <div id="info">
                                <div class="row text-center pt-5">

                                    <div class="col-lg-4 col-md-6 py-5 grid-blue1">
                                        <h5>Titulo Producto</h5>
                                        <small>Lorem, ipsum.</small>
                                    </div>
                                    <div class="col-lg-4 col-md-6 py-5 grid-blue2">
                                        <h5>Categoría</h5>
                                        <small>Lorem.</small>
                                    </div>
                                    <div class="col-lg-4 col-md-6 py-5 grid-blue1">
                                        <h5>Comentario</h5>
                                        <small>Lorem ipsum dolor sit amet consectetur adipisicing.</small>
                                    </div>
                                    <div class="col-lg-6 col-md-6 py-5 grid-blue2">
                                        <h5>Descripción</h5>
                                        <small>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Repudiandae fuga quasi
                                            rem deleniti nam ab ad est veniam laudantium sint.</small>
                                    </div>
                                    <div class="col-lg-3 col-md-6 py-5 grid-blue1">
                                        <h5>Precio</h5>
                                        <small>Lorem, ipsum dolor.</small>
                                    </div>
                                    <div class="col-lg-3 col-md-6 py-5 grid-blue2">
                                        <h5>Cantidad</h5>
                                        <small>Lorem.</small>
                                    </div>

                                </div>
                                <div class="dropdown-divider dp_div2 col-12"></div>
                            </div>



                            <div class="row">
                                <div class="col-lg-4 py-5"></div>
                                <div class="col-lg-4 py-5 text-center">
                                    <h5>Precio total</h5>
                                    <p id="PrecioTotalOrden"></p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer d-flex justify-content-center navbarD-bg">
                        <button class="btn btn-success">Cerrar</button>
                    </div>



                </div>
            </div>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="ConfirmarElim" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header navbarD-bg text-white">
                        <h5 class="modal-title" id="staticBackdropLabel">¡Cuidado!</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        ¿Está seguro que quiere eliminar esta Dirección?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-danger" id="btn-Elim-Dom">Eliminar</button>
                    </div>
                </div>
            </div>
        </div>
        <!---------------------------------------->

        <jsp:include page="footer.jsp"/>
    </body>

</html>
