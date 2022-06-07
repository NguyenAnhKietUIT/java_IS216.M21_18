package Process;

/**
 *
 * @author acer
 */
public class Recruit {
    private Company c;
    private Department d;
    private Position p;
    private int NUMBEROFPERSONNEL;
    private double MARK;

    public Recruit() {
    }

    public Recruit(Company c, Department d, Position p, int NUMBEROFPERSONNEL, double MARK) {
        this.c = c;
        this.d = d;
        this.p = p;
        this.NUMBEROFPERSONNEL = NUMBEROFPERSONNEL;
        this.MARK = MARK;
    }

    public Company getC() {
        return c;
    }

    public void setC(Company c) {
        this.c = c;
    }

    public Department getD() {
        return d;
    }

    public void setD(Department d) {
        this.d = d;
    }

    public Position getP() {
        return p;
    }

    public void setP(Position p) {
        this.p = p;
    }

    public int getNUMBEROFPERSONNEL() {
        return NUMBEROFPERSONNEL;
    }

    public void setNUMBEROFPERSONNEL(int NUMBEROFPERSONNEL) {
        this.NUMBEROFPERSONNEL = NUMBEROFPERSONNEL;
    }

    public double getMARK() {
        return MARK;
    }

    public void setMARK(double MARK) {
        this.MARK = MARK;
    }
}
