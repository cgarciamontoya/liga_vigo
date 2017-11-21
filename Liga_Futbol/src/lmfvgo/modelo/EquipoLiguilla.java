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
public class EquipoLiguilla implements Serializable {

    private static final long serialVersionUID = 2255090744898789521L;

    private int idEquipo;
    private String nombre;
    private int posicion;
    private boolean eliminado;
    private int jornada;

    public EquipoLiguilla() {
    }
    
    public EquipoLiguilla(int idEquipo, String nombre, int posicion) {
        this.idEquipo = idEquipo;
        this.nombre = nombre;
        this.posicion = posicion;
    }

    public EquipoLiguilla(int idEquipo, String nombre, int posicion, boolean eliminado, int jornada) {
        this.idEquipo = idEquipo;
        this.nombre = nombre;
        this.posicion = posicion;
        this.eliminado = eliminado;
        this.jornada = jornada;
    }
    
    public int getIdEquipo() {
        return idEquipo;
    }

    public void setIdEquipo(int idEquipo) {
        this.idEquipo = idEquipo;
    }

    public int getPosicion() {
        return posicion;
    }

    public void setPosicion(int posicion) {
        this.posicion = posicion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isEliminado() {
        return eliminado;
    }

    public void setEliminado(boolean eliminado) {
        this.eliminado = eliminado;
    }

    public int getJornada() {
        return jornada;
    }

    public void setJornada(int jornada) {
        this.jornada = jornada;
    }
    
    
}
