/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mrtrompoweb.utils;

import java.sql.Connection;
import java.sql.SQLException;
import org.apache.commons.dbcp.BasicDataSource;


/**
 *
 * @author 52811
 */
public class dbConnection{
    // Creamos el objeto conexion
    private static final BasicDataSource dataSource = new BasicDataSource();

    // Inicializamos la conexion
    static {
        // Tipo de Driver, este es el de mysql
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        // La URL a la conexion, especificando que es de mysql
        // la ruta que es localhost puerto 3306
        // el nombre de la base de datos que es pwDB
        // lo demas son parametros para que no tengan problemas con zonas horarias
        //dataSource.setUrl("jdbc:mysql://MYSQL5044.site4now.net:3306/db_a6d6a1_darienm?useUnicode=true&useJDBCCompliantTimeZoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
        // El nombre de usuario de su conexion
        //dataSource.setUsername("a6d6a1_darienm");
        // La contraseña del usuario de su conexion
        
        //dataSource.setPassword("darienm123");
        // dataSource.setMaxIdle(0);
        // dataSource.setMaxActive(100);
        dataSource.setUrl("jdbc:mysql://us-cdbr-east-02.cleardb.com:3306/heroku_55234f831fee866?useUnicode=true&useJDBCCompliantTimeZoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
        // El nombre de usuario de su conexion
        dataSource.setUsername("bbc3b94f16ba07");
        // La contraseña del usuario de su conexion
        
        dataSource.setPassword("65ef978c");
    }

    /**
     * *
     * Metodo para obtener la conexion
     *
     * @return Conexion a Base de datos
     * @throws SQLException
     */
    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    /**
     * Metodo para cerrar la conexion
     *
     * @throws SQLException
     */
    public static void closeConnection() throws SQLException {
        dataSource.close();
    }

}
