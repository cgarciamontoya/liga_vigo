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

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Juegos;

public class JuegosDAO extends BaseDAO {
    
    private StringBuilder sb;

    public JuegosDAO(Connection con) {
        super(con);
    }

    public void guardarRol(Map<Integer, List<Juegos>> rol, Integer fuerza) throws LMFVGOException {
        try {
            sb = new StringBuilder();
            sb.append("insert into juegos (jornada, local, visitante, id_torneo, fuerza, cerrado) values (?,?,?,?,?,0)");
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
    
    public Map<Integer, List<Juegos>> consultarRol(int fuerza) {
        try {
            sb = new StringBuilder();
            sb.append("select j.id_juego, j.jornada, j.local, j.visitante, j.lugar, j.resultado, j.id_torneo, j.fecha, j.fuerza, j.marcador, ")
                    .append("l.nombre local_nombre, v.nombre visitante_nombre, j.cerrado ")
                    .append("from juegos j inner join equipos l on l.id_equipo = j.local ")
                    .append("inner join equipos v on v.id_equipo = j.visitante where j.fuerza = ? ")
                    .append("and j.id_torneo = ? order by jornada, id_juego");
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            ps.setInt(1, fuerza);
            ps.setInt(2, getIdTorneoActivo());
            ResultSet rs = ps.executeQuery();
            Map<Integer, List<Juegos>> rol = null;
            if (rs != null) {
                rol = new HashMap<>();
                while (rs.next()) {
                    Juegos j = new Juegos();
                    j.setIdJuego(rs.getInt("id_juego"));
                    j.setJornada(rs.getInt("jornada"));
                    j.setLocal(rs.getInt("local"));
                    j.setLocalNombre(rs.getString("local_nombre"));
                    j.setVisitante(rs.getInt("visitante"));
                    j.setVisitanteNombre(rs.getString("visitante_nombre"));
                    j.setLugar(rs.getString("lugar"));
                    j.setResultado(rs.getInt("resultado"));
                    j.setIdTorneo(rs.getInt("id_torneo"));
                    j.setFecha(rs.getDate("fecha"));
                    j.setFuerza(rs.getInt("fuerza"));
                    j.setMarcador(rs.getString("marcador"));
                    j.setCerrado(rs.getInt("cerrado") == 1);
                    if (rol.get(j.getJornada()) == null) {
                        rol.put(j.getJornada(), new ArrayList<Juegos>());
                    }
                    rol.get(j.getJornada()).add(j);
                }
            }
            return rol;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public List<Integer> consultaNumeroJornadas(Integer fuerza) {
        try {
            ResultSet rs = getConnection().prepareStatement("select distinct(jornada) jornada from juegos where fuerza = " + 
                    fuerza + " and id_torneo = " + getIdTorneoActivo() + " order by jornada").executeQuery();
            List<Integer> jornadas = new ArrayList<>();
            while (rs.next()) {
                jornadas.add(rs.getInt("jornada"));
            }
            return jornadas;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public List<Juegos> consultaJuegosJornada(Integer fuerza, Integer jornada) {
        try {
            sb = new StringBuilder();
            sb.append("select j.id_juego, j.jornada, j.local, j.visitante, j.lugar, j.resultado, j.id_torneo, j.fecha, j.fuerza, j.marcador, j.arbitro, ar.nombre arbitro_nombre, ")
                    .append("j.hora, l.nombre local_nombre, v.nombre visitante_nombre, j.cerrado, ")
                    .append("(select sum(goles_favor) from estadisticas_equipo where id_juego = j.id_juego and id_equipo = j.local) golesLocal, ")
                    .append("(select sum(goles_favor) from estadisticas_equipo where id_juego = j.id_juego and id_equipo = j.visitante) golesVisita ")
                    .append("from juegos j inner join equipos l on l.id_equipo = j.local ")
                    .append("inner join equipos v on v.id_equipo = j.visitante ")
                    .append("left join arbitros ar on ar.id_arbitro = j.arbitro ")
                    .append("where j.jornada = ? and j.fuerza = ? and j.id_torneo = ? order by id_juego");
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            ps.setInt(1, jornada);
            ps.setInt(2, fuerza);
            ps.setInt(3, getIdTorneoActivo());
            ResultSet rs = ps.executeQuery();
            List<Juegos> juegos = new ArrayList<>();
            while (rs.next()) {
                Juegos j = new Juegos();
                    j.setIdJuego(rs.getInt("id_juego"));
                    j.setJornada(rs.getInt("jornada"));
                    j.setLocal(rs.getInt("local"));
                    j.setLocalNombre(rs.getString("local_nombre"));
                    j.setVisitante(rs.getInt("visitante"));
                    j.setVisitanteNombre(rs.getString("visitante_nombre"));
                    j.setLugar(rs.getString("lugar"));
                    j.setResultado(rs.getInt("resultado"));
                    j.setIdTorneo(rs.getInt("id_torneo"));
                    j.setFecha(rs.getDate("fecha"));
                    j.setFuerza(rs.getInt("fuerza"));
                    j.setMarcador(rs.getString("marcador"));
                    j.setHora(rs.getString("hora"));
                    j.setCerrado(rs.getInt("cerrado") == 1);
                    j.setGolesLocal(rs.getObject("golesLocal") != null ? rs.getInt("golesLocal") : null);
                    j.setGolesVisita(rs.getObject("golesVisita") != null ? rs.getInt("golesVisita") : null);
                    j.setIdArbitro(rs.getInt("arbitro"));
                    j.setNombreArbitro(rs.getString("arbitro_nombre"));
                    juegos.add(j);
            }
            return juegos;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public void actualizarDatosJornadaJuego(Juegos juego) throws LMFVGOException {
        try {
            sb = new StringBuilder();
            sb.append("update juegos set lugar = ?, fecha = ?, hora = ?, arbitro = ? where id_juego = ?");
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            ps.setString(1, juego.getLugar().trim().toUpperCase());
            ps.setDate(2, new java.sql.Date(juego.getFecha().getTime()));
            ps.setString(3, juego.getHora());
            if (juego.getIdArbitro() == null || juego.getIdArbitro() == 0) {
                ps.setNull(4, Types.INTEGER);
            } else {
                ps.setInt(4, juego.getIdArbitro());
            }
            ps.setInt(5, juego.getIdJuego());
            ps.execute();
        } catch (SQLException ex) {
            throw new LMFVGOException(ex.getMessage());
        }
    }
    
    public void actualizarMarcadorJuego(int idJuego, int resultado, String marcador) throws LMFVGOException {
        try {
            PreparedStatement ps = getConnection().prepareStatement
                        ("update juegos set resultado = ?, marcador = ? where id_juego = ?");
            ps.setInt(1, resultado);
            ps.setString(2, marcador);
            ps.setInt(3, idJuego);
            ps.execute();
        } catch (SQLException ex) {
            throw new LMFVGOException(ex.getMessage());
        }
    }
    
    public void cerrarJornada(int jornada, int fuerza) throws LMFVGOException {
        try {
            PreparedStatement ps = getConnection().prepareStatement("update juegos set cerrado = 1 where jornada = ? and id_torneo = ? and fuerza = ?");
            ps.setInt(1, jornada);
            ps.setInt(2, getIdTorneoActivo());
            ps.setInt(3, fuerza);
            
            ps.execute();
        } catch (SQLException ex) {
            throw new LMFVGOException("No fue posible cerrar la jornada debido a: " + ex.getMessage());
        }
    }
    
}
