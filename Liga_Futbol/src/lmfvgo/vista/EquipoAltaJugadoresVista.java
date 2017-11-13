/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lmfvgo.vista;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.swing.DefaultComboBoxModel;
import javax.swing.DefaultListModel;
import javax.swing.table.DefaultTableModel;
import lmfvgo.db.EquiposDAO;
import lmfvgo.db.JugadoresDAO;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Equipos;
import lmfvgo.modelo.Jugadores;
import lmfvgo.reportes.vo.CedulaVO;

/**
 *
 * @author cgarcia
 */
public class EquipoAltaJugadoresVista extends FormBase {

    private final EquiposDAO equiposDAO;
    private final JugadoresDAO jugadoresDAO;

    /**
     * Creates new form EquipoAltaJugadoresVista
     */
    public EquipoAltaJugadoresVista() {
        initComponents();
        equiposDAO = new EquiposDAO();
        jugadoresDAO = new JugadoresDAO();

        inicializarJugadores();
        
    }

    private void inicializarJugadores() {
        List<String> jugadores = jugadoresDAO.consultaJugadoresLibre();
        DefaultListModel model = new DefaultListModel();
        model.removeAllElements();
        for (String jug : jugadores) {
            model.addElement(jug);
        }
        lstJugadores.setModel(model);
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
        jScrollPane1 = new javax.swing.JScrollPane();
        lstJugadores = new javax.swing.JList<>();
        jLabel2 = new javax.swing.JLabel();
        cboEquipos = new javax.swing.JComboBox<>();
        btnAgregar = new javax.swing.JButton();
        btnQuitar = new javax.swing.JButton();
        btnGuardar = new javax.swing.JButton();
        jScrollPane3 = new javax.swing.JScrollPane();
        tblJugEq = new javax.swing.JTable();
        jLabel3 = new javax.swing.JLabel();
        cboFuerza = new javax.swing.JComboBox();

        setClosable(true);
        setTitle("ALTA DE JUGADORES EN EQUIPOS");

        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Jugadores");

        lstJugadores.setSelectionMode(javax.swing.ListSelectionModel.SINGLE_SELECTION);
        jScrollPane1.setViewportView(lstJugadores);

        jLabel2.setText("Fuerza");

        cboEquipos.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                actualizarJugadores(evt);
            }
        });

        btnAgregar.setLabel("Agregar >>");
        btnAgregar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                agregar(evt);
            }
        });

        btnQuitar.setLabel("<< Quitar");
        btnQuitar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                quitar(evt);
            }
        });

        btnGuardar.setText("Guardar");
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                guardar(evt);
            }
        });

        tblJugEq.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "Nombre", "Número"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, true
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane3.setViewportView(tblJugEq);

        jLabel3.setText("Equipo");

        cboFuerza.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Seleccione", "Primera", "Segunda" }));
        cboFuerza.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                actualizarEquipos(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 330, Short.MAX_VALUE)
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(btnAgregar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(btnQuitar, javax.swing.GroupLayout.PREFERRED_SIZE, 91, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 270, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(476, 476, 476)
                        .addComponent(btnGuardar))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel2)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(cboFuerza, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addGap(18, 18, 18)
                                .addComponent(jLabel3)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(cboEquipos, javax.swing.GroupLayout.PREFERRED_SIZE, 227, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 529, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(12, 12, 12)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(111, 111, 111)
                        .addComponent(btnAgregar)
                        .addGap(18, 18, 18)
                        .addComponent(btnQuitar))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(cboEquipos, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel2)
                            .addComponent(jLabel1)
                            .addComponent(jLabel3)
                            .addComponent(cboFuerza, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(20, 20, 20)
                                .addComponent(jScrollPane1))
                            .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 358, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED, 17, Short.MAX_VALUE)
                .addComponent(btnGuardar)
                .addGap(0, 7, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void agregar(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_agregar
        if (cboEquipos.getSelectedIndex() > 0) {
            if (lstJugadores.getSelectedValue() != null && !lstJugadores.getSelectedValue().isEmpty()) {
                DefaultTableModel modelo = (DefaultTableModel) tblJugEq.getModel();
                String seleccionado = lstJugadores.getSelectedValue();
                ((DefaultListModel) lstJugadores.getModel()).removeElementAt(lstJugadores.getSelectedIndex());

                modelo.addRow(new Object[]{seleccionado.split(" - ")[0], seleccionado.split(" - ")[1], null});
            } else {
                agregarMensajeAdvertencia("Debe seleccionar un jugador");
            }
        } else {
            agregarMensajeAdvertencia("Debe seleccionar un equipo");
        }
    }//GEN-LAST:event_agregar

    private void actualizarJugadores(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_actualizarJugadores
        limpiarTabla(tblJugEq);
        if (cboEquipos.getSelectedIndex() > 0) {
            Jugadores filtro = new Jugadores();
            filtro.setEquipo(Integer.parseInt(cboEquipos.getSelectedItem().toString().split(" - ")[0].trim()));
            if (filtro.getEquipo() > 0) {
                List<Jugadores> jgs = jugadoresDAO.consultarJugadores(filtro);
                if (jgs != null && !jgs.isEmpty()) {
                    DefaultTableModel modelo = (DefaultTableModel) tblJugEq.getModel();
                    for (Jugadores j : jgs) {
                        modelo.addRow(new Object[]{j.getIdJugador(), (j.getNombre() + " " + j.getPaterno() + " " + j.getMaterno()), j.getNumero()});
                    }
                }
            }
        }
    }//GEN-LAST:event_actualizarJugadores

    private void quitar(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_quitar
        DefaultTableModel modelo = (DefaultTableModel) tblJugEq.getModel();
        if (tblJugEq.getSelectedRow() > 0) {
            if (lstJugadores.getModel() == null || lstJugadores.getModel().getSize() == 0) {
                lstJugadores.setModel(new DefaultListModel());
            }
            String seleccionado = modelo.getValueAt(tblJugEq.getSelectedRow(), 0).toString() + " - " +
                    modelo.getValueAt(tblJugEq.getSelectedRow(), 1).toString();
            
            ((DefaultListModel) lstJugadores.getModel()).addElement(seleccionado);
            modelo.removeRow(tblJugEq.getSelectedRow());
        } else {
            agregarMensajeAdvertencia("Debe seleccionar un jugador");
        }
    }//GEN-LAST:event_quitar

    private void guardar(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_guardar
        DefaultTableModel modelo = (DefaultTableModel) tblJugEq.getModel();
        if (modelo.getRowCount() > 0) {
            String eqSel = cboEquipos.getSelectedItem().toString().split(" - ")[0];
            Integer idEquipo = Integer.parseInt(eqSel.trim());
            Map<String, String> numeros = new HashMap<>();
            List<CedulaVO> idsJugs = new ArrayList<>();
            for (int i = 0; i < modelo.getRowCount(); i++) {
                CedulaVO c = new CedulaVO();
                c.setIdJugador(Integer.parseInt(modelo.getValueAt(i, 0).toString()));
                if (modelo.getValueAt(i, 2) != null) {
                    c.setNumero(modelo.getValueAt(i, 2).toString());
                    if (numeros.containsKey(c.getNumero())) {
                        agregarMensajeAdvertencia("El número " + c.getNumero() + " se encuentra duplicado");
                        return;
                    }
                    numeros.put(c.getNumero(), c.getNumero());
                }
                idsJugs.add(c);
            }
            try {
                equiposDAO.limpiarEquipo(idEquipo);
                equiposDAO.guardarJugadoresEquipo(idEquipo, idsJugs);
                agregarMensajeExito("Se guardaron los registros correctamente");
            } catch (LMFVGOException ex) {
                agregarMensajeError(ex.getMessage());
            }
        } else {
            agregarMensajeAdvertencia("No se han agregado jugadores al equipo");
        }
    }//GEN-LAST:event_guardar

    private void actualizarEquipos(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_actualizarEquipos
        cboEquipos.removeAllItems();
        if (cboFuerza.getSelectedIndex() > 0) {
            List<Equipos> equipos = equiposDAO.consultarEquipo(null, cboFuerza.getSelectedIndex());
            DefaultComboBoxModel modelo = (DefaultComboBoxModel) cboEquipos.getModel();
            modelo.addElement("0 - Seleccione");
            for (Equipos eq : equipos) {
                modelo.addElement(eq.getIdEquipo() + " - " + eq.getNombre());
            }
        }
    }//GEN-LAST:event_actualizarEquipos


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAgregar;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JButton btnQuitar;
    private javax.swing.JComboBox<String> cboEquipos;
    private javax.swing.JComboBox cboFuerza;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JList<String> lstJugadores;
    private javax.swing.JTable tblJugEq;
    // End of variables declaration//GEN-END:variables
}
