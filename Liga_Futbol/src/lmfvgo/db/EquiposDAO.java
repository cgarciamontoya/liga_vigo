/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lmfvgo.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Equipos;

/**
 *
 * @author sandra
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
                    .append("from equipos where fecha_baja is null ");
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
    
}
