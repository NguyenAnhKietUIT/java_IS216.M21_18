package View;

import Process.CompanyDao;
import Process.Complete;
import Process.CompleteDao;
import Process.EvaluateDao;
import Process.MessageDialog;
import Process.SharedData;
import java.util.List;
import java.util.Properties;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author acer
 */
public class CompleteInterview extends javax.swing.JFrame {

    /**
     * Creates new form CompleteInterview
     */
    private DefaultTableModel model;
    private int maApp, maITS;
    private String destinationmail;

    public CompleteInterview() {
        initComponents();
        setLocationRelativeTo(null);
        setResizable(false);

        model = (DefaultTableModel) tblCOMPLETE.getModel();
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
        tblCOMPLETE = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        jLabel1.setText("DANH SÁCH ỨNG VIÊN");

        tblCOMPLETE.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        tblCOMPLETE.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Mã ứng viên", "Tên ứng viên", "Số điện thoại", "Gmail", "Vị trí phỏng vấn", "Mã lịch phỏng vấn"
            }
        ));
        tblCOMPLETE.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblCOMPLETEMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblCOMPLETE);

        jButton1.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jButton1.setText("Xem ứng viên");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jButton2.setText("Đánh giá ứng viên");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jButton3.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jButton3.setText("Nhận vào làm");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jButton4.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jButton4.setText("Quay lại");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jScrollPane1))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(269, 269, 269)
                        .addComponent(jLabel1)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
            .addGroup(layout.createSequentialGroup()
                .addContainerGap(49, Short.MAX_VALUE)
                .addComponent(jButton1)
                .addGap(55, 55, 55)
                .addComponent(jButton2)
                .addGap(54, 54, 54)
                .addComponent(jButton3)
                .addGap(60, 60, 60)
                .addComponent(jButton4)
                .addGap(47, 47, 47))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 301, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(29, 29, 29)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButton1)
                    .addComponent(jButton2)
                    .addComponent(jButton3)
                    .addComponent(jButton4))
                .addContainerGap(29, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void tblCOMPLETEMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblCOMPLETEMouseClicked
        // TODO add your handling code here:
        int row = tblCOMPLETE.getSelectedRow();

        if (row >= 0) {
            int idApp = (int) tblCOMPLETE.getValueAt(row, 0);
            maApp = idApp;

            int idITS = (int) tblCOMPLETE.getValueAt(row, 5);
            maITS = idITS;

            String mailreceive = (String) tblCOMPLETE.getValueAt(row, 3);
            destinationmail = mailreceive;
        }
    }//GEN-LAST:event_tblCOMPLETEMouseClicked

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        SeeCandidate dialog = new SeeCandidate(new javax.swing.JFrame(), true, maApp);
        dialog.setVisible(true);
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
        EvaluateDao dao = new EvaluateDao();
        try {
            if (dao.isEvaluateAPL(maApp, maITS)) {
                HaveEvaluateAPL dialog = new HaveEvaluateAPL(new javax.swing.JFrame(), true, maApp, maITS);
                dialog.setVisible(true);
            } else {
                NotEvaluateAPL dialog = new NotEvaluateAPL(new javax.swing.JFrame(), true, maApp, maITS);
                dialog.setVisible(true);
            }
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
        }
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // TODO add your handling code here:
        try {
            CompleteDao dao = new CompleteDao();

            if (dao.confirmedToWork(maApp, maITS)) {
                MessageDialog.showMessageDialog(this, "Xác nhận thành công!", "Thông báo");
            } else {
                MessageDialog.showConfirmDialog(this, "Xác nhận thất bại!", "Thông báo");
            }
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
        }
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        // TODO add your handling code here:
        CompanyFrame cf = new CompanyFrame();
        cf.setVisible(true);
        dispose();
    }//GEN-LAST:event_jButton4ActionPerformed

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
            java.util.logging.Logger.getLogger(CompleteInterview.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(CompleteInterview.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(CompleteInterview.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(CompleteInterview.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new CompleteInterview().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblCOMPLETE;
    // End of variables declaration//GEN-END:variables

    private void LoadData() {
        try {
            CompleteDao dao = new CompleteDao();
            List<Complete> list = dao.findComplete();
            model.setRowCount(0);
            for (Complete x : list) {
                model.addRow(new Object[]{
                    x.getAPPLICANTNO(), x.getAPPLICANTNAME(), x.getPHONENUMBER(),
                    x.getGMAIL(), x.getPOSITIONNAME(), x.getINTERVIEWSCHEDULENO()});
            }
            model.fireTableDataChanged();
            tblCOMPLETE.setModel(model);
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
        }
    }
}
