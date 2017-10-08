/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lmfvgo.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import lmfvgo.excepciones.LMFVGOException;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;

/**
 * Descripcion:
 * @author cgarcia
 */
public class ReportesManager {

    private void abrirPdf(String nombrePdf) {
        try {
            Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler " + nombrePdf);
        } catch(IOException ex) {
            
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
            throw new LMFVGOException("No se pudo generar el reporte debido a: " + ex.getMessage());
        }
    }
    
    private InputStream getLogo() {
        return ReportesManager.class.getResourceAsStream("/reportes/logo_cobaez.jpg");
    }
}
