/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lmfvgo.vista;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.swing.DefaultCellEditor;
import javax.swing.JComboBox;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import lmfvgo.db.ArbitrosDAO;
import lmfvgo.db.JuegosDAO;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Arbitro;
import lmfvgo.modelo.Juegos;
import lmfvgo.util.ReportesManager;

/**
 *
 * @author desarrollo
 */
public class JuegosRolJornada extends FormBase {
    
    private Connection connection;
    private JuegosDAO juegosDAO;
    private ArbitrosDAO arbitrosDAO;
    private ReportesManager reportesManager;
    private JComboBox cboArbitro;
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

    /**
     * Creates new form JuegosRolJornada
     * @param con
     */
    public JuegosRolJornada(Connection con) {
        initComponents();
        this.connection = con;
        juegosDAO = new JuegosDAO(con);
        reportesManager = new ReportesManager(con);
        arbitrosDAO = new ArbitrosDAO(con);
        Integer maxJornada = juegosDAO.getTotalJornadas(1);
        Integer maxJornada2 = juegosDAO.getTotalJornadas(2);
        for (int j = 1; j <= ((maxJornada > maxJornada2) ? maxJornada : maxJornada2); j++) {
            cboJornada.addItem(String.valueOf(j));
        }
        
        List<Arbitro> arbitros = arbitrosDAO.consultaArbitros("");
        if (arbitros != null && !arbitros.isEmpty()) {
            cboArbitro = new JComboBox();
            cboArbitro.addItem("0 - SELECCIONE");
            for (Arbitro ar : arbitros) {
                cboArbitro.addItem(ar.toString());
            }
        }
        
        tblPrimera.getColumnModel().getColumn(5).setCellEditor(new DefaultCellEditor(cboArbitro));
        tblSegunda.getColumnModel().getColumn(5).setCellEditor(new DefaultCellEditor(cboArbitro));
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
        cboJornada = new javax.swing.JComboBox<>();
        jButton1 = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        txtFecha = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblSegunda = new javax.swing.JTable();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        tblPrimera = new javax.swing.JTable();
        btnActualizar = new javax.swing.JButton();

        setClosable(true);
        setTitle("Rol por Jornada");

        jLabel1.setText("Jornada");

        cboJornada.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                actualizarTablas(evt);
            }
        });

        jButton1.setText("Exportar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                exportarReporte(evt);
            }
        });

        jLabel2.setText("Fecha");

        tblSegunda.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "Local", "Visitante", "Hora", "Lugar", "Arbitro"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, true, true, true
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(tblSegunda);

        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 13)); // NOI18N
        jLabel3.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel3.setText("Segunda Fuerza");

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 13)); // NOI18N
        jLabel4.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel4.setText("Primera Fuerza");

        tblPrimera.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "Local", "Visitante", "Hora", "Lugar", "Arbitro"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, true, true, true
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane2.setViewportView(tblPrimera);

        btnActualizar.setText("Actualizar");
        btnActualizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                actualizarCambios(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jScrollPane1)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(cboJornada, javax.swing.GroupLayout.PREFERRED_SIZE, 49, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txtFecha, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 407, Short.MAX_VALUE)
                        .addComponent(btnActualizar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButton1)))
                .addContainerGap())
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addContainerGap()
                    .addComponent(jLabel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addContainerGap()))
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addContainerGap()
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 853, Short.MAX_VALUE)
                    .addContainerGap()))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(cboJornada, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2)
                    .addComponent(txtFecha, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton1)
                    .addComponent(btnActualizar))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 215, Short.MAX_VALUE)
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 161, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(11, 11, 11))
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addGap(55, 55, 55)
                    .addComponent(jLabel4)
                    .addContainerGap(377, Short.MAX_VALUE)))
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addGap(84, 84, 84)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 161, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addContainerGap(203, Short.MAX_VALUE)))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void exportarReporte(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_exportarReporte
        // TODO add your handling code here:
        if (txtFecha.getText() == null || txtFecha.getText().isEmpty()) {
            agregarMensajeAdvertencia("Debe ingresar la fecha");
            return;
        }
        int jornada = cboJornada.getSelectedIndex() + 1;
        List<Juegos> juegos = new ArrayList<>();
        juegos.addAll(extraerDatosTabla(tblPrimera, 1));
        juegos.addAll(extraerDatosTabla(tblSegunda, 2));
        
        try {
            reportesManager.rolJornada(juegos, jornada, txtFecha.getText());
        } catch (LMFVGOException ex) {
            agregarMensajeError(ex.getMessage());
        }
    }//GEN-LAST:event_exportarReporte

    private List<Juegos> extraerDatosTabla(JTable tabla, int fuerza) {
        List<Juegos> juegos = new ArrayList<>();
        for (int i = 0; i < tabla.getRowCount(); i++) {
            Juegos j = new Juegos();
            j.setIdJuego((Integer) tabla.getValueAt(i, 0));
            j.setLocalNombre((String) tabla.getValueAt(i, 1));
            j.setVisitanteNombre((String) tabla.getValueAt(i, 2));
            j.setHora(tabla.getValueAt(i, 3) != null ? (String) tabla.getValueAt(i, 3) : "");
            j.setLugar(tabla.getValueAt(i, 4) != null ? (String) tabla.getValueAt(i, 4) : "");
            if (tabla.getValueAt(i, 5) != null) {
                String arbitro = (String) tabla.getValueAt(i, 5);
                if (!arbitro.isEmpty() && !arbitro.contains("DESCANSA") && !arbitro.contains("SELECCIONE")) {
                    j.setNombreArbitro(arbitro.split(" - ")[1]);
                    j.setIdArbitro(Integer.parseInt(arbitro.split(" - ")[0]));
                }
            }
            j.setFuerza(fuerza);
            juegos.add(j);
        }
        return juegos;
    }
    
    private void actualizarCambios(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_actualizarCambios
        if (txtFecha.getText() == null || txtFecha.getText().isEmpty()) {
            agregarMensajeAdvertencia("No se especificó la fecha");
            return;
        } else {
            try {
                sdf.parse(txtFecha.getText());
            } catch (ParseException ex) {
                agregarMensajeAdvertencia("El formato de la fecha no corresponde a dd/MM/yyyy");
                return;
            }
        }
        
       try {
           actualizarJuegos(extraerDatosTabla(tblPrimera, 1));
           actualizarJuegos(extraerDatosTabla(tblSegunda, 2));
           
           agregarMensajeExito("Los datos se actualizaron correctamente");
       } catch (LMFVGOException | ParseException ex) {
           agregarMensajeError(ex.getMessage());
       }
    }//GEN-LAST:event_actualizarCambios

    private void actualizarJuegos(List<Juegos> juegos) throws LMFVGOException, ParseException {
        Date fecha = sdf.parse(txtFecha.getText());
        for (Juegos j : juegos) {
            if (!j.getLocalNombre().contains("DESCANSA")) {
                j.setFecha(fecha);
                juegosDAO.actualizarDatosJornadaJuego(j);
            }
        }
    }
    
    private void actualizarTablas(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_actualizarTablas
        llenarTabla(tblPrimera, juegosDAO.consultaJuegosJornada(1, (cboJornada.getSelectedIndex() + 1)));
        llenarTabla(tblSegunda, juegosDAO.consultaJuegosJornada(2, (cboJornada.getSelectedIndex() + 1)));
        
        Date fecha = juegosDAO.consultaFechaJornada(cboJornada.getSelectedIndex() + 1);
        txtFecha.setText(fecha != null ? sdf.format(fecha) : "");
    }//GEN-LAST:event_actualizarTablas

    private void llenarTabla(JTable tabla, List<Juegos> juegos) {
        limpiarTabla(tabla);
        Juegos juegoDescansa = null;
        DefaultTableModel modelo = (DefaultTableModel) tabla.getModel();
        for (Juegos j : juegos) {
            if (j.getLocalNombre().equals("DESCANSA") || j.getVisitanteNombre().equals("DESCANSA")) {
                juegoDescansa = j;
            } else {
                modelo.addRow(new Object[]{j.getIdJuego(), j.getLocalNombre(), j.getVisitanteNombre(), j.getHora(), j.getLugar(), 
                    (j.getIdArbitro() == null || j.getIdArbitro().equals(0) ? "0 - SELECCIONE" : (j.getIdArbitro() + " - " + j.getNombreArbitro()))});
            }
        }
        if (juegoDescansa != null) {
                modelo.addRow(new Object[]{null, "DESCANSA", 
                    juegoDescansa.getLocalNombre().equals("DESCANSA") ? juegoDescansa.getVisitanteNombre() : juegoDescansa.getLocalNombre(), 
                    "","",""});
        }
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnActualizar;
    private javax.swing.JComboBox<String> cboJornada;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable tblPrimera;
    private javax.swing.JTable tblSegunda;
    private javax.swing.JTextField txtFecha;
    // End of variables declaration//GEN-END:variables
}
