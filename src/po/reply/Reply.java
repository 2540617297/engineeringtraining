package po.reply;

import po.post.PostInformation;
import po.user.User;

public class Reply {
    private int replyid;
    private int postid;
    private int userid;
    private String replycontent;
    private Integer lastid;
    private String replytime;
    private Reply reply;
    private User user;
    private PostInformation postInformation;

    public PostInformation getPostInformation() {
        return postInformation;
    }

    public void setPostInformation(PostInformation postInformation) {
        this.postInformation = postInformation;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getReplytime() {
        return replytime;
    }

    public void setReplytime(String replytime) {
        this.replytime = replytime;
    }

    public Reply getReply() {
        return reply;
    }

    public void setReply(Reply reply) {
        this.reply = reply;
    }

    public int getReplyid() {
        return replyid;
    }

    public void setReplyid(int replyid) {
        this.replyid = replyid;
    }

    public int getPostid() {
        return postid;
    }

    public void setPostid(int postid) {
        this.postid = postid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getReplycontent() {
        return replycontent;
    }

    public void setReplycontent(String replycontent) {
        this.replycontent = replycontent;
    }

    public Integer getLastid() {
        return lastid;
    }

    public void setLastid(Integer lastid) {
        this.lastid = lastid;
    }

    @Override
    public String toString() {
        return "Reply{" +
                "replyid=" + replyid +
                ", postid=" + postid +
                ", userid=" + userid +
                ", replycontent='" + replycontent + '\'' +
                ", lastid=" + lastid +
                ", replytime='" + replytime + '\'' +
                ", reply=" + reply +
                ", user=" + user +
                ", postInformation=" + postInformation +
                '}';
    }
}
