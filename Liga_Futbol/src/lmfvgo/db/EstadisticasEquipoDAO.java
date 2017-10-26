/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lmfvgo.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.EstadisticasEquipo;
import lmfvgo.modelo.EstadisticasJugador;

/**
 * Descripcion:
 * @author cgarcia
 */
public class EstadisticasEquipoDAO extends BaseDAO {

    StringBuilder sb = null;
    
    public EstadisticasEquipoDAO() {
        super();
    }

    public void guardarEstadisticas(EstadisticasEquipo estadisticas) throws LMFVGOException {
        sb = new StringBuilder();
        sb.append("insert into estadisticas_equipo (id_juego, id_equipo, goles_favor, goles_contra, puntos) ")
                .append("values (?,?,?,?,?)");
        try {
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
                ps.setInt(1, estadisticas.getIdJuego());
                ps.setInt(2, estadisticas.getIdEquipo());
                ps.setInt(3, estadisticas.getGolesFavor());
                ps.setInt(4, estadisticas.getGolesContra());
                ps.setInt(5, estadisticas.getPuntos());
            ps.execute();
        } catch (SQLException ex) {
            throw new LMFVGOException(ex.getMessage());
        }
    }
    
    public void actualizarEstadisticas(EstadisticasEquipo estadisticas) throws LMFVGOException {
        sb = new StringBuilder();
        sb.append("update estadisticas_equipo set goles_favor = ?, goles_contra = ?, puntos= ? ")
                .append("where id_estadistica = ?");
        try {
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
                ps.setInt(1, estadisticas.getGolesFavor());
                ps.setInt(2, estadisticas.getGolesContra());
                ps.setInt(3, estadisticas.getPuntos());
                ps.setInt(4, estadisticas.getIdEstadistica());
            ps.execute();
        } catch (SQLException ex) {
            throw new LMFVGOException(ex.getMessage());
        }
    }
    
    public EstadisticasEquipo consultaEstadisticaEquipo(Integer idJuego, Integer idEquipo) {
        sb = new StringBuilder();
        sb.append("select id_estadistica, id_juego, id_equipo, goles_favor, goles_contra, puntos ")
                .append("from estadisticas_equipo where id_juego = ? and id_equipo = ?");
        try {
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            ps.setInt(1, idJuego);
            ps.setInt(2, idEquipo);
            
            ResultSet rs = ps.executeQuery();
            EstadisticasEquipo ee = new EstadisticasEquipo();
            while (rs.next()) {
                ee.setIdEstadistica(rs.getInt("id_estadistica"));
                ee.setIdJuego(rs.getInt("id_juego"));
                ee.setIdEquipo(rs.getInt("id_equipo"));
                ee.setGolesFavor(rs.getInt("goles_favor"));
                ee.setGolesContra(rs.getInt("goles_contra"));
                ee.setPuntos(rs.getInt("puntos"));
            }
            return ee;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public List<EstadisticasEquipo> consultaEstadisticasFuerza(int fuerza) {
        sb = new StringBuilder();
        sb.append("select ee.id_equipo, eq.nombre, ")
                .append("sum(ee.goles_favor) gf, sum(ee.goles_contra) gc, ")
                .append("(sum(ee.goles_favor) - sum(ee.goles_contra)) dif, ")
                .append("sum(ee.puntos) pts, count(ee.id_juego) jj ")
                .append("from estadisticas_equipo ee ")
                .append("inner join equipos eq on eq.id_equipo = ee.id_equipo ")
                .append("where eq.fuerza = ? and eq.nombre not in ('DESCANSA') ")
                .append("group by id_equipo ")
                .append("order by pts desc, dif desc, gf desc, gc desc ");
        try {
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            ps.setInt(1, fuerza);
            
            int i = 1;
            ResultSet rs = ps.executeQuery();
            List<EstadisticasEquipo> estadisticas = new ArrayList<>();
            while (rs.next()) {
                EstadisticasEquipo ee = new EstadisticasEquipo();
                ee.setPosicion(i);
                ee.setIdEquipo(rs.getInt("id_equipo"));
                ee.setEquipoNombre(rs.getString("nombre"));
                ee.setPartidosJugados(rs.getInt("jj"));
                ee.setGolesFavor(rs.getInt("gf"));
                ee.setGolesContra(rs.getInt("gc"));
                ee.setDifGoles(rs.getInt("dif"));
                ee.setPuntos(rs.getInt("pts"));
                estadisticas.add(ee);
                i++;
            }
            return estadisticas;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public List<EstadisticasJugador> consultaGoleo(int fuerza) {
        sb = new StringBuilder();
        sb.append("select j.id_jugador, concat(j.nombre, ' ', j.paterno, ' ', j.materno) nombre, ")
                .append("e.id_equipo, e.nombre equipo, ")
                .append("sum(ej.goles) goles ")
                .append("from estadisticas_jugador ej ")
                .append("inner join rel_equipo_jugadores rel on rel.id_jugador = ej.id_jugador ")
                .append("inner join equipos e on e.id_equipo = rel.id_equipo ")
                .append("inner join jugadores j on ej.id_jugador = j.id_jugador ")
                .append("where e.fuerza = ? ")
                .append("group by id_jugador order by goles desc, equipo, nombre ")
                .append("limit 0, 5 ");
        try {
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            ps.setInt(1, fuerza);
            
            ResultSet rs = ps.executeQuery();
            List<EstadisticasJugador> estadisticas = new ArrayList<>();
            int i = 1;
            while (rs.next()) {
                EstadisticasJugador ej = new EstadisticasJugador();
                ej.setPosicion(i);
                ej.setIdJugador(rs.getInt("id_jugador"));
                ej.setNombreJugador(rs.getString("nombre"));
                ej.setIdEquipo(rs.getInt("id_equipo"));
                ej.setNombreEquipo(rs.getString("equipo"));
                ej.setGoles(rs.getInt("goles"));
                if (ej.getGoles() > 0) {
                    estadisticas.add(ej);
                }
                i++;
            }
            return estadisticas;
        } catch (SQLException ex) {
            return null;
        }
    }
}
