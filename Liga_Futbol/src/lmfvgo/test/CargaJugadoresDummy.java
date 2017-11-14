/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lmfvgo.test;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import lmfvgo.db.JugadoresDAO;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Jugadores;

/**
 *
 * @author desarrollo
 */
public class CargaJugadoresDummy {

    public static void main(String[] args) {
        new CargaJugadoresDummy().cargarJugadores();
    }
    
    private void cargarJugadores() {
        try {
            JugadoresDAO dao = new JugadoresDAO();
            List<Jugadores> jugadores = initNombres();
            for (Jugadores j : jugadores) {
                dao.guardarJugador(j);
            }
            System.out.println("FINALIZADO");
        } catch (LMFVGOException ex) {
            ex.printStackTrace();
        }
    }
    
    private List<Jugadores> initNombres() {
        List<Jugadores> nombres = new ArrayList<>();
        Date fecha = new Date();
        for (int i = 0; i < 150; i++) {
            Jugadores j = new Jugadores();
            j.setNombre("Nombre_" + i);
            j.setPaterno("Paterno_" + i);
            j.setMaterno("Materno_" + i);
            j.setLugarProcedencia("Villa gonzalez ortega");
            j.setFechaNacimiento(fecha);
            j.setFechaRegistro(fecha);
            nombres.add(j);
        }
        return nombres;
    }
}
