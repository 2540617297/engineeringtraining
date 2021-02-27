package dao.post;

import po.post.CollectPost;
import po.post.FindUserPost;
import po.post.PostInformation;
import po.post.UpdateView;
import po.user.User;

import java.util.List;

public interface PostDao {
    public void postAdd(PostInformation postInformation);
    public List<User> findUserPost(FindUserPost findUserPost);
    public int allpostnum(FindUserPost findUserPost);
    public int postnumbynavs(FindUserPost findUserPost);
    public List<User> findById(int postid);
    public void updateView(UpdateView updateView);
    public Integer findPostView(int postid);
    public List<User> postRanking(FindUserPost findUserPost);
    public String toptime();
    public List<PostInformation> classifyPost(FindUserPost findUserPost);
    public List<CollectPost> collectpost(FindUserPost findUserPost);
    public Integer collectfind(CollectPost collectPost);
    public void collectadd(CollectPost collectPost);
    public void collectdel(int collectid);
    public int collectnumbyuser(int collectuser);
    public void updatepost(PostInformation postInformation);
    public String navsname(int navsid);
    public List<PostInformation> daypost(FindUserPost findUserPost);
    public void userpostdel(int postid);
    public int alluserpost(FindUserPost findUserPost);
    public List<PostInformation> weekranking(FindUserPost findUserPost);
    public int questionpostnum(String question);
    public List<PostInformation> questionpost(FindUserPost findUserPost);



}
