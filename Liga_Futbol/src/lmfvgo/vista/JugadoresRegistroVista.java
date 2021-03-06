/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lmfvgo.vista;

import com.github.sarxos.webcam.Webcam;
import com.github.sarxos.webcam.WebcamDiscoveryEvent;
import com.github.sarxos.webcam.WebcamDiscoveryListener;
import com.github.sarxos.webcam.WebcamEvent;
import com.github.sarxos.webcam.WebcamListener;
import com.github.sarxos.webcam.WebcamPanel;
import com.github.sarxos.webcam.WebcamPicker;
import com.github.sarxos.webcam.WebcamResolution;
import com.github.sarxos.webcam.WebcamUtils;
import com.github.sarxos.webcam.util.ImageUtils;
import java.awt.BorderLayout;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.SwingUtilities;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.filechooser.FileSystemView;
import javax.swing.table.DefaultTableModel;
import lmfvgo.db.JugadoresDAO;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.HistoricoJugador;
import lmfvgo.modelo.Jugadores;

/**
 *
 * @author cgarcia
 */
public class JugadoresRegistroVista extends FormBase {

    private static final int PICTURE_MAX_SIZE = 16777215; //16 MB
    private static final long serialVersionUID = -40885056066966584L;
    private SimpleDateFormat sdf;
    private Date fechaActual;
    private JugadoresDAO jugadoresDAO;
    private int idJugador;
    private byte[] fotoBytes;
    private Connection connection;

    public JugadoresRegistroVista(int idJugador, Connection con) {
        this.connection = con;
        initLocal();
        this.idJugador = idJugador;
        Jugadores jbd = jugadoresDAO.consultarJugadorId(idJugador);
        if (jbd != null) {
            txtNombre.setText(jbd.getNombre());
            txtPaterno.setText(jbd.getPaterno());
            txtMaterno.setText(jbd.getMaterno());
            txtLugar.setText(jbd.getLugarProcedencia());
            txtFechaNac.setText(sdf.format(jbd.getFechaNacimiento()));
            txtFechaReg.setText(sdf.format(jbd.getFechaRegistro()));
            txtFechaReg.setEnabled(false);
            if (jbd.getImagen() != null && jbd.getImagen().length > 0) {
                BufferedImage img = scaleImage(120, 65, jbd.getImagen());
                lblFoto.setIcon(new ImageIcon((Image) img));
            }
            lblEditando.setVisible(true);
        }
        
        List<HistoricoJugador> historico = jugadoresDAO.consultaHistorialJugador(idJugador);
        if (historico != null && !historico.isEmpty()) {
            DefaultTableModel model = (DefaultTableModel) tblHistorico.getModel();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            for (HistoricoJugador h : historico) {
                model.addRow(new Object[]{h.getIdTorneo(), h.getNombreTorneo(), sdf.format(h.getFechaTorneo()), h.getNombreEquipo()});
            }
            resizeColumnWidth(tblHistorico);
        }
    }

    private void initLocal() {
        initComponents();
        sdf = new SimpleDateFormat("dd/MM/yyyy");
        fechaActual = new Date();
        jugadoresDAO = new JugadoresDAO(connection);
        txtFechaReg.setText(sdf.format(fechaActual));
        txtNombre.requestFocus();
        tblHistorico.setEnabled(false);
    }

