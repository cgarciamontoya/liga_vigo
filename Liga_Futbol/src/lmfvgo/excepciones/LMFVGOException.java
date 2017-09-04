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
package lmfvgo.excepciones;

public class LMFVGOException extends Throwable {
    private static final long serialVersionUID = 7470365177638766964L;

    public LMFVGOException() {
        super();
    }

    public LMFVGOException(String message) {
        super(message);
    }
    
}
