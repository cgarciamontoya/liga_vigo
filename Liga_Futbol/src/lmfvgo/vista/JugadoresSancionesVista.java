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
import javax.swing.JOptionPane;
import javax.swing.SwingUtilities;
import javax.swing.table.DefaultTableModel;
import lmfvgo.db.EquiposDAO;
import lmfvgo.db.JuegosDAO;
import lmfvgo.db.JugadoresDAO;
import lmfvgo.db.ReglamentoDAO;
import lmfvgo.db.SancionesDAO;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Equipos;
import lmfvgo.modelo.Jugadores;
import lmfvgo.modelo.Reglamento;
import lmfvgo.modelo.Sancion;
import lmfvgo.util.ConstantesUtil;

/**
 *
 * @author USUARIO
 */
public class JugadoresSancionesVista extends FormBase {
    private static final long serialVersionUID = -1806608817536470314L;
    
    private final ReglamentoDAO reglamentoDAO;
    private final EquiposDAO equiposDAO;
    private final JugadoresDAO jugadoresDAO;
    private final JuegosDAO juegosDAO;
    private final SancionesDAO sancionesDAO;

    /**
     * Creates new form JugadoresSancionesVista
     * @param con
     */
    public JugadoresSancionesVista(Connection con) {
        initComponents();
        
        reglamentoDAO = new ReglamentoDAO(con);
        equiposDAO = new EquiposDAO(con);
        jugadoresDAO = new JugadoresDAO(con);
        juegosDAO = new JuegosDAO(con);
        sancionesDAO = new SancionesDAO(con);
        
        List<Reglamento> reglas = reglamentoDAO.consultaPorFiltros(new Reglamento());
        DefaultComboBoxModel modelReglas = (DefaultComboBoxModel) cboReglamento.getModel();
        for (Reglamento r : reglas) {
            modelReglas.addElement(r.getClave() + " - " + r.getDescripcion());
        }
        cboReglamento.setModel(modelReglas);
        
        List<Integer> jornadas = juegosDAO.consultaNumeroJornadas(1);
        List<String> jcbo = new ArrayList<>();
        if (jornadas != null && !jornadas.isEmpty()) {
            for (Integer j : jornadas) {
                switch (j) {
                    case ConstantesUtil.JORNADA_CUARTOS:
                        jcbo.add("CT");
                        break;
                    case ConstantesUtil.JORNADA_SEMIS:
                        jcbo.add("SF");
                        break;
                    case ConstantesUtil.JORNADA_FINAL:
                        jcbo.add("FN");
                        break;
                    default:
                        jcbo.add(String.valueOf(j));
                }
            }
            cboJornada.setModel(new DefaultComboBoxModel(jcbo.toArray()));
        }
        
    }

