/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lmfvgo.vista;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.swing.DefaultCellEditor;
import javax.swing.JComboBox;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import lmfvgo.db.EstadisticasEquipoDAO;
import lmfvgo.db.EstadisticasJugadorDAO;
import lmfvgo.db.JuegosDAO;
import lmfvgo.db.JugadoresDAO;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.EstadisticasEquipo;
import lmfvgo.modelo.EstadisticasJugador;
import lmfvgo.modelo.Juegos;
import lmfvgo.util.ReportesManager;

/**
 *
 * @author USUARIO
 */
public class JuegoDetalleVista extends FormBase {
    private static final long serialVersionUID = -1163107632122936758L;
    private static final String PARAM_LISTA = "paramLista";
    private static final String PARAM_EST = "paramEstEq";

    private final JuegosDAO juegosDAO;
    private final JugadoresDAO jugadoresDAO;
    private final EstadisticasJugadorDAO estadisticasJugadorDAO;
    private final EstadisticasEquipoDAO estadisticasEquipoDAO;
    private final ReportesManager reportesManager;
    private final Juegos juego;
    private JComboBox cboAlineacion;
    private JComboBox cboTA;
    private JComboBox cboTR;
    private JComboBox cboGoles;
    private EstadisticasEquipo estadisticaLocal;
    private EstadisticasEquipo estadisticaVisitante;
    
    /**
     * Creates new form JuegoDetalleVista
     * @param juego
     */
    public JuegoDetalleVista(Juegos juego) {
        initComponents();
        
        juegosDAO = new JuegosDAO();
        jugadoresDAO = new JugadoresDAO();
        estadisticasJugadorDAO = new EstadisticasJugadorDAO();
        estadisticasEquipoDAO = new EstadisticasEquipoDAO();
        reportesManager = new ReportesManager();
        
        this.juego = juego;
        btnCedula.setEnabled(false);
        iniciarCombos();
        cargarModelosTable(tblLocal);
        cargarModelosTable(tblVisitante);
        
        estadisticaLocal = estadisticasEquipoDAO.consultaEstadisticaEquipo(juego.getIdJuego(), juego.getLocal());
        estadisticaVisitante = estadisticasEquipoDAO.consultaEstadisticaEquipo(juego.getIdJuego(), juego.getVisitante());
        
        btnGenerarEsta.setVisible(estadisticaLocal != null && estadisticaLocal.getIdEstadistica() != null && estadisticaLocal.getIdEstadistica() > 0 &&
                estadisticaVisitante != null && estadisticaVisitante.getIdEstadistica() != null && estadisticaVisitante.getIdEstadistica() > 0);
        
        cargarDatosJuego();
    }
    
    private void iniciarCombos() {
        cboAlineacion = new JComboBox();
        cboAlineacion.addItem("NJ");
        cboAlineacion.addItem("I");
        cboAlineacion.addItem("C");
        
        cboTA = new JComboBox();
        cboTA.addItem(0);
        cboTA.addItem(1);
        cboTA.addItem(2);
        
        cboTR = new JComboBox();
        cboTR.addItem(0);
        cboTR.addItem(1);
        
        cboGoles = new JComboBox();
        for (int i = 0; i <= 10; i++) {
            cboGoles.addItem(i);
        }
    }
    
    private void cargarDatosJuego() {
        setTitle("Jornada " + juego.getJornada() + ": " + juego.getLocalNombre() + " vs " + juego.getVisitanteNombre());
        lblLocal.setText(juego.getLocalNombre() + 
                (estadisticaLocal != null && estadisticaLocal.getIdEstadistica() != null && estadisticaLocal.getIdEstadistica() > 0 ? 
                        (" - " + estadisticaLocal.getGolesFavor()) : ""));
        lblVisitante.setText(juego.getVisitanteNombre() + 
                (estadisticaVisitante != null && estadisticaVisitante.getIdEstadistica() != null && estadisticaVisitante.getIdEstadistica() > 0 ?
                        (" - " + estadisticaVisitante.getGolesFavor()) : ""));
        
        if (juego.getFecha() != null && juego.getHora() != null && !juego.getHora().isEmpty()
                && juego.getLugar() != null && !juego.getLugar().isEmpty()) {
            txtFecha.setText(new SimpleDateFormat("dd/MM/yyyy").format(juego.getFecha()));
            txtHora.setText(juego.getHora());
            txtLugar.setText(juego.getLugar());
            btnCedula.setEnabled(true);
            btnActualizar.setEnabled(false);
            btnLimpiar.setEnabled(false);
            txtFecha.setEnabled(false);
            txtHora.setEnabled(false);
            txtLugar.setEnabled(false);
            btnActualizar.setEnabled(false);
        }
        
        cargarTablaEstadisticas(juego.getIdJuego(), juego.getLocal(), tblLocal);
        
        cargarTablaEstadisticas(juego.getIdJuego(), juego.getVisitante(), tblVisitante);
    }
    
