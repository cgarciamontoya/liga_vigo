/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lmfvgo.vista;

import java.util.List;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;
import javax.swing.table.DefaultTableModel;
import lmfvgo.db.JuegosDAO;
import lmfvgo.modelo.Juegos;

/**
 *
 * @author USUARIO
 */
public class JuegosJornadaVista extends FormBase {
    private static final long serialVersionUID = -4094741927045258235L;

    private final JuegosDAO juegosDAO;
    private List<Juegos> juegos;
    /**
     * Creates new form JuegosJornadaVista
     */
    public JuegosJornadaVista() {
        initComponents();
        juegosDAO = new JuegosDAO();
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
                "ID", "Local", "Visitante"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false
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
            tblJuegos.getColumnModel().getColumn(2).setPreferredWidth(150);
        }

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 530, Short.MAX_VALUE)
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
                        .addGap(0, 0, Short.MAX_VALUE)))
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
                    JuegoDetalleVista jdv = new JuegoDetalleVista(juegoSel);
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
        juegos = juegosDAO.consultaJuegosJornada(cboFuerza.getSelectedIndex(), (cboJornada.getSelectedIndex() + 1));
        limpiarTabla(tblJuegos);
        if (juegos == null || juegos.isEmpty()) {
            agregarMensajeError("No se encontraron juegos para la jornada");
            return;
        }
        DefaultTableModel model = (DefaultTableModel) tblJuegos.getModel();
        for (Juegos j :  juegos) {
            model.addRow(new Object[]{j.getIdJuego(), j.getLocalNombre(), j.getVisitanteNombre()});
        }
    }//GEN-LAST:event_abrirJornada

    private void cargarJornadas(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cargarJornadas
        cboJornada.removeAllItems();
        if (cboFuerza.getSelectedIndex() > 0) {
            List<Integer> jornadas = juegosDAO.consultaNumeroJornadas(cboFuerza.getSelectedIndex());
            if (jornadas != null && !jornadas.isEmpty()) {
                cboJornada.setModel(new DefaultComboBoxModel(jornadas.toArray()));
            }
        }
    }//GEN-LAST:event_cargarJornadas


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAbrir;
    private javax.swing.JComboBox cboFuerza;
    private javax.swing.JComboBox cboJornada;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblJuegos;
    // End of variables declaration//GEN-END:variables
}
