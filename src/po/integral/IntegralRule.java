package po.integral;

public class IntegralRule {
    private int ruleid;
    private String rulename;
    private int rulescore;

    public int getRuleid() {
        return ruleid;
    }

    public void setRuleid(int ruleid) {
        this.ruleid = ruleid;
    }

    public String getRulename() {
        return rulename;
    }

    public void setRulename(String rulename) {
        this.rulename = rulename;
    }

    public int getRulescore() {
        return rulescore;
    }

    public void setRulescore(int rulescore) {
        this.rulescore = rulescore;
    }

    @Override
    public String toString() {
        return "IntegralRule{" +
                "ruleid=" + ruleid +
                ", rulename='" + rulename + '\'' +
                ", rulescore=" + rulescore +
                '}';
    }
}