    /**
     * This method is called from within the constructor to initialize the form. WARNING: Do NOT modify this code. The
     * content of this method is always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        cboEquipos = new javax.swing.JComboBox();
        jLabel2 = new javax.swing.JLabel();
        cboJugador = new javax.swing.JComboBox();
        jLabel3 = new javax.swing.JLabel();
        cboReglamento = new javax.swing.JComboBox();
        btnLimpiar = new javax.swing.JButton();
        btnAgregar = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblCastigos = new javax.swing.JTable();
        jLabel4 = new javax.swing.JLabel();
        cboJornada = new javax.swing.JComboBox();
        btnGuardar = new javax.swing.JButton();
        btnClave = new javax.swing.JButton();
        jLabel5 = new javax.swing.JLabel();
        cboFuerza = new javax.swing.JComboBox();

        setClosable(true);
        setTitle("SANCIONES A JUGADORES");

        jLabel1.setText("Equipo:");

        cboEquipos.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cargarJugadores(evt);
            }
        });

        jLabel2.setText("Jugador:");

        cboJugador.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cargarSanciones(evt);
            }
        });

        jLabel3.setText("Clave:");

        btnLimpiar.setText("Limpiar");
        btnLimpiar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                limpiar(evt);
            }
        });

        btnAgregar.setText("Agregar");
        btnAgregar.setToolTipText("");
        btnAgregar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                agregarClave(evt);
            }
        });

        tblCastigos.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Clave", "Jornada", "Jugador", "Juegos", "Multa"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Float.class
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
        tblCastigos.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                quitarClave(evt);
            }
        });
        jScrollPane1.setViewportView(tblCastigos);

        jLabel4.setText("Jornada:");

        btnGuardar.setText("Guardar");
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                guardarCastigos(evt);
            }
        });

        btnClave.setText("Detalle Clave");
        btnClave.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                verClave(evt);
            }
        });

        jLabel5.setText("Fuerza:");

        cboFuerza.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Seleccione", "Primera", "Segunda" }));
        cboFuerza.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cargarEquipos(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 796, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel4)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(cboJornada, javax.swing.GroupLayout.PREFERRED_SIZE, 242, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel3)
                        .addGap(22, 22, 22)
                        .addComponent(cboReglamento, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(btnGuardar, javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addComponent(btnClave)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(btnAgregar)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(btnLimpiar))))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel5)
                        .addGap(18, 18, 18)
                        .addComponent(cboFuerza, javax.swing.GroupLayout.PREFERRED_SIZE, 243, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel1)
                        .addGap(18, 18, 18)
                        .addComponent(cboEquipos, javax.swing.GroupLayout.PREFERRED_SIZE, 243, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(cboJugador, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap(19, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(cboFuerza, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1)
                    .addComponent(cboEquipos, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(cboJugador, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(cboReglamento, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4)
                    .addComponent(cboJornada, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnLimpiar)
                    .addComponent(btnAgregar)
                    .addComponent(btnClave))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 210, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnGuardar))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cargarJugadores(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cargarJugadores
        if (cboEquipos.getItemCount() > 0) {
            int idEquipo = Integer.parseInt(cboEquipos.getSelectedItem().toString().split(" - ")[0]);
            cboJugador.removeAllItems();
            if (idEquipo > 0) {
                List<String> jugs = new ArrayList<>();
                jugs.add("0 - Seleccione");
                List<Jugadores> jugadoresBD = jugadoresDAO.consultaJugadoresEquipo(idEquipo);
                for (Jugadores j : jugadoresBD) {
                    jugs.add(j.getIdJugador() + " - " + j.getNombre() + " " + j.getPaterno() + " " + j.getMaterno());
                }
                if (!jugs.isEmpty()) {
                    cboJugador.setModel(new DefaultComboBoxModel(jugs.toArray()));
                }
            }
        }
    }//GEN-LAST:event_cargarJugadores

    private void limpiar(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_limpiar
        cboJugador.removeAllItems();
        cboEquipos.removeAllItems();
        cboJornada.setSelectedIndex(0);
        cboReglamento.setSelectedIndex(0);
        cboFuerza.setSelectedIndex(0);
        limpiarTabla(tblCastigos);
    }//GEN-LAST:event_limpiar

    private void agregarClave(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_agregarClave
        DefaultTableModel modelo = (DefaultTableModel) tblCastigos.getModel();
        Reglamento r = reglamentoDAO.consultaPorClave(cboReglamento.getSelectedItem().toString().split(" - ")[0]);
        modelo.addRow(new Object[]{r.getClave(), cboJornada.getSelectedItem().toString(),
            cboJugador.getSelectedItem().toString(),(String.valueOf(r.getSancionJuegos())), r.getSancionEconomica()});
    }//GEN-LAST:event_agregarClave

    private void quitarClave(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_quitarClave
        if (SwingUtilities.isRightMouseButton(evt)) {
            int dialogResult = JOptionPane.showConfirmDialog(null, "Desea quitar el castigo de la lista?", "Advertencia", JOptionPane.YES_NO_OPTION);
            if (dialogResult == JOptionPane.YES_OPTION) {
                ((DefaultTableModel) tblCastigos.getModel()).removeRow(tblCastigos.getSelectedRow());
            }
        }
    }//GEN-LAST:event_quitarClave

    private void guardarCastigos(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_guardarCastigos
        if (tblCastigos.getRowCount() > 0) {
            List<Sancion> sanciones = new ArrayList<>();
            DefaultTableModel modelo = (DefaultTableModel) tblCastigos.getModel();
            int idJugador = Integer.parseInt(((String) modelo.getValueAt(0, 2)).split(" - ")[0]);
            for (int i = 0; i < tblCastigos.getRowCount(); i++) {
                Sancion s = new Sancion();
                s.setClave((String) modelo.getValueAt(i, 0));
                String jor = modelo.getValueAt(i, 1).toString();
                switch (jor) {
                    case "CT":
                        s.setJornada(ConstantesUtil.JORNADA_CUARTOS);
                        break;
                    case "SF":
                        s.setJornada(ConstantesUtil.JORNADA_SEMIS);
                        break;
                    case "FN":
                        s.setJornada(ConstantesUtil.JORNADA_FINAL);
                        break;
                    default:
                        s.setJornada(Integer.parseInt(jor));
                }
                s.setIdJugador(idJugador);
                sanciones.add(s);
            }
            try {
                sancionesDAO.guardar(sanciones, idJugador);
                agregarMensajeExito("Las sanciones se guardaron correctamente");
                limpiar(evt);
            } catch (LMFVGOException ex) {
                agregarMensajeError(ex.getMessage());
            }
        }
    }//GEN-LAST:event_guardarCastigos

    private void verClave(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_verClave
        Reglamento r = reglamentoDAO.consultaPorClave(cboReglamento.getSelectedItem().toString().split(" - ")[0]);
        JOptionPane.showMessageDialog(this, r.getDescripcion(), "Info", JOptionPane.INFORMATION_MESSAGE);
    }//GEN-LAST:event_verClave

    private void cargarSanciones(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cargarSanciones
        if (cboJugador.getSelectedIndex() > 0) {
            limpiarTabla(tblCastigos);
            Integer idJugador = Integer.parseInt(cboJugador.getSelectedItem().toString().split(" - ")[0]);
            List<Sancion> sanciones = sancionesDAO.consultaSancionesJugador(idJugador, cboFuerza.getSelectedIndex());
            if (sanciones != null && !sanciones.isEmpty()) {
                DefaultTableModel modelo = (DefaultTableModel) tblCastigos.getModel();
                for (Sancion s : sanciones) {
                    modelo.addRow(new Object[]{s.getClave(), s.getJornada(), (s.getIdJugador() + " - " + s.getNombreJugador()), 
                    (String.valueOf(s.getSancionJuegos())), (s.getSancionEconomica() != null && s.getSancionEconomica() > 0 ? s.getSancionEconomica() : null)});
                }
            }
        }
    }//GEN-LAST:event_cargarSanciones

    private void cargarEquipos(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cargarEquipos
        if (cboFuerza.getSelectedIndex() > 0) {
            List<Equipos> equipos = equiposDAO.consultarEquipo(null, 0);
            DefaultComboBoxModel modelEquipos = (DefaultComboBoxModel) cboEquipos.getModel();
            modelEquipos.addElement("0 - Seleccione");
            for (Equipos e : equipos) {
                modelEquipos.addElement(e.getIdEquipo() + " - " + e.getNombre());
            }
            cboEquipos.setModel(modelEquipos);
        }
    }//GEN-LAST:event_cargarEquipos


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAgregar;
    private javax.swing.JButton btnClave;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JButton btnLimpiar;
    private javax.swing.JComboBox cboEquipos;
    private javax.swing.JComboBox cboFuerza;
    private javax.swing.JComboBox cboJornada;
    private javax.swing.JComboBox cboJugador;
    private javax.swing.JComboBox cboReglamento;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblCastigos;
    // End of variables declaration//GEN-END:variables
}
