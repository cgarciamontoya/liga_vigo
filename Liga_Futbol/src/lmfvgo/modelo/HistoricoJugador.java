/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lmfvgo.modelo;

import java.util.Date;

/**
 *
 * @author cgarcia
 */
public class HistoricoJugador {

    private int idTorneo;
    private String nombreTorneo;
    private Date fechaTorneo;
    private int idEquipo;
    private String nombreEquipo;

    public int getIdTorneo() {
        return idTorneo;
    }

    public void setIdTorneo(int idTorneo) {
        this.idTorneo = idTorneo;
    }

    public String getNombreTorneo() {
        return nombreTorneo;
    }

    public void setNombreTorneo(String nombreTorneo) {
        this.nombreTorneo = nombreTorneo;
    }

    public Date getFechaTorneo() {
        return fechaTorneo;
    }

    public void setFechaTorneo(Date fechaTorneo) {
        this.fechaTorneo = fechaTorneo;
    }

    public int getIdEquipo() {
        return idEquipo;
    }

    public void setIdEquipo(int idEquipo) {
        this.idEquipo = idEquipo;
    }

    public String getNombreEquipo() {
        return nombreEquipo;
    }

    public void setNombreEquipo(String nombreEquipo) {
        this.nombreEquipo = nombreEquipo;
    }
    
    
}
