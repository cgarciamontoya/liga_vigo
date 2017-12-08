/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lmfvgo.enums;

/**
 *
 * @author desarrollo
 */
public enum ResultadosJuegoEnum {
    EMPATE(0), LOCAL(1), VISITANTE(2);
    
    private int resultado;
    
    ResultadosJuegoEnum(int resultado) {
        this.resultado = resultado;
    }

    public int getResultado() {
        return resultado;
    }
}
