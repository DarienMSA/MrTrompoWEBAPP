

<%@page import="java.util.List"%>
<%@page import="com.mycompany.mrtrompoweb.models.products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
