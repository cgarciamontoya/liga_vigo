/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lmfvgo.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lmfvgo.modelo.Equipos;
import lmfvgo.modelo.Juegos;

/**
 * Descripcion:
 * @author cgarcia
 */
public class GeneradorRolJuegos {

    public static Map<Integer, List<Juegos>> generarRol10(List<Equipos> equipos, Integer idTorneo) {
        Map<Integer, List<Juegos>> rol = new HashMap<>();
        Integer[] j1 = new Integer[]{0,7,1,2,3,6,4,5,9,8};
        Integer[] j2 = new Integer[]{2,0,5,9,6,4,7,3,8,1};
        Integer[] j3 = new Integer[]{0,8,1,5,3,2,7,6,9,4};
        Integer[] j4 = new Integer[]{2,7,4,1,5,0,6,9,8,3};
        Integer[] j5 = new Integer[]{0,4,1,9,2,6,3,5,7,8};
        Integer[] j6 = new Integer[]{4,3,5,7,6,1,8,2,9,0};
        Integer[] j7 = new Integer[]{0,1,2,5,3,9,7,4,8,6};
        Integer[] j8 = new Integer[]{0,6,1,3,4,2,5,8,9,7};
        Integer[] j9 = new Integer[]{2,9,3,0,6,5,7,1,8,4};
        
        rol.put(1, generarJornada(j1, equipos, idTorneo, 1));
        rol.put(2, generarJornada(j2, equipos, idTorneo, 2));
        rol.put(3, generarJornada(j3, equipos, idTorneo, 3));
        rol.put(4, generarJornada(j4, equipos, idTorneo, 4));
        rol.put(5, generarJornada(j5, equipos, idTorneo, 5));
        rol.put(6, generarJornada(j6, equipos, idTorneo, 6));
        rol.put(7, generarJornada(j7, equipos, idTorneo, 7));
        rol.put(8, generarJornada(j8, equipos, idTorneo, 8));
        rol.put(9, generarJornada(j9, equipos, idTorneo, 9));
        
        //2a vuelta
        rol.put(10, generarJornada2a(j1, equipos, idTorneo, 10));
        rol.put(11, generarJornada2a(j2, equipos, idTorneo, 11));
        rol.put(12, generarJornada2a(j3, equipos, idTorneo, 12));
        rol.put(13, generarJornada2a(j4, equipos, idTorneo, 13));
        rol.put(14, generarJornada2a(j5, equipos, idTorneo, 14));
        rol.put(15, generarJornada2a(j6, equipos, idTorneo, 15));
        rol.put(16, generarJornada2a(j7, equipos, idTorneo, 16));
        rol.put(17, generarJornada2a(j8, equipos, idTorneo, 17));
        rol.put(18, generarJornada2a(j9, equipos, idTorneo, 18));
        
        return rol;
    }
    
