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
import java.util.Date;
import java.util.List;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Equipos;
import lmfvgo.reportes.vo.CedulaVO;

/**
 *
 * @author cgarcia
 */
public class EquiposDAO extends BaseDAO {
    
    private StringBuilder sb;

    public EquiposDAO() {
        super();
    }
    
    public void guardarEquipo(Equipos equipo) throws LMFVGOException {
        try {
            sb = new StringBuilder();
            if (equipo.getIdEquipo() == null || equipo.getIdEquipo() == 0) {
                sb.append("insert into equipos(nombre, fuerza, fecha_registro) values ('")
                        .append(equipo.getNombre().trim().toUpperCase()).append("', ")
                        .append(equipo.getFuerza()).append(", '")
                        .append(new SimpleDateFormat("yyyy-MM-dd").format(new Date())).append("')");
            } else {
                sb.append("update equipos set nombre = '").append(equipo.getNombre().trim().toUpperCase()).append("', ")
                        .append("fuerza = ").append(equipo.getFuerza()).append(" ")
                        .append("where id_equipo = ").append(equipo.getIdEquipo());
            }
            getConnection().prepareStatement(sb.toString()).execute();
        } catch (SQLException ex) {
            throw new LMFVGOException(ex.getMessage());
        }
    }
    
    public void altaEquipoDescansa(int fuerza) throws LMFVGOException {
        sb = new StringBuilder();
        sb.append("insert into equipos(nombre, fuerza, fecha_registro) values ('DESCANSA', ?, ?)");
        try {
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            ps.setInt(1, fuerza);
            ps.setDate(2, new java.sql.Date(new Date().getTime()));
            
            ps.execute();
        } catch (SQLException ex) {
            throw new LMFVGOException(ex.getMessage());
        }
    }
    
