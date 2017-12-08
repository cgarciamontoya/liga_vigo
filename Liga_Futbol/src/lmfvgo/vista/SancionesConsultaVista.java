/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lmfvgo.vista;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import javax.swing.DefaultComboBoxModel;
import javax.swing.table.DefaultTableModel;
import lmfvgo.db.EquiposDAO;
import lmfvgo.db.SancionesDAO;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Equipos;
import lmfvgo.modelo.Sancion;
import lmfvgo.util.ReportesManager;

/**
 *
 * @author desarrollo
 */
public class SancionesConsultaVista extends FormBase {

    private static final long serialVersionUID = 8482977825586734796L;

    private final EquiposDAO equiposDAO;
    private final SancionesDAO sancionesDAO;
    private List<Sancion> sanciones;
    private ReportesManager reportesManager;
    /**
     * Creates new form SancionesConsultaVista
     * @param con
     */
    public SancionesConsultaVista(Connection con) {
        initComponents();
        equiposDAO = new EquiposDAO(con);
        sancionesDAO = new SancionesDAO(con);
        reportesManager = new ReportesManager(con);
        btnExportar.setEnabled(false);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        cboFuerza = new javax.swing.JComboBox<>();
        jLabel2 = new javax.swing.JLabel();
        cboEquipos = new javax.swing.JComboBox<>();
        btnLimpiar = new javax.swing.JButton();
        btnBuscar = new javax.swing.JButton();
        btnExportar = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblSanciones = new javax.swing.JTable();

        setClosable(true);
        setTitle("CONSULTA SANCIONES");
        setPreferredSize(new java.awt.Dimension(900, 416));

        jLabel1.setText("Fuerza");

        cboFuerza.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccione", "Primera", "Segunda" }));
        cboFuerza.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                actualizarEquipos(evt);
            }
        });

        jLabel2.setText("Equipo:");

        btnLimpiar.setText("Limpiar");
        btnLimpiar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                limpiar(evt);
            }
        });

        btnBuscar.setText("Buscar");
        btnBuscar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                buscarSanciones(evt);
            }
        });

        btnExportar.setText("Exportar PDF");
        btnExportar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                exportar(evt);
            }
        });

        tblSanciones.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Clave", "Jornada", "Jugador", "Equipo", "Juegos", "Multa"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Float.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(tblSanciones);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 861, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(cboFuerza, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(cboEquipos, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(btnExportar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnBuscar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnLimpiar)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(cboFuerza, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2)
                    .addComponent(cboEquipos, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnLimpiar)
                    .addComponent(btnBuscar)
                    .addComponent(btnExportar))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 289, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void actualizarEquipos(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_actualizarEquipos
        cboEquipos.removeAllItems();
        if (cboFuerza.getSelectedIndex() > 0) {
            List<Equipos> equipos = equiposDAO.consultarEquipo(null, cboFuerza.getSelectedIndex());
            DefaultComboBoxModel modelEquipos = (DefaultComboBoxModel) cboEquipos.getModel();
            modelEquipos.addElement("0 - Seleccione");
            for (Equipos e : equipos) {
                modelEquipos.addElement(e.getIdEquipo() + " - " + e.getNombre());
            }
            cboEquipos.setModel(modelEquipos);
        }
    }//GEN-LAST:event_actualizarEquipos

    private void limpiar(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_limpiar
        cboEquipos.removeAllItems();
        limpiarTabla(tblSanciones);
        btnExportar.setEnabled(false);
        sanciones = null;
    }//GEN-LAST:event_limpiar

    private void buscarSanciones(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_buscarSanciones
        limpiarTabla(tblSanciones);
        sanciones = sancionesDAO.consultaSanciones(
                cboEquipos.getItemCount() > 0 ?
                Integer.parseInt(cboEquipos.getSelectedItem().toString().split(" - ")[0]) : 0, cboFuerza.getSelectedIndex());
        if (sanciones != null && !sanciones.isEmpty()) {
            DefaultTableModel modelo = (DefaultTableModel) tblSanciones.getModel();
            boolean agregado = false;
            for (Sancion s : sanciones) {
                if (s.isActivo()) {
                    modelo.addRow(new Object[]{
                        s.getClave(),
                        s.getJornada(),
                        s.getNombreJugador(),
                        s.getNombreEquipo(),
                        (String.valueOf(s.getJuegosCumplidos()) + "/" + String.valueOf(s.getSancionJuegos())),
                        (s.getSancionEconomica() != null && s.getSancionEconomica() > 0 ? s.getSancionEconomica() : null)
                    });
                    agregado = true;
                }
                if (!agregado) {
                    agregarMensajeError("No se encontraron resultados");
                    return;
                }
            }
            btnExportar.setEnabled(true);
        } else {
            agregarMensajeError("No se encontraron resultados");
        }
    }//GEN-LAST:event_buscarSanciones

    private void exportar(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_exportar
        if (sanciones != null && !sanciones.isEmpty()) {
            try {
                List<Sancion> activas = new ArrayList<>();
                for (Sancion s : sanciones) {
                    if (s.isActivo()) {
                        activas.add(s);
                    }
                }
                reportesManager.sanciones(activas);
            } catch (LMFVGOException ex) {
                agregarMensajeError(ex.getMessage());
            }
        }
    }//GEN-LAST:event_exportar


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnBuscar;
    private javax.swing.JButton btnExportar;
    private javax.swing.JButton btnLimpiar;
    private javax.swing.JComboBox<String> cboEquipos;
    private javax.swing.JComboBox<String> cboFuerza;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblSanciones;
    // End of variables declaration//GEN-END:variables
}
