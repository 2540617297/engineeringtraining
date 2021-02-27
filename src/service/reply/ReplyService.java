package service.reply;

import dao.reply.ReplyDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.post.FindUserPost;
import po.reply.Last_User;
import po.reply.Reply;
import po.reply.Tree;

import java.util.ArrayList;
import java.util.List;

@Service
public class ReplyService {
    @Autowired
    ReplyDao replyDao;


    public void addreply(Reply reply) {
        replyDao.addreply(reply);
    }

    public List<Reply> comments(int postid) {
        return replyDao.comments(postid);
    }

//    public List<Reply> commetnotnull(int postid){
//        return replyDao.commetnotnull(postid);
//    }

    public Tree commentnull(int postid) {
        Tree tree = new Tree(replyDao.comments(postid));
        Tree tree1 = store(tree);
        return tree1;
    }

    public Tree store(Tree tree) {
        for (Reply list :
                tree.getRootData()) {
            int i = 0;
            if (replyDao.findbylastid(list.getReplyid()) != null) {
                Tree tree1 = new Tree(replyDao.findbylastid(list.getReplyid()));
                tree.addNode(tree1);
                store(tree1);
            }
        }
        return tree;
    }

    public List<Last_User> finduser(List<Reply> replies) {
        Last_User last_user = null;
        List<Last_User> lastUsers = new ArrayList<>();
        List<Reply> replies1 = replies;
        for (Reply reply :
                replies) {
            for (Reply reply1 : replies1) {
                if (reply1.getLastid() != null) {
                    if (reply.getReplyid() == reply1.getLastid()) {
                        last_user = new Last_User();
                        last_user.setLastid(reply1.getLastid());
                        last_user.setReqlyid(reply.getReplyid());
                        last_user.setUsername(reply.getUser().getUsername());
                        last_user.setUserid(reply1.getUserid());
//                        last_user.setReqlyid(reply.getUser().getId());
                        lastUsers.add(last_user);
                    }
                }
            }
        }
        return lastUsers;
    }

    public int replynum(FindUserPost findUserPost) {
        return replyDao.replynum(findUserPost);
    }

    public List<Reply> allreply(FindUserPost findUserPost) {
        return replyDao.allreply(findUserPost);
    }
}
