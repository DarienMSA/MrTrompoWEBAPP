/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mrtrompoweb.dao;

import com.mycompany.mrtrompoweb.models.user;
import com.mycompany.mrtrompoweb.utils.dbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 52811
 */
public class userDAO {
    public static int registerUser(user User) {
        Connection con = null;
        try {
            
            con = dbConnection.getConnection();
            
            
            
            CallableStatement statement = con.prepareCall("CALL insertUser(?, ?, ?);");
            statement.setString(1, User.getEmail());
            statement.setString(2, User.getName());
            statement.setString(3, User.getPassword());
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
    
    public static user searchEmail(user User) {
        Connection con = null;
        try {
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL searchEmail(?);");
            statement.setString(1, User.getEmail());
            ResultSet result = statement.executeQuery();
            while (result.next()){
                String email = result.getString("email");
                String name = result.getString("name");
                String password = result.getString("password");
                boolean admin = result.getBoolean("admin");
                boolean onboarding = result.getBoolean("onboarding");
                return new user(email, name, password, admin, onboarding);
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
    
    public static user searchPassword(user User) {
        Connection con = null;
        try {
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL searchPassword(?, ?);");
            statement.setString(1, User.getPassword());
            statement.setString(2, User.getEmail());
            ResultSet result = statement.executeQuery();
            while (result.next()){
                String email = result.getString("email");
                String name = result.getString("name");
                String password = result.getString("password");
                boolean admin = result.getBoolean("admin");
                boolean onboarding = result.getBoolean("onboarding");
                return new user(email, name, password, admin, onboarding);
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
    
}
