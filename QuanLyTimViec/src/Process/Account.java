package Process;

/**
 *
 * @author acer
 */
public class Account {

    private int ACCOUNTID;
    private String USERNAME, PASSWORD, ROLE;

    public Account() {
    }

    public Account(int ACCOUNTID, String USERNAME, String PASSWORD, String ROLE) {
        this.ACCOUNTID = ACCOUNTID;
        this.USERNAME = USERNAME;
        this.PASSWORD = PASSWORD;
        this.ROLE = ROLE;
    }

    public int getACCOUNTID() {
        return ACCOUNTID;
    }

    public void setACCOUNTID(int ACCOUNTID) {
        this.ACCOUNTID = ACCOUNTID;
    }

    public String getUSERNAME() {
        return USERNAME;
    }

    public void setUSERNAME(String USERNAME) {
        this.USERNAME = USERNAME;
    }

    public String getPASSWORD() {
        return PASSWORD;
    }

    public void setPASSWORD(String PASSWORD) {
        this.PASSWORD = PASSWORD;
    }

    public String getROLE() {
        return ROLE;
    }

    public void setROLE(String ROLE) {
        this.ROLE = ROLE;
    }
}