    public Equipos getEquipoDescansa(int fuerza) {
        try {
            ResultSet rs = getConnection().prepareStatement("select id_equipo, nombre from equipos where fuerza = " + fuerza).executeQuery();
            rs.next();
            return new Equipos(rs.getInt("id_equipo"), rs.getString("nombre"), fuerza, null);
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public void bajaEquipo(int idEquipo, String motivoBaja) throws LMFVGOException {
        try {
            sb = new StringBuilder();
            sb.append("update equipos set motivo_baja = '").append(motivoBaja.trim().toUpperCase()).append("', ")
                    .append("fecha_baja = '").append(new SimpleDateFormat("yyyy-MM-dd").format(new Date())).append("' ")
                    .append("where id_equipo = ").append(idEquipo);
            getConnection().prepareStatement(sb.toString()).execute();
        } catch (SQLException ex) {
            throw new LMFVGOException(ex.getMessage());
        }
    }
    
    public List<Equipos> consultarEquipo(String nombre, int fuerza) {
        try {
            sb = new StringBuilder();
            sb.append("select id_equipo, nombre, fuerza, fecha_registro, fecha_baja, motivo_baja ")
                    .append("from equipos where nombre not in ('DESCANSA') and fecha_baja is null ");
            if (nombre != null && !nombre.trim().isEmpty()) {
                sb.append("and nombre like '").append(nombre.trim().toUpperCase()).append("%' ");
            }
            if (fuerza > 0) {
                sb.append("and fuerza = ").append(fuerza).append(" ");
            }
            sb.append("order by fuerza, nombre");
            ResultSet rs = getConnection().prepareStatement(sb.toString()).executeQuery();
            List<Equipos> resultado = new ArrayList<>();
            while (rs.next()) {
                Equipos eq = new Equipos();
                eq.setIdEquipo(rs.getInt("id_equipo"));
                eq.setNombre(rs.getString("nombre"));
                eq.setFuerza(rs.getInt("fuerza"));
                eq.setFechaRegistro(rs.getDate("fecha_registro"));
                eq.setFechaBaja(rs.getObject("fecha_baja") != null ? rs.getDate("fecha_baja") : null);
                eq.setMotivoBaja(rs.getObject("motivo_baja") != null ? rs.getString("motivo_baja") : null);
                resultado.add(eq);
            }
            return resultado;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public List<Equipos> consultarEquipoRol(int fuerza) {
        try {
            sb = new StringBuilder();
            sb.append("select id_equipo, nombre, fuerza, fecha_registro, fecha_baja, motivo_baja ")
                    .append("from equipos where nombre not in ('DESCANSA') and fecha_baja is null ");
            if (fuerza > 0) {
                sb.append("and fuerza = ").append(fuerza).append(" ");
            }
            sb.append("order by fuerza, nombre");
            ResultSet rs = getConnection().prepareStatement(sb.toString()).executeQuery();
            List<Equipos> resultado = new ArrayList<>();
            while (rs.next()) {
                Equipos eq = new Equipos();
                eq.setIdEquipo(rs.getInt("id_equipo"));
                eq.setNombre(rs.getString("nombre"));
                eq.setFuerza(rs.getInt("fuerza"));
                eq.setFechaRegistro(rs.getDate("fecha_registro"));
                eq.setFechaBaja(rs.getObject("fecha_baja") != null ? rs.getDate("fecha_baja") : null);
                eq.setMotivoBaja(rs.getObject("motivo_baja") != null ? rs.getString("motivo_baja") : null);
                resultado.add(eq);
            }
            return resultado;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public void limpiarEquipo(int idEquipo) throws LMFVGOException {
        try {
            getConnection().prepareStatement("delete from rel_equipo_jugadores where id_equipo = " + idEquipo).execute();
        } catch (SQLException ex) {
            throw new LMFVGOException("Ocurrio un error al limpiar los datos del equipo");
        }
    }
    
    public void guardarJugadoresEquipo(int idEquipo, List<CedulaVO> idsJugadores) throws LMFVGOException {
        try {
            sb = new StringBuilder();
            sb.append("insert into rel_equipo_jugadores (id_equipo, id_jugador, id_torneo, numero) values (?,?,?,?)");
            Integer idTorneo = getIdTorneoActivo();
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            for (CedulaVO idJug: idsJugadores) {
                ps.setInt(1, idEquipo);
                ps.setInt(2, idJug.getIdJugador());
                ps.setInt(3, idTorneo);
                if (idJug.getNumero() != null && !idJug.getNumero().isEmpty()) {
                    ps.setString(4, idJug.getNumero());
                } else {
                    ps.setNull(4, Types.VARCHAR);
                }
                ps.addBatch();
            }
            ps.executeBatch();
        } catch (SQLException ex) {
            throw new LMFVGOException("No fue posible guardar los jugadores");
        }
    }
    
    public void guardarEquiposLiguilla(List<Integer> ids) throws LMFVGOException {
        try {
            String query = "insert into control_liguilla(id_torneo, id_equipo, eliminado) values (?,?,0)";
            PreparedStatement ps = getConnection().prepareStatement(query);
            Integer idTorneo = getIdTorneoActivo();
            for (Integer id : ids) {
                ps.setInt(1, idTorneo);
                ps.setInt(2, id);
                ps.addBatch();
            }
            ps.executeBatch();
        } catch (SQLException ex) {
            throw new LMFVGOException("No se pudo guardar la configuracion de la liguilla debido a: " + ex.getMessage());
        }
    }
    
    public void eliminarEquipoLiguilla(int idEquipo) throws LMFVGOException {
        try {
            PreparedStatement ps = getConnection().prepareStatement("update contro_liguilla set eliminado = 1 where id_torneo = ? and id_equipo = ?");
            ps.setInt(1, getIdTorneoActivo());
            ps.setInt(2, idEquipo);
            ps.execute();
        } catch (SQLException ex) {
            throw new LMFVGOException("No se pudo eliminar el equipo de la liguilla");
        }
    }
    
    public List<Equipos> consultaEquiposLiguilla(int fuerza) {
        try {
            sb = new StringBuilder();
            sb.append("select e.id_equipo, e.nombre, e.fuerza, e.fecha_registro ")
                    .append("from equipos e inner join control_liguilla cl on cl.id_equipo = e.id_equipo ")
                    .append("where cl.eliminado = 0 and cl.id_torneo = ? and e.fuerza = ?");
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            ps.setInt(1, getIdTorneoActivo());
            ps.setInt(2, fuerza);
            
            ResultSet rs = ps.executeQuery();
            List<Equipos> equipos = new ArrayList<>();
            while (rs.next()) {
                equipos.add(new Equipos(rs.getInt("id_equipo"), rs.getString("nombre"), rs.getInt("fuerza"), rs.getDate("fecha_registro")));
            }
            return equipos;
        } catch (SQLException ex) {
            return null;
        }
    }
    
}
