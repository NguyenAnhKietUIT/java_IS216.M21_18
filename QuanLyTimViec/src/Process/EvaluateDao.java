package Process;

import ConnectDB.ConnectOracle;
import java.sql.*;

/**
 *
 * @author acer
 */
public class EvaluateDao {

    public boolean isEvaluate(int maApp, int maITS) throws Exception {
        String sql = "SELECT *"
                + " FROM EVALUATE_APL"
                + " WHERE COMPANYNO = ? AND APPLICANTNO = ? AND INTERVIEWSCHEDULENO = ?";

        CompanyDao dao = new CompanyDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, dao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(2, maApp);
            pstmt.setInt(3, maITS);

            try ( ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean insertEvaluateAPL(int maApp, int maITS, Evaluate e) throws Exception {
        String sql = "BEGIN "
                + " proc_insert_evaluate_apl(?, ?, ?, ?, ?);"
                + " END;";

        CompanyDao dao = new CompanyDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, dao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(2, maApp);
            pstmt.setInt(3, maITS);
            pstmt.setInt(4, e.getMARK());
            pstmt.setString(5, e.getCOMMENT());

            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean updateEvaluateAPL(int maApp, int maITS, Evaluate e) throws Exception {
        String sql = "BEGIN "
                + " proc_update_evaluate_apl(?, ?, ?, ?, ?);"
                + " END;";

        CompanyDao dao = new CompanyDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, dao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(2, maApp);
            pstmt.setInt(3, maITS);
            pstmt.setInt(4, e.getMARK());
            pstmt.setString(5, e.getCOMMENT());

            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean deleteEvaluateAPL(int maApp, int maITS) throws Exception {
        String sql = "BEGIN "
                + " proc_delete_evaluate_apl(?, ?, ?);"
                + " END;";

        CompanyDao dao = new CompanyDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, dao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(2, maApp);
            pstmt.setInt(3, maITS);

            return pstmt.executeUpdate() > 0;
        }
    }

    public Evaluate getInformation(int maApp, int maITS) throws Exception {
        String sql = "SELECT MARK_APL, COMMENT_APL"
                + " FROM EVALUATE_APL"
                + " WHERE COMPANYNO = ? AND APPLICANTNO = ? AND INTERVIEWSCHEDULENO = ?";

        CompanyDao dao = new CompanyDao();

        try (
                 Connection con = ConnectOracle.openConnection();  PreparedStatement pstmt = con.prepareStatement(sql);) {

            pstmt.setInt(1, dao.takeCOMPANYNO(SharedData.useraccount.getACCOUNTID()));
            pstmt.setInt(2, maApp);
            pstmt.setInt(3, maITS);

            try ( ResultSet rs = pstmt.executeQuery();) {

                while (rs.next()) {
                    Evaluate e = new Evaluate();
                    e.setMARK(rs.getInt("MARK_APL"));
                    e.setCOMMENT(rs.getString("COMMENT_APL"));
                    return e;
                }
            }
        }
        return null;
    }
}
