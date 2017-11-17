/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Descripción:
 * Fecha: 13/11/2017
 * Autor: Carlos A. García M.
 */
package lmfvgo.reportes.vo;

import java.io.Serializable;

public class RolVO implements Serializable {
    private static final long serialVersionUID = 5065207672341058071L;

    private String jornada;
    private String local;
    private String visitante;

    public String getJornada() {
        return jornada;
    }

    public void setJornada(String jornada) {
        this.jornada = jornada;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public String getVisitante() {
        return visitante;
    }

    public void setVisitante(String visitante) {
        this.visitante = visitante;
    }

    
}
