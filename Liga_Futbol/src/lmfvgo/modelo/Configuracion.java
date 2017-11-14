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
public class Configuracion implements Serializable {

    private static final long serialVersionUID = 5280120143625222430L;

    private int id;
    private int equiposCalifican;
    private byte[] logo;
    private byte[] escudo;
    private int idTorneo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEquiposCalifican() {
        return equiposCalifican;
    }

    public void setEquiposCalifican(int equiposCalifican) {
        this.equiposCalifican = equiposCalifican;
    }

    public byte[] getLogo() {
        return logo;
    }

    public void setLogo(byte[] logo) {
        this.logo = logo;
    }

    public byte[] getEscudo() {
        return escudo;
    }

    public void setEscudo(byte[] escudo) {
        this.escudo = escudo;
    }

    public int getIdTorneo() {
        return idTorneo;
    }

    public void setIdTorneo(int idTorneo) {
        this.idTorneo = idTorneo;
    }
    
    
}
