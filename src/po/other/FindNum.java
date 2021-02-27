package po.other;

public class FindNum {
    private String findtable;
    private String findline;
    private int linedata;

    public String getFindtable() {
        return findtable;
    }

    public void setFindtable(String findtable) {
        this.findtable = findtable;
    }

    public String getFindline() {
        return findline;
    }

    public void setFindline(String findline) {
        this.findline = findline;
    }

    public int getLinedata() {
        return linedata;
    }

    public void setLinedata(int linedata) {
        this.linedata = linedata;
    }

    @Override
    public String toString() {
        return "FindNum{" +
                "findtable='" + findtable + '\'' +
                ", findline='" + findline + '\'' +
                ", linedata='" + linedata + '\'' +
                '}';
    }
}
