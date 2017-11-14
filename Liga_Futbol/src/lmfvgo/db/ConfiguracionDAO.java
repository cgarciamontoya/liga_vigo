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
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Configuracion;

/**
 *
 * @author desarrollo
 */
public class ConfiguracionDAO extends BaseDAO {

    public ConfiguracionDAO() {
        super();
    }
    
    public void guardar(Configuracion conf) throws LMFVGOException {
        try {
            PreparedStatement ps = getConnection().prepareStatement("insert into configuracion(equipos_califican, escudo, logo, id_torneo) values (?,?,?,?)");
            ps.setInt(1, conf.getEquiposCalifican());
            if (conf.getEscudo() != null && conf.getEscudo().length > 0) {
                ps.setBytes(2, conf.getEscudo());
            } else {
                ps.setNull(2, Types.BLOB);
            }
            if (conf.getLogo() != null && conf.getLogo().length > 0) {
                ps.setBytes(3, conf.getLogo());
            } else {
                ps.setNull(3, Types.BLOB);
            }
            ps.setInt(4, getIdTorneoActivo());
            ps.execute();
        } catch (SQLException ex) {
            throw new LMFVGOException("No fue posible guardar la configuracion debido a: " + ex.getMessage());
        }
    }
    
    public void actualizar(Configuracion conf) throws LMFVGOException {
        try {
            PreparedStatement ps = getConnection().prepareStatement("update configuracion set equipos_califican = ?, escudo = ?, logo = ? where id = ?");
            ps.setInt(1, conf.getEquiposCalifican());
            if (conf.getEscudo() != null && conf.getEscudo().length > 0) {
                ps.setBytes(2, conf.getEscudo());
            } else {
                ps.setNull(2, Types.BLOB);
            }
            if (conf.getLogo() != null && conf.getLogo().length > 0) {
                ps.setBytes(3, conf.getLogo());
            } else {
                ps.setNull(3, Types.BLOB);
            }
            ps.setInt(4, conf.getId());
            ps.execute();
        } catch (SQLException ex) {
            throw new LMFVGOException("No fue posible guardar la configuracion debido a: " + ex.getMessage());
        }
    }
    
    public Configuracion consultaConfiguracion() {
        try {
            PreparedStatement ps = getConnection().prepareStatement("select id, equipos_califican, escudo, logo, id_torneo from configuracion where id_torneo = ?");
            ps.setInt(1, getIdTorneoActivo());
            
            ResultSet rs = ps.executeQuery();
            rs.next();
            
            Configuracion conf = new Configuracion();
            conf.setId(rs.getInt("id"));
            conf.setEquiposCalifican(rs.getInt("equipos_califican"));
            conf.setEscudo(rs.getBytes("escudo"));
            conf.setLogo(rs.getBytes("logo"));
            conf.setIdTorneo(rs.getInt("id_torneo"));
            
            return conf;
        } catch (SQLException ex) {
            return null;
        }
    }
}
