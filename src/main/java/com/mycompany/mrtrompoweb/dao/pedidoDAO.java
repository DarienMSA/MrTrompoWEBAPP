/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mrtrompoweb.dao;


import com.mycompany.mrtrompoweb.models.pedido;
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
public class pedidoDAO {
    public static int registerPedido(pedido Pedido) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            
            
            
            CallableStatement statement = con.prepareCall("CALL insertPedido(?, ?, ?, ?, ?, ?, ?);");
            statement.setString(1, Pedido.getNombre_prod());
            statement.setString(2, Pedido.getCategoria());
            statement.setInt(3, Pedido.getPrecio());
            statement.setString(4, Pedido.getDescripcion());
            statement.setString(5, Pedido.getImagen());
            statement.setString(6, Pedido.getUserEmail());
            statement.setString(7, Pedido.getUserNombre());
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
    
    public static int howManyActivePedidos(String email) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            
            
            
            CallableStatement statement = con.prepareCall("CALL howManyActivePedidos(?);");
            statement.setString(1, email);
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
    
    public static List<pedido> showActivePedidosbyCategory(String category, String email) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            List<pedido> Pedidos = new ArrayList<>();
            
            
            CallableStatement statement = con.prepareCall("CALL getActivePedidosbyCategory(?, ?);");
            statement.setString(1, category);
            statement.setString(2, email);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int id_pedidoP = result.getInt("id_pedido");
                String nombre_prodP = result.getString("nombre_prod");
                String categoriaP = result.getString("categoria");
                int precioP = result.getInt("precio");
                int cantidadP = result.getInt("cantidad");
                String descripciónP = result.getString("descripcion");
                String comentarioP = result.getString("comentario");
                String imagenP = result.getString("imagen");
                String userEmailP = result.getString("userEmail");
                int id_ordenP = result.getInt("id_orden");
                int precio_totalP = result.getInt("precio_total");
                boolean activoP = result.getBoolean("activo");
                String userNombreP = result.getString("userNombre");
                Pedidos.add(new pedido(id_pedidoP, nombre_prodP, categoriaP, precioP, cantidadP, descripciónP, comentarioP, imagenP, userEmailP, id_ordenP, precio_totalP, activoP, userNombreP));
            }
            return Pedidos;
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
    
    public static List<pedido> getPedidosOrderByColNumASC(int index) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            List<pedido> Pedidos = new ArrayList<>();
            
            
            CallableStatement statement = con.prepareCall("CALL getPedidosOrderByColNumASC(?);");
            statement.setInt(1, index);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int id_pedidoP = result.getInt("id_pedido");
                String nombre_prodP = result.getString("nombre_prod");
                String categoriaP = result.getString("categoria");
                int precioP = result.getInt("precio");
                int cantidadP = result.getInt("cantidad");
                String descripciónP = result.getString("descripcion");
                String comentarioP = result.getString("comentario");
                String imagenP = result.getString("imagen");
                String userEmailP = result.getString("userEmail");
                int id_ordenP = result.getInt("id_orden");
                int precio_totalP = result.getInt("precio_total");
                boolean activoP = result.getBoolean("activo");
                String userNombreP = result.getString("userNombre");
                Pedidos.add(new pedido(id_pedidoP, nombre_prodP, categoriaP, precioP, cantidadP, descripciónP, comentarioP, imagenP, userEmailP, id_ordenP, precio_totalP, activoP, userNombreP));
            }
            return Pedidos;
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
    
    public static List<pedido> getPedidosOrderByColNumDESC(int index) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            List<pedido> Pedidos = new ArrayList<>();
            
            
            CallableStatement statement = con.prepareCall("CALL getPedidosOrderByColNumDESC(?);");
            statement.setInt(1, index);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int id_pedidoP = result.getInt("id_pedido");
                String nombre_prodP = result.getString("nombre_prod");
                String categoriaP = result.getString("categoria");
                int precioP = result.getInt("precio");
                int cantidadP = result.getInt("cantidad");
                String descripciónP = result.getString("descripcion");
                String comentarioP = result.getString("comentario");
                String imagenP = result.getString("imagen");
                String userEmailP = result.getString("userEmail");
                int id_ordenP = result.getInt("id_orden");
                int precio_totalP = result.getInt("precio_total");
                boolean activoP = result.getBoolean("activo");
                String userNombreP = result.getString("userNombre");
                Pedidos.add(new pedido(id_pedidoP, nombre_prodP, categoriaP, precioP, cantidadP, descripciónP, comentarioP, imagenP, userEmailP, id_ordenP, precio_totalP, activoP, userNombreP));
            }
            return Pedidos;
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
    
     public static List<pedido> getPedidosByOrden(int idOrden) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            List<pedido> Pedidos = new ArrayList<>();
            
            
            CallableStatement statement = con.prepareCall("CALL getPedidosByOrden(?);");
            statement.setInt(1, idOrden);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int id_pedidoP = result.getInt("id_pedido");
                String nombre_prodP = result.getString("nombre_prod");
                String categoriaP = result.getString("categoria");
                int precioP = result.getInt("precio");
                int cantidadP = result.getInt("cantidad");
                String descripciónP = result.getString("descripcion");
                String comentarioP = result.getString("comentario");
                String imagenP = result.getString("imagen");
                String userEmailP = result.getString("userEmail");
                int id_ordenP = result.getInt("id_orden");
                int precio_totalP = result.getInt("precio_total");
                boolean activoP = result.getBoolean("activo");
                String userNombreP = result.getString("userNombre");
                Pedidos.add(new pedido(id_pedidoP, nombre_prodP, categoriaP, precioP, cantidadP, descripciónP, comentarioP, imagenP, userEmailP, id_ordenP, precio_totalP, activoP, userNombreP));
            }
            return Pedidos;
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
    
     public static List<pedido> getPedidosUserComplete(String email) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            List<pedido> Pedidos = new ArrayList<>();
            
            
            CallableStatement statement = con.prepareCall("CALL getPedidosUserComplete(?);");
            statement.setString(1, email);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int id_pedidoP = result.getInt("id_pedido");
                String nombre_prodP = result.getString("nombre_prod");
                String categoriaP = result.getString("categoria");
                int precioP = result.getInt("precio");
                int cantidadP = result.getInt("cantidad");
                String descripciónP = result.getString("descripcion");
                String comentarioP = result.getString("comentario");
                String imagenP = result.getString("imagen");
                String userEmailP = result.getString("userEmail");
                int id_ordenP = result.getInt("id_orden");
                int precio_totalP = result.getInt("precio_total");
                boolean activoP = result.getBoolean("activo");
                String userNombreP = result.getString("userNombre");
                Pedidos.add(new pedido(id_pedidoP, nombre_prodP, categoriaP, precioP, cantidadP, descripciónP, comentarioP, imagenP, userEmailP, id_ordenP, precio_totalP, activoP, userNombreP));
            }
            return Pedidos;
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
    
    public static List<pedido> getPedidosActivosUser(String email) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            List<pedido> Pedidos = new ArrayList<>();
            
            
            CallableStatement statement = con.prepareCall("CALL getPedidosActivosUser(?);");
            statement.setString(1, email);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int id_pedidoP = result.getInt("id_pedido");
                String nombre_prodP = result.getString("nombre_prod");
                String categoriaP = result.getString("categoria");
                int precioP = result.getInt("precio");
                int cantidadP = result.getInt("cantidad");
                String descripciónP = result.getString("descripcion");
                String comentarioP = result.getString("comentario");
                String imagenP = result.getString("imagen");
                String userEmailP = result.getString("userEmail");
                int id_ordenP = result.getInt("id_orden");
                int precio_totalP = result.getInt("precio_total");
                boolean activoP = result.getBoolean("activo");
                String userNombreP = result.getString("userNombre");
                Pedidos.add(new pedido(id_pedidoP, nombre_prodP, categoriaP, precioP, cantidadP, descripciónP, comentarioP, imagenP, userEmailP, id_ordenP, precio_totalP, activoP, userNombreP));
            }
            return Pedidos;
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
    
    public static int deletePedido(pedido Pedido) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            
            
            
            CallableStatement statement = con.prepareCall("CALL deletePedido(?, ?);");
            statement.setString(1, Pedido.getNombre_prod());
            statement.setString(2, Pedido.getUserEmail());
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
    
    public static int agregarCantidadPedido(int id, String email) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL agregarCantidadPedido(?, ?);");
            statement.setInt(1, id);
            statement.setString(2, email);
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
    
    public static int quitarCantidadPedido(int id, String email) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL quitarCantidadPedido(?, ?);");
            statement.setInt(1, id);
            statement.setString(2, email);
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
    
    public static int updateComentario(int id, String email, String comentario) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL updateComentario(?, ?, ?);");
            statement.setInt(1, id);
            statement.setString(2, email);
            statement.setString(3, comentario);
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
