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
public class products {
    private String nombre;
    private int id_productos;
    private String categoria;
    private String descripcion;
    private int uni_vendidas;
    private int precio;
    private String imagen;
    private int ganancias;
    
    public products(String nombre, int id_productos, String categoria, String descripción, int uni_vendidas, int precio, String imagen) {
        this.nombre = nombre;
        this.id_productos = id_productos;
        this.categoria = categoria;
        this.descripcion = descripción;
        this.uni_vendidas = uni_vendidas;
        this.precio = precio;
        this.imagen = imagen;
    }

    public products(String nombre, int id_productos, String categoria, String descripción, int uni_vendidas, int precio, String imagen, int ganancias) {
        this.nombre = nombre;
        this.id_productos = id_productos;
        this.categoria = categoria;
        this.descripcion = descripción;
        this.uni_vendidas = uni_vendidas;
        this.precio = precio;
        this.imagen = imagen;
        this.ganancias = ganancias;
    }

    public int getGanancias() {
        return ganancias;
    }

    public void setGanancias(int ganancias) {
        this.ganancias = ganancias;
    }
    
    

    public products(String nombre) {
        this.nombre = nombre;
    }
    
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getId_productos() {
        return id_productos;
    }

    public void setId_productos(int id_productos) {
        this.id_productos = id_productos;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getDescripción() {
        return descripcion;
    }

    public void setDescripción(String descripción) {
        this.descripcion = descripción;
    }

    public int getUni_vendidas() {
        return uni_vendidas;
    }

    public void setUni_vendidas(int uni_vendidas) {
        this.uni_vendidas = uni_vendidas;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    
    
}
