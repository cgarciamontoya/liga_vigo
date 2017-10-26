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
import java.util.Date;

public class Torneo implements Serializable {
    private static final long serialVersionUID = 8832265877704318996L;
    private Integer idTorneo;
    private String nombre;
    private Date fechaInicio;
    private Date fechaFin;
    private Integer campeonPrimera;
    private Integer campeonSegunda;
    private Integer subcampeonPrimera;
    private Integer subcampeonSegunda;
    private String presidente;
    private String secretario;
    private String tesorero;
    private Integer goleadorPrimera;
    private Integer goleadorSegunda;

    public Integer getGoleadorPrimera() {
        return goleadorPrimera;
    }

    public void setGoleadorPrimera(Integer goleadorPrimera) {
        this.goleadorPrimera = goleadorPrimera;
    }

    public Integer getGoleadorSegunda() {
        return goleadorSegunda;
    }

    public void setGoleadorSegunda(Integer goleadorSegunda) {
        this.goleadorSegunda = goleadorSegunda;
    }
    
    public Integer getIdTorneo() {
        return idTorneo;
    }

    public void setIdTorneo(Integer idTorneo) {
        this.idTorneo = idTorneo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public Integer getCampeonPrimera() {
        return campeonPrimera;
    }

    public void setCampeonPrimera(Integer campeonPrimera) {
        this.campeonPrimera = campeonPrimera;
    }

    public Integer getCampeonSegunda() {
        return campeonSegunda;
    }

    public void setCampeonSegunda(Integer campeonSegunda) {
        this.campeonSegunda = campeonSegunda;
    }

    public Integer getSubcampeonPrimera() {
        return subcampeonPrimera;
    }

    public void setSubcampeonPrimera(Integer subcampeonPrimera) {
        this.subcampeonPrimera = subcampeonPrimera;
    }

    public Integer getSubcampeonSegunda() {
        return subcampeonSegunda;
    }

    public void setSubcampeonSegunda(Integer subcampeonSegunda) {
        this.subcampeonSegunda = subcampeonSegunda;
    }

    public String getPresidente() {
        return presidente;
    }

    public void setPresidente(String presidente) {
        this.presidente = presidente;
    }

    public String getSecretario() {
        return secretario;
    }

    public void setSecretario(String secretario) {
        this.secretario = secretario;
    }

    public String getTesorero() {
        return tesorero;
    }

    public void setTesorero(String tesorero) {
        this.tesorero = tesorero;
    }

    
}
