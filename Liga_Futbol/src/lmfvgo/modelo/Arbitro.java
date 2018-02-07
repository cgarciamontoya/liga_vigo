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
public class Arbitro implements Serializable {

    private static final long serialVersionUID = -6767579522626190002L;
    
    private Integer idArbitro;
    private String nombre;
    private boolean activo;

    public Arbitro() {
    }

    public Arbitro(Integer idArbitro, String nombre, boolean activo) {
        this.idArbitro = idArbitro;
        this.nombre = nombre;
        this.activo = activo;
    }

    public Integer getIdArbitro() {
        return idArbitro;
    }

    public void setIdArbitro(Integer idArbitro) {
        this.idArbitro = idArbitro;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
    
    

}
