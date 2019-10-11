/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lmfvgo.vista;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;
import javax.swing.table.DefaultTableModel;
import lmfvgo.db.EquiposDAO;
import lmfvgo.db.JuegosDAO;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.EquipoLiguilla;
import lmfvgo.modelo.Juegos;
import lmfvgo.reportes.vo.RolVO;
import lmfvgo.util.ConstantesUtil;
import lmfvgo.util.ReportesManager;

/**
 *
 * @author USUARIO
 */
public class JuegosJornadaVista extends FormBase {
    private static final long serialVersionUID = -4094741927045258235L;

    private final JuegosDAO juegosDAO;
    private List<Juegos> juegos;
    private final ReportesManager reportesManager;
    private final EquiposDAO equiposDAO;
    private Connection connection;
    /**
     * Creates new form JuegosJornadaVista
     */
    public JuegosJornadaVista(Connection con) {
        initComponents();
        juegosDAO = new JuegosDAO(con);
        reportesManager = new ReportesManager(con);
        btnCerrarJornada.setEnabled(false);
        btnExportar.setEnabled(false);
        equiposDAO = new EquiposDAO(con);
        this.connection = con;
    }

    /**
     * This method is called from within the constructor to initialize the form. WARNING: Do NOT modify this code. The
     * content of this method is always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        cboFuerza = new javax.swing.JComboBox();
        jLabel2 = new javax.swing.JLabel();
        cboJornada = new javax.swing.JComboBox();
        btnAbrir = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblJuegos = new javax.swing.JTable();
        btnCerrarJornada = new javax.swing.JButton();
        btnExportar = new javax.swing.JButton();

        setClosable(true);
        setTitle("REGISTRO POR JORNADA");

        jLabel1.setText("Fuerza");

        cboFuerza.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Seleccione", "Primera", "Segunda" }));
        cboFuerza.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cargarJornadas(evt);
            }
        });

        jLabel2.setText("Jornada");

        btnAbrir.setText("Abrir");
        btnAbrir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                abrirJornada(evt);
            }
        });

        tblJuegos.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "Local", "G Local", "G Visita", "Visitante"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblJuegos.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                abrirDetalle(evt);
            }
        });
        jScrollPane1.setViewportView(tblJuegos);
        if (tblJuegos.getColumnModel().getColumnCount() > 0) {
            tblJuegos.getColumnModel().getColumn(0).setPreferredWidth(50);
            tblJuegos.getColumnModel().getColumn(1).setPreferredWidth(150);
            tblJuegos.getColumnModel().getColumn(4).setPreferredWidth(150);
        }

        btnCerrarJornada.setText("Cerrar Jornada");
        btnCerrarJornada.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cerrarJornada(evt);
            }
        });

        btnExportar.setText("Exportar PDF");
        btnExportar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                exportar(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 754, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(cboFuerza, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(cboJornada, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(btnAbrir)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(btnExportar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnCerrarJornada)))
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
                    .addComponent(cboJornada, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnAbrir))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 282, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnCerrarJornada)
                    .addComponent(btnExportar))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void abrirDetalle(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_abrirDetalle
        if (SwingUtilities.isRightMouseButton(evt)) {
            int dialogResult = JOptionPane.showConfirmDialog(null, "Desea abrir el detalle del juego?", "Advertencia", JOptionPane.YES_NO_OPTION);
            if (dialogResult == JOptionPane.YES_OPTION) {
                DefaultTableModel model = (DefaultTableModel) tblJuegos.getModel();
                int idJuegoSel = (Integer) model.getValueAt(tblJuegos.getSelectedRow(), 0);
                Juegos juegoSel = null;
                for (Juegos j : juegos) {
                    if (j.getIdJuego().equals(idJuegoSel)) {
                        juegoSel = j;
                        break;
                    }
                }
                if (juegoSel != null){
                    if (juegoSel.getLocalNombre().equalsIgnoreCase("descansa") ||
                            juegoSel.getVisitanteNombre().equalsIgnoreCase("descansa")) {
                        agregarMensajeError("No se puede abrir el detalle debido a que el equipo DESCANSA");
                        return;
                    }
                    JuegoDetalleVista jdv = new JuegoDetalleVista(juegoSel, connection);
                    this.getParent().add(jdv);
                    jdv.show();
                    this.dispose();
                } else {
                    agregarMensajeAdvertencia("No se seleccionón ningún juego");
                }
            }
        }
        
        
    }//GEN-LAST:event_abrirDetalle

    private void abrirJornada(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_abrirJornada
        if (cboFuerza.getSelectedIndex() == 0) {
            agregarMensajeAdvertencia("La fuerza es requerida");
            return;
        }
        int jornada = 0;
        switch (cboJornada.getSelectedItem().toString()) {
            case "CT" :
                jornada = ConstantesUtil.JORNADA_CUARTOS;
                break;
            case "SF":
                jornada = ConstantesUtil.JORNADA_SEMIS;
                break;
            case "FN":
                jornada = ConstantesUtil.JORNADA_FINAL;
                break;
            default:
                jornada = Integer.parseInt(cboJornada.getSelectedItem().toString());
        }
        juegos = juegosDAO.consultaJuegosJornada(cboFuerza.getSelectedIndex(), jornada);
        limpiarTabla(tblJuegos);
        if (juegos == null || juegos.isEmpty()) {
            agregarMensajeError("No se encontraron juegos para la jornada");
            btnExportar.setEnabled(false);
            btnCerrarJornada.setEnabled(false);
            return;
        } 
        DefaultTableModel model = (DefaultTableModel) tblJuegos.getModel();
        int jgoDes = -1;
        boolean jornadaCerrada = false;
        for (int i = 0; i < juegos.size(); i++) {
            Juegos j = juegos.get(i);
            if (j.isCerrado()) {
                jornadaCerrada = true;
            }
            if (!j.getLocalNombre().equalsIgnoreCase("DESCANSA") &&
                    !j.getVisitanteNombre().equalsIgnoreCase("DESCANSA")) {
                model.addRow(new Object[]{j.getIdJuego(), j.getLocalNombre(), 
                    j.getGolesLocal() != null ? j.getGolesLocal() : null,
                    j.getGolesVisita() != null ? j.getGolesVisita() : null,
                    j.getVisitanteNombre()});
            } else {
                jgoDes = i;
            }
        }
        if (jgoDes >= 0) {
            Juegos j = juegos.get(jgoDes);
            if (j.getLocalNombre().equalsIgnoreCase("DESCANSA")) {
                model.addRow(new Object[]{j.getIdJuego(), j.getLocalNombre(), null, null, j.getVisitanteNombre(), "", ""});
            } else {
                model.addRow(new Object[]{j.getIdJuego(), j.getVisitanteNombre(), null, null, j.getLocalNombre(), "", ""});
            }
        }
        btnCerrarJornada.setEnabled(!jornadaCerrada);
        btnExportar.setEnabled(model.getRowCount() > 0);
    }//GEN-LAST:event_abrirJornada

    private void cargarJornadas(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cargarJornadas
        cboJornada.removeAllItems();
        if (cboFuerza.getSelectedIndex() > 0) {
            List<Integer> jornadas = juegosDAO.consultaNumeroJornadas(cboFuerza.getSelectedIndex());
            List<String> jornadasFinal = new ArrayList<>();
            if (jornadas != null && !jornadas.isEmpty()) {
                for (Integer j : jornadas) {
                    switch (j) {
                        case ConstantesUtil.JORNADA_CUARTOS :
                            jornadasFinal.add("CT");
                            break;
                        case ConstantesUtil.JORNADA_SEMIS : 
                            jornadasFinal.add("SF");
                            break;
                        case ConstantesUtil.JORNADA_FINAL:
                            jornadasFinal.add("FN");
                            break;
                        default:
                            jornadasFinal.add(String.valueOf(j));
                    }
                }
                cboJornada.setModel(new DefaultComboBoxModel(jornadasFinal.toArray()));
            }
        }
    }//GEN-LAST:event_cargarJornadas

    private void cerrarJornada(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cerrarJornada
        int dialogResult = JOptionPane.showConfirmDialog(null, "Desea cerrar la jornada?", "Advertencia", JOptionPane.YES_NO_OPTION);
        if (dialogResult == JOptionPane.YES_OPTION) {
            int resJgos = 0;
            boolean descansa = false;
            DefaultTableModel modelo = (DefaultTableModel) tblJuegos.getModel();
            for (int i = 0; i < tblJuegos.getRowCount(); i++) {
                if (modelo.getValueAt(i, 2) != null) {
                    resJgos++;
                }
                if (modelo.getValueAt(i, 1).toString().equalsIgnoreCase("descansa") ||
                        modelo.getValueAt(i, 4).toString().equalsIgnoreCase("descansa")) {
                    descansa = true;
                }
            }
            if (descansa) {
                resJgos += 1;
            }
            if (resJgos == tblJuegos.getRowCount()) {
                try {
                    String ji = cboJornada.getSelectedItem().toString();
                    int jc = 0;
                    switch (ji) {
                        case "CT":
                            jc = ConstantesUtil.JORNADA_CUARTOS;
                            break;
                        case "SF":
                            jc = ConstantesUtil.JORNADA_SEMIS;
                            break;
                        case "FN":
                            jc = ConstantesUtil.JORNADA_FINAL;
                            break;
                        default:
                            jc = Integer.parseInt(ji);
                            break;
                    }
                    juegosDAO.cerrarJornada(jc, cboFuerza.getSelectedIndex());
                    if (jc >= ConstantesUtil.JORNADA_CUARTOS) {
                        marcarEliminadosLiguilla(jc);
                    }
                    agregarMensajeExito("La Jornada " + cboJornada.getSelectedItem() + " se cerró correctamente");
                    btnCerrarJornada.setEnabled(false);
                } catch (LMFVGOException ex) {
                    agregarMensajeError(ex.getMessage());
                }
            } else {
                agregarMensajeAdvertencia("Para cerrar la jornada es necesario ingresar los datos de todos los partidos");
            }
        }
    }//GEN-LAST:event_cerrarJornada

    private void marcarEliminadosLiguilla(int jornada) {
        DefaultTableModel modelo = (DefaultTableModel) tblJuegos.getModel();
        Map<String, Integer> resultados = new HashMap<>();
        for (int i = 0; i < modelo.getRowCount(); i++) {
            int gl = (Integer) modelo.getValueAt(i, 2);
            int gv = (Integer) modelo.getValueAt(i, 3);
            int res;
            if (!resultados.containsKey(modelo.getValueAt(i, 1).toString().concat(";").concat(modelo.getValueAt(i, 4).toString())) &&
                    !resultados.containsKey(modelo.getValueAt(i, 4).toString().concat(";").concat(modelo.getValueAt(i, 1).toString()))) {
                res = gl - gv;
                resultados.put(modelo.getValueAt(i, 1).toString().concat(";").concat(modelo.getValueAt(i, 4).toString()), res);
            } else {
                if (resultados.containsKey(modelo.getValueAt(i, 1).toString().concat(";").concat(modelo.getValueAt(i, 4).toString()))) {
                    res = resultados.get(modelo.getValueAt(i, 1).toString().concat(";").concat(modelo.getValueAt(i, 4).toString()));
                    res += gl - gv;
                    resultados.put(modelo.getValueAt(i, 1).toString().concat(";").concat(modelo.getValueAt(i, 4).toString()), res);
                } else {
                    res = resultados.get(modelo.getValueAt(i, 4).toString().concat(";").concat(modelo.getValueAt(i, 1).toString()));
                    res += gv - gl;
                    resultados.put(modelo.getValueAt(i, 4).toString().concat(";").concat(modelo.getValueAt(i, 1).toString()), res);
                }
            }
        }
        try {
            List<EquipoLiguilla> eqsLiguilla = equiposDAO.consultaEquiposLiguilla(cboFuerza.getSelectedIndex());
            for (String key : resultados.keySet()) {
                String[] eqs = key.split(";");
                if (resultados.get(key) > 0) {
                    equiposDAO.eliminarEquipoLiguilla(getIdEquipo(eqs[1]), jornada);
                } else if (resultados.get(key) < 0) {
                    equiposDAO.eliminarEquipoLiguilla(getIdEquipo(eqs[0]), jornada);
                } else {
                    int idLocal = getIdEquipo(eqs[0]);
                    int idVisitante = getIdEquipo(eqs[1]);
                    int posLocal = 0;
                    int posVisitante = 0;
                    for (EquipoLiguilla el : eqsLiguilla) {
                        if (el.getIdEquipo() == idLocal) {
                            posLocal = el.getPosicion();
                            continue;
                        }
                        if (el.getIdEquipo() == idVisitante) {
                            posVisitante = el.getPosicion();
                        }
                    }
                    if (posLocal > posVisitante) {
                        equiposDAO.eliminarEquipoLiguilla(idLocal, jornada);
                    } else {
                        equiposDAO.eliminarEquipoLiguilla(idVisitante, jornada);
                    }
                }
            }    
        } catch (LMFVGOException ex) {

        }
        
    }
    
    private int getIdEquipo(String nombre) {
        for (Juegos j : juegos) {
            if (j.getLocalNombre().equals(nombre)) {
                return j.getLocal();
            }
            if (j.getVisitanteNombre().equals(nombre)) {
                return j.getVisitante();
            }
        }
        return 0;
    }
    
    private void exportar(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_exportar
        if (tblJuegos.getRowCount() > 0) {
            List<RolVO> reporte = new ArrayList<>();
            DefaultTableModel model = (DefaultTableModel) tblJuegos.getModel();
            String ji = cboJornada.getSelectedItem().toString();
            String jc = "";
            switch (ji) {
                case "CT":
                    jc = "CUARTOS DE FINAL";
                    break;
                case "SF":
                    jc = "SEMIFINAL";
                    break;
                case "FN":
                    jc = "FINAL";
                    break;
                default:
                    jc = ji;
                    break;
            }
            for (int i = 0; i < model.getRowCount(); i++) {
                RolVO juego = new RolVO();
                juego.setJornada(jc);
                juego.setLocal(model.getValueAt(i, 1).toString());
                juego.setVisitante(model.getValueAt(i, 4).toString());
                reporte.add(juego);
            }
            try {
                reportesManager.rol(reporte, cboFuerza.getSelectedIndex());
            } catch (LMFVGOException ex) {
                agregarMensajeError(ex.getMessage());
            }
        } else {
            agregarMensajeAdvertencia("Debe seleccionar el rol para exportar");
        }        // TODO add your handling code here:
    }//GEN-LAST:event_exportar


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAbrir;
    private javax.swing.JButton btnCerrarJornada;
    private javax.swing.JButton btnExportar;
    private javax.swing.JComboBox cboFuerza;
    private javax.swing.JComboBox cboJornada;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblJuegos;
    // End of variables declaration//GEN-END:variables
}
