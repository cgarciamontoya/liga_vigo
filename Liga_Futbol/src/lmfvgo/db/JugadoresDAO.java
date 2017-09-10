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
                sb.append("update jugadores set nombre = ?, paterno = ?, materno = ?, fecha_nacimiento = ?, lugar_procedencia = ?, ")
                        .append("fecha_registro = ?, imagen = ? where id_jugador = ?");
                ps = getConnection().prepareStatement(sb.toString());
                ps.setString(1, jugador.getNombre().trim().toUpperCase());
                ps.setString(2, jugador.getPaterno().trim().toUpperCase());
                ps.setString(3, jugador.getMaterno());
                ps.setDate(4, new java.sql.Date(jugador.getFechaNacimiento().getTime()));
                ps.setString(5, jugador.getLugarProcedencia().trim().toUpperCase());
                ps.setDate(6, new java.sql.Date(jugador.getFechaRegistro().getTime()));
                ps.setBytes(7, jugador.getImagen());
                ps.setInt(8, jugador.getIdJugador());
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
                if (jugador.getImagen().length > 0) {
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
        sb.append("select id_jugador, nombre, paterno, materno, fecha_nacimiento, lugar_procedencia, ")
                .append("fecha_registro, imagen ")
                .append("from jugadores ");
        if (filtros.getNombre() != null && !filtros.getNombre().trim().isEmpty()) {
            sb.append("where nombre like '").append(filtros.getNombre().trim().toUpperCase()).append("%' ");
        }
        if (filtros.getPaterno() != null && !filtros.getPaterno().trim().isEmpty()) {
            sb.append(!sb.toString().contains("where") ? "where " : "and ")
                    .append("paterno like '").append(filtros.getPaterno().trim().toUpperCase()).append("%' ");
        }
        if (filtros.getMaterno() != null && !filtros.getMaterno().trim().isEmpty()) {
            sb.append(!sb.toString().contains("where") ? "where " : "and ")
                    .append("materno like '").append(filtros.getMaterno().trim().toUpperCase()).append("%' ");
        }
        sb.append("order by nombre, paterno, materno");
        try {
            List<Jugadores> resultado = new ArrayList<>();
            ResultSet rs = getConnection().prepareStatement(sb.toString()).executeQuery();
            while (rs.next()) {
                Jugadores j = new Jugadores();
                j.setIdJugador(rs.getInt("id_jugador"));
                j.setNombre(rs.getString("nombre"));
                j.setPaterno(rs.getString("paterno"));
                j.setMaterno(rs.getString("materno"));
                j.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
                j.setLugarProcedencia(rs.getString("lugar_procedencia"));
                j.setFechaRegistro(rs.getDate("fecha_registro"));
                j.setImagen(rs.getBytes("imagen"));
                resultado.add(j);
            }
            return resultado;
        } catch (SQLException ex) {
            return null;
        }
    }
}
