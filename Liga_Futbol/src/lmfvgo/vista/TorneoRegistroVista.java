/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lmfvgo.vista;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import lmfvgo.db.EquiposDAO;
import lmfvgo.db.TorneoDAO;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Equipos;
import lmfvgo.modelo.Torneo;

/**
 *
 * @author cgarcia
 */
public class TorneoRegistroVista extends FormBase {
    private static final long serialVersionUID = 996561005637736248L;

    private final TorneoDAO torneoDAO;
    private final EquiposDAO equiposDAO;
    private Torneo torneo;
    /** Creates new form TorneoRegistroVista
     * @param con */
    public TorneoRegistroVista(Connection con) {
        initComponents();
        torneoDAO = new TorneoDAO(con);
        equiposDAO = new EquiposDAO(con);
        txtFechaInicio.setText(new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
        torneo = torneoDAO.torneoActivo();
        if (torneo == null) {
            torneo = new Torneo();
        } else {
            txtNombre.setText(torneo.getNombre());
            txtFechaInicio.setText(new SimpleDateFormat("dd/MM/yyyy").format(torneo.getFechaInicio()));
            txtPresidente.setText(torneo.getPresidente());
            txtSecretario.setText(torneo.getSecretario());
            txtTesorero.setText(torneo.getTesorero() != null ? torneo.getTesorero() : null);
            setTitle("TORNEO ACTIVO");
        }
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        txtNombre = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        txtFechaInicio = new javax.swing.JTextField();
        btnGuardar = new javax.swing.JButton();
        jLabel3 = new javax.swing.JLabel();
        txtPresidente = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        txtSecretario = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        txtTesorero = new javax.swing.JTextField();

        setClosable(true);
        setTitle("Nuevo Torneo");

        jLabel1.setText("Nombre");

        jLabel2.setText("Inicio");

        btnGuardar.setText("Guardar");
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                guardarTorneo(evt);
            }
        });

        jLabel3.setText("Presidente");

        jLabel4.setText("Secretario");

        jLabel5.setText("Tesorero");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(btnGuardar))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(txtPresidente, javax.swing.GroupLayout.PREFERRED_SIZE, 319, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel4)
                                .addGap(6, 6, 6)
                                .addComponent(txtSecretario, javax.swing.GroupLayout.PREFERRED_SIZE, 319, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel2)
                                .addGap(30, 30, 30)
                                .addComponent(txtFechaInicio, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel1)
                                .addGap(18, 18, 18)
                                .addComponent(txtNombre, javax.swing.GroupLayout.PREFERRED_SIZE, 319, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel5)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(txtTesorero, javax.swing.GroupLayout.PREFERRED_SIZE, 319, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(txtNombre, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(txtFechaInicio, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(txtPresidente, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(txtSecretario, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(txtTesorero, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 19, Short.MAX_VALUE)
                .addComponent(btnGuardar)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void guardarTorneo(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_guardarTorneo
        Date fechaInicio = null;
        if (txtNombre.getText() == null || txtNombre.getText().trim().isEmpty()) {
            agregarMensajeAdvertencia("El nombre del torneo es requerido");
            return;
        } else {
            torneo.setNombre(txtNombre.getText());
        }
        if (txtFechaInicio.getText() == null || txtFechaInicio.getText().trim().isEmpty()) {
            agregarMensajeAdvertencia("La fecha de inicio es requerido");
            return;
        } else {
            try {
                fechaInicio = new SimpleDateFormat("dd/MM/yyyy").parse(txtFechaInicio.getText());
                torneo.setFechaInicio(fechaInicio);
            } catch (Exception ex) {
                agregarMensajeAdvertencia("El formato de la fecha de inicio es incorrecto (dd/MM/yyyy)");
                return;
            }
        }
        if (txtPresidente.getText() == null || txtPresidente.getText().isEmpty()) {
            agregarMensajeAdvertencia("El nombre del presidente es requerido");
            return;
        } else {
            torneo.setPresidente(txtPresidente.getText());
        }
        if (txtSecretario.getText() == null || txtSecretario.getText().isEmpty()) {
            agregarMensajeAdvertencia("El nombre del secretario es requerido");
            return;
        } else {
            torneo.setSecretario(txtSecretario.getText());
        }
        if (txtTesorero.getText() != null && !txtTesorero.getText().isEmpty()) {
            torneo.setTesorero(txtTesorero.getText());
        } else {
            torneo.setTesorero("");
        }
        try {
                if (torneo.getIdTorneo() != null && torneo.getIdTorneo() > 0) {
                    torneoDAO.actualizarTorneo(torneo);
                    agregarMensajeExito("El torneo fue actualizado correctamente");
                } else {
                    torneoDAO.guardarTorneo(torneo);
                    Equipos e1 = equiposDAO.getEquipoDescansa(1);
                    if (e1 == null || e1.getIdEquipo() == null || e1.getIdEquipo() == 0) {
                        equiposDAO.altaEquipoDescansa(1);
                    }
                    Equipos e2 = equiposDAO.getEquipoDescansa(2);
                    if (e2 == null || e2.getIdEquipo() == null || e2.getIdEquipo() == 0) {
                        equiposDAO.altaEquipoDescansa(2);
                    }
                    agregarMensajeExito("El torneo fue registrado correctamente");
                }
        } catch (LMFVGOException ex){
            agregarMensajeError(ex.getMessage());
        }
        
    }//GEN-LAST:event_guardarTorneo


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnGuardar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JTextField txtFechaInicio;
    private javax.swing.JTextField txtNombre;
    private javax.swing.JTextField txtPresidente;
    private javax.swing.JTextField txtSecretario;
    private javax.swing.JTextField txtTesorero;
    // End of variables declaration//GEN-END:variables

}
