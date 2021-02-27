package dao.administrator;

import po.nav.Nav;
import po.nav.NavF;
import po.nav.NavS;
import po.post.FindUserPost;
import po.post.PostInformation;
import po.post.UpdateView;
import po.user.User;

import java.util.List;

public interface AdminDao {
    public List<User> userlists(FindUserPost findUserPost);

    public int usernum(FindUserPost findUserPost);

    public void userdel(int userid);

    public List<NavS> findKind(int nfid);

    public void serviceAdd(PostInformation postInformation);

    public int findServiceView(int serviceid);

    public void updateView(UpdateView updateView);

    public List<PostInformation> findservicenotice(FindUserPost findUserPost);

    public int noticenum(FindUserPost findUserPost);

    public List<PostInformation> findById(int serviceid);

    public void updatenotice(PostInformation postInformation);

    public List<PostInformation> allpost(FindUserPost findUserPost);

    public void replydel(int replyid);

    public List<Nav> navs(FindUserPost findUserPost);

    public List<Nav> navf(FindUserPost findUserPost);

    public int navsnum();

    public int navfnum();

    public List<Nav> navffind();

    public void addnavf(NavF navF);

    public void addnavs(NavS navS);

    public NavS navsById(int navsid);

    public NavF navfById(int navfid);

    public void updatenavs(NavS navS);

    public void updatenavf(NavF navF);

    public int helpnum(int servicenavs);


}
