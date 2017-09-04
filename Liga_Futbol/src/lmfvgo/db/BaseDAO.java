/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Descripción:
 * Fecha: 13/12/2016
 * Autor: Carlos A. García M.
 */
package lmfvgo.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseDAO {

    private static final String URL_DB = "jdbc:mysql://localhost:3306/lmfvgo";
    private static final String DB_USR = "root";
    private static final String DB_PASS = "root";
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    
    private Connection connection;
    
    public BaseDAO() {
        
    }
    
    public Connection getConnection() {
        if (connection == null) {
            try {
                Class.forName(JDBC_DRIVER);
                return DriverManager.getConnection(URL_DB, DB_USR, DB_PASS);
            } catch (ClassNotFoundException | SQLException e) {
                return null;
            }
        } else {
            return connection;
        }
    }
    
}
