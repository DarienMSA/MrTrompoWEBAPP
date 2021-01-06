/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    /**/
    $("#nameReg-error-db").hide();
    $("#emailIS-error-db").hide();
    $("#passwordIS-error-db").hide();

    $.validator.addMethod('strongPassword', function (value, element) {
        return value.length >= 6 && /\d/.test(value) && /[a-z]/i.test(value);
    }, 'Tu contraseña debe contener almenos 6 caracteres incluyendo un número y una letra')

    $("#formReg").validate({
        rules: {
            nameReg: {
                required: true,
                minlength: 3,
                maxlength: 15
            },
            emailReg: {
                required: true,
                email: true
            },
            passwordReg: {
                required: true,
                strongPassword: true
            },
            password2Reg: {
                required: true,
                equalTo: "#passwordReg"
            }
        },
        messages: {
            nameReg: {
                required: 'Por favor introduzca un nombre',
                minlength: 'El nombre no puede ser menor a 3 caracteres',
                maxlength: 'El nombre no puede ser mayor a 15 caracteres'
            },
            emailReg: {
                required: 'Por favor introduzca un correo electrónico',
                email: 'Porfavor introduzca un correo electrónico válido'
            },
            passwordReg: {
                required: 'Por favor introduzca una contraseña'
            },
            password2Reg: {
                required: 'Por favor vuelve a escribir la contraseña',
                equalTo: 'Debes introducir la misma contraseña'
            }
        }
    })


    $("#botonReg").click(function (e) {
        e.preventDefault();
        // $("#usuarioregistrado").modal('show');
        if ($("#formReg").valid() == false) {
            return;
        } else {
            let nameReg = $("#nameReg").val();
            let emailReg = $("#emailReg").val();
            let passwordReg = $("#passwordReg").val();
            $.ajax({

                method: 'POST',
                data: {name: nameReg,
                    email: emailReg,
                    password: passwordReg},
                url: 'RegistroController',
                error: function (result) {
                    alert("error");
                },
                success: function (result) {

                    if (result == "Correcto") {
                        
                        $("#registrarse").modal('hide');
                        $("#usuarioregistrado").modal('show');
                        $("#Nav-Reg").hide();
                        $("#Nav-Is").hide();

                        $("#Nav-Carr").show();
                        $("#Nav-Acc").show();
                    } else
                        $("#nameReg-error-db").show();
                }

            });
        }

    })


    $("#botonIS").click(function (e) {
        e.preventDefault();


        // $("#usuarioregistrado").modal('show');
        if ($("#formIS").valid() == false) {
            return;
        } else {
            let emailIS = $("#emailIS").val();
            let passwordIS = $("#passwordIS").val();
            let prueba = 1;
            $.ajax({
                
                method: 'POST',
                data: {email: emailIS,
                    password: passwordIS},
                url: 'InicioSesionController',
                error: function (result) {
                    alert("error");
                },
                success: function (result) {
                    
                    if (result == "InicioUser") {
                        
                        $("#iniciarSesion").modal('hide');
                        $("#usuarioiniciado").modal('show');
                        $("#Nav-Reg").hide();
                        $("#Nav-Is").hide();

                        $("#Nav-Carr").show();
                        $("#Nav-Acc").show();
                        $("#Nav-Cerrar").show();
                    }
                    if (result == "InicioAdmin") {
                        
                        $("#iniciarSesion").modal('hide');
                        $("#usuarioiniciado").modal('show');
                        $("#Nav-Reg").hide();
                        $("#Nav-Is").hide();
                        $("#Nav-Acc").show();
                        $("#Nav-Cerrar").show();
                    } else if (result == "UsuarioMal") {
                        $("#emailIS-error-db").show();
                        $("#passwordIS-error-db").hide();
                    } else if (result == "ContraMal") {
                        $("#emailIS-error-db").hide();
                        $("#passwordIS-error-db").show();
                    }
                }

            });
        }

    })
});

