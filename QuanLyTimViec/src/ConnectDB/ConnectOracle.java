package ConnectDB;

import java.sql.*;

/**
 *
 * @author acer
 */
public class ConnectOracle {

    public static Connection openConnection() throws Exception {
        String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        String username = "QuanLyTimViec";
        String password = "anhkiet22032002";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection(url, username, password);
        
        return conn;
    }
}
