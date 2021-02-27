package po.post;

import po.nav.NavS;
import po.user.User;

public class CollectPost {
    private int collectid;
    private User user;
    private int collectuser;
    private int collectpost;
    private PostInformation postInformation;
    private String collecttime;
    private NavS navS;

    public int getCollectuser() {
        return collectuser;
    }

    public void setCollectuser(int collectuser) {
        this.collectuser = collectuser;
    }

    public int getCollectpost() {
        return collectpost;
    }

    public void setCollectpost(int collectpost) {
        this.collectpost = collectpost;
    }

    public NavS getNavS() {
        return navS;
    }

    public void setNavS(NavS navS) {
        this.navS = navS;
    }

    public int getCollectid() {
        return collectid;
    }

    public void setCollectid(int collectid) {
        this.collectid = collectid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public PostInformation getPostInformation() {
        return postInformation;
    }

    public void setPostInformation(PostInformation postInformation) {
        this.postInformation = postInformation;
    }

    public String getCollecttime() {
        return collecttime;
    }

    public void setCollecttime(String collecttime) {
        this.collecttime = collecttime;
    }

    @Override
    public String toString() {
        return "CollectPost{" +
                "collectid=" + collectid +
                ", user=" + user +
                ", collectuser=" + collectuser +
                ", collectpost=" + collectpost +
                ", postInformation=" + postInformation +
                ", collecttime='" + collecttime + '\'' +
                ", navS=" + navS +
                '}';
    }
}
