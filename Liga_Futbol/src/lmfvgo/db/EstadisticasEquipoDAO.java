/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lmfvgo.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.EstadisticasEquipo;

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
    
}
