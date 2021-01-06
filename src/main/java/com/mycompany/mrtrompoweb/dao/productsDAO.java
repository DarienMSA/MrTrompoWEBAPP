/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mrtrompoweb.dao;

import com.mycompany.mrtrompoweb.models.products;
import com.mycompany.mrtrompoweb.utils.dbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 52811
 */
public class productsDAO {
    
    public static List<products> getAllProducts() {
        Connection con = null;
        try {
            List<products> productos = new ArrayList<>();
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL getAllProducts();");
            
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                String nombre = result.getString("nombre");
                int id_productos = result.getInt("id_productos");
                String categoria = result.getString("categoria");
                String descripcion = result.getString("descripcion");
                int uni_vendidas = result.getInt("uni_vendidas");
                int precio = result.getInt("precio");
                String imagen = result.getString("imagen");
                productos.add(new products(nombre, id_productos, categoria, descripcion, uni_vendidas, precio, imagen));
            }
            return productos;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(productsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(productsDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
    
    public static List<products> getProductsOrderByColNumASC(int index) {
        Connection con = null;
        try {
            List<products> productos = new ArrayList<>();
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL getProductsOrderByColNumASC(?);");
            statement.setInt(1, index);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                String nombre = result.getString("nombre");
                int id_productos = result.getInt("id_productos");
                String categoria = result.getString("categoria");
                String descripcion = result.getString("descripcion");
                int uni_vendidas = result.getInt("uni_vendidas");
                int precio = result.getInt("precio");
                int ganancias = result.getInt("ganancias");
                productos.add(new products(nombre, id_productos, categoria, descripcion, uni_vendidas, precio, null, ganancias));
            }
            return productos;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(productsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(productsDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
    
    public static List<products> getProductsOrderByColNumDESC(int index) {
        Connection con = null;
        try {
            List<products> productos = new ArrayList<>();
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL getProductsOrderByColNumDESC(?);");
            statement.setInt(1, index);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                String nombre = result.getString("nombre");
                int id_productos = result.getInt("id_productos");
                String categoria = result.getString("categoria");
                String descripcion = result.getString("descripcion");
                int uni_vendidas = result.getInt("uni_vendidas");
                int precio = result.getInt("precio");
                int ganancias = result.getInt("ganancias");
                productos.add(new products(nombre, id_productos, categoria, descripcion, uni_vendidas, precio, null, ganancias));
            }
            return productos;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(productsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(productsDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
    
    public static products getProduct(products producto) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            
            
            
            CallableStatement statement = con.prepareCall("CALL getProduct(?);");
            statement.setString(1, producto.getNombre());
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                String nombre = result.getString("nombre");
                int id_productos = result.getInt("id_productos");
                String categoria = result.getString("categoria");
                String descripcion = result.getString("descripcion");
                int uni_vendidas = result.getInt("uni_vendidas");
                int precio = result.getInt("precio");
                String imagen = result.getString("imagen");
                return new products(nombre, id_productos, categoria, descripcion, uni_vendidas, precio, imagen);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            if(con != null){
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
    
    
    public static List<products> getBestSellers() {
        Connection con = null;
        try {
            List<products> productos = new ArrayList<>();
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL masVendidos();");
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                String nombre = result.getString("nombre");
                int id_productos = result.getInt("id_productos");
                String categoria = result.getString("categoria");
                String descripcion = result.getString("descripcion");
                int uni_vendidas = result.getInt("uni_vendidas");
                int precio = result.getInt("precio");
                String imagen = result.getString("imagen");
                productos.add(new products(nombre, id_productos, categoria, descripcion, uni_vendidas, precio, imagen));
            }
            return productos;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(productsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(productsDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
    
    public static List<products> getProductsByCategory(String inputcategoria) {
        Connection con = null;
        try {
            List<products> productos = new ArrayList<>();
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL productosCategoria(?);");
            statement.setString(1, inputcategoria);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                String nombre = result.getString("nombre");
                int id_productos = result.getInt("id_productos");
                String categoria = result.getString("categoria");
                String descripcion = result.getString("descripcion");
                int uni_vendidas = result.getInt("uni_vendidas");
                int precio = result.getInt("precio");
                String imagen = result.getString("imagen");
                productos.add(new products(nombre, id_productos, categoria, descripcion, uni_vendidas, precio, imagen));
            }
            return productos;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(productsDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(productsDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }
    
    
    
    public static int updateProductsSold(String pedidoName, int cantidad, int precioTotal) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL updateProductsSold(?, ?, ?);");
            statement.setString(1, pedidoName);
            statement.setInt(2, cantidad);
            statement.setInt(3, precioTotal);
            return statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            if(con != null){
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(userDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return 0;
    }
    
}
