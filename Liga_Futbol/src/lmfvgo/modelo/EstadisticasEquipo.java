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

public class EstadisticasEquipo implements Serializable {
    private static final long serialVersionUID = 4129361300181992670L;
    private Integer idEstadistica;
    private Integer idEquipo;
    private Integer idJuego;
    private int golesFavor;
    private int golesContra;
    private int puntos;

    public EstadisticasEquipo() {
    }

    public EstadisticasEquipo(Integer idEstadistica) {
        this.idEstadistica = idEstadistica;
    }

    public EstadisticasEquipo(Integer idEstadistica, int golesFavor, int golesContra, int puntos) {
        this.idEstadistica = idEstadistica;
        this.golesFavor = golesFavor;
        this.golesContra = golesContra;
        this.puntos = puntos;
    }

    public Integer getIdEstadistica() {
        return idEstadistica;
    }

    public void setIdEstadistica(Integer idEstadistica) {
        this.idEstadistica = idEstadistica;
    }

    public int getGolesFavor() {
        return golesFavor;
    }

    public void setGolesFavor(int golesFavor) {
        this.golesFavor = golesFavor;
    }

    public int getGolesContra() {
        return golesContra;
    }

    public void setGolesContra(int golesContra) {
        this.golesContra = golesContra;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }

    public Integer getIdEquipo() {
        return idEquipo;
    }

    public void setIdEquipo(Integer idEquipo) {
        this.idEquipo = idEquipo;
    }

    public Integer getIdJuego() {
        return idJuego;
    }

    public void setIdJuego(Integer idJuego) {
        this.idJuego = idJuego;
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEstadistica != null ? idEstadistica.hashCode() : 0);
        return hash;
    }

    

    @Override
    public String toString() {
        return "lmfvgo.modelo.EstadisticasEquipo[ idEstadistica=" + idEstadistica + " ]";
    }

}
