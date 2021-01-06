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
public class pedido {
   private int id_pedido;
   private String nombre_prod;
   private String categoria;
   private int precio;
   private int cantidad;
   private String descripcion;
   private String comentario;
   private String imagen;
   private String userEmail;
   private int id_orden;
   private int precio_total;
   private boolean activo;
   private String userNombre;

    public pedido(int id_pedido, String nombre_prod, String categoria, int precio, int cantidad, String descripcion, String comentario, String imagen, String userEmail, int id_orden, int precio_total, boolean activo, String userNombre) {
        this.id_pedido = id_pedido;
        this.nombre_prod = nombre_prod;
        this.categoria = categoria;
        this.precio = precio;
        this.cantidad = cantidad;
        this.descripcion = descripcion;
        this.comentario = comentario;
        this.imagen = imagen;
        this.userEmail = userEmail;
        this.id_orden = id_orden;
        this.precio_total = precio_total;
        this.activo = activo;
        this.userNombre = userNombre;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public String getNombre_prod() {
        return nombre_prod;
    }

    public void setNombre_prod(String nombre_prod) {
        this.nombre_prod = nombre_prod;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public int getId_orden() {
        return id_orden;
    }

    public void setId_orden(int id_orden) {
        this.id_orden = id_orden;
    }

    public int getPrecio_total() {
        return precio_total;
    }

    public void setPrecio_total(int precio_total) {
        this.precio_total = precio_total;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public String getUserNombre() {
        return userNombre;
    }

    public void setUserNombre(String userNombre) {
        this.userNombre = userNombre;
    }
   
   
}
