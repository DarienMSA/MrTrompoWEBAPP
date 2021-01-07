<%-- 
    Document   : index
    Created on : 29 dic 2020, 12:11:32
    Author     : 52811
--%>

<%@page import="com.mycompany.mrtrompoweb.models.pedido"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    List<pedido> PedidosUser = (List<pedido>) request.getAttribute("PedidosUser");
    int nextOrder = (int) request.getAttribute("nextOrder");
    nextOrder = nextOrder + 9;
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
                $('#NumTarjeta').prop('readonly', true);
                $('#Propietario').prop('readonly', true);
                $('#MM').prop('readonly', true);
                $('#AA').prop('readonly', true);
                $('#Cod-Seguridad').prop('readonly', true);
                $('#tarjeta').hide();
                $('#metodoPago').val('Efectivo');

                $("#btnEfectivo").click(function (e) {
                    e.preventDefault();
                    $('#NumTarjeta').prop('readonly', true);
                    $('#Propietario').prop('readonly', true);
                    $('#MM').prop('readonly', true);
                    $('#AA').prop('readonly', true);
                    $('#Cod-Seguridad').prop('readonly', true);
                    $('#NumTarjeta').val('');
                    $('#Propietario').val('');
                    $('#MM').val('');
                    $('#AA').val('');
                    $('#Cod-Seguridad').val('');
                    $('#tarjeta').hide();
                    $('#efectivo').show();
                    $('#metodoPago').val('Efectivo');
                    $("#datosTarjeta").slideUp(400);
                });

                $("#btnTarjeta").click(function (e) {
                    e.preventDefault();
                    $('#NumTarjeta').prop('readonly', false);
                    $('#Propietario').prop('readonly', false);
                    $('#MM').prop('readonly', false);
                    $('#AA').prop('readonly', false);
                    $('#Cod-Seguridad').prop('readonly', false);
                    $('#efectivo').hide();
                    $('#tarjeta').show();
                    $('#metodoPago').val('Tarjeta');
                    $("#datosTarjeta").slideDown(400);
                });




            });

        </script>
        <link rel="icon" href="assets/img/Logo/logoIcon.ico">
        <title>Mr. Trompo</title>
    </head>

    <body>

        <jsp:include page="navbar.jsp"/>

        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="MostrarCarroController">Carrito</a></li>
                <li class="breadcrumb-item"><a href="javascript:void(0)" onclick="$('#formDomCon').submit();">Domicilios</a></li>
                <li class="breadcrumb-item active" aria-current="page">Pagar</li>
            </ol>
        </nav>

        <form id="formDomCon" action="DomicilioController" method="POST">
            
        </form>
        
        <div class="container">
            <div class="row bg-light border-bottom-d">
                <div class="col-12 pt-3 ">
                    <h3>Referencia: Orden #<%=nextOrder%></h3>
                </div>
            </div>
            <div class="row bg-light border-middle-d">
                <div class="col-12">
                    <h3>Descripción de la orden: <%int cantidad = 1;
                        int precio = 15;
                        for (pedido Pedidos : PedidosUser) {%><h4 style="display:inline-block;"><%=Pedidos.getNombre_prod()%> x<%=Pedidos.getCantidad()%><%if (cantidad != PedidosUser.size()) {%>,&nbsp;<%} else {%>.<%}%></h4><%cantidad++;
                                precio += Pedidos.getPrecio_total();
                            }%></h3>
                </div>
            </div>
            <div class="row bg-light border-top-d">
                <div class="col-12">

                    <h3>Cantidad a pagar: $<%=precio%></h3>
                </div>
            </div>

            <div class="row">
                <div class="col-12 text-center pb-5 pt-5">
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-success">
                            <input type="radio" name="options" id="btnEfectivo" autocomplete="off" checked><i class="far fa-money-bill-alt"></i>&nbsp;Pagar con efectivo
                        </label>
                        <label class="btn btn-primary ">
                            <input type="radio" name="options" id="btnTarjeta" autocomplete="off"><i class="far fa-credit-card "></i>&nbsp;Pagar con tarjeta
                        </label>
                    </div>
                </div>
            </div>

            <div class="row" id="datosTarjeta" style="display:none;">

                <div class="col-12 mb-5">

                    <h4 class="my-auto d-flex"> <i class="far fa-handshake fa-2x"></i>&nbsp;&nbsp;&nbsp;Detalles del pago</h4>

                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="md-form mb-5">
                        <i class="far fa-credit-card fa-2x"></i> <label data-error="wrong" data-success="right">&nbsp;Número de tarjeta</label>
                        <input type="number" class="form-control validate" id="NumTarjeta">

                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="md-form mb-5">
                        <i class="fas fa-user-shield fa-2x"></i> <label data-error="wrong"
                                                                        data-success="right">&nbsp;Nombre del propietario</label>
                        <input type="text" class="form-control validate" id="Propietario">

                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="md-form mb-5 text-center">
                        <i class="fas fa-user-slash fa-2x"></i> <label data-error="wrong" data-success="right">&nbsp;Fecha de vencimiento</label>
                        <div class="row">
                            <div class="col-5">
                                <input type="number" class="form-control validate" placeholder="MM" id="MM">
                            </div>
                            <div class="col-2"><h4>/</h4></div>
                            <div class="col-5">
                                <input type="number" class="form-control validate" placeholder="AA" id="AA">
                            </div>
                        </div>



                    </div>
                </div>
                <div class="col-lg-3 col-md-6"></div>
                <div class="col-lg-6 col-md-6">
                    <div class="md-form mb-5">
                        <i class="fas fa-shield-alt fa-2x"></i> <label data-error="wrong" data-success="right">&nbsp;Código de Seguridad
                        </label> <small>&nbsp;Los 3 digitos que están detrás de la tarjeta.</small>
                        <br>
                        <input type="number" class="form-control validate" style="width: 50%; display:inline;" id="Cod-Seguridad">


                    </div>
                </div>


            </div>



            <div class="row">
                <div class="col-12  mt-5 text-right">
                    <h5 id="efectivo"><small class="text-muted" >El repartidor no contará con más de 200 pesos de cambio.</small></h5>
                    <h5 id="tarjeta"><small class="text-muted">Mr. Trompo respeta tu privacidad y no guardará la información.</small></h5>
                    <form action="OrdenController" method="POST">
                        <button type="submit" class="btn btn-success" id="ordenController"> <i class="fas fa-arrow-alt-circle-right"></i> Terminar la compra </button>
                        <input type="text" class="form-control validate" style="display:none;" id="metodoPago" name="metodoPago" value="">
                    </form>
                </div>
            </div>

        </div>

        <jsp:include page="footer.jsp"/>
    </body>

</html>
