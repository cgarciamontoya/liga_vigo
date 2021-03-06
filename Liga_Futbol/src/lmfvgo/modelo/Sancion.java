/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Descripción:
 * Fecha: 1/11/2017
 * Autor: Carlos A. García M.
 */
package lmfvgo.modelo;

import java.io.Serializable;
import java.util.Date;

public class Sancion implements Serializable {
    private static final long serialVersionUID = -3190477992211459130L;

    private Integer idJugador;
    private String nombreJugador;
    private String clave;
    private String descripcionClave;
    private Integer jornada;
    private Date fecha;
    private boolean activo;
    private Integer torneo;
    private Integer sancionJuegos;
    private Float sancionEconomica;
    private Integer juegosCumplidos;
    private String nombreEquipo;
    private int idEquipo;
    private String observaciones;
    private boolean bd;

    public Integer getIdJugador() {
        return idJugador;
    }

    public void setIdJugador(Integer idJugador) {
        this.idJugador = idJugador;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public Integer getJornada() {
        return jornada;
    }

    public void setJornada(Integer jornada) {
        this.jornada = jornada;
    }

    public String getNombreJugador() {
        return nombreJugador;
    }

    public void setNombreJugador(String nombreJugador) {
        this.nombreJugador = nombreJugador;
    }

    public String getDescripcionClave() {
        return descripcionClave;
    }

    public void setDescripcionClave(String descripcionClave) {
        this.descripcionClave = descripcionClave;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public Integer getTorneo() {
        return torneo;
    }

    public void setTorneo(Integer torneo) {
        this.torneo = torneo;
    }

    public Integer getSancionJuegos() {
        return sancionJuegos;
    }

    public void setSancionJuegos(Integer sancionJuegos) {
        this.sancionJuegos = sancionJuegos;
    }

    public Float getSancionEconomica() {
        return sancionEconomica;
    }

    public void setSancionEconomica(Float sancionEconomica) {
        this.sancionEconomica = sancionEconomica;
    }

    public Integer getJuegosCumplidos() {
        return juegosCumplidos;
    }

    public void setJuegosCumplidos(Integer juegosCumplidos) {
        this.juegosCumplidos = juegosCumplidos;
    }

    public String getNombreEquipo() {
        return nombreEquipo;
    }

    public void setNombreEquipo(String nombreEquipo) {
        this.nombreEquipo = nombreEquipo;
    }

    public int getIdEquipo() {
        return idEquipo;
    }

    public void setIdEquipo(int idEquipo) {
        this.idEquipo = idEquipo;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public boolean isBd() {
        return bd;
    }

    public void setBd(boolean bd) {
        this.bd = bd;
    }
    
    
    
}
