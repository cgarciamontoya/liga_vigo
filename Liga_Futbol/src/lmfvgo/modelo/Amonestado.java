/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lmfvgo.modelo;

import java.io.Serializable;

/**
 *
 * @author desarrollo
 */
public class Amonestado implements Serializable {

    private static final long serialVersionUID = 6546167560999756703L;

    private Integer idJugador;
    private String nombreJugador;
    private Integer idEquipo;
    private String nombreEquipo;
    private Integer idJuego;
    private Integer jornada;
    private String observaciones;
    private int totalTarjetas;
    private int fuerza;

    public Amonestado() {
    }

    public Amonestado(Integer idJugador, Integer idEquipo, Integer idJuego, Integer jornada) {
        this.idJugador = idJugador;
        this.idEquipo = idEquipo;
        this.idJuego = idJuego;
        this.jornada = jornada;
    }
    
    public Integer getIdJugador() {
        return idJugador;
    }

    public void setIdJugador(Integer idJugador) {
        this.idJugador = idJugador;
    }

    public String getNombreJugador() {
        return nombreJugador;
    }

    public void setNombreJugador(String nombreJugador) {
        this.nombreJugador = nombreJugador;
    }

    public Integer getIdEquipo() {
        return idEquipo;
    }

    public void setIdEquipo(Integer idEquipo) {
        this.idEquipo = idEquipo;
    }

    public String getNombreEquipo() {
        return nombreEquipo;
    }

    public void setNombreEquipo(String nombreEquipo) {
        this.nombreEquipo = nombreEquipo;
    }

    public Integer getJornada() {
        return jornada;
    }

    public void setJornada(Integer jornada) {
        this.jornada = jornada;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Integer getIdJuego() {
        return idJuego;
    }

    public void setIdJuego(Integer idJuego) {
        this.idJuego = idJuego;
    }

    public int getTotalTarjetas() {
        return totalTarjetas;
    }

    public void setTotalTarjetas(int totalTarjetas) {
        this.totalTarjetas = totalTarjetas;
    }

    public int getFuerza() {
        return fuerza;
    }

    public void setFuerza(int fuerza) {
        this.fuerza = fuerza;
    }
    
    

}
