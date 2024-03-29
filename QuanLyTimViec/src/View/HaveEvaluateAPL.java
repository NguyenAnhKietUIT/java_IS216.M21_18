package View;

import Process.Evaluate;
import Process.EvaluateDao;
import Process.MessageDialog;
import javax.swing.JOptionPane;

/**
 *
 * @author acer
 */
public class HaveEvaluateAPL extends javax.swing.JDialog {

    /**
     * Creates new form HaveEvaluateAPL
     */
    private int APPLICANTNO, INTERVIEWSCHEDULENO;

    /**
     * Creates new form HaveEvaluateAPL
     */
    public HaveEvaluateAPL(java.awt.Frame parent, boolean modal, int maApp, int maITS) {
        super(parent, modal);
        initComponents();
        setResizable(false);
        setLocationRelativeTo(null);

        APPLICANTNO = maApp;
        INTERVIEWSCHEDULENO = maITS;

        HienThi();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnAlt = new javax.swing.JButton();
        btnDlt = new javax.swing.JButton();
        jLabel5 = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        lblINTERVIEWSCHEDULE = new javax.swing.JLabel();
        lblAPPLICANTNO = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        txtMARK = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        txaCOMMENT = new javax.swing.JTextArea();
        jLabel4 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        btnAlt.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btnAlt.setText("Change");
        btnAlt.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAltActionPerformed(evt);
            }
        });
        getContentPane().add(btnAlt, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 350, -1, -1));

        btnDlt.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btnDlt.setText("Delete");
        btnDlt.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDltActionPerformed(evt);
            }
        });
        getContentPane().add(btnDlt, new org.netbeans.lib.awtextra.AbsoluteConstraints(300, 350, -1, -1));

        jLabel5.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(255, 255, 255));
        jLabel5.setText("Rate Candidate");
        getContentPane().add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 10, -1, -1));

        jLabel1.setFont(new java.awt.Font("Dubai", 1, 16)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("Interview ID");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 70, 129, -1));

        lblINTERVIEWSCHEDULE.setFont(new java.awt.Font("Segoe UI", 0, 16)); // NOI18N
        lblINTERVIEWSCHEDULE.setForeground(new java.awt.Color(255, 255, 255));
        lblINTERVIEWSCHEDULE.setText("jLabel6");
        getContentPane().add(lblINTERVIEWSCHEDULE, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 70, 250, -1));

        lblAPPLICANTNO.setFont(new java.awt.Font("Segoe UI", 0, 16)); // NOI18N
        lblAPPLICANTNO.setForeground(new java.awt.Color(255, 255, 255));
        lblAPPLICANTNO.setText("jLabel5");
        getContentPane().add(lblAPPLICANTNO, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 110, 250, -1));

        jLabel2.setFont(new java.awt.Font("Dubai", 1, 16)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("Candidate ID");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 110, 129, -1));

        jLabel3.setFont(new java.awt.Font("Dubai", 1, 16)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("Rating");
        getContentPane().add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 150, 129, -1));

        txtMARK.setFont(new java.awt.Font("Segoe UI", 0, 16)); // NOI18N
        getContentPane().add(txtMARK, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 150, 250, -1));

        txaCOMMENT.setColumns(20);
        txaCOMMENT.setFont(new java.awt.Font("Segoe UI", 0, 16)); // NOI18N
        txaCOMMENT.setRows(5);
        jScrollPane1.setViewportView(txaCOMMENT);

        getContentPane().add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 200, 250, -1));

        jLabel4.setFont(new java.awt.Font("Dubai", 1, 16)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("Review");
        getContentPane().add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 200, 129, -1));

        jLabel6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resource/profilebg.png"))); // NOI18N
        getContentPane().add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 440, 420));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnAltActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAltActionPerformed
        // TODO add your handling code here:
        int mark_apl = Integer.parseInt(txtMARK.getText());
        String comment_apl = txaCOMMENT.getText();
        EvaluateDao dao = new EvaluateDao();
        if (txtMARK.getText().equals("")) {
            MessageDialog.showErrorDialog(this, "Rating cannot be blank!", "Error");
            return;
        } else if (txtMARK.getText().length() > 0 && !txtMARK.getText().matches("\\d+")) {
            JOptionPane.showMessageDialog(this, "Rating are numberous only!");
            return;
        } else if (mark_apl < 1 || mark_apl > 5) {
            JOptionPane.showMessageDialog(this, "Rating can only be on the scale 1 - 5!");
            return;
        }

        try {
            Evaluate ev = new Evaluate(mark_apl, comment_apl);

            int choose = MessageDialog.showConfirmDialog(this, "Do you sure want to change rating?", "Confirm");
            if (choose == JOptionPane.YES_OPTION) {
                if (dao.updateEvaluateAPL(APPLICANTNO, INTERVIEWSCHEDULENO, ev)) {
                    MessageDialog.showMessageDialog(this, "Changed successfully!", "Notification");
                } else {
                    MessageDialog.showConfirmDialog(this, "Change unsuccessfully!", "Notification");
                }
            }
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Error");
        }
    }//GEN-LAST:event_btnAltActionPerformed

    private void btnDltActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDltActionPerformed
        // TODO add your handling code here:
        EvaluateDao dao = new EvaluateDao();
        try {
            int choose = MessageDialog.showConfirmDialog(this, "Do you sure want to delete rating?", "Confirm");
            if (choose == JOptionPane.YES_OPTION) {
                if (dao.deleteEvaluateAPL(APPLICANTNO, INTERVIEWSCHEDULENO)) {
                    MessageDialog.showMessageDialog(this, "Deleted successfully!", "Notification");
                    this.dispose();
                } else {
                    MessageDialog.showConfirmDialog(this, "Delete unsuccessfully!", "Notification");
                }
            }
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Error");
        }
    }//GEN-LAST:event_btnDltActionPerformed

    /**
     * @param args the command line arguments
     */

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAlt;
    private javax.swing.JButton btnDlt;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel lblAPPLICANTNO;
    private javax.swing.JLabel lblINTERVIEWSCHEDULE;
    private javax.swing.JTextArea txaCOMMENT;
    private javax.swing.JTextField txtMARK;
    // End of variables declaration//GEN-END:variables

    private void HienThi() {
        EvaluateDao dao = new EvaluateDao();
        Evaluate e = new Evaluate();
        try {
            e = dao.getInformationAPL(APPLICANTNO, INTERVIEWSCHEDULENO);
        } catch (Exception ex) {
            MessageDialog.showErrorDialog(this, ex.getMessage(), "Error");
        }
        lblINTERVIEWSCHEDULE.setText(String.valueOf(INTERVIEWSCHEDULENO));
        lblAPPLICANTNO.setText(String.valueOf(APPLICANTNO));
        txtMARK.setText(String.valueOf(e.getMARK()));
        txaCOMMENT.setText(e.getCOMMENT());
    }

}
