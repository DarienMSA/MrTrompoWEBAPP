/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mrtrompoweb.dao;


import com.mycompany.mrtrompoweb.models.address;
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
public class addressDAO {
    public static int registerAddress(address Address) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            
            
            
            CallableStatement statement = con.prepareCall("CALL insertAddress(?, ?, ?, ?, ?, ?, ?, ?);");
            statement.setString(1, Address.getColonia());
            statement.setString(2, Address.getCalle());
            statement.setInt(3, Address.getCod_postal());
            statement.setString(4, Address.getNum_exterior());
            statement.setString(5, Address.getNum_interior());
            statement.setString(6, Address.getTelefono());
            statement.setString(7, Address.getReferencias());
            statement.setString(8, Address.getUserEmail());
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
    
    public static int insertAddressAccount(address Address) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            
            
            
            CallableStatement statement = con.prepareCall("CALL insertAddressAccount(?, ?, ?, ?, ?, ?, ?, ?, ?);");
            statement.setString(1, Address.getColonia());
            statement.setString(2, Address.getCalle());
            statement.setInt(3, Address.getCod_postal());
            statement.setString(4, Address.getNum_exterior());
            statement.setString(5, Address.getNum_interior());
            statement.setString(6, Address.getTelefono());
            statement.setString(7, Address.getReferencias());
            statement.setString(8, Address.getUserEmail());
            statement.setString(9, Address.getNombreDireccion());
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
    
    public static int updateAddress(address Address) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            
            
            
            CallableStatement statement = con.prepareCall("CALL updateAddress(?, ?, ?, ?, ?, ?, ?, ?, ?);");
            statement.setInt(1, Address.getId_address());
            statement.setString(2, Address.getColonia());
            statement.setString(3, Address.getCalle());
            statement.setInt(4, Address.getCod_postal());
            statement.setString(5, Address.getNum_exterior());
            statement.setString(6, Address.getNum_interior());
            statement.setString(7, Address.getTelefono());
            statement.setString(8, Address.getReferencias());
            statement.setString(9, Address.getNombreDireccion());
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
    
    public static int deleteAddress(int Address) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            
            
            
            CallableStatement statement = con.prepareCall("CALL deleteAddress(?);");
            statement.setInt(1, Address);

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
    
    public static List<address> getAddressUser(String email) {
        Connection con = null;
        try {
            List<address> direcciones = new ArrayList<>();
            con = dbConnection.getConnection();
            
            
            
            CallableStatement statement = con.prepareCall("CALL getAddressByUser(?);");
            statement.setString(1, email);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int id_address = result.getInt("id_address");
                String colonia = result.getString("colonia");
                String calle = result.getString("calle");
                int cod_postal = result.getInt("cod_postal");
                String num_exterior = result.getString("num_exterior");
                String num_interior = result.getString("num_interior");
                String telefono = result.getString("telefono");
                String referencias = result.getString("referencias");
                String userEmail = result.getString("userEmail");
                String fechaCreacion = result.getString("fechaCreacion");
                String nombreDireccion = result.getString("nombreDireccion");
                boolean activo = result.getBoolean("activo");
                
                direcciones.add(new address(id_address, colonia, calle, cod_postal, num_exterior, num_interior, telefono, referencias, userEmail, fechaCreacion, nombreDireccion, activo));
            }
            return direcciones;
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
    
    public static int resetUserAddressActive(String email) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            
            
            
            CallableStatement statement = con.prepareCall("CALL resetUserAddressActive(?);");
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
    
    public static int activeUserAddress(int id) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            
            
            
            CallableStatement statement = con.prepareCall("CALL activeUserAddress(?);");
            statement.setInt(1, id);
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
    
     public static address getAddressByID(int id) {
        Connection con = null;
        try {
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL getAddressByID(?);");
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            while (result.next()){
                int id_address = result.getInt("id_address");
                String colonia = result.getString("colonia");
                String calle = result.getString("calle");
                int cod_postal = result.getInt("cod_postal");
                String num_exterior = result.getString("num_exterior");
                String num_interior = result.getString("num_interior");
                String telefono = result.getString("telefono");
                String referencias = result.getString("referencias");
                String userEmail = result.getString("userEmail");
                String fechaCreacion = result.getString("fechaCreacion");
                String nombreDireccion = result.getString("nombreDireccion");
                boolean activo = result.getBoolean("activo");
                return new address(id_address, colonia, calle, cod_postal, num_exterior, num_interior, telefono, referencias, userEmail, fechaCreacion, nombreDireccion, activo);
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
    
    public static int lastIdAddress() {
        Connection con = null;
        try {
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL lastIdAddress();");

            ResultSet result = statement.executeQuery();
            while (result.next()){
                int id_address = result.getInt("id_address");
                return id_address + 1;
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
        return 1;
    }
}
