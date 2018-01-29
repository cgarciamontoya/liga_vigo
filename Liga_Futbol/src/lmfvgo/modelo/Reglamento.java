/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lmfvgo.modelo;

import java.io.Serializable;

/**
 * Descripcion:
 * @author cgarcia
 */
public class Reglamento implements Serializable {

    private static final long serialVersionUID = 693319328029127288L;

    private String clave;
    private String descripcion;

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

}
