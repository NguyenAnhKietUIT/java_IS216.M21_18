package View;

import Process.MessageDialog;
import Process.Recruit;
import Process.RecruitDao;
import java.util.List;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author acer
 */
public class SearchJob extends javax.swing.JFrame {

    /**
     * Creates new form SearchJob
     */
    private String tencty;
    private String tenpban;
    private String tenvt;
    private int soLuong;

    private DefaultTableModel model;

    public SearchJob() {
        initComponents();
        setLocationRelativeTo(null);
        setResizable(false);

        model = (DefaultTableModel) tblTKCV.getModel();
        LoadData();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jToggleButton1 = new javax.swing.JToggleButton();
        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblTKCV = new javax.swing.JTable();
        txtFIND = new javax.swing.JTextField();
        btnFind = new javax.swing.JButton();
        btnRefresh = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();

        jToggleButton1.setText("jToggleButton1");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Dialog", 1, 30)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("Find A Job");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(260, 10, -1, -1));

        tblTKCV.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        tblTKCV.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Company", "Department", "Position", "Number Of Vacancies"
            }
        ));
        tblTKCV.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblTKCVMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblTKCV);

        getContentPane().add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(14, 127, 660, 267));

        txtFIND.setFont(new java.awt.Font("Segoe UI", 0, 16)); // NOI18N
        txtFIND.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtFINDActionPerformed(evt);
            }
        });
        getContentPane().add(txtFIND, new org.netbeans.lib.awtextra.AbsoluteConstraints(206, 68, 195, -1));

        btnFind.setFont(new java.awt.Font("Dubai", 0, 14)); // NOI18N
        btnFind.setText("Search");
        btnFind.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnFindActionPerformed(evt);
            }
        });
        getContentPane().add(btnFind, new org.netbeans.lib.awtextra.AbsoluteConstraints(419, 68, -1, -1));

        btnRefresh.setFont(new java.awt.Font("Dubai", 0, 14)); // NOI18N
        btnRefresh.setText("Refresh");
        btnRefresh.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRefreshActionPerformed(evt);
            }
        });
        getContentPane().add(btnRefresh, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 420, -1, -1));

        jButton1.setFont(new java.awt.Font("Dubai", 0, 14)); // NOI18N
        jButton1.setText("Register");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(300, 420, -1, -1));

        jButton3.setFont(new java.awt.Font("Dubai", 0, 14)); // NOI18N
        jButton3.setText("Back");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton3, new org.netbeans.lib.awtextra.AbsoluteConstraints(540, 420, -1, -1));

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resource/profilebg2.png"))); // NOI18N
        jLabel2.setText("jLabel2");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 690, 500));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void tblTKCVMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblTKCVMouseClicked
        // TODO add your handling code here:
        int row = tblTKCV.getSelectedRow();

        if (row >= 0) {
            String companyname = (String) tblTKCV.getValueAt(row, 0);
            tencty = companyname;

            String departmentname = (String) tblTKCV.getValueAt(row, 1);
            tenpban = departmentname;

            String positionname = (String) tblTKCV.getValueAt(row, 2);
            tenvt = positionname;

            int num = (int) tblTKCV.getValueAt(row, 3);
            soLuong = num;
        }
    }//GEN-LAST:event_tblTKCVMouseClicked

    private void btnFindActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnFindActionPerformed
        // TODO add your handling code here:
        FindData();
    }//GEN-LAST:event_btnFindActionPerformed

    private void btnRefreshActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRefreshActionPerformed
        // TODO add your handling code here:
        txtFIND.setText("");
        LoadData();
    }//GEN-LAST:event_btnRefreshActionPerformed

    private void txtFINDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtFINDActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtFINDActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        if (soLuong > 0) {
            RegisterSchedule rs = new RegisterSchedule(tencty, tenpban, tenvt);
            rs.setVisible(true);
            dispose();
        } else {
            MessageDialog.showErrorDialog(this, "Công ty hiện đang không cần tuyển nhân viên!", "Lỗi");
        }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // TODO add your handling code here:
        ApplicantFrame app = new ApplicantFrame();
        app.setVisible(true);
        dispose();
    }//GEN-LAST:event_jButton3ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(SearchJob.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(SearchJob.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(SearchJob.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(SearchJob.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new SearchJob().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnFind;
    private javax.swing.JButton btnRefresh;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton3;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JToggleButton jToggleButton1;
    private javax.swing.JTable tblTKCV;
    private javax.swing.JTextField txtFIND;
    // End of variables declaration//GEN-END:variables

    private void LoadData() {
        try {
            RecruitDao dao = new RecruitDao();
            List<Recruit> list = dao.findAll();
            sortByName(list);
            model.setRowCount(0);
            for (Recruit x : list) {
                model.addRow(new Object[]{
                    x.getC().getCOMPANYNAME(), x.getD().getDEPARTMENTNAME(),
                    x.getP().getPOSITIONNAME(), x.getNUMBEROFPERSONNEL()});
            }
            model.fireTableDataChanged();
            tblTKCV.setModel(model);
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
        }
    }

    private void FindData() {
        try {
            RecruitDao dao = new RecruitDao();
            List<Recruit> list = dao.findAll();
            sortByName(list);
            model.setRowCount(0);
            for (Recruit x : list) {
                if (x.getC().getCOMPANYNAME().equals(txtFIND.getText())
                        || x.getP().getPOSITIONNAME().equals(txtFIND.getText())) {
                    model.addRow(new Object[]{
                        x.getC().getCOMPANYNAME(), x.getD().getDEPARTMENTNAME(),
                        x.getP().getPOSITIONNAME(), x.getNUMBEROFPERSONNEL()});
                }
            }
            model.fireTableDataChanged();
            tblTKCV.setModel(model);
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
        }
    }

    private void sortByName(List<Recruit> list) {
        list.sort((o1, o2) -> {
            String name1 = o1.getC().getCOMPANYNAME().trim();
            String name2 = o2.getC().getCOMPANYNAME().trim();
            return name1.compareTo(name2);
        });
    }
}
