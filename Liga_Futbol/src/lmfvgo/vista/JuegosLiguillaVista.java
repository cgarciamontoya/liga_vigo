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
import lmfvgo.db.ConfiguracionDAO;
import lmfvgo.db.EquiposDAO;
import lmfvgo.db.EstadisticasEquipoDAO;
import lmfvgo.db.JuegosDAO;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Configuracion;
import lmfvgo.modelo.EquipoLiguilla;
import lmfvgo.modelo.EstadisticasEquipo;
import lmfvgo.modelo.Juegos;
import lmfvgo.util.ConstantesUtil;

/**
 *
 * @author desarrollo
 */
public class JuegosLiguillaVista extends FormBase {

    private static final long serialVersionUID = -1679620339563084656L;

    private final JuegosDAO juegosDAO;
    private final EstadisticasEquipoDAO estadisticasEquipoDAO;
    private final ConfiguracionDAO configuracionDAO;
    private Configuracion configuracion;
    private List<EstadisticasEquipo> equipos;
    private final EquiposDAO equiposDAO;
    
    /**
     * Creates new form JuegosLiguillaVista
     */
    public JuegosLiguillaVista(Connection con) {
        initComponents();
        juegosDAO = new JuegosDAO(con);
        estadisticasEquipoDAO = new EstadisticasEquipoDAO(con);
        configuracionDAO = new ConfiguracionDAO(con);
        configuracion = configuracionDAO.consultaConfiguracion();
        equiposDAO = new EquiposDAO(con);
        
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
        cboJuego = new javax.swing.JComboBox<>();
        jLabel3 = new javax.swing.JLabel();
        cboEquipos = new javax.swing.JComboBox<>();
        btnLimpiar = new javax.swing.JButton();
        btnAgregar = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblJuegos = new javax.swing.JTable();
        btnGuardar = new javax.swing.JButton();
        chkIdaVuelta = new javax.swing.JCheckBox();
        jLabel5 = new javax.swing.JLabel();
        cboEquiposVisitante = new javax.swing.JComboBox<>();

        setClosable(true);
        setTitle("LIGUILLA");

        jLabel1.setText("Fuerza:");

        cboFuerza.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccione", "Primera", "Segunda" }));
        cboFuerza.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cargarEquipos(evt);
            }
        });

        jLabel2.setText("Juego:");

        cboJuego.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cargarJuegos(evt);
            }
        });

        jLabel3.setText("Local:");

        btnLimpiar.setText("Limpiar");
        btnLimpiar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                limpiar(evt);
            }
        });

        btnAgregar.setText("Agregar");
        btnAgregar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                agregarJuego(evt);
            }
        });

        tblJuegos.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Juego", "Local", "Visitante"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblJuegos.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                quitarJuego(evt);
            }
        });
        jScrollPane1.setViewportView(tblJuegos);

        btnGuardar.setText("Guardar");
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                guardarJuegos(evt);
            }
        });

        chkIdaVuelta.setText("Ida / Vuelta");

        jLabel5.setText("Visitante:");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 482, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(cboFuerza, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(cboJuego, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(btnAgregar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnLimpiar))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(chkIdaVuelta)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnGuardar))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel5)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(cboEquiposVisitante, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel3)
                        .addGap(25, 25, 25)
                        .addComponent(cboEquipos, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
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
                    .addComponent(cboJuego, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(cboEquipos, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(cboEquiposVisitante, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnLimpiar)
                    .addComponent(btnAgregar))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 96, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnGuardar)
                    .addComponent(chkIdaVuelta))
                .addContainerGap(20, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cargarEquipos(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cargarEquipos
        if (cboFuerza.getSelectedIndex() > 0) {
            int jornadaActual = juegosDAO.getJornadaActual(cboFuerza.getSelectedIndex());
            int totalJornadas = juegosDAO.getTotalJornadas(cboFuerza.getSelectedIndex());
            if (jornadaActual == 0 || totalJornadas == 0 || (jornadaActual < totalJornadas)) {
                agregarMensajeAdvertencia("La temporada regular no está finalizada por lo que no es posible generar la liguilla");
                limpiar(evt);
                btnAgregar.setEnabled(false);
                btnGuardar.setEnabled(false);
                chkIdaVuelta.setEnabled(false);
                return;
            }
            cboEquipos.removeAllItems();
            cboEquiposVisitante.removeAllItems();
            cboJuego.removeAllItems();
            equipos = estadisticasEquipoDAO.consultaEstadisticasFuerza(cboFuerza.getSelectedIndex());
            List<EquipoLiguilla> equiposLiguilla = equiposDAO.consultaEquiposLiguilla(cboFuerza.getSelectedIndex());
            if (jornadaActual == totalJornadas && (equiposLiguilla == null || equiposLiguilla.isEmpty())) {
                //INICIA CONF CONTROL_LIGUILLA
                List<EquipoLiguilla> idsLiguilla = new ArrayList<>();
                for (int idx = 1; idx <= configuracion.getEquiposCalifican(); idx++) {
                    for (EstadisticasEquipo ee : equipos) {
                        if (idx == ee.getPosicion()) {
                            idsLiguilla.add(new EquipoLiguilla(ee.getIdEquipo(), ee.getEquipoNombre(), ee.getPosicion()));
                            break;
                        }
                    }
                }
                try {
                    equiposDAO.guardarEquiposLiguilla(idsLiguilla, cboFuerza.getSelectedIndex());
                    equiposLiguilla = equiposDAO.consultaEquiposLiguilla(cboFuerza.getSelectedIndex());
                } catch (LMFVGOException ex) {
                    agregarMensajeError(ex.getMessage());
                    return;
                }
            }
            List<String> equiposLocal = new ArrayList<>();
            List<String> equiposVisitante = new ArrayList<>();
            equiposLocal.add("Seleccione");
            equiposVisitante.add("Seleccione");
            if (equiposLiguilla.size() == 2) {
                if (equiposLiguilla.get(0).getPosicion() < equiposLiguilla.get(1).getPosicion()) {
                    equiposLocal.add(equiposLiguilla.get(0).getPosicion() + "o. - " + equiposLiguilla.get(0).getNombre());
                    equiposVisitante.add(equiposLiguilla.get(1).getPosicion() + "o. - " + equiposLiguilla.get(1).getNombre());
                } else {
                    equiposLocal.add(equiposLiguilla.get(1).getPosicion() + "o. - " + equiposLiguilla.get(1).getNombre());
                    equiposVisitante.add(equiposLiguilla.get(0).getPosicion() + "o. - " + equiposLiguilla.get(0).getNombre());
                }
                
            } else {
                int numEL = equiposLiguilla.size()/ 2;
                if (equiposLiguilla.size() == 6) {
                    numEL++;
                }

                for (int i = 0; i < equiposLiguilla.size(); i++) {
                    if (equiposLiguilla.get(i).getPosicion() <= numEL) {
                        equiposLocal.add(equiposLiguilla.get(i).getPosicion() + "o. - " + equiposLiguilla.get(i).getNombre());
                    } else {
                        equiposVisitante.add(equiposLiguilla.get(i).getPosicion() + "o. - " + equiposLiguilla.get(i).getNombre());
                    }

                }
            }
            cboEquipos.setModel(new DefaultComboBoxModel(equiposLocal.toArray()));
            cboEquiposVisitante.setModel(new DefaultComboBoxModel(equiposVisitante.toArray()));
            List<String> jornadas = new ArrayList<>();
            jornadas.add("Seleccione");
            int ultimaJornada = juegosDAO.getJornadaActual(cboFuerza.getSelectedIndex());
            if (ultimaJornada < ConstantesUtil.JORNADA_CUARTOS) {
                if (configuracion.getEquiposCalifican() > 4) {
                    jornadas.add("CUARTOS");
                } else {
                    jornadas.add("SEMIFINAL");
                }
            } else if (ultimaJornada < ConstantesUtil.JORNADA_SEMIS) {
                jornadas.add("SEMIFINAL");
            } else {
                jornadas.add("FINAL");
            }
            cboJuego.setModel(new DefaultComboBoxModel(jornadas.toArray()));
        }
    }//GEN-LAST:event_cargarEquipos

    private void limpiar(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_limpiar
        cboJuego.removeAllItems();
        cboEquipos.removeAllItems();
        cboEquiposVisitante.removeAllItems();
        equipos = null;
        limpiarTabla(tblJuegos);
        cboFuerza.setSelectedIndex(0);
        btnAgregar.setEnabled(true);
        btnGuardar.setEnabled(true);
    }//GEN-LAST:event_limpiar

    private void agregarJuego(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_agregarJuego
        DefaultTableModel dtm = (DefaultTableModel) tblJuegos.getModel();
        if (cboJuego.getSelectedIndex() == 0) {
            agregarMensajeAdvertencia("Debe seleccionar el tipo de juego");
            return;
        }
        if (cboEquipos.getSelectedIndex() == 0) {
            agregarMensajeAdvertencia("Debe seleccionar el equipo local");
            return;
        }
        if (cboEquiposVisitante.getSelectedIndex() == 0) {
            agregarMensajeAdvertencia("Debe seleccionar el equipo visitante");
            return;
        }
        if (cboEquipos.getSelectedItem().toString().equals(cboEquiposVisitante.getSelectedItem().toString())) {
            agregarMensajeAdvertencia("El equipo local y visitante no puede ser el mismo");
            return;
        }
        if (tblJuegos.getRowCount() > 0) {
            for (int i = 0; i < dtm.getRowCount(); i++) {
                if (tblJuegos.getValueAt(i, 1).toString().equals(cboEquipos.getSelectedItem().toString()) ||
                        tblJuegos.getValueAt(i, 2).toString().equals(cboEquipos.getSelectedItem().toString())) {
                    agregarMensajeAdvertencia("El equipo " + cboEquipos.getSelectedItem().toString() + " ya fue agregado");
                    return;
                }
                if (tblJuegos.getValueAt(i, 1).toString().equals(cboEquiposVisitante.getSelectedItem().toString()) ||
                        tblJuegos.getValueAt(i, 2).toString().equals(cboEquiposVisitante.getSelectedItem().toString())) {
                    agregarMensajeAdvertencia("El equipo " + cboEquiposVisitante.getSelectedItem().toString() + " ya fue agregado");
                    return;
                }
            }
        }
        DefaultTableModel modelo = (DefaultTableModel) tblJuegos.getModel();
        modelo.addRow(new Object[]{cboJuego.getSelectedItem().toString(),
                            cboEquipos.getSelectedItem().toString(),
                            cboEquiposVisitante.getSelectedItem().toString()});
    }//GEN-LAST:event_agregarJuego

    private void quitarJuego(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_quitarJuego
        if (SwingUtilities.isRightMouseButton(evt)) {
            int dialogResult = JOptionPane.showConfirmDialog(null, "Desea quitar el juego de la lista?", "Advertencia", JOptionPane.YES_NO_OPTION);
            if (dialogResult == JOptionPane.YES_OPTION) {
                ((DefaultTableModel) tblJuegos.getModel()).removeRow(tblJuegos.getSelectedRow());
            }
        }
    }//GEN-LAST:event_quitarJuego

    private void guardarJuegos(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_guardarJuegos
        int dialogResult = JOptionPane.showConfirmDialog(null, "Desea guardar los juegos?", "Advertencia", JOptionPane.YES_NO_OPTION);
        if (dialogResult == JOptionPane.YES_OPTION) {
            Map<Integer, List<Juegos>> rol = new HashMap<>();
            List<Juegos> juegos = new ArrayList<>();
            List<Juegos> juegosVisita = new ArrayList<>();
            DefaultTableModel modelo = (DefaultTableModel) tblJuegos.getModel();
            int jornada = ConstantesUtil.JORNADA_CUARTOS;
            if (cboJuego.getSelectedItem().toString().equalsIgnoreCase("Semifinal")) {
                jornada = ConstantesUtil.JORNADA_SEMIS;
            } else if (cboJuego.getSelectedItem().toString().equalsIgnoreCase("Final")) {
                jornada = ConstantesUtil.JORNADA_FINAL;
            }
            for (int i = 0; i < modelo.getRowCount(); i++) {
                Juegos j = new Juegos();
                j.setJornada(jornada);
                j.setLocal(chkIdaVuelta.isSelected() ? getIdEquipo(modelo.getValueAt(i, 2).toString()) : getIdEquipo(modelo.getValueAt(i, 1).toString()));
                j.setVisitante(chkIdaVuelta.isSelected() ? getIdEquipo(modelo.getValueAt(i, 1).toString()) : getIdEquipo(modelo.getValueAt(i, 2).toString()));
                j.setFuerza(cboFuerza.getSelectedIndex());
                juegos.add(j);
                if (chkIdaVuelta.isSelected()) {
                    Juegos jv = new Juegos();
                    jv.setJornada(jornada);
                    jv.setLocal(j.getVisitante());
                    jv.setVisitante(j.getLocal());
                    jv.setFuerza(j.getFuerza());
                    juegosVisita.add(jv);
                }
            }
            juegos.addAll(juegosVisita);
            rol.put(jornada, juegos);
            try {
                juegosDAO.guardarRol(rol, cboFuerza.getSelectedIndex());
                agregarMensajeExito("Los juegos de " + cboJuego.getSelectedItem().toString() + " fueron guardados correctamente");
                this.dispose();
            } catch (LMFVGOException ex) {
                agregarMensajeError(ex.getMessage());
            }
        }
    }//GEN-LAST:event_guardarJuegos

    private void cargarJuegos(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cargarJuegos
        if (cboJuego.getSelectedIndex() > 0) {
            String juegoSel = cboJuego.getSelectedItem().toString();
            List<Juegos> juegos = null;
            int jornada = 0;
            switch (juegoSel) {
                case "CUARTOS" :
                    jornada = ConstantesUtil.JORNADA_CUARTOS;
                    break;
                case "SEMIFINAL" :
                    jornada = ConstantesUtil.JORNADA_SEMIS;
                    break;
                case "FINAL" :
                    jornada = ConstantesUtil.JORNADA_FINAL;
            }
            if (jornada > 0) {
                juegos = juegosDAO.consultaJuegosJornada(cboFuerza.getSelectedIndex(), jornada);
                if (juegos != null && !juegos.isEmpty()) {
                    limpiarTabla(tblJuegos);
                    btnGuardar.setEnabled(false);
                    btnAgregar.setEnabled(false);
                    for (Juegos j : juegos) {
                        ((DefaultTableModel) tblJuegos.getModel()).addRow(new Object[]{j.getIdJuego(), j.getLocalNombre(), j.getVisitanteNombre()});
                    }
                }
            }
        }
    }//GEN-LAST:event_cargarJuegos

    private int getIdEquipo(String nombre) {
        for (EstadisticasEquipo ee : equipos) {
            if (ee.getEquipoNombre().equalsIgnoreCase(nombre.split(" - ")[1])) {
                return ee.getIdEquipo();
            }
        }
        return 0;
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAgregar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JButton btnLimpiar;
    private javax.swing.JComboBox<String> cboEquipos;
    private javax.swing.JComboBox<String> cboEquiposVisitante;
    private javax.swing.JComboBox<String> cboFuerza;
    private javax.swing.JComboBox<String> cboJuego;
    private javax.swing.JCheckBox chkIdaVuelta;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblJuegos;
    // End of variables declaration//GEN-END:variables
}
