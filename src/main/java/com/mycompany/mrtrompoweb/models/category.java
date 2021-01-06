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
public class category {
    private String categoria_nombre;
    private String descripcion;
    private int id_categoria;

    public category(String categoria_nombre, String descripcion, int id_categoria) {
        this.categoria_nombre = categoria_nombre;
        this.descripcion = descripcion;
        this.id_categoria = id_categoria;
    }

    public String getCategoria_nombre() {
        return categoria_nombre;
    }

    public void setCategoria_nombre(String categoria_nombre) {
        this.categoria_nombre = categoria_nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }
    
    
}
