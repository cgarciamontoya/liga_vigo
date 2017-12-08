/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lmfvgo.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Reglamento;

/**
 * Descripcion:
 * @author cgarcia
 */
public class ReglamentoDAO extends BaseDAO {
    
    private StringBuilder sb;

    public ReglamentoDAO(Connection con) {
        super(con);
    }

    public void guardarReglamento(Reglamento reglamento) throws LMFVGOException {
        sb = new StringBuilder();
        sb.append("insert into reglamento(clave, descripcion, sancion_juegos, sancion_economica) values (?,?,?,?)");
        try {
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            ps.setString(1, reglamento.getClave().toUpperCase());
            ps.setString(2, reglamento.getDescripcion().toUpperCase());
            if (reglamento.getSancionJuegos() != null && reglamento.getSancionJuegos() > 0) {
                ps.setInt(3, reglamento.getSancionJuegos());
            } else {
                ps.setNull(3, Types.INTEGER);
            }
            if (reglamento.getSancionEconomica() != null && reglamento.getSancionEconomica() > 0) {
                ps.setFloat(4, reglamento.getSancionEconomica());
            } else {
                ps.setNull(4, Types.FLOAT);
            }
            ps.execute();
        } catch (SQLException ex) {
            throw new LMFVGOException("No fue posible guardar el reglamento");
        }
    }
    
    public void actualizarReglamento(Reglamento reglamento) throws LMFVGOException {
        sb = new StringBuilder();
        sb.append("update reglamento set descripcion = ?, sancion_juegos = ?, sancion_economica = ? where clave = ?");
        try {
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            ps.setString(1, reglamento.getDescripcion().toUpperCase());
            if (reglamento.getSancionJuegos() != null && reglamento.getSancionJuegos() > 0) {
                ps.setInt(2, reglamento.getSancionJuegos());
            } else {
                ps.setNull(2, Types.INTEGER);
            }
            if (reglamento.getSancionEconomica() != null && reglamento.getSancionEconomica() > 0) {
                ps.setFloat(3, reglamento.getSancionEconomica());
            } else {
                ps.setNull(3, Types.FLOAT);
            }
            ps.setString(4, reglamento.getClave().toUpperCase());
            ps.execute();
        } catch (SQLException ex) {
            throw new LMFVGOException("No fue posible actualizar el reglamento");
        }
    }
    
    public List<Reglamento> consultaPorFiltros(Reglamento filtros) {
        sb = new StringBuilder();
        sb.append("select clave, descripcion, sancion_juegos, sancion_economica from reglamento ");
        if (filtros.getClave() != null && !filtros.getClave().isEmpty()) {
            sb.append("where clave = '").append(filtros.getClave().toUpperCase()).append("' ");
        }
        if (filtros.getDescripcion() != null && !filtros.getDescripcion().isEmpty()) {
            sb.append(!sb.toString().contains("where ") ? "where " : "and ")
                    .append("descripcion like '%").append(filtros.getDescripcion().toUpperCase()).append("' ");
        }
        if (filtros.getSancionJuegos() != null && filtros.getSancionJuegos() > 0) {
            sb.append(!sb.toString().contains("where ") ? "where " : "and ")
                    .append("sancion_juegos = ")
                    .append(filtros.getSancionJuegos()).append(" ");
        }
        if (filtros.getSancionEconomica() != null && filtros.getSancionEconomica() > 0) {
            sb.append(!sb.toString().contains("where ") ? "where " : "and ")
                    .append("sancion_economica = ")
                    .append(filtros.getSancionEconomica()).append(" ");
        }
        sb.append("order by clave");
        try {
            ResultSet rs = getConnection().prepareStatement(sb.toString()).executeQuery();
            List<Reglamento> reglas = new ArrayList<>();
            while (rs.next()) {
                Reglamento r = new Reglamento();
                r.setClave(rs.getString("clave"));
                r.setDescripcion(rs.getString("descripcion"));
                r.setSancionJuegos(rs.getInt("sancion_juegos"));
                r.setSancionEconomica(rs.getFloat("sancion_economica"));
                reglas.add(r);
            }
            return reglas;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public Reglamento consultaPorClave(String clave) {
        sb = new StringBuilder();
        sb.append("select clave, descripcion, sancion_juegos, sancion_economica from reglamento where clave = '")
                .append(clave.toUpperCase()).append("'");
        try {
            ResultSet rs = getConnection().prepareStatement(sb.toString()).executeQuery();
            Reglamento r = new Reglamento();
            while (rs.next()) {
                r.setClave(rs.getString("clave"));
                r.setDescripcion(rs.getString("descripcion"));
                r.setSancionJuegos(rs.getInt("sancion_juegos"));
                r.setSancionEconomica(rs.getFloat("sancion_economica"));
                break;
            }
            return r;
        } catch (SQLException ex) {
            return null;
        }
    }
}
