package View;

import Process.EvaluateDao;
import Process.FirstPair;
import Process.FirstPairDao;
import Process.MessageDialog;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author acer
 */
public class ApplicantSchedule extends javax.swing.JFrame {

    /**
     * Creates new form ApplicantSchedule
     */
    private int maITS;
    private String trangthai;

    private DefaultTableModel model;

    public ApplicantSchedule() {
        initComponents();
        setLocationRelativeTo(null);
        setResizable(false);

        model = (DefaultTableModel) tblLPV.getModel();
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

        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblLPV = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Dubai", 1, 28)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("INTERVIEWS SCHEDULE");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 20, -1, -1));

        tblLPV.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        tblLPV.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Interview ID", "Start Date", "End Date", "Location", "Position", "Status"
            }
        ));
        tblLPV.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblLPVMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblLPV);

        getContentPane().add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 80, 620, 310));

        jButton1.setFont(new java.awt.Font("Dubai", 0, 14)); // NOI18N
        jButton1.setText("Cancel Schedule");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(300, 430, -1, -1));

        jButton2.setFont(new java.awt.Font("Dubai", 0, 14)); // NOI18N
        jButton2.setText("Back");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton2, new org.netbeans.lib.awtextra.AbsoluteConstraints(510, 430, -1, -1));

        jButton3.setFont(new java.awt.Font("Dubai", 0, 14)); // NOI18N
        jButton3.setText("Rate Company");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton3, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 430, -1, -1));

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resource/profilebg2.png"))); // NOI18N
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 680, 500));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void tblLPVMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblLPVMouseClicked
        // TODO add your handling code here:
        int row = tblLPV.getSelectedRow();

        if (row >= 0) {
            int id = (int) tblLPV.getValueAt(row, 0);
            maITS = id;

            String status = (String) tblLPV.getValueAt(row, 5);
            trangthai = status;
        }
    }//GEN-LAST:event_tblLPVMouseClicked

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        int choose = MessageDialog.showConfirmDialog(this, "Bạn có chắc muốn hủy lịch?", "Hỏi");
        if (choose == JOptionPane.YES_OPTION) {
            try {
                FirstPairDao dao = new FirstPairDao();
                if (trangthai.equalsIgnoreCase("Đã đăng ký")) {
                    if (dao.cancel(maITS)) {
                        MessageDialog.showMessageDialog(this, "Đã hủy lịch!", "Thông báo");
                        LoadData();
                    } else {
                        MessageDialog.showConfirmDialog(this, "Hủy lịch thất bại!", "Thông báo");
                    }
                } else {
                    MessageDialog.showConfirmDialog(this, "Không thể hủy lịch!", "Thông báo");
                }
            } catch (Exception e) {
                MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
            }
        }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
        ApplicantFrame app = new ApplicantFrame();
        app.setVisible(true);
        dispose();
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // TODO add your handling code here:
        if (trangthai.equals("Đã hoàn thành")) {
            EvaluateDao dao = new EvaluateDao();

            try {
                int maCom = dao.getCompanynoByInterviewScheduleno(maITS);
                if (dao.isEvaluateCO(maCom, maITS)) {
                    HaveEvaluateCO dialog = new HaveEvaluateCO(new javax.swing.JFrame(), true, maCom, maITS);
                    dialog.setVisible(true);
                } else {
                    NotEvaluateCO dialog = new NotEvaluateCO(new javax.swing.JFrame(), true, maCom, maITS);
                    dialog.setVisible(true);
                }
            } catch (Exception e) {
                MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
            }
        } else {
            MessageDialog.showMessageDialog(this, "Bạn cần hoàn thành phỏng vấn", "Thông báo");
        }
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
            java.util.logging.Logger.getLogger(ApplicantSchedule.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ApplicantSchedule.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ApplicantSchedule.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ApplicantSchedule.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ApplicantSchedule().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblLPV;
    // End of variables declaration//GEN-END:variables

    private void LoadData() {
        try {
            FirstPairDao dao = new FirstPairDao();
            List<FirstPair> list = dao.findByAccountID();
            model.setRowCount(0);
            for (FirstPair x : list) {
                trangthai = switch (x.getIs().getSTATUS()) {
                    case 0 ->
                        "Registered";
                    case 1 ->
                        "Register Canceled";
                    case 2 ->
                        "Completed";
                    case 3 ->
                        "Absent";
                    default ->
                        "Offered";
                };
                model.addRow(new Object[]{
                    x.getIs().getINTERVIEWSCHEDULENO(), x.getIs().getSTARTTIME(),
                    x.getIs().getENDTIME(), x.getIs().getLOCATION(),
                    x.getP().getPOSITIONNAME(), trangthai});
            }
            model.fireTableDataChanged();
            tblLPV.setModel(model);
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
        }
    }
}