    public static Map<Integer, List<Juegos>> generarRol12(List<Equipos> equipos, Integer idTorneo) {
        Map<Integer, List<Juegos>> rol = new HashMap<>();
        Integer[] j1 = new Integer[]{1,7,10,4,2,9,5,0,6,3,8,11};
        Integer[] j2 = new Integer[]{0,1,11,2,3,8,4,6,7,10,9,5};
        Integer[] j3 = new Integer[]{10,1,2,3,5,11,6,7,8,4,9,0};
        Integer[] j4 = new Integer[]{0,10,1,6,11,9,3,5,4,2,7,8};
        Integer[] j5 = new Integer[]{11,0,2,7,5,4,6,10,8,1,9,3};
        Integer[] j6 = new Integer[]{0,6,1,2,10,8,3,11,4,9,7,5};
        Integer[] j7 = new Integer[]{11,4,2,10,3,0,5,1,8,6,9,7};
        Integer[] j8 = new Integer[]{0,8,1,9,10,5,4,3,6,2,7,11};
        Integer[] j9 = new Integer[]{11,1,2,8,3,7,4,0,5,6,9,10};
        Integer[] j10 = new Integer[]{1,3,10,11,2,0,6,9,7,4,8,5};
        Integer[] j11 = new Integer[]{0,7,11,6,3,10,4,1,5,2,9,8};
        
        rol.put(1, generarJornada(j1, equipos, idTorneo, 1));
        rol.put(2, generarJornada(j2, equipos, idTorneo, 2));
        rol.put(3, generarJornada(j3, equipos, idTorneo, 3));
        rol.put(4, generarJornada(j4, equipos, idTorneo, 4));
        rol.put(5, generarJornada(j5, equipos, idTorneo, 5));
        rol.put(6, generarJornada(j6, equipos, idTorneo, 6));
        rol.put(7, generarJornada(j7, equipos, idTorneo, 7));
        rol.put(8, generarJornada(j8, equipos, idTorneo, 8));
        rol.put(9, generarJornada(j9, equipos, idTorneo, 9));
        rol.put(10, generarJornada(j10, equipos, idTorneo, 10));
        rol.put(11, generarJornada(j11, equipos, idTorneo, 11));
        
        //2a Vuelta
        rol.put(12, generarJornada2a(j1, equipos, idTorneo, 12));
        rol.put(13, generarJornada2a(j2, equipos, idTorneo, 13));
        rol.put(14, generarJornada2a(j3, equipos, idTorneo, 14));
        rol.put(15, generarJornada2a(j4, equipos, idTorneo, 15));
        rol.put(16, generarJornada2a(j5, equipos, idTorneo, 16));
        rol.put(17, generarJornada2a(j6, equipos, idTorneo, 17));
        rol.put(18, generarJornada2a(j7, equipos, idTorneo, 18));
        rol.put(19, generarJornada2a(j8, equipos, idTorneo, 19));
        rol.put(20, generarJornada2a(j9, equipos, idTorneo, 20));
        rol.put(21, generarJornada2a(j10, equipos, idTorneo, 21));
        rol.put(22, generarJornada2a(j11, equipos, idTorneo, 22));
        
        return rol;
    }
    
    public static Map<Integer, List<Juegos>> generarRol14(List<Equipos> equipos, Integer idTorneo) {
        Map<Integer, List<Juegos>> rol = new HashMap<>();
        Integer[] j1 = new Integer[]{10,3,12,2,13,6,4,11,7,1,8,5,9,0};
        Integer[] j2 = new Integer[]{0,8,1,4,11,13,2,10,3,9,5,7,6,12};
        Integer[] j3 = new Integer[]{12,11,13,1,4,5,6,2,7,0,8,3,9,10};
        Integer[] j4 = new Integer[]{0,4,1,12,10,8,11,6,2,9,3,7,5,13};
        Integer[] j5 = new Integer[]{11,2,12,5,13,0,4,3,6,1,7,10,8,9};
        Integer[] j6 = new Integer[]{0,12,1,11,10,4,2,8,3,13,5,6,9,7};
        Integer[] j7 = new Integer[]{1,2,11,5,12,3,13,10,4,9,6,0,7,8};
        Integer[] j8 = new Integer[]{0,11,10,12,2,7,3,6,5,1,8,4,9,13};
        Integer[] j9 = new Integer[]{1,0,11,3,12,9,13,8,4,7,5,2,6,10};
        Integer[] j10 = new Integer[]{0,5,10,11,2,4,3,1,7,13,8,12,9,6};
        Integer[] j11 = new Integer[]{0,2,1,10,11,9,12,7,13,4,5,3,6,8};
        Integer[] j12 = new Integer[]{10,5,13,2,3,0,4,12,7,6,8,11,9,1};
        Integer[] j13 = new Integer[]{0,10,1,8,11,7,12,13,2,3,5,9,6,4};
        
        rol.put(1, generarJornada(j1, equipos, idTorneo, 1));
        rol.put(2, generarJornada(j2, equipos, idTorneo, 2));
        rol.put(3, generarJornada(j3, equipos, idTorneo, 3));
        rol.put(4, generarJornada(j4, equipos, idTorneo, 4));
        rol.put(5, generarJornada(j5, equipos, idTorneo, 5));
        rol.put(6, generarJornada(j6, equipos, idTorneo, 6));
        rol.put(7, generarJornada(j7, equipos, idTorneo, 7));
        rol.put(8, generarJornada(j8, equipos, idTorneo, 8));
        rol.put(9, generarJornada(j9, equipos, idTorneo, 9));
        rol.put(10, generarJornada(j10, equipos, idTorneo, 10));
        rol.put(11, generarJornada(j11, equipos, idTorneo, 11));
        rol.put(12, generarJornada(j12, equipos, idTorneo, 12));
        rol.put(13, generarJornada(j13, equipos, idTorneo, 13));
        
        //2a vuelta
        rol.put(14, generarJornada2a(j1, equipos, idTorneo, 14));
        rol.put(15, generarJornada2a(j2, equipos, idTorneo, 15));
        rol.put(16, generarJornada2a(j3, equipos, idTorneo, 16));
        rol.put(17, generarJornada2a(j4, equipos, idTorneo, 17));
        rol.put(18, generarJornada2a(j5, equipos, idTorneo, 18));
        rol.put(19, generarJornada2a(j6, equipos, idTorneo, 19));
        rol.put(20, generarJornada2a(j7, equipos, idTorneo, 20));
        rol.put(21, generarJornada2a(j8, equipos, idTorneo, 21));
        rol.put(22, generarJornada2a(j9, equipos, idTorneo, 22));
        rol.put(23, generarJornada2a(j10, equipos, idTorneo, 23));
        rol.put(24, generarJornada2a(j11, equipos, idTorneo, 24));
        rol.put(25, generarJornada2a(j12, equipos, idTorneo, 25));
        rol.put(26, generarJornada2a(j13, equipos, idTorneo, 26));
        
        return rol;
    }

