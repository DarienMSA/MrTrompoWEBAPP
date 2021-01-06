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

        <script src="js/jqueryValidate.js"></script>
        
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="main.css">
        <link rel="icon" href="assets/img/Logo/logoIcon.ico">
        <title>Mr. Trompo</title>
    </head>

    <body>

        <jsp:include page="navbar.jsp"/>

        <div class="container text-center bg-light border-bottom-d border-top-d ">
    <div class="row">
        <div class="col-12">
            <img src="assets/img/Iconos/check.png" height="300px"  alt="">
            <h1>¡Muchas gracias por tu compra!</h1>
            <h3>Se ha procesado el pago con éxito. Los detalles de tu compra se han enviado al correo: <i><%=session.getAttribute("emailActual")%></i>.</h3>
            <h3 class="pb-5">Cada compra nos inspira a mejorar y realizar sabores. ¡Con tu apoyo lo lograremos!</h3>
            <form action="MainPageController" method="GET">
            <button type="submit" class="btn btn-success">Ir al inicio</button>
            </form>
        </div>
    </div>
</div>

        <jsp:include page="footer.jsp"/>
    </body>

</html>

