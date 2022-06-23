package View;

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
public class InformationInterviewer extends javax.swing.JFrame {

    /**
     * Creates new form InformationInterviewer
     */
    public InformationInterviewer() {
        initComponents();
        setLocationRelativeTo(null);
        setResizable(false);
        InThongTin();
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
        jButton1 = new javax.swing.JButton();
        btnUndo1 = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        lblINTERVIEWERNO = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        lblINTERVIEWERNAME = new javax.swing.JLabel();
        txtPHONENUMBER = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        txtGMAIL = new javax.swing.JTextField();
        lblCOMPANYNAME = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Dubai", 1, 24)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("RECRUITER'S PROFILE");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 10, -1, -1));

        jButton1.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jButton1.setText("Profile Update");
        jButton1.setPreferredSize(new java.awt.Dimension(120, 30));
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 300, -1, -1));

        btnUndo1.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btnUndo1.setText("Back");
        btnUndo1.setPreferredSize(new java.awt.Dimension(72, 30));
        btnUndo1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnUndo1ActionPerformed(evt);
            }
        });
        getContentPane().add(btnUndo1, new org.netbeans.lib.awtextra.AbsoluteConstraints(270, 300, -1, -1));

        jLabel2.setFont(new java.awt.Font("Dubai", 1, 16)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("Recruiter ID");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 70, 130, -1));

        lblINTERVIEWERNO.setFont(new java.awt.Font("Segoe UI", 0, 16)); // NOI18N
        lblINTERVIEWERNO.setForeground(new java.awt.Color(255, 255, 255));
        lblINTERVIEWERNO.setText("jLabel3");
        getContentPane().add(lblINTERVIEWERNO, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 70, 220, -1));

        jLabel4.setFont(new java.awt.Font("Dubai", 1, 16)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("Name");
        getContentPane().add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 110, -1, -1));

        lblINTERVIEWERNAME.setFont(new java.awt.Font("Segoe UI", 0, 16)); // NOI18N
        lblINTERVIEWERNAME.setForeground(new java.awt.Color(255, 255, 255));
        lblINTERVIEWERNAME.setText("jLabel5");
        getContentPane().add(lblINTERVIEWERNAME, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 110, 220, -1));

        txtPHONENUMBER.setFont(new java.awt.Font("Segoe UI", 0, 16)); // NOI18N
        getContentPane().add(txtPHONENUMBER, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 150, 220, -1));

        jLabel6.setFont(new java.awt.Font("Dubai", 1, 16)); // NOI18N
        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setText("Phone Number");
        getContentPane().add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 150, 130, -1));

        jLabel7.setFont(new java.awt.Font("Dubai", 1, 16)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(255, 255, 255));
        jLabel7.setText("Email");
        getContentPane().add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 200, 130, -1));

        txtGMAIL.setFont(new java.awt.Font("Segoe UI", 0, 16)); // NOI18N
        getContentPane().add(txtGMAIL, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 200, 220, -1));

        lblCOMPANYNAME.setFont(new java.awt.Font("Segoe UI", 0, 16)); // NOI18N
        lblCOMPANYNAME.setForeground(new java.awt.Color(255, 255, 255));
        lblCOMPANYNAME.setText("jLabel9");
        getContentPane().add(lblCOMPANYNAME, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 240, 220, -1));

        jLabel8.setFont(new java.awt.Font("Dubai", 1, 16)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(255, 255, 255));
        jLabel8.setText("Company's name");
        getContentPane().add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 240, 130, -1));

        jLabel3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resource/profilebg.png"))); // NOI18N
        getContentPane().add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 420, 360));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        StringBuilder sb = new StringBuilder();
        if (txtPHONENUMBER.getText().equals("")) {
            MessageDialog.showErrorDialog(this, "Số điện thoại không được để trống!", "Lỗi");
            return;
        } else if (!txtPHONENUMBER.getText().matches("\\d+")) {
            MessageDialog.showErrorDialog(this, "Số điện thoại chỉ có thể là dãy số!", "Lỗi");
            return;
        } else if (txtPHONENUMBER.getText().length() != 10) {
            MessageDialog.showErrorDialog(this, "Số điện thoại phải có đúng 10 chữ số!", "Lỗi");
            return;
        } else if (txtGMAIL.getText().equals("")) {
            MessageDialog.showErrorDialog(this, "Gmail không được để trống!", "Lỗi");
            return;
        }

        DataValidator.validateGmail(txtGMAIL, sb, "Gmail phải có định dạng XXX@gmail.com");

        if (sb.length() > 0) {
            MessageDialog.showErrorDialog(this, sb.toString(), "Lỗi");
            return;
        }

        int choose = MessageDialog.showConfirmDialog(this, "Bạn có chắc muốn cập nhật thông tin?", "Hỏi");
        if (choose == JOptionPane.YES_OPTION) {
            try {
                Interviewer i = new Interviewer();
                InterviewerDao dao = new InterviewerDao();
                CompanyDao cdao = new CompanyDao();
                int companyno = cdao.getCompanyNoByCompanyName(lblCOMPANYNAME.getText());

                i.setINTERVIEWERNAME(lblINTERVIEWERNAME.getText());
                i.setPHONENUMBER(txtPHONENUMBER.getText());
                i.setGMAIL(txtGMAIL.getText());
                i.setCOMPANYNO(companyno);

                if (dao.update(i)) {
                    MessageDialog.showMessageDialog(this, "Cập nhật thành công!", "Thông báo");
                } else {
                    MessageDialog.showConfirmDialog(this, "Cập nhật thất bại!", "Thông báo");
                }
            } catch (Exception e) {
                MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
            }
        }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void btnUndo1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnUndo1ActionPerformed
        // TODO add your handling code here:
        InterviewerFrame i = new InterviewerFrame();
        i.setVisible(true);
        dispose();
    }//GEN-LAST:event_btnUndo1ActionPerformed

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
            java.util.logging.Logger.getLogger(InformationInterviewer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(InformationInterviewer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(InformationInterviewer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(InformationInterviewer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new InformationInterviewer().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnUndo1;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel lblCOMPANYNAME;
    private javax.swing.JLabel lblINTERVIEWERNAME;
    private javax.swing.JLabel lblINTERVIEWERNO;
    private javax.swing.JTextField txtGMAIL;
    private javax.swing.JTextField txtPHONENUMBER;
    // End of variables declaration//GEN-END:variables

    private void InThongTin() {
        Interviewer i = new Interviewer();
        InterviewerDao idao = new InterviewerDao();
        CompanyDao cdao = new CompanyDao();
        String companyName = null;

        try {
            i = idao.getInformationByAccountID();
            companyName = cdao.getCompanyNameByCompanyNo(i.getCOMPANYNO());
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
        }

        lblINTERVIEWERNO.setText(String.valueOf(i.getINTERVIEWERNO()));
        lblINTERVIEWERNAME.setText(i.getINTERVIEWERNAME());
        txtPHONENUMBER.setText(i.getPHONENUMBER());
        txtGMAIL.setText(i.getGMAIL());
        lblCOMPANYNAME.setText(String.valueOf(companyName));
    }
}
