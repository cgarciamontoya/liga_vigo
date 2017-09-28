/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lmfvgo.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Jugadores;

/**
 * Descripcion:
 * @author cgarcia
 */
public class JugadoresDAO extends BaseDAO {
    
    private StringBuilder sb;
    private SimpleDateFormat sdf;

    public JugadoresDAO() {
        super();
        sdf = new SimpleDateFormat("yyyy-MM-dd");
    }

    public void guardarJugador(Jugadores jugador) throws LMFVGOException {
        sb = new StringBuilder();
        try {
            PreparedStatement ps = null;
            if (jugador.getIdJugador() != null && jugador.getIdJugador() > 0) {
                sb.append("update jugadores set nombre = ?, paterno = ?, materno = ?, fecha_nacimiento = ?, lugar_procedencia = ?");
                if (jugador.getImagen() != null && jugador.getImagen().length > 0) {
                    sb.append(", imagen = ?");
                }
                sb.append(" where id_jugador = ?");
                ps = getConnection().prepareStatement(sb.toString());
                ps.setString(1, jugador.getNombre().trim().toUpperCase());
                ps.setString(2, jugador.getPaterno().trim().toUpperCase());
                ps.setString(3, jugador.getMaterno());
                ps.setDate(4, new java.sql.Date(jugador.getFechaNacimiento().getTime()));
                ps.setString(5, jugador.getLugarProcedencia().trim().toUpperCase());
                if (jugador.getImagen() != null && jugador.getImagen().length > 0) {
                    ps.setBytes(6, jugador.getImagen());
                    ps.setInt(7, jugador.getIdJugador());
                } else {
                    ps.setInt(6, jugador.getIdJugador());
                }
                
            } else {
                sb.append("insert into jugadores(nombre, paterno, materno, fecha_nacimiento, lugar_procedencia, fecha_registro, ")
                        .append("imagen) values(?,?,?,?,?,?,?)");
                ps = getConnection().prepareStatement(sb.toString());
                ps.setString(1, jugador.getNombre().trim().toUpperCase());
                ps.setString(2, jugador.getPaterno().trim().toUpperCase());
                ps.setString(3, jugador.getMaterno());
                ps.setDate(4, new java.sql.Date(jugador.getFechaNacimiento().getTime()));
                ps.setString(5, jugador.getLugarProcedencia().trim().toUpperCase());
                ps.setDate(6, new java.sql.Date(jugador.getFechaRegistro().getTime()));
                if (jugador.getImagen() != null && jugador.getImagen().length > 0) {
                    ps.setBytes(7, jugador.getImagen());
                } else {
                    ps.setNull(7, Types.BLOB);
                }
            }
            ps.execute();
        } catch (SQLException ex) {
            throw new LMFVGOException(ex.getMessage());
        }
    }
    
    public List<Jugadores> consultarJugadores(Jugadores filtros) {
        sb = new StringBuilder();
        sb.append("select j.id_jugador, j.nombre, j.paterno, j.materno, j.lugar_procedencia, ")
                .append("e.nombre equipo_nombre, e.fuerza ")
                .append("from jugadores j left join rel_equipo_jugadores rel on rel.id_jugador = j.id_jugador ")
                .append("left join equipos e on e.id_equipo = rel.id_equipo ");
        if (filtros.getNombre() != null && !filtros.getNombre().trim().isEmpty()) {
            sb.append("where j.nombre like '").append(filtros.getNombre().trim().toUpperCase()).append("%' ");
        }
        if (filtros.getPaterno() != null && !filtros.getPaterno().trim().isEmpty()) {
            sb.append(!sb.toString().contains("where") ? "where " : "and ")
                    .append("j.paterno like '").append(filtros.getPaterno().trim().toUpperCase()).append("%' ");
        }
        if (filtros.getMaterno() != null && !filtros.getMaterno().trim().isEmpty()) {
            sb.append(!sb.toString().contains("where") ? "where " : "and ")
                    .append("j.materno like '").append(filtros.getMaterno().trim().toUpperCase()).append("%' ");
        }
        if (filtros.getEquipo() > 0) {
            sb.append(!sb.toString().contains("where") ? "where " : "and ")
                    .append("e.id_equipo = ").append(filtros.getEquipo()).append(" ");
        }
        if (filtros.getFuerza() > 0) {
            sb.append(!sb.toString().contains("where") ? "where " : "and ")
                    .append("e.fuerza = ").append(filtros.getFuerza()).append(" ");
        }
        sb.append("order by nombre, paterno, materno, equipo_nombre");
        try {
            List<Jugadores> resultado = new ArrayList<>();
            ResultSet rs = getConnection().prepareStatement(sb.toString()).executeQuery();
            while (rs.next()) {
                Jugadores j = new Jugadores();
                j.setIdJugador(rs.getInt("id_jugador"));
                j.setNombre(rs.getString("nombre"));
                j.setPaterno(rs.getString("paterno"));
                j.setMaterno(rs.getString("materno"));
                j.setLugarProcedencia(rs.getString("lugar_procedencia"));
                j.setEquipoNombre(rs.getString("equipo_nombre"));
                j.setFuerza(rs.getInt("fuerza"));
                resultado.add(j);
            }
            return resultado;
        } catch (SQLException ex) {
            return null;
        }
    }

    public Jugadores consultarJugadorId(int idJugador) {
        sb = new StringBuilder();
        sb.append("select id_jugador, nombre, paterno, materno, fecha_nacimiento, lugar_procedencia, ")
                .append("fecha_registro, imagen ")
                .append("from jugadores where id_jugador = ? ");
        try {
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            ps.setInt(1, idJugador);
            ResultSet rs = ps.executeQuery();
            rs.next();
            Jugadores j = new Jugadores();
            j.setIdJugador(rs.getInt("id_jugador"));
            j.setNombre(rs.getString("nombre"));
            j.setPaterno(rs.getString("paterno"));
            j.setMaterno(rs.getString("materno"));
            j.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
            j.setLugarProcedencia(rs.getString("lugar_procedencia"));
            j.setFechaRegistro(rs.getDate("fecha_registro"));
            j.setImagen(rs.getBytes("imagen"));
            return j;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public List<String> consultaJugadoresLibre() {
        try {
            sb = new StringBuilder();
            sb.append("select j.id_jugador, j.nombre, j.paterno, j.materno ")
                    .append("from jugadores j ")
                    .append("where j.id_jugador not in ")
                    .append("(select distinct(id_jugador) from rel_equipo_jugadores) ")
                    .append("order by nombre, paterno, materno");
            ResultSet rs = getConnection().prepareStatement(sb.toString()).executeQuery();
            List<String> jug = new ArrayList<>();
            while (rs.next()) {
                jug.add(rs.getInt("id_jugador") + " - " + rs.getString("nombre") + " " + rs.getString("paterno") + " " + rs.getString("materno"));
            }
            return jug;
        } catch (SQLException ex) {
            return null;
        }
    }
}
