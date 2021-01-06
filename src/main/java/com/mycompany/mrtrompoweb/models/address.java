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
public class address {
    private int id_address;
    private String colonia;
    private String calle;
    private int cod_postal;
    private String num_exterior;
    private String num_interior;
    private String telefono;
    private String referencias;
    private String userEmail;
    private String fechaCreacion;
    private String nombreDireccion;
    private boolean activo;

    public address(int id_address, String colonia, String calle, int cod_postal, String num_exterior, String num_interior, String telefono, String referencias, String userEmail, String fechaCreacion, String nombreDireccion, boolean activo) {
        this.id_address = id_address;
        this.colonia = colonia;
        this.calle = calle;
        this.cod_postal = cod_postal;
        this.num_exterior = num_exterior;
        this.num_interior = num_interior;
        this.telefono = telefono;
        this.referencias = referencias;
        this.userEmail = userEmail;
        this.fechaCreacion = fechaCreacion;
        this.nombreDireccion = nombreDireccion;
        this.activo = activo;
    }

    public address(String colonia, String calle, int cod_postal, String num_interior, String telefono, String referencias, String userEmail) {
        this.colonia = colonia;
        this.calle = calle;
        this.cod_postal = cod_postal;
        this.num_interior = num_interior;
        this.telefono = telefono;
        this.referencias = referencias;
        this.userEmail = userEmail;
    }

    public int getId_address() {
        return id_address;
    }

    public void setId_address(int id_address) {
        this.id_address = id_address;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public int getCod_postal() {
        return cod_postal;
    }

    public void setCod_postal(int cod_postal) {
        this.cod_postal = cod_postal;
    }

    public String getNum_exterior() {
        return num_exterior;
    }

    public void setNum_exterior(String num_exterior) {
        this.num_exterior = num_exterior;
    }

    public String getNum_interior() {
        return num_interior;
    }

    public void setNum_interior(String num_interior) {
        this.num_interior = num_interior;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getReferencias() {
        return referencias;
    }

    public void setReferencias(String referencias) {
        this.referencias = referencias;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(String fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getNombreDireccion() {
        return nombreDireccion;
    }

    public void setNombreDireccion(String nombreDireccion) {
        this.nombreDireccion = nombreDireccion;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
    
    
    
}
