/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lmfvgo.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.EstadisticasEquipo;
import lmfvgo.modelo.EstadisticasJugador;
import lmfvgo.modelo.Juegos;
import lmfvgo.modelo.Reglamento;
import lmfvgo.reportes.vo.CedulaVO;
import lmfvgo.reportes.vo.CredencialVO;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

/**
 * Descripcion:
 * @author cgarcia
 */
public class ReportesManager {
    
    private static final String URL_REPORTES = "C:\\lmfvgo\\";
    private static final String REPORTE_CEDULA_JUEGO = "/lmfvgo/reportes/CedulaJuego.jasper";
    private static final String REPORTE_TABLA_GENERAL = "/lmfvgo/reportes/TablaEstadisticas.jasper";
    private static final String REPORTE_CREDENCIALES = "/lmfvgo/reportes/Credenciales.jasper";
    private static final String REPORTE_CEDULA = "/lmfvgo/reportes/CedulaEquipo.jasper";
    private static final String REPORTE_REGLAMENTO = "/lmfvgo/reportes/Reglamento.jasper";
    
    public void reglamento(List<Reglamento> lista) throws LMFVGOException {
        Map<String, Object> parametros = new HashMap<>();
        
        String nombrePdf = URL_REPORTES + "Reglamento.pdf";
        exportar(REPORTE_REGLAMENTO, parametros, nombrePdf, lista);
        abrirPdf(nombrePdf);
    }
    
    public void cedulaEquipo(List<CedulaVO> lista, String equipo) throws LMFVGOException {
        if (lista.size() < 24) {
            for (int i = lista.size(); i < 24; i++) {
                lista.add(new CedulaVO(equipo));
            }
        }
        List<CedulaVO> lista1 = new ArrayList<>();
        for (int i = 0; i < 12; i++) {
            lista1.add(lista.get(i));
        }
        List<CedulaVO> lista2 = new ArrayList<>();
        for (int i = 12; i < 24; i++) {
            lista2.add(lista.get(i));
        }
        
        Map<String, Object> parametros = new HashMap<>();
        parametros.put("lista1", lista1);
        parametros.put("lista2", lista2);
        
        String nombrePdf = URL_REPORTES + "Cedula_" + equipo + ".pdf";
        exportar(REPORTE_CEDULA, parametros, nombrePdf);
        abrirPdf(nombrePdf);
    }
    
    public void credenciales(List<CredencialVO> lista1, List<CredencialVO> lista2) throws LMFVGOException {
        Map<String, Object> parametros = new HashMap<>();
        parametros.put("lista1", lista1);
        parametros.put("lista2", lista2);
        
        String nombrePdf = URL_REPORTES + "Credenciales.pdf";
        exportar(REPORTE_CREDENCIALES, parametros, nombrePdf);
        abrirPdf(nombrePdf);
    }

    public void cedulaJuego(Juegos juego, List<EstadisticasJugador> local, List<EstadisticasJugador> visitante, Map<String, Object> parametros) throws LMFVGOException {
        if (parametros == null) {
            parametros = new HashMap<>();
        }
        parametros.put("jornada", "Jornada " + juego.getJornada());
        parametros.put("local", juego.getLocalNombre());
        parametros.put("visitante", juego.getVisitanteNombre());
        parametros.put("fecha", juego.getFecha());
        parametros.put("hora", juego.getHora());
        parametros.put("lugar", juego.getLugar());
        parametros.put("listaLocal", local);
        parametros.put("listaVisitante", visitante);
        
        String nombrePdf = URL_REPORTES + "J" + juego.getJornada() + "_" + juego.getLocalNombre() + "_VS_" + juego.getVisitanteNombre() + ".pdf";
        exportar(REPORTE_CEDULA_JUEGO, parametros, nombrePdf);
        abrirPdf(nombrePdf);
        
    }
    
    public void tablaEstadisticas(int fuerza, List<EstadisticasEquipo> ee, List<EstadisticasJugador> goleo) throws LMFVGOException {
        Map<String, Object> parametros = new HashMap<>();
        parametros.put("fuerza", fuerza == 1 ? "Primera Fuerza" : "Segunda Fuerza");
        parametros.put("listaTabla", ee);
        parametros.put("listaGoleo", goleo);
        
        String nombrePdf = URL_REPORTES + "Tabla_" + (fuerza == 1 ? "Primera" : "Segunda") + ".pdf";
        exportar(REPORTE_TABLA_GENERAL, parametros, nombrePdf);
        abrirPdf(nombrePdf);
    }
    
    private void abrirPdf(String nombrePdf) {
        try {
            Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler " + nombrePdf);
        } catch(IOException ex) {
            
        }
    }
    
    private void exportar(String nombreReporte, Map<String, Object> parametros, String nombrePdf, List detalle) throws LMFVGOException {
        try {
            InputStream reporte = ReportesManager.class.getResourceAsStream(nombreReporte);
            JasperPrint jp = (JasperPrint) JasperFillManager.fillReport(reporte, parametros, new JRBeanCollectionDataSource(detalle));
            File archivo = new File(nombrePdf);
            archivo.createNewFile();
            JasperExportManager.exportReportToPdfFile(jp, nombrePdf);
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new LMFVGOException("No se pudo generar el reporte debido a: " + ex.getMessage());
        }
    }
    
    private void exportar(String nombreReporte, Map<String, Object> parametros, String nombrePdf) throws LMFVGOException {
        try {
            InputStream reporte = ReportesManager.class.getResourceAsStream(nombreReporte);
            JasperPrint jp = (JasperPrint) JasperFillManager.fillReport(reporte, parametros, new JREmptyDataSource());
            File archivo = new File(nombrePdf);
            archivo.createNewFile();
            JasperExportManager.exportReportToPdfFile(jp, nombrePdf);
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new LMFVGOException("No se pudo generar el reporte debido a: " + ex.getMessage());
        }
    }
    
    private InputStream getLogo() {
        return ReportesManager.class.getResourceAsStream("/reportes/logo_cobaez.jpg");
    }
}
