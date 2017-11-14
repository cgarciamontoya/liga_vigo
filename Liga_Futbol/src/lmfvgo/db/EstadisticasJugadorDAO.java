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
import lmfvgo.modelo.EstadisticasJugador;

/**
 * Descripcion:
 * @author cgarcia
 */
public class EstadisticasJugadorDAO extends BaseDAO {

    private StringBuilder sb;
    
    public EstadisticasJugadorDAO() {
        super();
    }

    public List<EstadisticasJugador> consultarEstadisticasJuego(Integer idEquipo, Integer idJuego) {
        sb = new StringBuilder();
        sb.append("select ej.id_estadistica, ej.id_jugador, ej.id_juego, ej.goles, ej.ta, ej.tr, ej.inicio_cambio_nj, ej.id_equipo, ")
                .append("concat(j.id_jugador, ' - ',j.nombre, ' ', j.paterno, ' ', j.materno) jugador_nombre, rel.numero ")
                .append("from estadisticas_jugador ej inner join jugadores j on j.id_jugador = ej.id_jugador ")
                .append("left join rel_equipo_jugadores rel on rel.id_jugador = j.id_jugador ")
                .append("where ej.id_equipo = ? and ej.id_juego = ?");
        try {
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            ps.setInt(1, idEquipo);
            ps.setInt(2, idJuego);
            
            List<EstadisticasJugador> estadisticas = new ArrayList<>();
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                EstadisticasJugador est = new EstadisticasJugador();
                est.setIdEstadistica(rs.getInt("id_estadistica"));
                est.setIdJugador(rs.getInt("id_jugador"));
                est.setIdJuego(rs.getInt("id_juego"));
                est.setGoles(rs.getInt("goles"));
                est.setTa(rs.getInt("ta"));
                est.setTr(rs.getInt("tr"));
                est.setInicioCambioNj(rs.getString("inicio_cambio_nj"));
                est.setIdEquipo(rs.getInt("id_equipo"));
                est.setNombreJugador(rs.getString("jugador_nombre"));
                est.setNumero(rs.getString("numero"));
                estadisticas.add(est);
            }
            return estadisticas;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public void guardarEstadisticasJuego(List<EstadisticasJugador> estadisticas) throws LMFVGOException {
        try {
            sb = new StringBuilder();
            sb.append("insert into estadisticas_jugador (id_jugador, id_juego, goles, ta, tr, inicio_cambio_nj, id_equipo) ")
                    .append("values (?,?,?,?,?,?,?)");
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            for (EstadisticasJugador ej: estadisticas) {
                ps.setInt(1, ej.getIdJugador());
                ps.setInt(2, ej.getIdJuego());
                ps.setInt(3, ej.getGoles());
                ps.setInt(4, ej.getTa());
                ps.setInt(5, ej.getTr());
                ps.setString(6, ej.getInicioCambioNj());
                ps.setInt(7, ej.getIdEquipo());
                ps.addBatch();
            }
            ps.executeBatch();
        } catch (SQLException ex) {
            throw new LMFVGOException("No fue posible guardar las estadisticas del juego");
        }
    }
    
    public void actualizarEstadisticasJuego(List<EstadisticasJugador> estadisticas) throws LMFVGOException {
        try {
            sb = new StringBuilder();
            sb.append("update estadisticas_jugador set goles = ?, ta = ?, tr = ?, inicio_cambio_nj = ? where id_jugador = ? and id_juego = ?");
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            for (EstadisticasJugador ej: estadisticas) {
                ps.setInt(1, ej.getGoles());
                ps.setInt(2, ej.getTa());
                ps.setInt(3, ej.getTr());
                ps.setString(4, ej.getInicioCambioNj());
                ps.setInt(5, ej.getIdJugador());
                ps.setInt(6, ej.getIdJuego());
                ps.addBatch();
            }
            ps.executeBatch();
        } catch (SQLException ex) {
            throw new LMFVGOException("No fue posible guardar las estadisticas del juego");
        }
    }
    
}
