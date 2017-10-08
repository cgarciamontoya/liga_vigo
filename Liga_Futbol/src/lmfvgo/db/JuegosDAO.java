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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
    
    public Map<Integer, List<Juegos>> consultarRol(int fuerza) {
        try {
            sb = new StringBuilder();
            sb.append("select j.id_juego, j.jornada, j.local, j.visitante, j.lugar, j.resultado, j.id_torneo, j.fecha, j.fuerza, j.marcador, ")
                    .append("l.nombre local_nombre, v.nombre visitante_nombre ")
                    .append("from juegos j inner join equipos l on l.id_equipo = j.local ")
                    .append("inner join equipos v on v.id_equipo = j.visitante ")
                    .append("where j.fuerza = ? order by id_juego");
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            ps.setInt(1, fuerza);
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
                    fuerza + " order by jornada").executeQuery();
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
            sb.append("select j.id_juego, j.jornada, j.local, j.visitante, j.lugar, j.resultado, j.id_torneo, j.fecha, j.fuerza, j.marcador, ")
                    .append("j.hora, l.nombre local_nombre, v.nombre visitante_nombre ")
                    .append("from juegos j inner join equipos l on l.id_equipo = j.local ")
                    .append("inner join equipos v on v.id_equipo = j.visitante ")
                    .append("where j.jornada = ? and j.fuerza = ? order by id_juego");
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            ps.setInt(1, jornada);
            ps.setInt(2, fuerza);
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
            sb.append("update juegos set lugar = ?, fecha = ?, hora = ? where id_juego = ?");
            PreparedStatement ps = getConnection().prepareStatement(sb.toString());
            ps.setString(1, juego.getLugar().trim().toUpperCase());
            ps.setDate(2, new java.sql.Date(juego.getFecha().getTime()));
            ps.setString(3, juego.getHora());
            ps.setInt(4, juego.getIdJuego());
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
}
