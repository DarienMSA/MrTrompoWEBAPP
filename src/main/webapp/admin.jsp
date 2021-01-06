<%-- 
    Document   : index
    Created on : 29 dic 2020, 12:11:32
    Author     : 52811
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.mrtrompoweb.models.products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    List<products> productos = (List<products>) request.getAttribute("productos");
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
        <!-- jQuery and JS bundle w/ Popper.js -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Counter-Up/1.0.0/jquery.counterup.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/jquery.validate.min.js"></script>

        <script src="js/jqueryValidate.js"></script>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="main.css">

        <script>

            $(document).ready(function () {
                /*$("#btnradioC1").click(function () {
                 var text = $("#btnradioC1").text();
                 alert(text);
                 });*/
            });
            function cambiaProductos(categoria) {
                $("#productos").empty();

                switch (categoria) {
                    case "Tacos de harina":
                        var div = "<input type='radio' onclick=\"MuestraPedidos('Gringa')\" class='btn-check' name='btnradio' id='btnradioP1' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP1'>Gringa</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Pirata')\" class='btn-check' name='btnradio' id='btnradioP2' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP2'>Pirata</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Campechana')\" class='btn-check' name='btnradio' id='btnradioP3' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP3'>Campechana</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Burrito Grill')\" class='btn-check' name='btnradio' id='btnradioP4' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP4'>Burrito Grill</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Burrito Gringo')\" class='btn-check' name='btnradio' id='btnradioP5' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP5'>Burrito Gringo</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Burrito Campechano')\" class='btn-check' name='btnradio' id='btnradioP6' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP6'>Burrito Campechano</label>";
                        $("#productos").append(div);

                        return false;
                    case "Tacos de maíz":
                        var div = "<input type='radio' onclick=\"MuestraPedidos('Trompo')\" class='btn-check' name='btnradio' id='btnradioP1' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP1'>Trompo</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Bistek')\" class='btn-check' name='btnradio' id='btnradioP2' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP2'>Bistek</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Carne Asada')\" class='btn-check' name='btnradio' id='btnradioP3' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP3'>Carne Asada</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Alambre')\" class='btn-check' name='btnradio' id='btnradioP4' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP4'>Alambre</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Campechanita')\" class='btn-check' name='btnradio' id='btnradioP5' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP5'>Campechanita</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Lorenza')\" class='btn-check' name='btnradio' id='btnradioP6' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP6'>Lorenza</label>";
                        $("#productos").append(div);

                        return false;
                    case "Burgers":
                        var div = "<input type='radio' onclick=\"MuestraPedidos('Kids Burger')\" class='btn-check' name='btnradio' id='btnradioP1' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP1'>Kids Burger</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Clásica')\" class='btn-check' name='btnradio' id='btnradioP2' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP2'>Clásica</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Bacon Burger')\" class='btn-check' name='btnradio' id='btnradioP3' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP3'>Bacon Burger</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Mr. Burger')\" class='btn-check' name='btnradio' id='btnradioP4' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP4'>Mr. Burger</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Doble')\" class='btn-check' name='btnradio' id='btnradioP5' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP5'>Doble</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Bufalo Chicken')\" class='btn-check' name='btnradio' id='btnradioP6' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP6'>Bufalo Chicken</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Pollo')\" class='btn-check' name='btnradio' id='btnradioP7' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP7'>Pollo</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('TEX MEX')\" class='btn-check' name='btnradio' id='btnradioP8' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP8'>TEX MEX</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('CLÁSICA LIGHT')\" class='btn-check' name='btnradio' id='btnradioP9' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP9'>CLÁSICA LIGHT</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('POLLO LIGHT')\" class='btn-check' name='btnradio' id='btnradioP10' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP10'>POLLO LIGHT</label>";
                        $("#productos").append(div);
                        return false;
                    case "Parrilladas":
                        var div = "<input type='radio' onclick=\"MuestraPedidos('FAMILIAR')\" class='btn-check' name='btnradio' id='btnradioP1' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP1'>FAMILIAR</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('MR. TROMPO')\" class='btn-check' name='btnradio' id='btnradioP2' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP2'>MR. TROMPO</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('LIGHT')\" class='btn-check' name='btnradio' id='btnradioP3' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP3'>LIGHT</label>";
                        $("#productos").append(div);
                        return false;
                    case "Para acompañar":
                        var div = "<input type='radio' onclick=\"MuestraPedidos('Frijoles Charros')\" class='btn-check' name='btnradio' id='btnradioP1' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP1'>Frijoles Charros</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Frijoles Charros Especiales')\" class='btn-check' name='btnradio' id='btnradioP2' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP2'>Frijoles Charros Especiales</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Guacamole')\" class='btn-check' name='btnradio' id='btnradioP3' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP3'>Guacamole</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Quesadilla Maíz')\" class='btn-check' name='btnradio' id='btnradioP4' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP4'>Quesadilla Maíz</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Quesadilla Harina')\" class='btn-check' name='btnradio' id='btnradioP5' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP5'>Quesadilla Harina</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('Papas a la Francesa')\" class='btn-check' name='btnradio' id='btnradioP6' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP6'>Papas a la Francesa</label>" +
                                "<input type='radio' onclick=\"MuestraPedidos('CHE´PAPAS')\" class='btn-check' name='btnradio' id='btnradioP7' autocomplete='off'>" +
                                "<label class='btn btn-outline-primary' for='btnradioP7'>CHE´PAPAS</label>";
                        $("#productos").append(div);
                        return false;
                }


            }

            function MuestraPedidos(NombreProd) {
                var producto = NombreProd;
                $("#ProductoActual").val(producto);
                let orden = 1;
                $.ajax({

                    method: 'POST',
                    data: {orden: orden,
                        columna: 1},
                    dataType: 'JSON',
                    url: 'PedidosOrdenados',
                    error: function (result) {
                        alert("error");
                    },
                    success: function (result) {
                        $("#cuerpoTablaProductos").empty();
                        $("#TablaGeneralProductos").show();
                        $.each(result, function (k, v) {
                            if (v.nombre_prod == producto) {
                                var div = "<tr class='text-center'>" +
                                        "<td>#" + v.id_pedido + "</td>" +
                                        "<td>#" + v.id_orden + "</td>" +
                                        "<td>" + v.comentario + "</td>" +
                                        "<td class='text-left'>" + v.userEmail + "</td>" +
                                        "<td>" + v.userNombre + "</td>" +
                                        "<td>$" + v.precio + "</td>" +
                                        "<td>" + v.cantidad + "</td>" +
                                        "<td>$" + v.precio_total + "</td>" +
                                        "</tr>";
                                $("#cuerpoTablaProductos").append(div);
                            }

                        });

                    }

                });

            }

            function OrdenPedidos(index) {
                var columna = index;
                let orden = $("#prod").val();
                var producto = $("#ProductoActual").val();
                $.ajax({

                    method: 'POST',
                    data: {orden: orden,
                        columna: columna},
                    dataType: 'JSON',
                    url: 'PedidosOrdenados',
                    error: function (result) {
                        alert("error");
                    },
                    success: function (result) {
                        $("#cuerpoTablaProductos").empty();
                        $.each(result, function (k, v) {
                            if (v.nombre_prod == producto) {
                                var div = "<tr class='text-center'>" +
                                        "<td>#" + v.id_pedido + "</td>" +
                                        "<td>#" + v.id_orden + "</td>" +
                                        "<td>" + v.comentario + "</td>" +
                                        "<td class='text-left'>" + v.userEmail + "</td>" +
                                        "<td>" + v.userNombre + "</td>" +
                                        "<td>$" + v.precio + "</td>" +
                                        "<td>" + v.cantidad + "</td>" +
                                        "<td>$" + v.precio_total + "</td>" +
                                        "</tr>";
                                $("#cuerpoTablaProductos").append(div);
                            }
                            if (orden == 1) {
                                $("#prod").val(2);
                            } else {
                                $("#prod").val(1);
                            }
                        });
                    }

                });

            }

            function orden(index) {
                let orden = $("#order").val();
                let columna = index;
                //alert(index + " " + orden);


                $.ajax({

                    method: 'POST',
                    data: {orden: orden,
                        columna: columna},
                    dataType: 'JSON',
                    url: 'ProductosOrdenados',
                    error: function (result) {
                        alert("error");
                    },
                    success: function (result) {
                        $("#cuerpoTabla").empty();
                        $.each(result, function (k, v) {

                            var div = "<tr class='text-center'>" +
                                    "<td>#" + v.id_productos + "</td>" +
                                    "<td>" + v.nombre + "</td>" +
                                    "<td>" + v.categoria + "</td>" +
                                    "<td class='text-left'>" + v.descripcion + "</td>" +
                                    "<td>$" + v.precio + "</td>" +
                                    "<td>" + v.uni_vendidas + "</td>" +
                                    "<td>$" + v.ganancias + "</td>" +
                                    "</tr>";
                            $("#cuerpoTabla").append(div);
                            if (orden == 1) {
                                $("#order").val(2);
                            } else {
                                $("#order").val(1);
                            }
                        });
                    }

                });
            }

            function fechas(bDate, eDate) {
                var fechaI = $(bDate).val();
                var fechaF = $(eDate).val();
                $.ajax({

                    method: 'POST',
                    data: {fechaI: fechaI,
                        fechaF: fechaF},
                    dataType: 'JSON',
                    url: 'Ganancias',
                    error: function (result) {
                        alert("error");
                    },
                    success: function (result) {
                        if ($("#mostrarGanancias").text() != result.Ganancias) {
                            $("#mostrarGanancias").text(result.Ganancias);

                            $("#mostrarGanancias").counterUp({delay: 10, time: 1000});
                        }
                    }

                });
            }



        </script>
        <link rel="icon" href="assets/img/Logo/logoIcon.ico">
        <title>Mr. Trompo</title>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-dark navbarD-bg mx-auto d-flex">
            <div class="container-fluid ">
                <a class="navbar-brand ml-5 nav-center" href="MainPageController">
                    <img src="assets/img/Logo/Mr Trompo2.png" class="img-fluid" width="150" height="47" alt="" loading="lazy" /></a>
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



        <div class="container-fluid mt-5">
            <h1 class="text-center mt-5 mb-5">ESTADÍSTICAS DE MR. TROMPO</h1>

            <div class="accordion mb-5" id="accordionFlushExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        Tabla general de los productos
      </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-sm">
                                    <thead class="table-primary">
                                        <tr class="text-center">
                                            <th onclick="orden('2')" >Identificador</th>
                                            <th onclick="orden('1')">Nombre</th>
                                            <th onclick="orden('3')">Categoría</th>
                                            <th onclick="orden('4')">Descripción</th>
                                            <th onclick="orden('6')">Precio</th>
                                            <th onclick="orden('5')">Vendidas</th>
                                            <th onclick="orden('8')">Ganancias</th>
                                    <input style="display:none" id="order" value="2">

                                    </tr>
                                    </thead>
                                    <tbody id="cuerpoTabla">
                                        <%for (products p : productos) {%>
                                        <tr class="text-center">
                                            <td>#<%= p.getId_productos()%></td>
                                            <td><%= p.getNombre()%></td>
                                            <td><%= p.getCategoria()%></td>
                                            <td class="text-left"><%= p.getDescripción()%></td>
                                            <td>$<%= p.getPrecio()%></td>
                                            <td><%= p.getUni_vendidas()%></td>
                                            <td>$<%=p.getPrecio() * p.getUni_vendidas()%></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                            Ver pedidos por productos
                        </button>
                    </h2>
                    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" dataparent="#accordionFlushExample">
                        <div class="accordion-body">
                            <div class="btn-group mx-auto d-flex pb-5 flex-wrap" role="group" aria-label="Basic radio toggle button group">
                                <input type="radio" class="btn-check" onclick="cambiaProductos('Tacos de harina')" name="btnradio" id="btnradioC1" autocomplete="off">
                                <label class="btn btn-outline-primary" for="btnradioC1">Tacos de harina</label>

                                <input type="radio" class="btn-check" onclick="cambiaProductos('Tacos de maíz')" name="btnradio" id="btnradioC2" autocomplete="off">
                                <label class="btn btn-outline-primary" for="btnradioC2">Tacos de maíz</label>

                                <input type="radio" class="btn-check" onclick="cambiaProductos('Burgers')" name="btnradio" id="btnradioC3" autocomplete="off">
                                <label class="btn btn-outline-primary" for="btnradioC3">Burgers</label>

                                <input type="radio" class="btn-check" onclick="cambiaProductos('Parrilladas')" name="btnradio" id="btnradioC4" autocomplete="off">
                                <label class="btn btn-outline-primary" for="btnradioC4">Parrilladas</label>

                                <input type="radio" class="btn-check" onclick="cambiaProductos('Para acompañar')" name="btnradio" id="btnradioC5" autocomplete="off">
                                <label class="btn btn-outline-primary" for="btnradioC5">Para acompañar</label>
                            </div>

                            <div class="btn-group mx-auto d-flex pt-5 pb-5 flex-wrap" id="productos" role="group" aria-label="Basic radio toggle button group">

                            </div>

                            <div class="table-responsive" id="TablaGeneralProductos" style="display:none;">
                                <table class="table table-striped table-sm">
                                    <thead class="table-primary">
                                        <tr class="text-center align-middle">
                                            <th onclick="OrdenPedidos('1')" >Identificador</th>
                                            <th onclick="OrdenPedidos('10')">Identificador Orden</th>
                                            <th onclick="OrdenPedidos('7')">Comentario</th>
                                            <th onclick="OrdenPedidos('9')">Correo Electrónico</th>
                                            <th onclick="OrdenPedidos('13')">Nombre del Cliente</th>
                                            <th onclick="OrdenPedidos('4')">Precio</th>
                                            <th onclick="OrdenPedidos('5')">Cantidad</th>
                                            <th onclick="OrdenPedidos('11')">Precio Total</th>
                                    <input style="display:none" id="prod" value="2">
                                    <input style="display:none" id="ProductoActual" value="">
                                    </tr>
                                    </thead>
                                    <tbody id="cuerpoTablaProductos">

                                        <tr class="text-center">

                                        </tr>

                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingThree">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                            Ganancias en un determinado tiempo
                        </button>
                    </h2>
                    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" dataparent="#accordionFlushExample">
                        <div class="accordion-body">
                            <div class="row pt-5">
                                <div class="col-6 text-center pt-3">
                                    <h4>Fecha inicio:</h4>
                                    <input type="date" id="beginDate" name="beginDate" onfocusout="fechas('#beginDate', '#endDate')">
                                </div>
                                <div class="col-6 text-center pt-3">
                                    <h4>Fecha final:</h4>
                                    <input type="date" id="endDate" name="endDate" onfocusout="fechas('#beginDate', '#endDate')">
                                </div>
                                <div class="col-12 text-center pt-5">
                                    <i class="fas fa-smile-beam fa-4x pb-2"></i>
                                    <h4>Ganancias obtenidas:</h4>
                                    <h3 style='display:inline;'>$
                                        <h3 id='mostrarGanancias' style='display:inline;'>0</h3>
                                    </h3>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>






        </div>

        <jsp:include page="footer.jsp"/>
    </body>

</html>
