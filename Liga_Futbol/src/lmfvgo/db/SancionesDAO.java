/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Descripción:
 * Fecha: 1/11/2017
 * Autor: Carlos A. García M.
 */
package lmfvgo.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Sancion;

public class SancionesDAO extends BaseDAO {

    private StringBuilder sb;
    
    public SancionesDAO() {
        super();
    }

    public void guardar(List<Sancion> sanciones) throws LMFVGOException {
        sb = new StringBuilder();
        sb.append("insert into sanciones (clave_reglamento, id_jugador, jornada, id_torneo, fecha, activo) values (?,?,?,?,?,?)");
        try {
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            Integer idTorneo = getIdTorneoActivo();
            java.sql.Date fecha = new java.sql.Date(new Date().getTime());
            for (Sancion s : sanciones) {
                ps.setString(1, s.getClave());
                ps.setInt(2, s.getIdJugador());
                ps.setInt(3, s.getJornada());
                ps.setInt(4, idTorneo);
                ps.setDate(5, fecha);
                ps.setInt(6, 1);
                ps.addBatch();
            }
            ps.executeBatch();
        } catch (SQLException ex) {
            throw new LMFVGOException("No se pudo guardar las sanciones debido a: " + ex.getMessage());
        }
    }
    
    public List<Sancion> consultaSancionesJugador(Integer idJugador) {
        sb = new StringBuilder();
        sb.append("select s.clave_reglamento, r.descripcion, ")
                .append("s.id_jugador, concat(j.nombre, ' ', j.paterno, ' ', j.materno) nombre_jugador, ")
                .append("s.jornada, s.id_torneo, s.fecha, s.activo, r.sancion_juegos, r.sancion_economica ")
                .append("from sanciones s ")
                .append("inner join reglamento r on r.clave = s.clave_reglamento ")
                .append("inner join jugadores j on j.id_jugador = s.id_jugador ")
                .append("where s.id_jugador = ? order by clave_reglamento");
        try {
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            ps.setInt(1, idJugador);
            
            ResultSet rs = ps.executeQuery();
            List<Sancion> sanciones = new ArrayList<>();
            while (rs.next()) {
                Sancion s = new Sancion();
                s.setClave(rs.getString("clave_reglamento"));
                s.setDescripcionClave("descripcion");
                s.setIdJugador(rs.getInt("id_jugador"));
                s.setNombreJugador(rs.getString("nombre_jugador"));
                s.setJornada(rs.getInt("jornada"));
                s.setTorneo(rs.getInt("id_torneo"));
                s.setFecha(rs.getDate("fecha"));
                s.setActivo(rs.getInt("activo") == 1);
                s.setSancionEconomica(rs.getFloat("sancion_economica"));
                s.setSancionJuegos(rs.getInt("sancion_juegos"));
                sanciones.add(s);
            }
            return sanciones;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public void bajaSancion(Integer idJugador, String clave) throws LMFVGOException {
        try {
            PreparedStatement ps = getConnection().prepareStatement("update sanciones set activo = 0 where id_jugador = ? and clave_reglamento = ?");
            ps.setInt(1, idJugador);
            ps.setString(2, clave);
            ps.execute();
        } catch (SQLException ex) {
            throw new LMFVGOException("No se pudo eliminar la sancion debido a: " + ex.getMessage());
        }
    }
    
}
