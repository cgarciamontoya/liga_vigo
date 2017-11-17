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

    public void guardar(List<Sancion> sanciones, int idJugador) throws LMFVGOException {
        sb = new StringBuilder();
        sb.append("insert into sanciones (clave_reglamento, id_jugador, jornada, id_torneo, fecha, activo) values (?,?,?,?,?,?)");
        try {
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            Integer idTorneo = getIdTorneoActivo();
            
            //se elminan los castigos para insertarlos nuevamente
            eliminar(idJugador, idTorneo);
            
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
    
    private void eliminar(int idJugador, int idTorneo) throws SQLException {
        sb = new StringBuilder();
        sb.append("delete from sanciones where id_jugador = ? and id_torneo = ?");
        PreparedStatement ps = getConnection().prepareStatement(sb.toString());
        ps.setInt(1, idJugador);
        ps.setInt(2, idTorneo);
        
        ps.execute();
    }
    
    public List<Sancion> consultaSanciones(int idEquipo, int fuerza) {
        sb = new StringBuilder();
        sb.append("select s.clave_reglamento, r.descripcion, ")
                .append("s.id_jugador, concat(j.nombre, ' ', j.paterno, ' ', j.materno) nombre_jugador, ")
                .append("s.jornada, s.id_torneo, s.fecha, s.activo, sum(r.sancion_juegos) sancion_juegos, r.sancion_economica, eqs.nombre nombre_equipo ")
                .append("from sanciones s ")
                .append("inner join reglamento r on r.clave = s.clave_reglamento ")
                .append("inner join jugadores j on j.id_jugador = s.id_jugador ")
                .append("left join rel_equipo_jugadores rel on rel.id_jugador = s.id_jugador ")
                .append("inner join equipos eqs on eqs.id_equipo = rel.id_equipo ");
        if (idEquipo > 0) {
            sb.append("where rel.id_equipo = ")
                    .append(idEquipo)
                    .append(" ");
        }
        sb.append("group by s.id_jugador order by jornada, nombre_equipo, nombre_jugador");
        try {
            int jornadaActual = getJornadaActual(fuerza);
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            
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
                s.setSancionEconomica(rs.getFloat("sancion_economica"));
                s.setSancionJuegos(rs.getInt("sancion_juegos"));
                s.setJuegosCumplidos(jornadaActual - (s.getJornada() + 1));
                s.setNombreEquipo(rs.getString("nombre_equipo"));
                s.setActivo(!s.getJuegosCumplidos().equals(s.getSancionJuegos()));
                sanciones.add(s);
            }
            return sanciones;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public List<Sancion> consultaSancionesJugador(Integer idJugador, int fuerza) {
        sb = new StringBuilder();
        sb.append("select s.clave_reglamento, r.descripcion, ")
                .append("s.id_jugador, concat(j.nombre, ' ', j.paterno, ' ', j.materno) nombre_jugador, ")
                .append("s.jornada, s.id_torneo, s.fecha, s.activo, r.sancion_juegos, r.sancion_economica ")
                .append("from sanciones s ")
                .append("inner join reglamento r on r.clave = s.clave_reglamento ")
                .append("inner join jugadores j on j.id_jugador = s.id_jugador ")
                .append("where s.id_jugador = ? order by clave_reglamento");
        try {
            int jornadaActual = getJornadaActual(fuerza);
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
                s.setSancionEconomica(rs.getFloat("sancion_economica"));
                s.setSancionJuegos(rs.getInt("sancion_juegos"));
                s.setJuegosCumplidos(jornadaActual - (s.getJornada() + 1));
                s.setActivo(!s.getJuegosCumplidos().equals(s.getSancionJuegos()));
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
