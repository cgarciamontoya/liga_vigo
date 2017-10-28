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

    private String clave;
    private String descripcion;
    private Integer sancionJuegos;
    private Float sancionEconomica;

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
    
    
}
