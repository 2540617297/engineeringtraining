package po.post;

public class FindUserPost {
    private int collectid;
    private int userid;
    private int nowpage;
    private int page;
    private int startpage;
    private int endpage;
    private int postid;
    private int postnavs;
    private String question;

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public int getCollectid() {
        return collectid;
    }

    public void setCollectid(int collectid) {
        this.collectid = collectid;
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

    public int getStartpage(){
        return startpage;
    }

    public void setStartpage(int startpage) {
        this.startpage = startpage;
    }

    public int getEndpage() {
        return endpage;
    }

    public void setEndpage(int endpage) {
        this.endpage = endpage;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getNowpage() {
        return nowpage;
    }

    public void setNowpage(int nowpage) {
        this.nowpage = nowpage;
    }


    @Override
    public String toString() {
        return "FindUserPost{" +
                "collectid=" + collectid +
                ", userid=" + userid +
                ", nowpage=" + nowpage +
                ", page=" + page +
                ", startpage=" + startpage +
                ", endpage=" + endpage +
                ", postid=" + postid +
                ", postnavs=" + postnavs +
                '}';
    }
}
