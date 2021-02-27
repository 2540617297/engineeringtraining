package service.post;

import dao.post.PostDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.post.CollectPost;
import po.post.FindUserPost;
import po.post.PostInformation;
import po.post.UpdateView;
import po.user.User;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class PostService {
    @Autowired
    PostDao postDao;

    public void postAdd(PostInformation postInformation){
        postDao.postAdd(postInformation);
    }

    public List<User> findUserPost(FindUserPost findUserPost){
        return postDao.findUserPost(findUserPost);
    }

    //查找出所有的数据条数
    public int allpostnum(FindUserPost findUserPost){
        return postDao.allpostnum(findUserPost);
    }

    //根据postnavs查找相应模块的数据条数
    public int postnumbynavs(FindUserPost findUserPost){
        return postDao.postnumbynavs(findUserPost);
    }

    public List<User> findById(int postid){
        return postDao.findById(postid);
    }

    public void updateView(UpdateView updateView){
        postDao.updateView(updateView);
    }

    public int findPostView(int postid){
        if(postDao.findPostView(postid)==null){
            return 0;
        }
        return postDao.findPostView(postid).intValue();
    }

    public List<User> findRanking(FindUserPost findUserPost){
        return postDao.postRanking(findUserPost);
    }

    public int timedifference() throws ParseException {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String toptime=postDao.toptime();
        System.out.println(sdf.parse(toptime));
        Date nowtime=new Date();
        System.out.println(nowtime);
        long nd = 1000 * 24 * 60 * 60;
        long nh = 1000 * 60 * 60;
        long nm = 1000 * 60;
        long ns = 1000;
        long timedifference=nowtime.getTime()-sdf.parse(toptime).getTime();
        long day = timedifference / nd;
        long hour = timedifference % nd / nh;
        long min = timedifference % nd % nh / nm;
        long sec = timedifference % nd % nh % nm / ns;
        int diff= (int) (sec+min*60+hour*60*60+day*24*60*60);
        System.out.println("相差时间数（秒）："+sec+min*60+hour*60*60+day*24*60*60);
        return diff;
    }

    public List<PostInformation> classifyPost(FindUserPost findUserPost){
        return postDao.classifyPost(findUserPost);
    }

    public Integer collectfind(CollectPost collectPost){
        return postDao.collectfind(collectPost);
    }

    public void collectadd(CollectPost collectPost){
        postDao.collectadd(collectPost);
    }

    public void collectdel(int collectid){
        postDao.collectdel(collectid);
    }

    public List<CollectPost> collectpost(FindUserPost findUserPost){
        return postDao.collectpost(findUserPost);
    }

    public int collectnumbyuser(int collectuser){
        return postDao.collectnumbyuser(collectuser);
    }

    public void updatepost(PostInformation postInformation){
        postDao.updatepost(postInformation);
    }

    public String navsname(int navsid){
        return postDao.navsname(navsid);
    }

    public List<PostInformation> daypost(FindUserPost findUserPost){
        return postDao.daypost(findUserPost);
    }

    public void userpostdel(int postid){
        postDao.userpostdel(postid);
    }

    public int alluserpost(FindUserPost findUserPost){
        return postDao.alluserpost(findUserPost);
    }

    public List<PostInformation> weekranking(FindUserPost findUserPost){
        return postDao.weekranking(findUserPost);
    }

    public int questionpostnum(String question){
        return postDao.questionpostnum(question);
    }

    public List<PostInformation> questionpost(FindUserPost findUserPost){
        return postDao.questionpost(findUserPost);
    }
}
