package po.post;

import po.nav.NavS;
import po.user.User;

public class PostInformation {
    private int postid;
    private String posttitle;
    private String postcontent;
    private String posttime;
    private int postuser;
    private int postview;
    private int postnavs;
    private NavS navS;
    private User user;
    private String postcontenttext;

    public String getPostcontenttext() {
        return postcontenttext;
    }

    public void setPostcontenttext(String postcontenttext) {
        this.postcontenttext = postcontenttext;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public NavS getNavS() {
        return navS;
    }

    public void setNavS(NavS navS) {
        this.navS = navS;
    }

    public int getPostnavs() {
        return postnavs;
    }

    public void setPostnavs(int postnavs) {
        this.postnavs = postnavs;
    }

    public int getPostid() {
        return postid;
    }

    public void setPostid(int postid) {
        this.postid = postid;
    }

    public String getPosttitle() {
        return posttitle;
    }

    public void setPosttitle(String posttitle) {
        this.posttitle = posttitle;
    }

    public String getPostcontent() {
        return postcontent;
    }

    public void setPostcontent(String postcontent) {
        this.postcontent = postcontent;
    }

    public String getPosttime() {
        return posttime;
    }

    public void setPosttime(String posttime) {
        this.posttime = posttime;
    }

    public int getPostuser() {
        return postuser;
    }

    public void setPostuser(int postuser) {
        this.postuser = postuser;
    }

    public int getPostview() {
        return postview;
    }

    public void setPostview(int postview) {
        this.postview = postview;
    }

    @Override
    public String toString() {
        return "PostInformation{" +
                "postid=" + postid +
                ", posttitle='" + posttitle + '\'' +
                ", postcontenttext='" + postcontenttext + '\'' +
                ", posttime='" + posttime + '\'' +
                ", postuser=" + postuser +
                ", postview=" + postview +
                ", postnavs=" + postnavs +
                ", navS=" + navS +
                ", user=" + user +
                '}';
    }
}
