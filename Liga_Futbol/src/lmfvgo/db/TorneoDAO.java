/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lmfvgo.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
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
    public TorneoDAO() {
        super();
    }

    public void guardarTorneo(String nombre, Date fechaInicio) throws LMFVGOException {
        try {
            PreparedStatement ps = getConnection().prepareStatement("insert into torneo(nombre, fecha_inicio) values (?,?)");
            ps.setString(1, nombre.trim().toUpperCase());
            ps.setDate(2, new java.sql.Date(fechaInicio.getTime()));
            
            ps.execute();
        } catch (SQLException ex) {
            throw new LMFVGOException("Ocurrio un error al guardar el torneo");
        }
    }
    
    public void cerrarTorneo(Torneo torneo) throws LMFVGOException {
        
    }
    
    public Map<String,Object> torneoActivo() {
        try {
            ResultSet rs = getConnection().prepareStatement("select id_torneo, nombre from torneo where fecha_fin is null").executeQuery();
            rs.next();
            Map<String, Object> mapa = new HashMap<>();
            mapa.put(ID_TORNEO, rs.getInt("id_torneo"));
            mapa.put(NOMBRE_TORNEO, rs.getString("nombre"));
            return mapa;
        } catch (SQLException ex) {
            return null;
        }
    }
    
}
