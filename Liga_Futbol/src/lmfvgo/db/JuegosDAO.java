/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Descripción:
 * Fecha: 4/10/2017
 * Autor: Carlos A. García M.
 */
package lmfvgo.db;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Juegos;

public class JuegosDAO extends BaseDAO {
    
    private StringBuilder sb;

    public JuegosDAO() {
        super();
    }

    public void guardarRol(Map<Integer, List<Juegos>> rol, Integer fuerza) throws LMFVGOException {
        try {
            sb = new StringBuilder();
            sb.append("insert into juegos (jornada, local, visitante, id_torneo, fuerza) values (?,?,?,?, ?)");
            Integer idTorneo = getIdTorneoActivo();
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            for (Integer jor : rol.keySet()) {
                for (Juegos j : rol.get(jor)) {
                    ps.setInt(1, jor);
                    ps.setInt(2, j.getLocal());
                    ps.setInt(3, j.getVisitante());
                    ps.setInt(4, idTorneo);
                    ps.setInt(5, fuerza);
                    ps.addBatch();
                }
            }
            ps.executeBatch();
        } catch (SQLException ex) {
            throw new LMFVGOException("No fue posible guardar el rol de juegos para la " + (fuerza == 1 ? "Primera fuerza" : "Segunda fuerza"));
        }
    }
}