    private void cargarTablaEstadisticas(Integer idJuego, Integer idEquipo, JTable tabla) {
        limpiarTabla(tabla);
        
        List<EstadisticasJugador> estj = estadisticasJugadorDAO.consultarEstadisticasJuego(idEquipo, idJuego);
        
        if (estj == null) {
            estj = new ArrayList<>();
        }
        if (estj.isEmpty()) {
            List<String> jLocal = jugadoresDAO.consultaJugadoresEquipo(idEquipo);
            for (String j: jLocal) {
                EstadisticasJugador ej = new EstadisticasJugador();
                ej.setIdJugador(Integer.parseInt(j.split(" - ")[0]));
                ej.setNombreJugador(j);
                ej.setIdEquipo(idEquipo);
                ej.setIdJuego(idJuego);
                estj.add(ej);
            }
        }
        DefaultTableModel local = (DefaultTableModel) tabla.getModel();
        
        for (EstadisticasJugador ej : estj) {
            local.addRow(new Object[]{(ej.getIdEstadistica() != null && ej.getIdEstadistica() > 0 ? ej.getIdEstadistica() : null),
                                        ej.getNombreJugador(), 
                                        ej.getInicioCambioNj() == null || ej.getInicioCambioNj().isEmpty() ? "NJ" : ej.getInicioCambioNj(), 
                                        ej.getTa() == null ? 0 : ej.getTa(), 
                                        ej.getTr() == null ? 0 : ej.getTr(), 
                                        ej.getGoles() == null ? 0 : ej.getGoles()});
        }
    }
    
    private void cargarModelosTable(JTable tabla) {
        tabla.getColumnModel().getColumn(2).setCellEditor(new DefaultCellEditor(cboAlineacion));
        tabla.getColumnModel().getColumn(3).setCellEditor(new DefaultCellEditor(cboTA));
        tabla.getColumnModel().getColumn(4).setCellEditor(new DefaultCellEditor(cboTR));
        tabla.getColumnModel().getColumn(5).setCellEditor(new DefaultCellEditor(cboGoles));
    }
    
