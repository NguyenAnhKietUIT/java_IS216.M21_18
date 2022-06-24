package View;

import Process.Account;
import Process.AccountDao;
import Process.CompanyDao;
import Process.DataValidator;
import Process.Interviewer;
import Process.InterviewerDao;
import Process.MessageDialog;
import javax.swing.JOptionPane;

/**
 *
 * @author acer
 */
public class RegisterInterviewer extends javax.swing.JFrame {

    /**
     * Creates new form RegisterInterviewer
     */
    public RegisterInterviewer() {
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

        jLabel2 = new javax.swing.JLabel();
        txtINTERVIEWERNAME = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        txtPHONENUMBER = new javax.swing.JTextField();
        txtGMAIL = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        txtCOMPANYNAME = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        txtUSERNAME = new javax.swing.JTextField();
        txtPASSWORD = new javax.swing.JPasswordField();
        txtCONFIRM = new javax.swing.JPasswordField();
        btnRegister = new javax.swing.JButton();
        btnUndo = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setPreferredSize(new java.awt.Dimension(460, 620));
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel2.setFont(new java.awt.Font("Dubai", 0, 16)); // NOI18N
        jLabel2.setText("Full name");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 190, 124, -1));

        txtINTERVIEWERNAME.setFont(new java.awt.Font("Dubai", 0, 14)); // NOI18N
        txtINTERVIEWERNAME.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtINTERVIEWERNAMEActionPerformed(evt);
            }
        });
        getContentPane().add(txtINTERVIEWERNAME, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 190, 200, -1));

        jLabel3.setFont(new java.awt.Font("Dubai", 0, 16)); // NOI18N
        jLabel3.setText("Phone number");
        getContentPane().add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 240, 124, -1));

        txtPHONENUMBER.setFont(new java.awt.Font("Dubai", 0, 14)); // NOI18N
        getContentPane().add(txtPHONENUMBER, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 240, 200, -1));

        txtGMAIL.setFont(new java.awt.Font("Dubai", 0, 14)); // NOI18N
        getContentPane().add(txtGMAIL, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 290, 200, -1));

        jLabel4.setFont(new java.awt.Font("Dubai", 0, 16)); // NOI18N
        jLabel4.setText("Gmail");
        getContentPane().add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 290, 124, -1));

        jLabel5.setFont(new java.awt.Font("Dubai", 0, 16)); // NOI18N
        jLabel5.setText("Company name");
        getContentPane().add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 340, 124, -1));

        txtCOMPANYNAME.setFont(new java.awt.Font("Dubai", 0, 14)); // NOI18N
        txtCOMPANYNAME.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtCOMPANYNAMEActionPerformed(evt);
            }
        });
        getContentPane().add(txtCOMPANYNAME, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 340, 200, -1));

        jLabel9.setFont(new java.awt.Font("Dubai", 0, 16)); // NOI18N
        jLabel9.setText("Username");
        getContentPane().add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 390, 124, -1));

        jLabel10.setFont(new java.awt.Font("Dubai", 0, 16)); // NOI18N
        jLabel10.setText("Password");
        getContentPane().add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 440, 124, -1));

        jLabel11.setFont(new java.awt.Font("Dubai", 0, 16)); // NOI18N
        jLabel11.setText("Confirm password");
        getContentPane().add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(40, 490, -1, -1));

        txtUSERNAME.setFont(new java.awt.Font("Dubai", 0, 14)); // NOI18N
        getContentPane().add(txtUSERNAME, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 390, 200, -1));

        txtPASSWORD.setFont(new java.awt.Font("Dubai", 0, 14)); // NOI18N
        txtPASSWORD.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtPASSWORDActionPerformed(evt);
            }
        });
        getContentPane().add(txtPASSWORD, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 440, 200, -1));

        txtCONFIRM.setFont(new java.awt.Font("Dubai", 0, 14)); // NOI18N
        getContentPane().add(txtCONFIRM, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 490, 200, -1));

        btnRegister.setBackground(new java.awt.Color(79, 220, 194));
        btnRegister.setFont(new java.awt.Font("Dubai", 0, 14)); // NOI18N
        btnRegister.setForeground(new java.awt.Color(255, 255, 255));
        btnRegister.setText("Sign Up");
        btnRegister.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRegisterActionPerformed(evt);
            }
        });
        getContentPane().add(btnRegister, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 540, -1, -1));

        btnUndo.setBackground(new java.awt.Color(79, 220, 194));
        btnUndo.setFont(new java.awt.Font("Dubai", 0, 14)); // NOI18N
        btnUndo.setForeground(new java.awt.Color(255, 255, 255));
        btnUndo.setText("Back");
        btnUndo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnUndoActionPerformed(evt);
            }
        });
        getContentPane().add(btnUndo, new org.netbeans.lib.awtextra.AbsoluteConstraints(280, 540, -1, -1));

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resource/dangky2.png"))); // NOI18N
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 450, 620));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txtINTERVIEWERNAMEActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtINTERVIEWERNAMEActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtINTERVIEWERNAMEActionPerformed

    private void txtPASSWORDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtPASSWORDActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtPASSWORDActionPerformed

    private void btnUndoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnUndoActionPerformed
        // TODO add your handling code here:
        ChooseRole cr = new ChooseRole();
        cr.setVisible(true);
        dispose();
    }//GEN-LAST:event_btnUndoActionPerformed

    private void btnRegisterActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRegisterActionPerformed
        // TODO add your handling code here:
        StringBuilder sb = new StringBuilder();
        String password = new String(txtPASSWORD.getPassword());
        String confirm = new String(txtCONFIRM.getPassword());

        CompanyDao cdao = new CompanyDao();
        int companyno = 0;
        try {
            companyno = cdao.getCompanyNoByCompanyName(txtCOMPANYNAME.getText());
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
        }

        if (txtINTERVIEWERNAME.getText().equals("")) {
            MessageDialog.showErrorDialog(this, "Full name cannot be blank!", "Error");
            return;
        } else if (txtPHONENUMBER.getText().equals("")) {
            MessageDialog.showErrorDialog(this, "Phone number cannot be blank!", "Error");
            return;
        } else if (!txtPHONENUMBER.getText().matches("\\d+")) {
            MessageDialog.showErrorDialog(this, "Phone number are numberous only!", "Error");
            return;
        } else if (txtPHONENUMBER.getText().length() != 10) {
            MessageDialog.showErrorDialog(this, "Phone number must be exactly 10 numbers!", "Error");
            return;
        } else if (txtGMAIL.getText().equals("")) {
            MessageDialog.showErrorDialog(this, "Email cannot be blank!", "Error");
            return;
        } else if (txtCOMPANYNAME.getText().equals("")) {
            MessageDialog.showErrorDialog(this, "Company name cannot be blank!", "Error");
            return;
        } else if (!txtCOMPANYNAME.getText().equalsIgnoreCase("") && companyno == 0) {
            MessageDialog.showErrorDialog(this, "Company does not exist!", "Error");
            return;
        } else if (txtUSERNAME.getText().equals("")) {
            MessageDialog.showErrorDialog(this, "Username cannot be blank!", "Error");
            return;
        } else if (password.length() < 8) {
            MessageDialog.showErrorDialog(this, "Password cannot be less than 8 characters!", "Error");
            return;
        }

        DataValidator.validateEmpty(txtPASSWORD, sb, "Password cannot be blank!");
        DataValidator.validateEmpty(txtCONFIRM, sb, "You need to confirm password!");
        DataValidator.validateGmail(txtGMAIL, sb, "Email must be formatted XXX@gmail.com");

        if (sb.length() > 0) {
            MessageDialog.showErrorDialog(this, sb.toString(), "Error");
            return;
        }

        if (password.equals(confirm)) {
            int choose = MessageDialog.showConfirmDialog(this, "Do you want to create new account?", "Confirm");
            if (choose == JOptionPane.YES_OPTION) {
                try {
                    Account a = new Account();

                    a.setUSERNAME(txtUSERNAME.getText());
                    a.setPASSWORD(new String(txtPASSWORD.getPassword()));
                    a.setROLE("Nhà tuyển dụng");

                    AccountDao dao = new AccountDao();
                    if (dao.insert(a)) {
                        int accountid = dao.getAccountIDByUsername(a.getUSERNAME());

                        Interviewer i = new Interviewer();

                        i.setINTERVIEWERNAME(txtINTERVIEWERNAME.getText());
                        i.setPHONENUMBER(txtPHONENUMBER.getText());
                        i.setGMAIL(txtGMAIL.getText());
                        i.setCOMPANYNO(companyno);
                        i.setACCOUNTID(accountid);

                        InterviewerDao idao = new InterviewerDao();
                        if (idao.insert(i)) {
                            MessageDialog.showMessageDialog(this, "Created successfully!", "Notification");
                        } else {
                            MessageDialog.showConfirmDialog(this, "Create unsuccessfully!", "Notification");
                        }
                    } else {
                        MessageDialog.showConfirmDialog(this, "Create unsuccessfully!", "Notification");
                    }
                } catch (Exception e) {
                    MessageDialog.showErrorDialog(this, e.getMessage(), "Error");
                }
            }
        } else {
            MessageDialog.showErrorDialog(this, "Those passwords did not match. Try again!", "Error");
        }
    }//GEN-LAST:event_btnRegisterActionPerformed

    private void txtCOMPANYNAMEActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtCOMPANYNAMEActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtCOMPANYNAMEActionPerformed

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
            java.util.logging.Logger.getLogger(RegisterInterviewer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(RegisterInterviewer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(RegisterInterviewer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(RegisterInterviewer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new RegisterInterviewer().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnRegister;
    private javax.swing.JButton btnUndo;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JTextField txtCOMPANYNAME;
    private javax.swing.JPasswordField txtCONFIRM;
    private javax.swing.JTextField txtGMAIL;
    private javax.swing.JTextField txtINTERVIEWERNAME;
    private javax.swing.JPasswordField txtPASSWORD;
    private javax.swing.JTextField txtPHONENUMBER;
    private javax.swing.JTextField txtUSERNAME;
    // End of variables declaration//GEN-END:variables
}
