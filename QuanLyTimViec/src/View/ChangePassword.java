package View;

import Process.Account;
import Process.AccountDao;
import Process.DataValidator;
import Process.MessageDialog;
import Process.SharedData;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author acer
 */
public class ChangePassword extends javax.swing.JFrame {

    /**
     * Creates new form ChangePassword
     */
    public ChangePassword() {
        initComponents();
        setLocationRelativeTo(null);
        setResizable(false);
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
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        txtNEWPASSWORD = new javax.swing.JPasswordField();
        txtCONFIRM = new javax.swing.JPasswordField();
        jLabel2 = new javax.swing.JLabel();
        txtPASSWORD = new javax.swing.JPasswordField();
        btnChange = new javax.swing.JButton();
        btnUNDO = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        jLabel1.setText("ĐỔI MẬT KHẨU");

        jLabel10.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel10.setText("Mật khẩu:");

        jLabel11.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel11.setText("Xác nhận mật khẩu:");

        jLabel2.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel2.setText("Mật khẩu hiện tại:");

        btnChange.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btnChange.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resource/icons8_password_reset_16px.png"))); // NOI18N
        btnChange.setText("Đổi mật khẩu");
        btnChange.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnChangeActionPerformed(evt);
            }
        });

        btnUNDO.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btnUNDO.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resource/icons8_undo_16px.png"))); // NOI18N
        btnUNDO.setText("Quay lại");
        btnUNDO.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnUNDOActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(47, 47, 47)
                .addComponent(btnChange)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 107, Short.MAX_VALUE)
                .addComponent(btnUNDO)
                .addGap(48, 48, 48))
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(152, 152, 152)
                        .addComponent(jLabel1))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(21, 21, 21)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jLabel11, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jLabel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jLabel10, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(txtNEWPASSWORD)
                            .addComponent(txtCONFIRM)
                            .addComponent(txtPASSWORD, javax.swing.GroupLayout.DEFAULT_SIZE, 252, Short.MAX_VALUE))))
                .addGap(0, 0, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(31, 31, 31)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(txtPASSWORD, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(47, 47, 47)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel10)
                    .addComponent(txtNEWPASSWORD, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(49, 49, 49)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel11)
                    .addComponent(txtCONFIRM, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(42, 42, 42)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnChange)
                    .addComponent(btnUNDO))
                .addContainerGap(34, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnChangeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnChangeActionPerformed
        // TODO add your handling code here:
        AccountDao dao = new AccountDao();
        StringBuilder sb = new StringBuilder();
        DataValidator.validateEmpty(txtPASSWORD, sb, "Mật khẩu không được để trống!");
        DataValidator.validateEmpty(txtNEWPASSWORD, sb, "Mật khẩu mới không được để trống!");
        DataValidator.validateEmpty(txtCONFIRM, sb, "Bạn cần xác nhận mật khẩu!");

        if (sb.length() > 0) {
            MessageDialog.showErrorDialog(this, sb.toString(), "Lỗi");
            return;
        }

        String current = new String(txtPASSWORD.getPassword());
        String newpassword = new String(txtNEWPASSWORD.getPassword());
        String confirm = new String(txtCONFIRM.getPassword());

        try {
            if (!current.equals(dao.getPasswordByAccountID())) {
                MessageDialog.showErrorDialog(this, "Mật khẩu hiện tại không chính xác!", "Lỗi");
                return;
            } else if (newpassword.length() < 8) {
                MessageDialog.showErrorDialog(this, "Mật khẩu không thể ít hơn 8 ký tự!", "Lỗi");
                return;
            }
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
        }

        if (newpassword.equals(confirm)) {
            int choose = MessageDialog.showConfirmDialog(this, "Bạn có chắc muốn đổi mật khẩu?", "Hỏi");
            if (choose == JOptionPane.YES_OPTION) {
                try {
                    Account a = new Account();

                    a.setUSERNAME(SharedData.useraccount.getUSERNAME());
                    a.setPASSWORD(newpassword);
                    a.setROLE(SharedData.useraccount.getROLE());

                    if (dao.update(a)) {
                        MessageDialog.showMessageDialog(this, "Mật khẩu đã được thay đổi!", "Thông báo");
                    } else {
                        MessageDialog.showMessageDialog(this, "Cập nhật thất bại!", "Thông báo");
                    }
                } catch (Exception e) {
                    MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
                }
            }

        } else {
            MessageDialog.showErrorDialog(this, "Bạn đã nhập mật khẩu không trùng nhau!", "Lỗi");
        }
    }//GEN-LAST:event_btnChangeActionPerformed

    private void btnUNDOActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnUNDOActionPerformed
        // TODO add your handling code here:
        ApplicantFrame app = new ApplicantFrame();
        app.setVisible(true);
        dispose();
    }//GEN-LAST:event_btnUNDOActionPerformed

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
            java.util.logging.Logger.getLogger(ChangePassword.class
                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);

        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ChangePassword.class
                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);

        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ChangePassword.class
                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);

        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ChangePassword.class
                    .getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ChangePassword().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnChange;
    private javax.swing.JButton btnUNDO;
    private javax.swing.JButton btnUndo;
    private javax.swing.JButton btnUndo1;
    private javax.swing.JButton btnUndo2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPasswordField txtCONFIRM;
    private javax.swing.JPasswordField txtNEWPASSWORD;
    private javax.swing.JPasswordField txtPASSWORD;
    // End of variables declaration//GEN-END:variables
}