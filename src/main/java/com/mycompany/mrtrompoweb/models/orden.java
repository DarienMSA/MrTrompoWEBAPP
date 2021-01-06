/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mrtrompoweb.models;

/**
 *
 * @author 52811
 */
public class orden {
    private int id_orden;
    private int precio_final;
    private String userEmail;
    private boolean pago_tarjeta;
    private String fecha;
    private int direccion;

    public orden(int id_orden, int precio_final, String userEmail, boolean pago_tarjeta, String fecha, int direccion) {
        this.id_orden = id_orden;
        this.precio_final = precio_final;
        this.userEmail = userEmail;
        this.pago_tarjeta = pago_tarjeta;
        this.fecha = fecha;
        this.direccion = direccion;
    }

    public int getId_orden() {
        return id_orden;
    }

    public void setId_orden(int id_orden) {
        this.id_orden = id_orden;
    }

    public int getPrecio_final() {
        return precio_final;
    }

    public void setPrecio_final(int precio_final) {
        this.precio_final = precio_final;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public boolean isPago_tarjeta() {
        return pago_tarjeta;
    }

    public void setPago_tarjeta(boolean pago_tarjeta) {
        this.pago_tarjeta = pago_tarjeta;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getDireccion() {
        return direccion;
    }

    public void setDireccion(int direccion) {
        this.direccion = direccion;
    }
    
    
    
    
}
