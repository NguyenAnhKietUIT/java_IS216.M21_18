package View;

import Process.DataValidator;
import Process.InterviewSchedule;
import Process.InterviewScheduleDao;
import Process.MessageDialog;
import java.sql.Date;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author acer
 */
public class ListInterviewSchedule extends javax.swing.JFrame {

    /**
     * Creates new form ListInterviewSchedule
     */
    private DefaultTableModel model;
    private int maLich;

    public ListInterviewSchedule() {
        initComponents();
        setLocationRelativeTo(null);
        setResizable(false);

        model = (DefaultTableModel) tblSCHEDULE.getModel();
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
        tblSCHEDULE = new javax.swing.JTable();
        jLabel2 = new javax.swing.JLabel();
        dtSTARTTIME = new com.toedter.calendar.JDateChooser();
        jLabel3 = new javax.swing.JLabel();
        dtENDTIME = new com.toedter.calendar.JDateChooser();
        jLabel5 = new javax.swing.JLabel();
        comboSTATUS = new javax.swing.JComboBox<>();
        txtSLOT = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jScrollPane3 = new javax.swing.JScrollPane();
        txaLOCATION = new javax.swing.JTextArea();
        jLabel6 = new javax.swing.JLabel();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        jLabel1.setText("DANH SÁCH LỊCH PHỎNG VẤN");

        tblSCHEDULE.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        tblSCHEDULE.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Mã lịch phỏng vấn", "Ngày bắt đầu", "Ngày kết thúc", "Địa điểm", "Trạng thái", "Số lượng tối đa"
            }
        ));
        tblSCHEDULE.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblSCHEDULEMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblSCHEDULE);

        jLabel2.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel2.setText("Ngày bắt đầu:");

        dtSTARTTIME.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        jLabel3.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel3.setText("Ngày kết thúc:");

        dtENDTIME.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        jLabel5.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel5.setText("Trạng thái:");

        comboSTATUS.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        comboSTATUS.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Chưa hoàn thành", "Đã hoàn thành" }));

        txtSLOT.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        jLabel4.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel4.setText("Địa điểm:");

        txaLOCATION.setColumns(20);
        txaLOCATION.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        txaLOCATION.setRows(5);
        jScrollPane3.setViewportView(txaLOCATION);

        jLabel6.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel6.setText("Số lượng tối đa:");

        jButton1.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jButton1.setText("Xem người đăng ký");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jButton2.setText("Thêm lịch phỏng vấn");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jButton3.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jButton3.setText("Xóa lịch phỏng vấn");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jButton4.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jButton4.setText("Sửa lịch phỏng vấn");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

        jButton5.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jButton5.setText("Quay lại");
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1)
                .addContainerGap())
            .addGroup(layout.createSequentialGroup()
                .addGap(25, 25, 25)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel2)
                    .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(dtSTARTTIME, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(comboSTATUS, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(84, 84, 84)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jLabel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel6))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(txtSLOT)
                    .addComponent(dtENDTIME, javax.swing.GroupLayout.PREFERRED_SIZE, 147, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 102, Short.MAX_VALUE)
                .addComponent(jLabel4)
                .addGap(18, 18, 18)
                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(26, 26, 26))
            .addGroup(layout.createSequentialGroup()
                .addGap(117, 117, 117)
                .addComponent(jButton1)
                .addGap(18, 18, 18)
                .addComponent(jButton2)
                .addGap(18, 18, 18)
                .addComponent(jButton3)
                .addGap(18, 18, 18)
                .addComponent(jButton4)
                .addGap(18, 18, 18)
                .addComponent(jButton5)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel1)
                .addGap(360, 360, 360))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 252, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2)
                            .addComponent(dtSTARTTIME, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(45, 45, 45)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel5)
                            .addComponent(comboSTATUS, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3)
                            .addComponent(dtENDTIME, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel4))
                        .addGap(45, 45, 45)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel6)
                            .addComponent(txtSLOT, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 34, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButton1)
                    .addComponent(jButton2)
                    .addComponent(jButton3)
                    .addComponent(jButton5)
                    .addComponent(jButton4))
                .addGap(37, 37, 37))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void tblSCHEDULEMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblSCHEDULEMouseClicked
        // TODO add your handling code here:
        int row = tblSCHEDULE.getSelectedRow();

        if (row >= 0) {
            int id = (int) tblSCHEDULE.getValueAt(row, 0);
            maLich = id;

            try {
                InterviewScheduleDao dao = new InterviewScheduleDao();
                InterviewSchedule result = dao.getInformation(maLich);

                dtSTARTTIME.setDate(result.getSTARTTIME());
                dtENDTIME.setDate(result.getENDTIME());
                comboSTATUS.setSelectedIndex(result.getSTATUS());
                txtSLOT.setText(String.valueOf(result.getSLOT()));
                txaLOCATION.setText(result.getLOCATION());
            } catch (Exception e) {
                MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
            }
        }
    }//GEN-LAST:event_tblSCHEDULEMouseClicked

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // TODO add your handling code here:
        int choose = MessageDialog.showConfirmDialog(this, "Bạn có chắc muốn xóa lịch phỏng vấn?", "Hỏi");
        if (choose == JOptionPane.YES_OPTION) {
            try {
                InterviewScheduleDao dao = new InterviewScheduleDao();
                if (dao.delete(maLich)) {
                    MessageDialog.showMessageDialog(this, "Xóa thành công!", "Thông báo");
                    LoadData();
                } else {
                    MessageDialog.showConfirmDialog(this, "Xóa thất bại!", "Thông báo");
                }
            } catch (Exception e) {
                MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
            }
        }
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
        StringBuilder sb = new StringBuilder();
        DataValidator.validateEmpty(txtSLOT, sb, "Số lượng tối đa không được để trống!");
        DataValidator.validateEmpty(txaLOCATION, sb, "Địa điểm không được để trống");

        if (sb.length() > 0) {
            MessageDialog.showErrorDialog(this, sb.toString(), "Lỗi");
            return;
        }

        if (txtSLOT.getText().length() > 0 && !txtSLOT.getText().matches("\\d+")) {
            JOptionPane.showMessageDialog(this, "Số năm kinh nghiệm chỉ có thể là số!");
            return;
        }

        try {
            InterviewSchedule is = new InterviewSchedule();

            Date startdate = new Date(dtSTARTTIME.getDate().getTime());
            Date enddate = new Date(dtENDTIME.getDate().getTime());
            int status = comboSTATUS.getSelectedIndex();

            if (startdate.compareTo(enddate) > 0) {
                JOptionPane.showMessageDialog(this, "Ngày bắt đầu không thể lớn hơn ngày kết thúc!");
                return;
            }

            is.setSTARTTIME(startdate);
            is.setENDTIME(enddate);
            is.setLOCATION(txaLOCATION.getText());
            is.setSTATUS(status);
            is.setSLOT(Integer.parseInt(txtSLOT.getText()));

            InterviewScheduleDao dao = new InterviewScheduleDao();
            if (dao.insert(is)) {
                MessageDialog.showMessageDialog(this, "Thêm thành công!", "Thông báo");
                LoadData();
            } else {
                MessageDialog.showConfirmDialog(this, "Thêm thất bại!", "Thông báo");
            }
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
        }
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        // TODO add your handling code here:
        StringBuilder sb = new StringBuilder();
        DataValidator.validateEmpty(txtSLOT, sb, "Số lượng tối đa không được để trống!");
        DataValidator.validateEmpty(txaLOCATION, sb, "Địa điểm không được để trống");

        if (sb.length() > 0) {
            MessageDialog.showErrorDialog(this, sb.toString(), "Lỗi");
            return;
        }

        if (txtSLOT.getText().length() > 0 && !txtSLOT.getText().matches("\\d+")) {
            JOptionPane.showMessageDialog(this, "Số năm kinh nghiệm chỉ có thể là số!");
            return;
        }

        try {
            InterviewSchedule is = new InterviewSchedule();

            Date startdate = new Date(dtSTARTTIME.getDate().getTime());
            Date enddate = new Date(dtENDTIME.getDate().getTime());
            int status = comboSTATUS.getSelectedIndex();

            is.setINTERVIEWSCHEDULENO(maLich);
            is.setSTARTTIME(startdate);
            is.setENDTIME(enddate);
            is.setLOCATION(txaLOCATION.getText());
            is.setSTATUS(status);
            is.setSLOT(Integer.parseInt(txtSLOT.getText()));

            InterviewScheduleDao dao = new InterviewScheduleDao();
            int choose = MessageDialog.showConfirmDialog(this, "Bạn có chắc muốn sửa lịch phỏng vấn?", "Hỏi");
            if (choose == JOptionPane.YES_OPTION) {
                if (dao.update(is)) {
                    MessageDialog.showMessageDialog(this, "Sửa thành công!", "Thông báo");
                    LoadData();
                } else {
                    MessageDialog.showConfirmDialog(this, "Sửa thất bại!", "Thông báo");
                }
            }
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
        }
    }//GEN-LAST:event_jButton4ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        // TODO add your handling code here:
        InterviewerFrame i = new InterviewerFrame();
        i.setVisible(true);
        dispose();
    }//GEN-LAST:event_jButton5ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        ListApplicantRegister lar = new ListApplicantRegister(maLich);
        lar.setVisible(true);
        dispose();
    }//GEN-LAST:event_jButton1ActionPerformed

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
            java.util.logging.Logger.getLogger(ListInterviewSchedule.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ListInterviewSchedule.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ListInterviewSchedule.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ListInterviewSchedule.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ListInterviewSchedule().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox<String> comboSTATUS;
    private com.toedter.calendar.JDateChooser dtENDTIME;
    private com.toedter.calendar.JDateChooser dtSTARTTIME;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JTable tblSCHEDULE;
    private javax.swing.JTextArea txaLOCATION;
    private javax.swing.JTextField txtSLOT;
    // End of variables declaration//GEN-END:variables

    private void LoadData() {
        try {
            InterviewScheduleDao dao = new InterviewScheduleDao();
            List<InterviewSchedule> list = dao.ListSchedule();
            model.setRowCount(0);
            for (InterviewSchedule x : list) {
                String trangthai;
                if (x.getSTATUS() == 0) {
                    trangthai = "Chưa hoàn thành";
                } else {
                    trangthai = "Đã hoàn thành";
                }

                model.addRow(new Object[]{
                    x.getINTERVIEWSCHEDULENO(), x.getSTARTTIME(), x.getENDTIME(),
                    x.getLOCATION(), trangthai, x.getSLOT()});
            }
            model.fireTableDataChanged();
            tblSCHEDULE.setModel(model);
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
        }
    }
}
