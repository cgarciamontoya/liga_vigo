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

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Amonestado;
import lmfvgo.modelo.Expulsado;
import lmfvgo.modelo.Sancion;
import lmfvgo.modelo.SancionEquipo;
import lmfvgo.util.ConstantesUtil;

public class SancionesDAO extends BaseDAO {
    
    private StringBuilder sb;
    
    public SancionesDAO(Connection con) {
        super(con);
    }

    public void guardar(List<Sancion> sanciones, int idJugador) throws LMFVGOException {
        sb = new StringBuilder();
        sb.append("insert into sanciones (clave_reglamento, id_jugador, jornada, id_torneo, fecha, activo, observaciones, juegos, multa) values (?,?,?,?,?,?,?,?,?)");
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
                if (s.getObservaciones() != null && !s.getObservaciones().isEmpty()) {
                    ps.setString(7, s.getObservaciones().toUpperCase());
                } else {
                    ps.setNull(7, Types.VARCHAR);
                }
                if (s.getSancionJuegos() != null && s.getSancionJuegos() > 0) {
                    ps.setInt(8, s.getSancionJuegos());
                } else {
                    ps.setNull(8, Types.INTEGER);
                }
                if (s.getSancionEconomica() != null && s.getSancionEconomica() > 0) {
                    ps.setFloat(9, s.getSancionEconomica());
                } else {
                    ps.setNull(9, Types.FLOAT);
                }
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
        sb.append("select s.clave_reglamento, r.descripcion, s.observaciones,")
                .append("s.id_jugador, concat(j.nombre, ' ', j.paterno, ' ', j.materno) nombre_jugador, ")
                .append("s.jornada, s.id_torneo, s.fecha, s.activo, sum(s.juegos) sancion_juegos, s.multa sancion_economica, eqs.nombre nombre_equipo ")
                .append("from sanciones s ")
                .append("inner join reglamento r on r.clave = s.clave_reglamento ")
                .append("inner join jugadores j on j.id_jugador = s.id_jugador ")
                .append("left join rel_equipo_jugadores rel on rel.id_jugador = s.id_jugador ")
                .append("inner join equipos eqs on eqs.id_equipo = rel.id_equipo ")
                .append("where s.activo = 1 ");
        if (idEquipo > 0) {
            sb.append("and rel.id_equipo = ")
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
                s.setObservaciones(rs.getString("observaciones"));
                s.setIdJugador(rs.getInt("id_jugador"));
                s.setNombreJugador(rs.getString("nombre_jugador"));
                s.setJornada(rs.getInt("jornada"));
                s.setTorneo(rs.getInt("id_torneo"));
                s.setFecha(rs.getDate("fecha"));
                s.setSancionEconomica(rs.getFloat("sancion_economica"));
                s.setSancionJuegos(rs.getInt("sancion_juegos"));
                if (jornadaActual < ConstantesUtil.JORNADA_CUARTOS) {
                    s.setJuegosCumplidos(jornadaActual - (s.getJornada() + 1));
                    if (s.getJuegosCumplidos() < 0) {
                        s.setJuegosCumplidos(0);
                    }
                    s.setActivo(true);
                }
                s.setNombreEquipo(rs.getString("nombre_equipo"));
                s.setBd(true);
                sanciones.add(s);
            }
            return sanciones;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public List<Sancion> consultaSancionesJugador(Integer idJugador, int fuerza) {
        sb = new StringBuilder();
        sb.append("select s.clave_reglamento, r.descripcion, s.observaciones, ")
                .append("s.id_jugador, concat(j.nombre, ' ', j.paterno, ' ', j.materno) nombre_jugador, ")
                .append("s.jornada, s.id_torneo, s.fecha, s.activo, s.juegos sancion_juegos, s.multa sancion_economica ")
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
                s.setDescripcionClave(rs.getString("descripcion"));
                s.setObservaciones(rs.getString("observaciones"));
                s.setIdJugador(rs.getInt("id_jugador"));
                s.setNombreJugador(rs.getString("nombre_jugador"));
                s.setJornada(rs.getInt("jornada"));
                s.setTorneo(rs.getInt("id_torneo"));
                s.setFecha(rs.getDate("fecha"));
                s.setSancionEconomica(rs.getFloat("sancion_economica"));
                s.setSancionJuegos(rs.getInt("sancion_juegos"));
                s.setJuegosCumplidos(jornadaActual - (s.getJornada() + 1));
                if (s.getJuegosCumplidos() < 0) {
                    s.setJuegosCumplidos(0);
                }
                s.setActivo(!s.getJuegosCumplidos().equals(s.getSancionJuegos()));
                s.setBd(true);
                sanciones.add(s);
            }
            return sanciones;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public void bajaSancion(Integer idJugador, String clave, String observaciones) throws LMFVGOException {
        try {
            PreparedStatement ps = getConnection().prepareStatement("update expulsados set activo = 0, observaciones = ? where id_jugador = ? and clave_reglamento = ?");
            ps.setString(1, observaciones != null ? observaciones : "");
            ps.setInt(2, idJugador);
            ps.setString(3, clave);
            ps.execute();
        } catch (SQLException ex) {
            throw new LMFVGOException("No se pudo eliminar la sancion debido a: " + ex.getMessage());
        }
    }
    
    public void guardarAmonestacion(List<Amonestado> amonestados) throws LMFVGOException {
        try {
            String query = "insert into amonestados values(?,?,?,?,?,?)";
            PreparedStatement ps = getConnection().prepareStatement(query);
            for (Amonestado a : amonestados) {
                eliminarAmonestaciones(a.getIdJugador(), a.getIdJuego());
                ps.setInt(1, a.getIdJugador());
                ps.setInt(2, a.getIdEquipo());
                ps.setInt(3, a.getIdJuego());
                ps.setInt(4, a.getJornada());
                ps.setString(5, "");
                ps.setInt(6, 1);
                ps.addBatch();
            }
            ps.executeBatch();
        } catch (SQLException ex) {
            throw new LMFVGOException("No fue posible guardar los amonestados debido a: " + ex.getMessage());
        }
    }
    
    private void eliminarAmonestaciones(Integer idJugador, Integer idJuego) throws SQLException {
        PreparedStatement ps = getConnection().prepareStatement("delete from amonestados where id_jugador = ? and id_juego = ?");
        ps.setInt(1, idJugador);
        ps.setInt(2, idJuego);
        ps.execute();
    }
    
    public List<Amonestado> consultaAmonestados(int fuerza) {
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("select a.id_jugador, concat(j.nombre, ' ', j.paterno, ' ', j.materno) nombre_jugador, a.id_equipo, ")
                    .append("e.nombre equipo, count(id_jugador) total, e.fuerza, group_concat(a.jornada order by a.jornada separator ',') jornadas ")
                    .append("from amonestados a ")
                    .append("inner join equipos e using(id_equipo) ")
                    .append("inner join jugadores j using(id_jugador) ")
                    .append("where activo = 1 ");
            if (fuerza > 0) {
                sb.append("and e.fuerza = ")
                        .append(fuerza)
                        .append(" ");
            }
            sb.append("group by id_jugador ")
                    .append("having count(id_jugador) >= 2 ")
                    .append("order by fuerza, total desc, equipo, nombre_jugador");
            ResultSet rs = getConnection().prepareStatement(sb.toString()).executeQuery();
            List<Amonestado> amonestados = new ArrayList<>();
            while (rs.next()) {
                Amonestado a = new Amonestado();
                a.setIdJugador(rs.getInt("id_jugador"));
                a.setNombreJugador(rs.getString("nombre_jugador"));
                a.setIdEquipo(rs.getInt("id_equipo"));
                a.setNombreEquipo(rs.getString("equipo"));
                a.setTotalTarjetas(rs.getInt("total"));
                a.setFuerza(rs.getInt("fuerza"));
                a.setJornadas(rs.getString("jornadas"));
                amonestados.add(a);
            }
            return amonestados;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public void quitarAmonestacion(Integer idJugador, String observaciones) {
        try {
            PreparedStatement ps = getConnection().prepareStatement("update amonestados set activo = 0, observaciones = ? where id_jugador = ?");
            ps.setString(1, observaciones);
            ps.setInt(2, idJugador);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("No se eliminaron las amonestaciones debido a: " + ex.getMessage());
        }
    }
    
    public void guardarExpulsado(List<Expulsado> expulsados) throws LMFVGOException {
        try {
            String query = "insert into expulsados(id_jugador, id_equipo, id_juego, jornada) values(?,?,?,?)";
            PreparedStatement ps = getConnection().prepareStatement(query);
            for (Expulsado e : expulsados) {
                eliminarExpulsados(e.getIdJugador(), e.getIdJuego());
                ps.setInt(1, e.getIdJugador());
                ps.setInt(2, e.getIdEquipo());
                ps.setInt(3, e.getIdJuego());
                ps.setInt(4, e.getJornada());
                ps.addBatch();
            }
            ps.executeBatch();
        } catch (SQLException ex) {
            throw new LMFVGOException("No fue posible guardar los expulsados debido a: " + ex.getMessage());
        }
    }
    
    private void eliminarExpulsados(Integer idJugador, Integer idJuego) throws SQLException {
        PreparedStatement ps = getConnection().prepareStatement("delete from expulsados where id_jugador = ? and id_juego = ?");
        ps.setInt(1, idJugador);
        ps.setInt(2, idJuego);
        ps.execute();
    }
    
    public List<Expulsado> consultaExpulsados(int fuerza) {
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("select a.id_jugador, concat(j.nombre, ' ', j.paterno, ' ', j.materno) nombre_jugador, a.id_equipo, ")
                    .append("e.nombre equipo, a.claves, e.fuerza, a.jornada, a.observaciones, a.juegos, a.multa ")
                    .append("from expulsados a ")
                    .append("inner join equipos e using(id_equipo) ")
                    .append("inner join jugadores j using(id_jugador) ")
                    .append("where a.activo = 1 ");
            if (fuerza > 0) {
                sb.append("and e.fuerza = ")
                        .append(fuerza)
                        .append(" ");
            }
            sb.append("group by id_jugador ")
                    .append("order by fuerza, equipo, nombre_jugador");
            ResultSet rs = getConnection().prepareStatement(sb.toString()).executeQuery();
            List<Expulsado> expulsados = new ArrayList<>();
            while (rs.next()) {
                Expulsado a = new Expulsado();
                a.setIdJugador(rs.getInt("id_jugador"));
                a.setNombreJugador(rs.getString("nombre_jugador"));
                a.setIdEquipo(rs.getInt("id_equipo"));
                a.setNombreEquipo(rs.getString("equipo"));
                a.setFuerza(rs.getInt("fuerza"));
                a.setClaves(rs.getString("claves"));
                a.setJornada(rs.getInt("jornada"));
                a.setObservaciones(rs.getString("observaciones"));
                a.setJuegos(rs.getInt("juegos"));
                a.setMulta(rs.getFloat("multa"));
                a.setActivo(true);
                expulsados.add(a);
            }
            return expulsados;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public void quitarExpulsion(Integer idJugador, String observaciones) throws LMFVGOException {
        try {
            PreparedStatement ps = getConnection().prepareStatement("update expulsados set activo = 0, observaciones = ? where id_jugador = ?");
            ps.setString(1, observaciones);
            ps.setInt(2, idJugador);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("No se eliminaron las expulsiones debido a: " + ex.getMessage());
        }
    }
    
    public void actualizarExpulsiones(List<Expulsado> expulsados) throws LMFVGOException {
        try {
            String query = "update expulsados set claves = ?, observaciones = ?, juegos = ?, multa = ? where id_jugador = ?";
            PreparedStatement ps = getConnection().prepareStatement(query);
            for (Expulsado e : expulsados) {
                ps.setString(1, e.getClaves() != null && !e.getClaves().isEmpty() ? e.getClaves().toUpperCase() : "");
                ps.setString(2, e.getObservaciones() != null && !e.getObservaciones().isEmpty() ? e.getObservaciones().toUpperCase() : "");
                ps.setInt(3, e.getJuegos());
                ps.setFloat(4, e.getMulta());
                ps.setInt(5, e.getIdJugador());
                ps.addBatch();
            }
            ps.executeBatch();
        } catch (SQLException ex) {
            throw new LMFVGOException("No fue posible actualizar los expulsados debido a: " + ex.getMessage());
        }
    }
    
    public List<SancionEquipo> consultaSancionesEquipo(int fuerza) {
        StringBuilder sb = new StringBuilder();
        sb.append("select e.id_equipo, e.nombre, se.juegos, se.multa, se.puntos, se.observaciones, se.activo, e.fuerza ")
                .append("from sanciones_equipo se inner join equipos e using(id_equipo) ")
                .append("where se.activo = 1 ");
        if (fuerza > 0) {
            sb.append("and e.fuerza = ").append(fuerza);
        }
        sb.append(" order by fuerza, nombre");
        try {
            ResultSet rs = getConnection().prepareStatement(sb.toString()).executeQuery();
            List<SancionEquipo> lista = new ArrayList<>();
            while (rs.next()) {
                SancionEquipo se = new SancionEquipo();
                se.setIdEquipo(rs.getInt("id_equipo"));
                se.setNombreEquipo(rs.getString("nombre"));
                se.setJuegos(rs.getInt("juegos"));
                se.setMulta(rs.getFloat("multa"));
                se.setPuntos(rs.getInt("puntos"));
                se.setObservaciones(rs.getString("observaciones"));
                se.setActivo(rs.getInt("activo") == 1);
                se.setFuerza(rs.getInt("fuerza"));
                lista.add(se);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public void guardarSanciones(List<SancionEquipo> sanciones) throws LMFVGOException {
        try {
            String query = "insert into sanciones_equipo values(?,?,?,?,?,?)";
            PreparedStatement ps = getConnection().prepareStatement(query);
            for (SancionEquipo se : sanciones) {
                eliminarSancionEquipo(se.getIdEquipo());
                ps.setInt(1, se.getIdEquipo());
                ps.setInt(2, se.getJuegos() == null ? 0 : se.getJuegos());
                ps.setFloat(3, se.getMulta() == null ? 0 : se.getMulta());
                ps.setInt(4, se.getPuntos() == null ? 0 : se.getPuntos());
                ps.setString(5, se.getObservaciones() == null ? "" : se.getObservaciones().toUpperCase());
                ps.setInt(6, 1);
                ps.addBatch();
            }
            ps.executeBatch();
        } catch (SQLException ex) {
            throw new LMFVGOException("No fue posible registrar las sanciones a los equipos debido a: " + ex.getMessage());
        }
    }
    
    private void eliminarSancionEquipo(int idEquipo) throws SQLException {
        getConnection().prepareStatement("delete from sanciones_equipo where id_equipo = " + idEquipo).execute();
    }
    
    public void quitarSancionEquipo(int idEquipo, String observaciones) throws LMFVGOException {
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("update sanciones_equipo set activo = 0, observaciones = '")
                    .append(observaciones.toUpperCase()).append("' where id_equipo = ")
                    .append(idEquipo);
            getConnection().prepareStatement(sb.toString()).execute();
        } catch (SQLException ex) {
            throw new LMFVGOException("No fue posible eliminar la sanción debido a: " + ex.getMessage());
        }
    }
    
}
