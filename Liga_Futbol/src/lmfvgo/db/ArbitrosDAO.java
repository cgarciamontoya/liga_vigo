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
import java.util.ArrayList;
import java.util.List;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Arbitro;

/**
 *
 * @author desarrollo
 */
public class ArbitrosDAO extends BaseDAO {


    public ArbitrosDAO(Connection con) {
        super(con);
    }
    
    public void guardar(Arbitro arbitro) throws LMFVGOException {
        try {
            PreparedStatement ps = null;
            if (arbitro.getIdArbitro() != null && arbitro.getIdArbitro() > 0) {
                ps = getConnection().prepareStatement("update arbitros set nombre = ? where id_arbitro = ?");
                ps.setString(1, arbitro.getNombre().trim().toUpperCase());
                ps.setInt(2, arbitro.getIdArbitro());
            } else {
                ps = getConnection().prepareStatement("insert into arbitros (nombre) values (?)");
                ps.setString(1, arbitro.getNombre().toUpperCase());
            }
            ps.execute();
        }catch (SQLException ex) {
            throw new LMFVGOException("El registro no se pudo guardar/actualizar debido a: " + ex.getMessage());
        }
    }
    
    public void baja(Integer idArbitro) throws LMFVGOException {
        try {
            getConnection().prepareStatement("update arbitros set activo = 0 where id_arbitro = " + idArbitro).execute();
        } catch (SQLException ex) {
            throw new LMFVGOException("No se pudo dar de baja el arbitro debido a: " + ex.getMessage());
        }
    }
    
    public List<Arbitro> consultaArbitros(String nombre) {
        StringBuilder sb = new StringBuilder();
        sb.append("select id_arbitro, nombre, activo from arbitros where activo = 1");
        if (nombre != null && !nombre.isEmpty()) {
            sb.append(" and nombre like '")
                    .append(nombre.toUpperCase())
                    .append("%'");
        }
        sb.append(" order by nombre");
        try {
            ResultSet rs = getConnection().prepareStatement(sb.toString()).executeQuery();
            List<Arbitro> lista = new ArrayList<>();
            while (rs.next()) {
                lista.add(new Arbitro(rs.getInt("id_arbitro"), rs.getString("nombre"), (rs.getInt("activo") == 1)));
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        }
    }
}
