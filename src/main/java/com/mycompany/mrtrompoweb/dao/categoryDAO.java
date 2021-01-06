/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mrtrompoweb.dao;

import com.mycompany.mrtrompoweb.models.category;
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
public class categoryDAO {
    
    public static category getCategory(String Categoria) {
        Connection con = null;
        try {
            con = dbConnection.getConnection();
            CallableStatement statement = con.prepareCall("CALL getCategory(?);");
            statement.setString(1, Categoria);
            ResultSet result = statement.executeQuery();
            while (result.next()){
                String categoria_nombre = result.getString("categoria_nombre");
                String descripcion = result.getString("descripción");
                int id_categoria = result.getInt("id_categoria");
                return new category(categoria_nombre, descripcion, id_categoria);
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
