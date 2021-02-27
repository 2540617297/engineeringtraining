package po.integral;

import po.user.User;

public class Integral {
    private int integralid;
    private int integralname;
    private int integraluser;
    private int integralscore;
    private String integraltime;
    private int integralpost;
    private int scoresum;
    private User user;
    private IntegralRule integralRule;

    public IntegralRule getIntegralRule() {
        return integralRule;
    }

    public void setIntegralRule(IntegralRule integralRule) {
        this.integralRule = integralRule;
    }

    public int getScoresum() {
        return scoresum;
    }

    public void setScoresum(int scoresum) {
        this.scoresum = scoresum;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getIntegralpost() {
        return integralpost;
    }

    public void setIntegralpost(int integralpost) {
        this.integralpost = integralpost;
    }

    public int getIntegralid() {
        return integralid;
    }

    public void setIntegralid(int integralid) {
        this.integralid = integralid;
    }

    public int getIntegralname() {
        return integralname;
    }

    public void setIntegralname(int integralname) {
        this.integralname = integralname;
    }

    public int getIntegraluser() {
        return integraluser;
    }

    public void setIntegraluser(int integraluser) {
        this.integraluser = integraluser;
    }

    public int getIntegralscore() {
        return integralscore;
    }

    public void setIntegralscore(int integralscore) {
        this.integralscore = integralscore;
    }

    public String getIntegraltime() {
        return integraltime;
    }

    public void setIntegraltime(String integraltime) {
        this.integraltime = integraltime;
    }

    @Override
    public String toString() {
        return "Integral{" +
                "integralid=" + integralid +
                ", integralname=" + integralname +
                ", integraluser=" + integraluser +
                ", integralscore=" + integralscore +
                ", integraltime='" + integraltime + '\'' +
                ", integralpost=" + integralpost +
                ", scoresum=" + scoresum +
                ", user=" + user +
                ", integralRule=" + integralRule +
                '}';
    }
}
