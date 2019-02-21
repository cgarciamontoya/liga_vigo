/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lmfvgo.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Torneo;

/**
 * Descripcion:
 * @author cgarcia
 */
public class TorneoDAO extends BaseDAO {

    public static final String ID_TORNEO = "id_torneo";
    public static final String NOMBRE_TORNEO = "nombre_torneo";
    private StringBuilder sb;
    public TorneoDAO(Connection con) {
        super(con);
    }
    
    public TorneoDAO() {
        super();
    }

    public void guardarTorneo(Torneo torneo) throws LMFVGOException {
        try {
            PreparedStatement ps = getConnection().prepareStatement("insert into torneo(nombre, fecha_inicio, presidente, secretario, tesorero) values (?,?,?,?,?)");
            ps.setString(1, torneo.getNombre().trim().toUpperCase());
            ps.setDate(2, new java.sql.Date(torneo.getFechaInicio().getTime()));
            ps.setString(3, torneo.getPresidente().toUpperCase());
            ps.setString(4, torneo.getSecretario().toUpperCase());
            if (torneo.getTesorero() != null && !torneo.getTesorero().isEmpty()) {
                ps.setString(5, torneo.getTesorero().toUpperCase());
            } else {
                ps.setNull(5, Types.VARCHAR);
            }
            ps.execute();
            
            mantenerJugadoresEquipos();
        } catch (SQLException ex) {
            throw new LMFVGOException("Ocurrio un error al guardar el torneo");
        }
    }
    
    private void mantenerJugadoresEquipos() throws SQLException {
        int torneoActivo = getIdTorneoActivo();
        if (torneoActivo > 1) {
            int torneoAnterior = getIdTorneoAnterior();
            StringBuilder sb = new StringBuilder();
            sb.append("insert into rel_equipo_jugadores (id_equipo, id_jugador, id_torneo, numero) ")
                    .append("select id_equipo, id_jugador, ")
                    .append(torneoActivo)
                    .append(", numero from rel_equipo_jugadores where id_torneo = ")
                    .append(torneoAnterior);
            
            getConnection().prepareStatement(sb.toString()).execute();
            
            sb = new StringBuilder();
            sb.append("insert into configuracion (equipos_califican, escudo, logo, id_torneo) ")
                    .append("select equipos_califican, escudo, logo, ")
                    .append(torneoActivo)
                    .append(" from configuracion where id_torneo = ")
                    .append(torneoAnterior);
            
            getConnection().prepareStatement(sb.toString()).execute();
        }
    }
    
    public void actualizarTorneo(Torneo torneo) throws LMFVGOException {
        try {
            PreparedStatement ps = getConnection().prepareStatement("update torneo set nombre = ?, fecha_inicio = ?, presidente = ?, secretario = ?, tesorero = ? where id_torneo = ?");
            ps.setString(1, torneo.getNombre().trim().toUpperCase());
            ps.setDate(2, new java.sql.Date(torneo.getFechaInicio().getTime()));
            ps.setString(3, torneo.getPresidente().toUpperCase());
            ps.setString(4, torneo.getSecretario().toUpperCase());
            if (torneo.getTesorero() != null && !torneo.getTesorero().isEmpty()) {
                ps.setString(5, torneo.getTesorero().toUpperCase());
            } else {
                ps.setNull(5, Types.VARCHAR);
            }
            ps.setInt(6, torneo.getIdTorneo());
            ps.execute();
        } catch (SQLException ex) {
            throw new LMFVGOException("Ocurrio un error al guardar el torneo");
        }
    }
    
    public void cerrarTorneo(Torneo torneo) throws LMFVGOException {
        StringBuilder sb = new StringBuilder();
        sb.append("update torneo set fecha_fin = ?, campeon_primera = ?, subcampeon_primera = ?, campeon_segunda = ?, ")
                .append("subcampeon_segunda = ?, goleador_primera = ?, goleador_segunda = ? ")
                .append("where id_torneo = ?");
        try {
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            ps.setDate(1, new java.sql.Date(torneo.getFechaFin().getTime()));
            ps.setInt(2, torneo.getCampeonPrimera());
            ps.setInt(3, torneo.getSubcampeonPrimera());
            ps.setInt(4, torneo.getCampeonSegunda());
            ps.setInt(5, torneo.getSubcampeonSegunda());
            ps.setInt(6, torneo.getGoleadorPrimera());
            ps.setInt(7, torneo.getGoleadorSegunda());
            ps.setInt(8, torneo.getIdTorneo());
            ps.execute();
            
            getConnection().prepareStatement("update amonestados set observaciones = 'CIERRE DE TORNEO', activo = 0 where activo = 1").execute();
            getConnection().prepareStatement("update amonestados set activo = 0 where activo = 1").execute();
        } catch (SQLException ex) {
            throw new LMFVGOException(ex.getMessage());
        }
    }
    
}