    private BufferedImage scaleImage(int WIDTH, int HEIGHT, byte[] image) {
        BufferedImage bi = null;
        try {
            ImageIcon ii = new ImageIcon(Toolkit.getDefaultToolkit().createImage(image));//path to image
            bi = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
            Graphics2D g2d = (Graphics2D) bi.createGraphics();
            g2d.addRenderingHints(new RenderingHints(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY));
            g2d.drawImage(ii.getImage(), 0, 0, WIDTH, HEIGHT, null);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return bi;
    }

    /**
     * Creates new form JugadoresRegistroVista
     */
    public JugadoresRegistroVista() {
        initLocal();
        lblEditando.setVisible(false);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        txtNombre = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        txtPaterno = new javax.swing.JTextField();
        txtMaterno = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        txtLugar = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        txtFechaNac = new javax.swing.JTextField();
        txtFechaReg = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        txtFotografia = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jSeparator1 = new javax.swing.JSeparator();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        lblFoto = new javax.swing.JLabel();
        btnCamara = new javax.swing.JButton();
        btnNuevo = new javax.swing.JButton();
        lblEditando = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        tblHistorico = new javax.swing.JTable();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(jTable1);

        setClosable(true);
        setTitle("Registro de Jugadores");
        setPreferredSize(new java.awt.Dimension(492, 500));

        jLabel1.setText("Nombre");

        jLabel2.setText("Apellido Paterno");

        jLabel3.setText("Apellido Materno");

        jLabel4.setText("Lugar de Procedencia");

        jLabel5.setText("Fecha Nacimiento");

        txtFechaNac.setToolTipText("Formato dd/MM/yyyy Ej: 15/11/1983");

        txtFechaReg.setToolTipText("Formato dd/MM/yyyy Ej: 15/11/1983");

        jLabel6.setText("Fecha Registro");

        jLabel7.setText("Fotografía");

        txtFotografia.setEnabled(false);

        jButton1.setText("Buscar");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                abrirFotos(evt);
            }
        });

        jButton2.setText("Limpiar");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                limpiar(evt);
            }
        });

        jButton3.setText("Guardar");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                guardar(evt);
            }
        });

        btnCamara.setText("Camara");
        btnCamara.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                abrirCamara(evt);
            }
        });

        btnNuevo.setText("Nuevo");
        btnNuevo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                nuevoRegistro(evt);
            }
        });

        lblEditando.setForeground(new java.awt.Color(255, 51, 51));
        lblEditando.setText("Editando...");

        tblHistorico.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Torneo", "Nombre", "Fecha T.", "Equipo"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblHistorico.setRowSelectionAllowed(false);
        jScrollPane2.setViewportView(tblHistorico);
        if (tblHistorico.getColumnModel().getColumnCount() > 0) {
            tblHistorico.getColumnModel().getColumn(0).setResizable(false);
            tblHistorico.getColumnModel().getColumn(1).setResizable(false);
            tblHistorico.getColumnModel().getColumn(2).setResizable(false);
            tblHistorico.getColumnModel().getColumn(3).setResizable(false);
        }

        jLabel8.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel8.setText("HISTÓRICO");

        jLabel9.setText("* Torneo actual");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel8, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jSeparator1)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(lblEditando)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnNuevo)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButton3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButton2))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(txtFechaNac, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel5))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel6)
                                    .addComponent(txtFechaReg, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addComponent(txtFotografia, javax.swing.GroupLayout.PREFERRED_SIZE, 256, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel7))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jButton1)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(btnCamara))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(lblFoto, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(0, 0, Short.MAX_VALUE))))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txtLugar, javax.swing.GroupLayout.PREFERRED_SIZE, 391, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(txtNombre, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel1))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(txtPaterno, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel2))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel3)
                                    .addComponent(txtMaterno, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addComponent(jLabel4)
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel9))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(jLabel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtNombre, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtPaterno, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtMaterno, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel4)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtLugar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel5)
                            .addComponent(jLabel6))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(txtFechaNac, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txtFechaReg, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel7))
                    .addComponent(lblFoto))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtFotografia, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton1)
                    .addComponent(btnCamara))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jSeparator1, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButton2)
                    .addComponent(jButton3)
                    .addComponent(btnNuevo)
                    .addComponent(lblEditando))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel8)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 109, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(9, 9, 9)
                .addComponent(jLabel9))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void abrirFotos(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_abrirFotos
        final JFileChooser jfc = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
        jfc.setFileFilter(new FileNameExtensionFilter("Imagen", "jpg"));
        int retval = jfc.showOpenDialog(this);
        if (retval == JFileChooser.APPROVE_OPTION) {
            File archivo = jfc.getSelectedFile();
            txtFotografia.setText(archivo.getAbsolutePath());
        }
    }//GEN-LAST:event_abrirFotos

    private void limpiar(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_limpiar
        txtNombre.setText("");
        txtPaterno.setText("");
        txtMaterno.setText("");
        txtLugar.setText("");
        txtFechaNac.setText("");
        txtFechaReg.setText(sdf.format(fechaActual));
        txtFotografia.setText("");
        fotoBytes = null;
    }//GEN-LAST:event_limpiar

    private void guardar(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_guardar
        if (jugadorValido()) {
            Jugadores jugador = new Jugadores();
            jugador.setNombre(txtNombre.getText().toUpperCase());
            jugador.setPaterno(txtPaterno.getText().toUpperCase());
            jugador.setMaterno(txtMaterno.getText().toUpperCase());
            jugador.setLugarProcedencia(txtLugar.getText().trim().toUpperCase());
            try {
                jugador.setFechaNacimiento(sdf.parse(txtFechaNac.getText()));
                jugador.setFechaRegistro(sdf.parse(txtFechaReg.getText()));
            } catch (ParseException ex) {
                Logger.getLogger(JugadoresRegistroVista.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (fotoBytes != null && fotoBytes.length > 0) {
                jugador.setImagen(fotoBytes);
            } else {
                if (txtFotografia.getText() != null && !txtFotografia.getText().trim().isEmpty()) {
                    File foto = new File(txtFotografia.getText());
                    if (foto != null && foto.isFile()) {
                        if (foto.length() > PICTURE_MAX_SIZE) {
                            agregarMensajeAdvertencia("El tamaño de la imagen debe ser menor a 16 MB");
                            return;
                        }
                        try {
                            jugador.setImagen(Files.readAllBytes(foto.toPath()));
                        } catch (IOException ex) {

                        }
                    }
                }
            }
            try {
                if (idJugador > 0) {
                    jugador.setIdJugador(idJugador);
                }
                jugadoresDAO.guardarJugador(jugador);
                agregarMensajeExito("El registro fue almacenado correctamente");
                this.dispose();
            } catch (LMFVGOException ex) {
                agregarMensajeError(ex.getMessage());
            }
        }
    }//GEN-LAST:event_guardar

    private void abrirCamara(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_abrirCamara
        SwingUtilities.invokeLater(new WebCamViewer());
        /*final Webcam webcam = Webcam.getDefault();
        if (webcam.isOpen()) {
            webcam.close();
        }
        webcam.setViewSize(WebcamResolution.VGA.getSize());
        final JFrame window = new JFrame("CAPTURA");
        WebcamPanel panel = new WebcamPanel(webcam);
        panel.setFPSDisplayed(true);
        panel.setDisplayDebugInfo(true);
        panel.setImageSizeDisplayed(true);
        panel.setMirrored(true);

        JButton boton = new JButton();
        boton.setText("Capturar");
        boton.addActionListener(new java.awt.event.ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                    WebcamUtils.capture(webcam, "foto1", ImageUtils.FORMAT_JPG);
                    fotoBytes = WebcamUtils.getImageBytes(webcam, "jpg");
                    txtFotografia.setText("FOTOGRAFIA CAPTURADA");
                    webcam.close();
                    window.dispose();
            }
        });
        window.add(boton, BorderLayout.NORTH);
        window.add(panel, BorderLayout.CENTER);
        window.setResizable(true);
        window.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        window.pack();
        window.setVisible(true);*/
    }//GEN-LAST:event_abrirCamara

    private void nuevoRegistro(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_nuevoRegistro
        limpiar(evt);
        lblFoto.setIcon(null);
        this.idJugador = 0;
        lblEditando.setVisible(false);
        limpiarTabla(tblHistorico);
        tblHistorico.setEnabled(false);
    }//GEN-LAST:event_nuevoRegistro

    private boolean jugadorValido() {
        if (!datoValido(txtNombre.getText())) {
            agregarMensajeAdvertencia("El nombre es requerido");
            txtNombre.requestFocus();
            return false;
        }
        if (!datoValido(txtPaterno.getText())) {
            agregarMensajeAdvertencia("El Apellido Paterno es requerido");
            txtPaterno.requestFocus();
            return false;
        }
        if (!datoValido(txtMaterno.getText())) {
            agregarMensajeAdvertencia("El Apellido Materno es requerido");
            txtMaterno.requestFocus();
            return false;
        }
        if (!datoValido(txtLugar.getText())) {
            agregarMensajeAdvertencia("El Lugar de Procedencia es requerido");
            txtLugar.requestFocus();
            return false;
        }
        if (!datoValido(txtFechaNac.getText())) {
            agregarMensajeAdvertencia("La fecha de Nacimiento es requerida");
            txtFechaNac.requestFocus();
            return false;
        } else if (txtFechaNac.getText().length() != 10) {
            agregarMensajeAdvertencia("La Fecha de Nacimiento tiene un formato incorrecto");
            txtFechaNac.requestFocus();;
            return false;
        }

        try {
            Date fn = sdf.parse(txtFechaNac.getText());
            if (fn.after(fechaActual)) {
                agregarMensajeAdvertencia("La Fecha de Nacimiento no debe ser mayo a la fecha actual");
                txtFechaNac.requestFocus();
                return false;
            }
        } catch (ParseException dfe) {
            agregarMensajeAdvertencia("La Fecha de Nacimiento tiene un formato incorrecto");
            txtFechaNac.requestFocus();
            return false;
        }
        if (!datoValido(txtFechaReg.getText())) {
            agregarMensajeAdvertencia("La Fecha de Registro es requerida");
            txtFechaReg.requestFocus();
            return false;
        } else if (txtFechaReg.getText().length() != 10) {
            agregarMensajeAdvertencia("La Fecha de Registro tiene un formato incorrecto");
            txtFechaReg.requestFocus();
            return false;
        }
        try {
            Date fr = sdf.parse(txtFechaReg.getText());
            if (fr.after(fechaActual)) {
                agregarMensajeAdvertencia("La Fecha de Registro no puede ser mayor a la fecha actual");
                txtFechaReg.requestFocus();
                return false;
            }
        } catch (ParseException pe) {
            agregarMensajeAdvertencia("La Fecha de Registro tiene un formato incorrecto");
            txtFechaReg.requestFocus();
            return false;
        }
        return true;
    }

    private boolean datoValido(String dato) {
        return dato != null && !dato.trim().isEmpty();
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCamara;
    private javax.swing.JButton btnNuevo;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JTable jTable1;
    private javax.swing.JLabel lblEditando;
    private javax.swing.JLabel lblFoto;
    private javax.swing.JTable tblHistorico;
    private javax.swing.JTextField txtFechaNac;
    private javax.swing.JTextField txtFechaReg;
    private javax.swing.JTextField txtFotografia;
    private javax.swing.JTextField txtLugar;
    private javax.swing.JTextField txtMaterno;
    private javax.swing.JTextField txtNombre;
    private javax.swing.JTextField txtPaterno;
    // End of variables declaration//GEN-END:variables

    private class WebCamViewer implements Runnable, WebcamListener, WindowListener, Thread.UncaughtExceptionHandler, ItemListener, WebcamDiscoveryListener {

    private Webcam webcam = null;
    private WebcamPanel panel = null;
    private WebcamPicker picker = null;
    private JFrame window = null;

    @Override
    public void run() {

        window = new JFrame("CAPTURA");

        Webcam.addDiscoveryListener(this);

        window.setTitle("FOTOGRAFIA");
        window.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        window.setLayout(new BorderLayout());

        window.addWindowListener(this);

        picker = new WebcamPicker();
        picker.addItemListener(this);

        webcam = picker.getSelectedWebcam();

        if (webcam == null) {
            agregarMensajeError("No se detectaron cámaras...");
            System.exit(1);
        }

        webcam.setViewSize(WebcamResolution.VGA.getSize());
        webcam.addWebcamListener(WebCamViewer.this);

        panel = new WebcamPanel(webcam, false);
        panel.setFPSDisplayed(true);

        JButton boton = new JButton();
        boton.setText("Capturar");
        boton.addActionListener(new java.awt.event.ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                WebcamUtils.capture(webcam, "foto1", ImageUtils.FORMAT_JPG);
                fotoBytes = WebcamUtils.getImageBytes(webcam, "jpg");
                txtFotografia.setText("FOTOGRAFIA CAPTURADA");
                BufferedImage img = scaleImage(120, 65, fotoBytes);
                lblFoto.setIcon(new ImageIcon((Image) img));
                webcam.close();
                window.dispose();
            }
        });

        window.add(picker, BorderLayout.NORTH);
        window.add(panel, BorderLayout.CENTER);
        window.add(boton, BorderLayout.SOUTH);

        window.pack();
        window.setVisible(true);

        Thread t = new Thread() {

            @Override
            public void run() {
                panel.start();
            }
        };
        t.setName("example-starter");
        t.setDaemon(true);
        t.setUncaughtExceptionHandler(this);
        t.start();
    }

    @Override
    public void webcamOpen(WebcamEvent we) {
        System.out.println("webcam open");
    }

    @Override
    public void webcamClosed(WebcamEvent we) {
        System.out.println("webcam closed");
    }

    @Override
    public void webcamDisposed(WebcamEvent we) {
        System.out.println("webcam disposed");
    }

    @Override
    public void webcamImageObtained(WebcamEvent we) {
        // do nothing
    }

    @Override
    public void windowActivated(WindowEvent e) {
    }

    @Override
    public void windowClosed(WindowEvent e) {
        webcam.close();
    }

    @Override
    public void windowClosing(WindowEvent e) {
    }

    @Override
    public void windowOpened(WindowEvent e) {
    }

    @Override
    public void windowDeactivated(WindowEvent e) {
    }

    @Override
    public void windowDeiconified(WindowEvent e) {
        System.out.println("webcam viewer resumed");
        panel.resume();
    }

    @Override
    public void windowIconified(WindowEvent e) {
        System.out.println("webcam viewer paused");
        panel.pause();
    }

    @Override
    public void uncaughtException(Thread t, Throwable e) {
        System.err.println(String.format("Exception in thread %s", t.getName()));
        e.printStackTrace();
    }

    @Override
    public void itemStateChanged(ItemEvent e) {
        if (e.getItem() != webcam) {
            if (webcam != null) {

                panel.stop();

                window.remove(panel);

                webcam.removeWebcamListener(this);
                webcam.close();

                webcam = (Webcam) e.getItem();
                webcam.setViewSize(WebcamResolution.VGA.getSize());
                webcam.addWebcamListener(this);

                System.out.println("cámara seleccionada " + webcam.getName());

                panel = new WebcamPanel(webcam, false);
                panel.setFPSDisplayed(true);

                window.add(panel, BorderLayout.CENTER);
                window.pack();

                Thread t = new Thread() {

                    @Override
                    public void run() {
                        panel.start();
                    }
                };
                t.setName("example-stoper");
                t.setDaemon(true);
                t.setUncaughtExceptionHandler(this);
                t.start();
            }
        }
    }

    @Override
    public void webcamFound(WebcamDiscoveryEvent event) {
        if (picker != null) {
            picker.addItem(event.getWebcam());
        }
    }

    @Override
    public void webcamGone(WebcamDiscoveryEvent event) {
        if (picker != null) {
            picker.removeItem(event.getWebcam());
        }
    }
    
    
}
}
