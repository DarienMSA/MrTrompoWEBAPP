<%-- 
    Document   : index
    Created on : 29 dic 2020, 12:11:32
    Author     : 52811
--%>

<%@page import="com.mycompany.mrtrompoweb.models.address"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    List<address> direccionesUser = (List<address>) request.getAttribute("direccionesUser");
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

                $("#domicilioGuardado").hide();

                $("#btnGuardado").click(function (e) {
                    e.preventDefault();
                    $("#domicilioGuardado").show();
                    $('#codigoPostal').prop('readonly', true);
                    $('#colonia').prop('readonly', true);
                    $('#calle').prop('readonly', true);
                    $('#referencias').prop('readonly', true);
                    $('#numExterior').prop('readonly', true);
                    $('#numInterior').prop('readonly', true);
                    $('#telefono').prop('readonly', true);

                    $('#btn-pagoController').val('Guardado');

                });

                $("#btnEscribir").click(function (e) {
                    e.preventDefault();
                    $("#domicilioGuardado").hide();
                    $('#codigoPostal').prop('readonly', false);
                    $('#colonia').prop('readonly', false);
                    $('#calle').prop('readonly', false);
                    $('#referencias').prop('readonly', false);
                    $('#numExterior').prop('readonly', false);
                    $('#numInterior').prop('readonly', false);
                    $('#telefono').prop('readonly', false);

                    $('#codigoPostal').val('');
                    $('#colonia').val('');
                    $('#calle').val('');
                    $('#referencias').val('');
                    $('#numExterior').val('');
                    $('#numInterior').val('');
                    $('#telefono').val('');
                    $('#btn-pagoController').val('Escribir');
                    $(".uncheck").prop('checked', false);
                })

                /*$("#btn-pagoController").click(function (e) {
                 e.preventDefault();
                 alert($('#btn-pagoController').val());
                 })*/
                $("#PagoSubmit").submit(function (e) {
                    var checar = $('#codigoPostal').val();
                    if (checar == '')
                        e.preventDefault();
                });


            });

            function domicilios(id) {
                let idAddress = id;

                $.ajax({

                    method: 'POST',
                    data: {idAddress: idAddress},
                    dataType: 'JSON',
                    url: 'MostrarDireccionController',
                    error: function (result) {
                        alert("error");
                    },
                    success: function (result) {
                        $('#codigoPostal').val(result.CodigoPostal);
                        $('#colonia').val(result.Colonia);
                        $('#calle').val(result.Calle);
                        $('#referencias').val(result.Referencias);
                        $('#numExterior').val(result.NumExterior);
                        $('#numInterior').val(result.NumInterior);
                        $('#telefono').val(result.Telefono);
                        $('#idDomicilio').val(result.Id);
                        
                        $("#divCP").animate( {"top": "+=10px"}, 200, "linear" );
                        $("#divCP").animate( {"top": "-=10px"}, 400, "linear" );
                        
                        $("#divCOL").animate( {"top": "+=10px"}, 200, "linear" );
                        $("#divCOL").animate( {"top": "-=10px"}, 400, "linear" );
                        
                        $("#divCALLE").animate( {"top": "+=10px"}, 200, "linear" );
                        $("#divCALLE").animate( {"top": "-=10px"}, 400, "linear" );
                        
                        $("#divREF").animate( {"top": "+=10px"}, 200, "linear" );
                        $("#divREF").animate( {"top": "-=10px"}, 400, "linear" );
                        
                        $("#divNE").animate( {"top": "+=10px"}, 200, "linear" );
                        $("#divNE").animate( {"top": "-=10px"}, 400, "linear" );
                        
                        $("#divNI").animate( {"top": "+=10px"}, 200, "linear" );
                        $("#divNI").animate( {"top": "-=10px"}, 400, "linear" );
                        
                        $("#divTF").animate( {"top": "+=10px"}, 200, "linear" );
                        $("#divTF").animate( {"top": "-=10px"}, 400, "linear" );
                        
                    }

                });

            }

        </script>
        <link rel="icon" href="assets/img/Logo/logoIcon.ico">
        <title>Mr. Trompo</title>
    </head>

    <body>

        <jsp:include page="navbar.jsp"/>

        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="MostrarCarroController">Carrito</a></li>
                <li class="breadcrumb-item active" aria-current="page">Domicilios</li>
            </ol>
        </nav>

        <form action="PagoController" method="POST" id="PagoSubmit">

            <div class="container">
                <div class="row">

                    <!--<div class="col-6 d-flex justify-content-center pb-5 pt-5">
                        <button class="btn btn-danger" id="btnEscribir">Escribir domicilio</button>


                    </div>

                    <div class="col-6 d-flex justify-content-center pb-5 pt-5">

                        <button class="btn btn-success" id="btnGuardado">Usar domicilio guardado</button>

                    </div>-->

                    <div class="col-12 text-center pb-5 pt-5">
                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
                            <label class="btn btn-primary">
                                <input type="radio" name="options" id="btnEscribir" autocomplete="off" checked> Escribir domicilio
                            </label>
                            <label class="btn <%if (direccionesUser.isEmpty()) {%> btn-secondary <%} else { %>  btn-primary <%}%>" <%if (direccionesUser.isEmpty()) {%> style="cursor:default;" <%}%>>
                                <input type="radio" name="options" id="btnGuardado" autocomplete="off" <%if (direccionesUser.isEmpty()) {%> disabled <%}%>> Usar domicilio guardado
                            </label>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-2"></div>
                    <div class="col-lg-4 col-md-6 pb-5" id="domicilioGuardado">
                        <ul class="list-group" style="overflow-y: scroll; max-height: 300px;">
                            <%

                                for (address direcciones : direccionesUser) {

                            %>
                            <li class="list-group-item">
                                <div class="form-check">
                                    <input class="form-check-input uncheck" onclick="domicilios('<%=direcciones.getId_address()%>')" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                                    <label class="form-check-label" for="flexRadioDefault1">
                                        <%=direcciones.getNombreDireccion()%>
                                    </label>
                                    <p><small><%=direcciones.getColonia()%>, <%=direcciones.getCalle()%>, <%=direcciones.getNum_interior()%></small></p>
                                </div>
                            </li>
                            <% }%>

                        </ul>
                    </div>


                    <div class="col-12 text-center mb-5">

                        <h1><i class="fas fa-motorcycle"></i>&nbsp;&nbsp;&nbsp;¿A qué domicilio se lo enviaremos?</h1>

                    </div>

                    <div class="col-lg-4 col-md-6" id="divCP">
                        <div class="md-form mb-5">
                            <i class="fas fa-mail-bulk fa-2x"></i> <label data-error="wrong" data-success="right">&nbsp;Código
                                Postal</label>
                            <input id="codigoPostal" name="codigoPostal" type="number" class="form-control validate" value="" required>

                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6" id="divCOL">
                        <div class="md-form mb-5">
                            <i class="fas fa-map-signs fa-2x"></i></i> <label data-error="wrong"
                                                                              data-success="right">&nbsp;Colonia</label>
                            <input id="colonia" name="colonia" type="text" class="form-control validate" value="" required>

                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6" id="divCALLE">
                        <div class="md-form mb-5">
                            <i class="fas fa-street-view fa-2x"></i> <label data-error="wrong" data-success="right">&nbsp;Calle</label>
                            <input id="calle" name="calle" type="text" class="form-control validate" value="" required>

                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6" id="divREF">
                        <div class="md-form mb-5">
                            <i class="far fa-sticky-note fa-2x"></i> <label data-error="wrong" data-success="right">&nbsp;Referencias
                                <span class="text-muted">(Color de casa, entre calles)</span> </label>
                            <input id="referencias" name="referencias" type="text" class="form-control validate" value="" >

                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6" id="divNE">
                        <div class="md-form mb-5">
                            <i class="fas fa-list-ol fa-2x"></i> <label data-error="wrong" data-success="right">&nbsp;Núm.
                                Exterior</label>
                            <input id="numExterior" name="numExterior" type="text" class="form-control validate" value="" >

                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6" id="divNI">
                        <div class="md-form mb-5">
                            <i class="fas fa-list-ol fa-2x"></i><label data-error="wrong" data-success="right">&nbsp;Núm. Interior</label>
                            <input id="numInterior" name="numInterior" type="text" class="form-control validate" value="" required>

                        </div>
                    </div>
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4" id="divTF">
                        <div class="md-form mb-5">
                            <i class="fas fa-phone fa-2x"></i></i> <label data-error="wrong" data-success="right">&nbsp;Teléfono</label>
                            <input id="telefono" name="telefono" type="number" class="form-control validate" value="" required>

                        </div>
                    </div>

                </div>



                <div class="row">
                    <div class="col-12 text-right mt-5">
                        <button id="btn-pagoController" type="submit" class="btn btn-success" name="Escribir-Guardar" value="Escribir"> <i class="fas fa-arrow-alt-circle-right"></i> Continuar
                            con la compra </button>
                        <input id="idDomicilio" name="idDomicilio" type="number" class="form-control validate" value="" style="display:none;">
                    </div>
                </div>

            </div>

        </form>
        <jsp:include page="footer.jsp"/>
    </body>

</html>

