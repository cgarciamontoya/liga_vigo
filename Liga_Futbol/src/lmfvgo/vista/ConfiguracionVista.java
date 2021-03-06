/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lmfvgo.vista;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Connection;
import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.filechooser.FileSystemView;
import lmfvgo.db.ConfiguracionDAO;
import lmfvgo.excepciones.LMFVGOException;
import lmfvgo.modelo.Configuracion;

/**
 *
 * @author desarrollo
 */
public class ConfiguracionVista extends FormBase {
    
    private static final int PICTURE_MAX_SIZE = 200500;
    private static final long serialVersionUID = 4235684075125932638L;

    private final ConfiguracionDAO configuracionDAO;
    private Configuracion configuracion;
    /**
     * Creates new form ConfiguracionVista
     * @param con
     */
    public ConfiguracionVista(Connection con) {
        initComponents();
        configuracionDAO = new ConfiguracionDAO(con);
        configuracion = configuracionDAO.consultaConfiguracion();
        if (configuracion != null) {
            cboEquipos.setSelectedItem(String.valueOf(configuracion.getEquiposCalifican()));
            if (configuracion.getEscudo()!= null && configuracion.getEscudo().length > 0) {
                BufferedImage esc = scaleImage(300, 187, configuracion.getEscudo());
                lblEscudo.setIcon(new ImageIcon((Image) esc));
            }
            if (configuracion.getLogo()!= null && configuracion.getLogo().length > 0) {
                BufferedImage logo = scaleImage(300, 187, configuracion.getLogo());
                lblLogo.setIcon(new ImageIcon((Image) logo));
            }
        } else {
            configuracion = new Configuracion();
        }
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
            return null;
        }
        return bi;
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        lblEscudo = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        txtEscudo = new javax.swing.JTextField();
        btnEscudo = new javax.swing.JButton();
        btnGuardar = new javax.swing.JButton();
        cboEquipos = new javax.swing.JComboBox<>();
        jLabel5 = new javax.swing.JLabel();
        lblLogo = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        txtLogo = new javax.swing.JTextField();
        btnLogo = new javax.swing.JButton();

        setClosable(true);
        setTitle("CONFIGURACION");

        jLabel3.setText("Equipos Califican:");

        jLabel4.setText("Escudo:");

        lblEscudo.setText("ESCUDO");

        jLabel6.setText("Cargar:");

        txtEscudo.setEditable(false);

        btnEscudo.setText("Cargar Escudo");
        btnEscudo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cargarEscudo(evt);
            }
        });

        btnGuardar.setText("Guardar");
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                guardarCambios(evt);
            }
        });

        cboEquipos.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "4", "6", "8" }));

        jLabel5.setText("Logo:");

        lblLogo.setText("LOGO");

        jLabel7.setText("Cargar:");

        txtLogo.setEditable(false);

        btnLogo.setText("Cargar Logo");
        btnLogo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cargarLogo(evt);
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
                        .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(lblLogo, javax.swing.GroupLayout.PREFERRED_SIZE, 301, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                .addGroup(layout.createSequentialGroup()
                                    .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                    .addComponent(txtLogo, javax.swing.GroupLayout.PREFERRED_SIZE, 300, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addComponent(btnLogo, javax.swing.GroupLayout.Alignment.TRAILING))
                            .addComponent(btnGuardar, javax.swing.GroupLayout.Alignment.TRAILING)))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(lblEscudo, javax.swing.GroupLayout.PREFERRED_SIZE, 301, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(txtEscudo, javax.swing.GroupLayout.PREFERRED_SIZE, 300, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(btnEscudo, javax.swing.GroupLayout.Alignment.TRAILING)))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 105, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(cboEquipos, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(cboEquipos, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(10, 10, 10)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel6)
                            .addComponent(txtEscudo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnEscudo))
                    .addComponent(lblEscudo, javax.swing.GroupLayout.PREFERRED_SIZE, 187, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel7)
                            .addComponent(txtLogo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnLogo)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnGuardar))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lblLogo, javax.swing.GroupLayout.PREFERRED_SIZE, 187, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel5))
                        .addGap(0, 20, Short.MAX_VALUE)))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void cargarEscudo(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cargarEscudo
        final JFileChooser jfc = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
        jfc.setFileFilter(new FileNameExtensionFilter("Imagen", "jpg"));
        int retval = jfc.showOpenDialog(this);
        if (retval == JFileChooser.APPROVE_OPTION) {
            File archivo = jfc.getSelectedFile();
            txtEscudo.setText(archivo.getAbsolutePath());
        }
    }//GEN-LAST:event_cargarEscudo

    private void guardarCambios(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_guardarCambios
        try {
            configuracion.setEquiposCalifican(Integer.parseInt(cboEquipos.getSelectedItem().toString()));
            if (txtEscudo.getText() != null && !txtEscudo.getText().trim().isEmpty()) {
                File foto = new File(txtEscudo.getText());
                if (foto.isFile()) {
                    if (foto.length() > PICTURE_MAX_SIZE) {
                        agregarMensajeAdvertencia("El tamaño del Escudo debe ser menor a 200KB");
                        return;
                    }
                    try {
                        configuracion.setEscudo(Files.readAllBytes(foto.toPath()));
                    } catch (IOException ex) {

                    }
                }
            }
            if (txtLogo.getText() != null && !txtLogo.getText().trim().isEmpty()) {
                File foto = new File(txtLogo.getText());
                if (foto.isFile()) {
                    if (foto.length() > PICTURE_MAX_SIZE) {
                        agregarMensajeAdvertencia("El tamaño del Logo debe ser menor a 200KB");
                        return;
                    }
                    try {
                        configuracion.setLogo(Files.readAllBytes(foto.toPath()));
                    } catch (IOException ex) {

                    }
                }
            }
            if (configuracion != null && configuracion.getId() > 0) {
                configuracionDAO.actualizar(configuracion);
                agregarMensajeExito("La configuración fue actualizada correctamente");
            } else {
                configuracionDAO.guardar(configuracion);
                agregarMensajeExito("La configuración fue guardada correctamente");
            }
        } catch (LMFVGOException ex) {
            agregarMensajeError(ex.getMessage());
        }
    }//GEN-LAST:event_guardarCambios

    private void cargarLogo(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cargarLogo
        final JFileChooser jfc = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());
        jfc.setFileFilter(new FileNameExtensionFilter("Imagen", "jpg"));
        int retval = jfc.showOpenDialog(this);
        if (retval == JFileChooser.APPROVE_OPTION) {
            File archivo = jfc.getSelectedFile();
            txtLogo.setText(archivo.getAbsolutePath());
        }
    }//GEN-LAST:event_cargarLogo


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnEscudo;
    private javax.swing.JButton btnGuardar;
    private javax.swing.JButton btnLogo;
    private javax.swing.JComboBox<String> cboEquipos;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel lblEscudo;
    private javax.swing.JLabel lblLogo;
    private javax.swing.JTextField txtEscudo;
    private javax.swing.JTextField txtLogo;
    // End of variables declaration//GEN-END:variables
}
