/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Descripción:
 * Fecha: 26/10/2017
 * Autor: Carlos A. García M.
 */
package lmfvgo.reportes.vo;

import java.io.Serializable;

public class CedulaVO implements Serializable {
    private static final long serialVersionUID = 1751835653292398074L;

    public CedulaVO() {
    }

    public CedulaVO(String equipo) {
        this.equipo = equipo;
    }
    
    private String nombre;
    private String equipo;
    private Integer numero;
    private String equipoAnterior;
    private Integer idJugador;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEquipo() {
        return equipo;
    }

    public void setEquipo(String equipo) {
        this.equipo = equipo;
    }

    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public String getEquipoAnterior() {
        return equipoAnterior;
    }

    public void setEquipoAnterior(String equipoAnterior) {
        this.equipoAnterior = equipoAnterior;
    }

    public Integer getIdJugador() {
        return idJugador;
    }

    public void setIdJugador(Integer idJugador) {
        this.idJugador = idJugador;
    }
    

}
