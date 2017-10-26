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
import java.sql.ResultSet;
import java.sql.SQLException;
import lmfvgo.modelo.Torneo;

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
    
    public Integer getIdTorneoActivo() {
        try {
            ResultSet rs = getConnection().prepareStatement("select id_torneo from torneo where fecha_fin is null").executeQuery();
            rs.next();
            return rs.getInt("id_torneo");
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public Torneo torneoActivo() {
        try {
            ResultSet rs = getConnection().prepareStatement("select id_torneo, nombre, fecha_inicio, presidente, secretario, tesorero from torneo where fecha_fin is null").executeQuery();
            rs.next();
            Torneo torneo = new Torneo();
            torneo.setIdTorneo(rs.getInt("id_torneo"));
            torneo.setNombre(rs.getString("nombre"));
            torneo.setFechaInicio(rs.getDate("fecha_inicio"));
            torneo.setPresidente(rs.getString("presidente"));
            torneo.setSecretario(rs.getString("secretario"));
            torneo.setTesorero(rs.getString("tesorero"));
            return torneo;
        } catch (SQLException ex) {
            return null;
        }
    }
    
}
