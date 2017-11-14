/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Descripción:
 * Fecha: 4/09/2017
 * Autor: Carlos A. García M.
 */
package lmfvgo.modelo;

import java.io.Serializable;

public class EstadisticasJugador implements Serializable {
    private static final long serialVersionUID = 8021510397649512539L;
    private Integer idEstadistica;
    private Integer goles;
    private Integer ta;
    private Integer tr;
    private String inicioCambioNj;
    private Integer idEquipo;
    private Integer idJugador;
    private Integer idJuego;
    private String nombreJugador;
    private String nombreEquipo;
    private int posicion;
    
    private String numero;

    public EstadisticasJugador() {
    }

    public EstadisticasJugador(Integer idEstadistica) {
        this.idEstadistica = idEstadistica;
    }

    public EstadisticasJugador(Integer idEstadistica, String inicioCambioNj) {
        this.idEstadistica = idEstadistica;
        this.inicioCambioNj = inicioCambioNj;
    }

    public String getNombreJugador() {
        return nombreJugador;
    }

    public void setNombreJugador(String nombreJugador) {
        this.nombreJugador = nombreJugador;
    }

    public Integer getIdJuego() {
        return idJuego;
    }

    public void setIdJuego(Integer idJuego) {
        this.idJuego = idJuego;
    }

    public Integer getIdEstadistica() {
        return idEstadistica;
    }

    public void setIdEstadistica(Integer idEstadistica) {
        this.idEstadistica = idEstadistica;
    }

    public Integer getGoles() {
        return goles;
    }

    public void setGoles(Integer goles) {
        this.goles = goles;
    }

    public Integer getTa() {
        return ta;
    }

    public void setTa(Integer ta) {
        this.ta = ta;
    }

    public Integer getTr() {
        return tr;
    }

    public void setTr(Integer tr) {
        this.tr = tr;
    }

    public String getInicioCambioNj() {
        return inicioCambioNj;
    }

    public void setInicioCambioNj(String inicioCambioNj) {
        this.inicioCambioNj = inicioCambioNj;
    }

    public Integer getIdEquipo() {
        return idEquipo;
    }

    public void setIdEquipo(Integer idEquipo) {
        this.idEquipo = idEquipo;
    }

    public Integer getIdJugador() {
        return idJugador;
    }

    public void setIdJugador(Integer idJugador) {
        this.idJugador = idJugador;
    }

    public String getNombreEquipo() {
        return nombreEquipo;
    }

    public void setNombreEquipo(String nombreEquipo) {
        this.nombreEquipo = nombreEquipo;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }
    
    
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEstadistica != null ? idEstadistica.hashCode() : 0);
        return hash;
    }

    public int getPosicion() {
        return posicion;
    }

    public void setPosicion(int posicion) {
        this.posicion = posicion;
    }
    
    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EstadisticasJugador)) {
            return false;
        }
        EstadisticasJugador other = (EstadisticasJugador) object;
        if ((this.idEstadistica == null && other.idEstadistica != null) || (this.idEstadistica != null && !this.idEstadistica.equals(other.idEstadistica))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "lmfvgo.modelo.EstadisticasJugador[ idEstadistica=" + idEstadistica + " ]";
    }

}
