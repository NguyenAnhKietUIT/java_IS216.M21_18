package View;

import ConnectDB.ConnectOracle;
import java.sql.*;
import Process.DataValidator;
import Process.HaveSkill;
import Process.HaveSkillDao;
import Process.MessageDialog;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author acer
 */
public class CurriculumViate extends javax.swing.JFrame {

    /**
     * Creates new form CurriculumViate
     */
    private DefaultTableModel model;
    private Connection con;

    public CurriculumViate() {
        initComponents();
        setLocationRelativeTo(null);
        setResizable(false);

        model = (DefaultTableModel) tblHaveSkill.getModel();
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
        tblHaveSkill = new javax.swing.JTable();
        jLabel2 = new javax.swing.JLabel();
        txtSKILLNAME = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        txtYEARSOFEXPERIENCE = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        comboLEVEL_APL = new javax.swing.JComboBox<>();
        btnAdd = new javax.swing.JButton();
        btnDlt = new javax.swing.JButton();
        btnAlt = new javax.swing.JButton();
        btnRefresh = new javax.swing.JButton();
        btnUndo = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        jLabel1.setText("THÔNG TIN KỸ NĂNG");

        tblHaveSkill.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        tblHaveSkill.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Tên kỹ năng", "Trình độ chuyên môn", "Số năm kinh nghiệm"
            }
        ));
        tblHaveSkill.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblHaveSkillMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblHaveSkill);

        jLabel2.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel2.setText("Tên kỹ năng:");

        txtSKILLNAME.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        jLabel3.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel3.setText("Số năm kinh nghiệm:");

        txtYEARSOFEXPERIENCE.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        jLabel4.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel4.setText("Trình độ chuyên môn:");

        comboLEVEL_APL.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        comboLEVEL_APL.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Kém", "Yếu", "Trung bình", "Khá", "Giỏi", "Chuyên sâu" }));
        comboLEVEL_APL.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                comboLEVEL_APLActionPerformed(evt);
            }
        });

        btnAdd.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btnAdd.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resource/icons8_plus_16px.png"))); // NOI18N
        btnAdd.setText("Thêm kỹ năng");
        btnAdd.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAddActionPerformed(evt);
            }
        });

        btnDlt.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btnDlt.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resource/icons8_Delete_16px.png"))); // NOI18N
        btnDlt.setText("Xóa kỹ năng");
        btnDlt.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDltActionPerformed(evt);
            }
        });

        btnAlt.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btnAlt.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resource/icons8_maintenance_16px.png"))); // NOI18N
        btnAlt.setText("Sửa kỹ năng");
        btnAlt.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAltActionPerformed(evt);
            }
        });

        btnRefresh.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btnRefresh.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resource/icons8_refresh_16px.png"))); // NOI18N
        btnRefresh.setText("Làm mới");
        btnRefresh.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnRefreshActionPerformed(evt);
            }
        });

        btnUndo.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btnUndo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Resource/icons8_undo_16px.png"))); // NOI18N
        btnUndo.setText("Quay lại");
        btnUndo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnUndoActionPerformed(evt);
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
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel1)
                .addGap(263, 263, 263))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel3)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 134, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(txtYEARSOFEXPERIENCE, javax.swing.GroupLayout.PREFERRED_SIZE, 256, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(txtSKILLNAME, javax.swing.GroupLayout.PREFERRED_SIZE, 256, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jLabel4)
                        .addGap(18, 18, 18)
                        .addComponent(comboLEVEL_APL, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(23, 23, 23))
            .addGroup(layout.createSequentialGroup()
                .addGap(52, 52, 52)
                .addComponent(btnAdd)
                .addGap(18, 18, 18)
                .addComponent(btnDlt)
                .addGap(18, 18, 18)
                .addComponent(btnAlt)
                .addGap(18, 18, 18)
                .addComponent(btnRefresh)
                .addGap(18, 18, 18)
                .addComponent(btnUndo)
                .addContainerGap(38, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 296, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(29, 29, 29)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(txtSKILLNAME, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4)
                    .addComponent(comboLEVEL_APL, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(24, 24, 24)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(txtYEARSOFEXPERIENCE, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 43, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnAdd)
                    .addComponent(btnDlt)
                    .addComponent(btnAlt)
                    .addComponent(btnRefresh)
                    .addComponent(btnUndo))
                .addGap(34, 34, 34))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void comboLEVEL_APLActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_comboLEVEL_APLActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_comboLEVEL_APLActionPerformed

    private void btnRefreshActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnRefreshActionPerformed
        // TODO add your handling code here:
        txtSKILLNAME.setText("");
        txtYEARSOFEXPERIENCE.setText("");
        comboLEVEL_APL.setSelectedIndex(0);
        LoadData();
    }//GEN-LAST:event_btnRefreshActionPerformed

    private void tblHaveSkillMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblHaveSkillMouseClicked
        // TODO add your handling code here:
        int row = tblHaveSkill.getSelectedRow();

        if (row >= 0) {
            String name = (String) tblHaveSkill.getValueAt(row, 0);
            HaveSkillDao dao = new HaveSkillDao();
            HaveSkill hs = new HaveSkill();
            try {
                hs = dao.findBySkillName(name);
            } catch (Exception e) {
                MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
            }

            if (hs != null) {
                txtSKILLNAME.setText(hs.getSKILLNAME());
                txtYEARSOFEXPERIENCE.setText(String.valueOf(hs.getYEARSOFEXPERIENCE()));
                comboLEVEL_APL.setSelectedIndex(hs.getLEVEL_APL() - 1);

            }
        }
    }//GEN-LAST:event_tblHaveSkillMouseClicked

    private void btnUndoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnUndoActionPerformed
        // TODO add your handling code here:
        ApplicantFrame app = new ApplicantFrame();
        app.setVisible(true);
        dispose();
    }//GEN-LAST:event_btnUndoActionPerformed

    private void btnDltActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDltActionPerformed
        try {
            // TODO add your handling code here:
            con = ConnectOracle.openConnection();
            con.setAutoCommit(false);

            StringBuilder sb = new StringBuilder();
            DataValidator.validateEmpty(txtSKILLNAME, sb, "Tên kỹ năng không được để trống!");

            if (sb.length() > 0) {
                MessageDialog.showErrorDialog(this, sb.toString(), "Lỗi");
                return;
            }

            int choose = MessageDialog.showConfirmDialog(this, "Bạn có chắc muốn xóa kỹ năng?", "Hỏi");
            if (choose == JOptionPane.YES_OPTION) {
                try {
                    HaveSkillDao dao = new HaveSkillDao();
                    if (dao.delete(txtSKILLNAME.getText())) {
                        MessageDialog.showMessageDialog(this, "Xóa thành công!", "Thông báo");
                        LoadData();
                    } else {
                        MessageDialog.showConfirmDialog(this, "Xóa thất bại!", "Thông báo");
                    }
                } catch (Exception e) {
                    MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
                }
            }
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
        }
    }//GEN-LAST:event_btnDltActionPerformed

    private void btnAddActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAddActionPerformed
        // TODO add your handling code here:
        StringBuilder sb = new StringBuilder();
        DataValidator.validateEmpty(txtSKILLNAME, sb, "Tên kỹ năng không được để trống!");
        DataValidator.validateEmpty(txtYEARSOFEXPERIENCE, sb, "Số năm kinh nghiệm không được để trống!");

        if (sb.length() > 0) {
            MessageDialog.showErrorDialog(this, sb.toString(), "Lỗi");
            return;
        }

        if (txtYEARSOFEXPERIENCE.getText().length() > 0 && !txtYEARSOFEXPERIENCE.getText().matches("\\d+")) {
            JOptionPane.showMessageDialog(this, "Số năm kinh nghiệm chỉ có thể là số!");
            return;
        }

        try {
            HaveSkill hs = new HaveSkill();
            int index = comboLEVEL_APL.getSelectedIndex();
            int level_apl = index + 1;

            hs.setSKILLNAME(txtSKILLNAME.getText());
            hs.setLEVEL_APL(level_apl);
            hs.setYEARSOFEXPERIENCE(Integer.parseInt(txtYEARSOFEXPERIENCE.getText()));

            HaveSkillDao dao = new HaveSkillDao();
            if (dao.insert(hs)) {
                MessageDialog.showMessageDialog(this, "Thêm thành công!", "Thông báo");
                LoadData();
            } else {
                MessageDialog.showConfirmDialog(this, "Thêm thất bại!", "Thông báo");
            }
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
        }
    }//GEN-LAST:event_btnAddActionPerformed

    private void btnAltActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAltActionPerformed
        // TODO add your handling code here:
        try {
            HaveSkill hs = new HaveSkill();
            int index = comboLEVEL_APL.getSelectedIndex();
            int level_apl = index + 1;

            hs.setSKILLNAME(txtSKILLNAME.getText());
            hs.setLEVEL_APL(level_apl);
            hs.setYEARSOFEXPERIENCE(Integer.parseInt(txtYEARSOFEXPERIENCE.getText()));

            int choose = MessageDialog.showConfirmDialog(this, "Bạn có chắc muốn sửa kỹ năng?", "Hỏi");
            if (choose == JOptionPane.YES_OPTION) {
                HaveSkillDao dao = new HaveSkillDao();
                if (dao.update(hs)) {
                    MessageDialog.showMessageDialog(this, "Sửa thành công!", "Thông báo");
                    LoadData();
                } else {
                    MessageDialog.showConfirmDialog(this, "Sửa thất bại!", "Thông báo");
                }
            }
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
        }
    }//GEN-LAST:event_btnAltActionPerformed

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
            java.util.logging.Logger.getLogger(CurriculumViate.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(CurriculumViate.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(CurriculumViate.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(CurriculumViate.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new CurriculumViate().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAdd;
    private javax.swing.JButton btnAlt;
    private javax.swing.JButton btnDlt;
    private javax.swing.JButton btnRefresh;
    private javax.swing.JButton btnUndo;
    private javax.swing.JComboBox<String> comboLEVEL_APL;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblHaveSkill;
    private javax.swing.JTextField txtSKILLNAME;
    private javax.swing.JTextField txtYEARSOFEXPERIENCE;
    // End of variables declaration//GEN-END:variables

    private void LoadData() {
        try {
            HaveSkillDao dao = new HaveSkillDao();
            List<HaveSkill> list = dao.findByAccountID();
            model.setRowCount(0);
            for (HaveSkill x : list) {
                String trinhdo;
                trinhdo = switch (x.getLEVEL_APL()) {
                    case 1 ->
                        "Kém";
                    case 2 ->
                        "Yếu";
                    case 3 ->
                        "Trung bình";
                    case 4 ->
                        "Khá";
                    case 5 ->
                        "Giỏi";
                    default ->
                        "Chuyên sâu";
                };

                model.addRow(new Object[]{
                    x.getSKILLNAME(), trinhdo, x.getYEARSOFEXPERIENCE()});
            }
            model.fireTableDataChanged();
            tblHaveSkill.setModel(model);
        } catch (Exception e) {
            MessageDialog.showErrorDialog(this, e.getMessage(), "Lỗi");
        }
    }
}
