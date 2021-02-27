package dao.reply;

import po.post.CollectPost;
import po.post.FindUserPost;
import po.reply.Reply;

import java.util.List;

public interface ReplyDao {
    public void addreply(Reply reply);
    public List<Reply> comments(int postid);
    public List<Reply> findbylastid(int lastid);
//    public List<Reply> commetnotnull(int postid);
    public int replynum(FindUserPost findUserPost);
    public List<Reply> allreply(FindUserPost findUserPost);

}
