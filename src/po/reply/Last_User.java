package po.reply;

public class Last_User {
    private int lastid;
    private int reqlyid;
    private String username;
    private int userid;
    private int replyuserid;

    public int getReplyuserid() {
        return replyuserid;
    }

    public void setReplyuserid(int replyuserid) {
        this.replyuserid = replyuserid;
    }

    public int getLastid() {
        return lastid;
    }

    public void setLastid(int lastid) {
        this.lastid = lastid;
    }

    public int getReqlyid() {
        return reqlyid;
    }

    public void setReqlyid(int reqlyid) {
        this.reqlyid = reqlyid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    @Override
    public String toString() {
        return "Last_User{" +
                "lastid=" + lastid +
                ", reqlyid=" + reqlyid +
                ", username='" + username + '\'' +
                ", userid=" + userid +
                ", replyuserid=" + replyuserid +
                '}';
    }
}