    public static Map<Integer, List<Juegos>> generarRol16(List<Equipos> equipos, Integer idTorneo) {
        Map<Integer, List<Juegos>> rol = new HashMap<>();
        Integer[] j1 = new Integer[]{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
        Integer[] j2 = new Integer[]{11,6,13,2,15,8,7,10,1,14,3,4,9,12,5,0};
        Integer[] j3 = new Integer[]{0,9,7,11,2,1,4,15,6,5,8,13,10,3,14,12};
        Integer[] j4 = new Integer[]{13,4,15,6,0,10,1,7,3,5,9,11,12,8,14,2};
        Integer[] j5 = new Integer[]{11,14,15,1,2,4,8,3,9,13,5,7,10,6,12,0};
        Integer[] j6 = new Integer[]{13,0,7,8,1,12,3,15,4,10,6,2,5,11,14,9};
        Integer[] j7 = new Integer[]{11,3,15,13,0,14,2,7,1,6,8,4,9,10,12,5};
        Integer[] j8 = new Integer[]{11,2,13,14,7,3,4,1,6,12,8,0,5,9,10,15};
        Integer[] j9 = new Integer[]{15,11,0,4,2,5,1,13,3,6,9,7,12,10,14,8};
        Integer[] j10 = new Integer[]{11,13,7,15,2,12,3,9,4,14,6,0,5,1,10,8};
        Integer[] j11 = new Integer[]{13,10,15,5,0,3,1,11,8,2,9,6,12,4,14,7};
        Integer[] j12 = new Integer[]{11,0,7,12,2,15,3,1,4,9,6,8,5,13,10,14};
        Integer[] j13 = new Integer[]{13,3,0,7,1,10,4,6,8,11,9,2,12,15,14,5};
        Integer[] j14 = new Integer[]{11,4,15,9,7,13,2,0,1,8,3,12,6,14,5,10};
        Integer[] j15 = new Integer[]{13,6,0,15,4,7,8,5,9,1,10,2,12,11,14,3};
        
        rol.put(1, generarJornada(j1, equipos, idTorneo, 1));
        rol.put(2, generarJornada(j2, equipos, idTorneo, 2));
        rol.put(3, generarJornada(j3, equipos, idTorneo, 3));
        rol.put(4, generarJornada(j4, equipos, idTorneo, 4));
        rol.put(5, generarJornada(j5, equipos, idTorneo, 5));
        rol.put(6, generarJornada(j6, equipos, idTorneo, 6));
        rol.put(7, generarJornada(j7, equipos, idTorneo, 7));
        rol.put(8, generarJornada(j8, equipos, idTorneo, 8));
        rol.put(9, generarJornada(j9, equipos, idTorneo, 9));
        rol.put(10, generarJornada(j10, equipos, idTorneo, 10));
        rol.put(11, generarJornada(j11, equipos, idTorneo, 11));
        rol.put(12, generarJornada(j12, equipos, idTorneo, 12));
        rol.put(13, generarJornada(j13, equipos, idTorneo, 13));
        rol.put(14, generarJornada(j14, equipos, idTorneo, 14));
        rol.put(15, generarJornada(j15, equipos, idTorneo, 15));
        
        //2a vuelta
        rol.put(16, generarJornada2a(j1, equipos, idTorneo, 16));
        rol.put(17, generarJornada2a(j2, equipos, idTorneo, 17));
        rol.put(18, generarJornada2a(j3, equipos, idTorneo, 18));
        rol.put(19, generarJornada2a(j4, equipos, idTorneo, 19));
        rol.put(20, generarJornada2a(j5, equipos, idTorneo, 20));
        rol.put(21, generarJornada2a(j6, equipos, idTorneo, 21));
        rol.put(22, generarJornada2a(j7, equipos, idTorneo, 22));
        rol.put(23, generarJornada2a(j8, equipos, idTorneo, 23));
        rol.put(24, generarJornada2a(j9, equipos, idTorneo, 24));
        rol.put(25, generarJornada2a(j10, equipos, idTorneo, 25));
        rol.put(26, generarJornada2a(j11, equipos, idTorneo, 26));
        rol.put(27, generarJornada2a(j12, equipos, idTorneo, 27));
        rol.put(28, generarJornada2a(j13, equipos, idTorneo, 28));
        rol.put(29, generarJornada2a(j14, equipos, idTorneo, 29));
        rol.put(30, generarJornada2a(j15, equipos, idTorneo, 30));
        
        return rol;
    }    
    private static List<Juegos> generarJornada(Integer[] juegosJornada, List<Equipos> equipos, Integer idTorneo, Integer jornada) {
        List<Juegos> juegos = new ArrayList<>();
        int i = 0;
        for (i = 0; i < juegosJornada.length; i+=2) {
            Juegos jgo = new Juegos();
            jgo.setJornada(jornada);
            jgo.setIdTorneo(idTorneo);
            jgo.setLocal(equipos.get(juegosJornada[i]).getIdEquipo());
            jgo.setLocalNombre(equipos.get(juegosJornada[i]).getNombre());
            jgo.setVisitante(equipos.get(juegosJornada[i+1]).getIdEquipo());
            jgo.setVisitanteNombre(equipos.get(juegosJornada[i+1]).getNombre());
            juegos.add(jgo);
        }
        return juegos;
    }
    
    private static List<Juegos> generarJornada2a(Integer[] juegosJornada, List<Equipos> equipos, Integer idTorneo, Integer jornada) {
        List<Juegos> juegos = new ArrayList<>();
        int i = 0;
        for (i = 0; i < juegosJornada.length; i+=2) {
            Juegos jgo = new Juegos();
            jgo.setJornada(jornada);
            jgo.setIdTorneo(idTorneo);
            jgo.setVisitante(equipos.get(juegosJornada[i]).getIdEquipo());
            jgo.setVisitanteNombre(equipos.get(juegosJornada[i]).getNombre());
            jgo.setLocal(equipos.get(juegosJornada[i+1]).getIdEquipo());
            jgo.setLocalNombre(equipos.get(juegosJornada[i+1]).getNombre());
            juegos.add(jgo);
        }
        return juegos;
    }
}