    /**
     * This method is called from within the constructor to initialize the form. WARNING: Do NOT modify this code. The
     * content of this method is always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        txtFecha = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        txtLugar = new javax.swing.JTextField();
        btnLimpiar = new javax.swing.JButton();
        btnActualizar = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblLocal = new javax.swing.JTable();
        jScrollPane2 = new javax.swing.JScrollPane();
        tblVisitante = new javax.swing.JTable();
        lblLocal = new javax.swing.JLabel();
        lblVisitante = new javax.swing.JLabel();
        btnCedula = new javax.swing.JButton();
        jLabel3 = new javax.swing.JLabel();
        txtHora = new javax.swing.JTextField();
        btnGuardar = new javax.swing.JButton();
        btnGenerarEsta = new javax.swing.JButton();

        setClosable(true);
        setPreferredSize(new java.awt.Dimension(1150, 550));

        jLabel1.setText("Fecha:");

        txtFecha.setToolTipText("Formato: dd/MM/yyyy Ejemplo: 05/09/2017");

        jLabel2.setText("Lugar:");

        btnLimpiar.setText("Limpiar");
        btnLimpiar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                limpiar(evt);
            }
        });

        btnActualizar.setText("Actualizar");
        btnActualizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                actualizarJuego(evt);
            }
        });

        tblLocal.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID-E", "Nombre", "Alinea", "A", "R", "G"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.Integer.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, true, true, true, true
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(tblLocal);
        if (tblLocal.getColumnModel().getColumnCount() > 0) {
            tblLocal.getColumnModel().getColumn(0).setResizable(false);
            tblLocal.getColumnModel().getColumn(0).setPreferredWidth(5);
            tblLocal.getColumnModel().getColumn(1).setPreferredWidth(105);
            tblLocal.getColumnModel().getColumn(2).setResizable(false);
            tblLocal.getColumnModel().getColumn(2).setPreferredWidth(10);
            tblLocal.getColumnModel().getColumn(3).setResizable(false);
            tblLocal.getColumnModel().getColumn(3).setPreferredWidth(5);
            tblLocal.getColumnModel().getColumn(4).setResizable(false);
            tblLocal.getColumnModel().getColumn(4).setPreferredWidth(5);
            tblLocal.getColumnModel().getColumn(5).setResizable(false);
            tblLocal.getColumnModel().getColumn(5).setPreferredWidth(5);
        }

        tblVisitante.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID-E", "Nombre", "Alinea", "A", "R", "G"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.Integer.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, true, true, true, true
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblVisitante.getTableHeader().setReorderingAllowed(false);
        jScrollPane2.setViewportView(tblVisitante);
        if (tblVisitante.getColumnModel().getColumnCount() > 0) {
            tblVisitante.getColumnModel().getColumn(0).setResizable(false);
            tblVisitante.getColumnModel().getColumn(0).setPreferredWidth(5);
            tblVisitante.getColumnModel().getColumn(1).setPreferredWidth(105);
            tblVisitante.getColumnModel().getColumn(2).setResizable(false);
            tblVisitante.getColumnModel().getColumn(2).setPreferredWidth(10);
            tblVisitante.getColumnModel().getColumn(3).setResizable(false);
            tblVisitante.getColumnModel().getColumn(3).setPreferredWidth(5);
            tblVisitante.getColumnModel().getColumn(4).setResizable(false);
            tblVisitante.getColumnModel().getColumn(4).setPreferredWidth(5);
            tblVisitante.getColumnModel().getColumn(5).setResizable(false);
            tblVisitante.getColumnModel().getColumn(5).setPreferredWidth(5);
        }

        lblLocal.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblLocal.setText("jLabel3");

        lblVisitante.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblVisitante.setText("jLabel3");

        btnCedula.setText("Cédula");
        btnCedula.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                generarCedula(evt);
            }
        });

        jLabel3.setText("Hora");

        txtHora.setToolTipText("Formato: HH:mm Ejemplo: 10:00");

        btnGuardar.setText("Guardar Estadisticas");
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                guardarEstadisticas(evt);
            }
        });

        btnGenerarEsta.setText("Reporte");
        btnGenerarEsta.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                generarReporte(evt);
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
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(txtFecha, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jLabel3)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(txtHora, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(0, 0, Short.MAX_VALUE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(txtLugar, javax.swing.GroupLayout.PREFERRED_SIZE, 403, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 436, Short.MAX_VALUE)
                                .addComponent(btnCedula)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(btnActualizar)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(btnLimpiar))))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(4, 4, 4)
                                .addComponent(lblLocal, javax.swing.GroupLayout.PREFERRED_SIZE, 496, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 540, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lblVisitante, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(0, 0, Short.MAX_VALUE)
                                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 540, javax.swing.GroupLayout.PREFERRED_SIZE))))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(btnGenerarEsta)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(btnGuardar)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(txtFecha, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3)
                    .addComponent(txtHora, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(txtLugar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnLimpiar)
                    .addComponent(btnActualizar)
                    .addComponent(btnCedula))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lblVisitante)
                    .addComponent(lblLocal))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 367, Short.MAX_VALUE)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnGuardar)
                    .addComponent(btnGenerarEsta))
                .addGap(0, 0, 0))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void limpiar(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_limpiar
        txtFecha.setText(null);
        txtHora.setText(null);
        txtLugar.setText(null);
        btnCedula.setEnabled(false);
    }//GEN-LAST:event_limpiar

    private void actualizarJuego(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_actualizarJuego
        if (validarDatos()) {
            try {
                juegosDAO.actualizarDatosJornadaJuego(juego);
                btnCedula.setEnabled(true);
                txtFecha.setEnabled(false);
                txtHora.setEnabled(false);
                txtLugar.setEnabled(false);
                btnLimpiar.setEnabled(false);
                btnActualizar.setEnabled(false);
            } catch (LMFVGOException ex) {
                agregarMensajeError(ex.getMessage());
            }
        }
    }//GEN-LAST:event_actualizarJuego

    private boolean validarDatos() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        if (txtFecha.getText() == null) {
            agregarMensajeAdvertencia("La fecha es requerida");
            return false;
        }
        try {
            juego.setFecha(sdf.parse(txtFecha.getText()));
        } catch (ParseException ex) {
            agregarMensajeError("El formato de la fecha es incorrecto");
            return false;
        }
        if (txtHora.getText() == null) {
            agregarMensajeAdvertencia("La hora es requerida");
            return false;
        } 
        if (!txtHora.getText().contains(":")) {
            agregarMensajeAdvertencia("El formato de la hora es incorrecto");
            return false;
        } 
        String[] hora = txtHora.getText().split(":");
        try {
            if (Integer.parseInt(hora[0]) < 13 && Integer.parseInt(hora[1]) < 60) {
                juego.setHora(txtHora.getText());
            } else {
                agregarMensajeError("El valor de la hora es incorrecta");
                return false;
            }
            
        } catch (NumberFormatException ex) {
            agregarMensajeError("El contenido del valor de la hora debe ser numérico");
            return false;
        }
        if (txtLugar.getText() == null || txtLugar.getText().trim().isEmpty()) {
            agregarMensajeAdvertencia("El lugar es requerido");
            return false;
        }
        juego.setLugar(txtLugar.getText());
        return true;
    }
    private void generarCedula(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_generarCedula
        Map<String, Object> listaLocal = obtenerEstadisticasTabla(tblLocal, juego.getLocal(), juego.getIdJuego(), true, estadisticaLocal);
        Map<String, Object> listaVisitante = obtenerEstadisticasTabla(tblVisitante, juego.getVisitante(), juego.getIdJuego(), true, estadisticaVisitante);
        
        if (listaLocal == null || listaLocal.isEmpty() || listaLocal.get(PARAM_LISTA) == null ||
                listaVisitante == null || listaVisitante.isEmpty() || listaVisitante.get(PARAM_LISTA) == null) {
            agregarMensajeError("No se pueden generar la cédula de juego ya que uno de los equipos no cuenta con jugadores activos");
            return;
        }
        try {
            reportesManager.cedulaJuego(juego, (List<EstadisticasJugador>) listaLocal.get(PARAM_LISTA), 
                    (List<EstadisticasJugador>) listaVisitante.get(PARAM_LISTA));
        } catch (LMFVGOException ex) {
            agregarMensajeError(ex.getMessage());
        }
    }//GEN-LAST:event_generarCedula

    private void guardarEstadisticas(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_guardarEstadisticas
        Map<String, Object> estadisticasLocal = obtenerEstadisticasTabla(tblLocal, juego.getLocal(), 
                juego.getIdJuego(), false, estadisticaLocal);
        Map<String, Object> estadisticasVisitante = obtenerEstadisticasTabla(tblVisitante, juego.getVisitante(), 
                juego.getIdJuego(), false, estadisticaVisitante);
        
        if (estadisticasLocal == null || estadisticasLocal.isEmpty() ||
                estadisticasVisitante == null || estadisticasVisitante.isEmpty()) {
            agregarMensajeError("No se pueden guardar los registros debido a que un equipo no tiene jugadores activos");
            return;
        }
        
        try {
            List<EstadisticasJugador> ejl = (List<EstadisticasJugador>) estadisticasLocal.get(PARAM_LISTA);
            List<EstadisticasJugador> ejv = (List<EstadisticasJugador>) estadisticasVisitante.get(PARAM_LISTA);
            if (ejl.get(0).getIdEstadistica()!= null &&
                    ejl.get(0).getIdEstadistica()> 0) {
                estadisticasJugadorDAO.actualizarEstadisticasJuego(ejl);
            } else {
                estadisticasJugadorDAO.guardarEstadisticasJuego(ejl);
            }
            if (ejv.get(0).getIdEstadistica() != null &&
                    ejv.get(0).getIdEstadistica() > 0) {
                estadisticasJugadorDAO.actualizarEstadisticasJuego(ejv);
            } else {
                estadisticasJugadorDAO.guardarEstadisticasJuego(ejv);
            }
            estadisticaLocal.setGolesContra(estadisticaVisitante.getGolesFavor());
            estadisticaVisitante.setGolesContra(estadisticaLocal.getGolesFavor());
            if (estadisticaLocal.getGolesFavor() == estadisticaVisitante.getGolesFavor()) {
                estadisticaLocal.setPuntos(1);
                estadisticaVisitante.setPuntos(1);
            } else if (estadisticaLocal.getGolesFavor() > estadisticaVisitante.getGolesFavor()) {
                estadisticaLocal.setPuntos(3);
                estadisticaVisitante.setPuntos(0);
            } else {
                estadisticaVisitante.setPuntos(3);
                estadisticaLocal.setPuntos(0);
            }
            if (estadisticaLocal.getIdEstadistica() == null || estadisticaLocal.getIdEstadistica() == 0) {
                estadisticasEquipoDAO.guardarEstadisticas(estadisticaLocal);
            } else {
                estadisticasEquipoDAO.actualizarEstadisticas(estadisticaLocal);
            }
            if (estadisticaVisitante.getIdEstadistica() == null || estadisticaVisitante.getIdEstadistica() == 0) {
                estadisticasEquipoDAO.guardarEstadisticas(estadisticaVisitante);
            } else {
                estadisticasEquipoDAO.actualizarEstadisticas(estadisticaVisitante);
            }
            agregarMensajeExito("Se guardaron correctamente los registos");
            btnGenerarEsta.setVisible(true);
        } catch (LMFVGOException ex) {
            agregarMensajeError(ex.getMessage());
        }
    }//GEN-LAST:event_guardarEstadisticas

    private void generarReporte(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_generarReporte
        Map<String, Object> listaLocal = obtenerEstadisticasTabla(tblLocal, juego.getLocal(), juego.getIdJuego(), false, estadisticaLocal);
        Map<String, Object> listaVisitante = obtenerEstadisticasTabla(tblVisitante, juego.getVisitante(), juego.getIdJuego(), false, estadisticaVisitante);
        
        if (listaLocal == null || listaLocal.isEmpty() || listaLocal.get(PARAM_LISTA) == null ||
                listaVisitante == null || listaVisitante.isEmpty() || listaVisitante.get(PARAM_LISTA) == null) {
            agregarMensajeError("No se pueden generar el reporte de juego ya que uno de los equipos no cuenta con jugadores activos");
            return;
        }
        try {
            EstadisticasEquipo estEqLocal = (EstadisticasEquipo) listaLocal.get(PARAM_EST);
            EstadisticasEquipo estEqVisitante = (EstadisticasEquipo) listaVisitante.get(PARAM_EST);
            juego.setMarcador(String.valueOf(estEqLocal.getGolesFavor()) + " - " + String.valueOf(estEqVisitante.getGolesFavor()));
            reportesManager.cedulaJuego(juego, (List<EstadisticasJugador>) listaLocal.get(PARAM_LISTA), 
                    (List<EstadisticasJugador>) listaVisitante.get(PARAM_LISTA));
        } catch (LMFVGOException ex) {
            agregarMensajeError(ex.getMessage());
        }
    }//GEN-LAST:event_generarReporte

    private Map<String, Object> obtenerEstadisticasTabla(JTable tabla, Integer idEquipo, Integer idJuego, boolean expCedRep, EstadisticasEquipo ee) {
        Map<String, Object> mapa = new HashMap<>();
        
        DefaultTableModel model = (DefaultTableModel) tabla.getModel();
        
        if (model.getRowCount() >= 8) {
            if (ee == null) {
                ee = new EstadisticasEquipo();
            }
            int goles = 0;
            
            ee.setIdEquipo(idEquipo);
            ee.setIdJuego(idJuego);
            List<EstadisticasJugador> ejl = new ArrayList<>();
            for (int i = 0; i < model.getRowCount(); i++) {
                EstadisticasJugador ej = new EstadisticasJugador();
                ej.setIdEstadistica((Integer) model.getValueAt(i, 0));
                String[] dj = ((String) model.getValueAt(i, 1)).split(" - ");
                ej.setIdJugador(Integer.parseInt(dj[0]));
                ej.setNombreJugador(dj[1]);
                ej.setIdEquipo(idEquipo);
                ej.setIdJuego(idJuego);
                if (!expCedRep) {
                    ej.setInicioCambioNj((String) model.getValueAt(i, 2));
                    ej.setTa((Integer) model.getValueAt(i, 3));
                    ej.setTr((Integer) model.getValueAt(i, 4));
                    ej.setGoles((Integer) model.getValueAt(i, 5));
                    goles += ej.getGoles();
                }
                ejl.add(ej);
            }
            ee.setGolesFavor(goles);
            mapa.put(PARAM_LISTA, ejl);
            mapa.put(PARAM_EST, ee);
            return mapa;
        }
        return null;
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnActualizar;
    private javax.swing.JButton btnCedula;
    private javax.swing.JButton btnGenerarEsta;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JButton btnLimpiar;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JLabel lblLocal;
    private javax.swing.JLabel lblVisitante;
    private javax.swing.JTable tblLocal;
    private javax.swing.JTable tblVisitante;
    private javax.swing.JTextField txtFecha;
    private javax.swing.JTextField txtHora;
    private javax.swing.JTextField txtLugar;
    // End of variables declaration//GEN-END:variables
}
