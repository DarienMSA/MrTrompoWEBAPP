/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mrtrompoweb.dao;

import com.mycompany.mrtrompoweb.models.address;
import com.mycompany.mrtrompoweb.models.orden;
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
public class ordenDAO {
    public static int nextOrder() {
        Connection con = null;
        int nextOrden = 0;
        try {
            con = dbConnection.getConnection();
            
            
            
            CallableStatement statement = con.prepareCall("CALL nextOrder();");
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int id_orden = result.getInt("id_orden");
                nextOrden = id_orden;
            }
            return nextOrden + 1;
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
        return nextOrden + 1;
    }
    
    public static int getGananciasEntreFechas(String fechaIni, String fechaFin) {
        Connection con = null;
        int Ganancias = 0;
        try {
            con = dbConnection.getConnection();
            
            
            
            CallableStatement statement = con.prepareCall("CALL getGananciasEntreFechas(?, ?);");
            statement.setString(1, fechaIni);
            statement.setString(2, fechaFin);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Ganancias = result.getInt("SUM(`orden`.`precio_final`)");
            }
            return Ganancias;
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
        return Ganancias;
    }
    
    public static int insertOrder(orden Orden) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            
            
            
            CallableStatement statement = con.prepareCall("CALL insertOrder(?, ?, ?, ?);");
            statement.setInt(1, Orden.getPrecio_final());
            statement.setString(2, Orden.getUserEmail());
            statement.setBoolean(3, Orden.isPago_tarjeta());
            statement.setInt(4, Orden.getDireccion());
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
    
    public static List<orden> getOrdenComplete(String email) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            List<orden> ordenes = new ArrayList<>();
            
            
            CallableStatement statement = con.prepareCall("CALL getOrdenesUser(?);");
            statement.setString(1, email);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int id_orden = result.getInt("id_orden");
                int precio_final = result.getInt("precio_final");
                String userEmailP = result.getString("userEmail");
                boolean pago_tarjeta = result.getBoolean("pago_tarjeta");
                String fecha = result.getString("fecha");
                int direccion = result.getInt("direccion");
                ordenes.add(new orden(id_orden, precio_final, userEmailP, pago_tarjeta, fecha, direccion));
            }
            return ordenes;
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
    
}
