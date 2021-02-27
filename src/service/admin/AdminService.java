package service.admin;

import dao.administrator.AdminDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.nav.Nav;
import po.nav.NavF;
import po.nav.NavS;
import po.post.FindUserPost;
import po.post.PostInformation;
import po.post.UpdateView;
import po.user.User;

import java.util.List;

@Service
public class AdminService {
    @Autowired
    AdminDao adminDao;

    public List<User> userlists(FindUserPost findUserPost) {
        return adminDao.userlists(findUserPost);
    }

    public int usernum(FindUserPost findUserPost) {
        return adminDao.usernum(findUserPost);
    }

    public void userdel(int userid) {
        adminDao.userdel(userid);
    }

    public List<NavS> findKind(int nfid) {
        return adminDao.findKind(nfid);
    }

    public void serviceAdd(PostInformation postInformation) {
        adminDao.serviceAdd(postInformation);
    }

    public int findServiceView(int serviceid) {
        return adminDao.findServiceView(serviceid);
    }

    public void updateView(UpdateView updateView) {
        adminDao.updateView(updateView);
    }

    public List<PostInformation> findservicenotice(FindUserPost findUserPost) {
        return adminDao.findservicenotice(findUserPost);
    }

    public int noticenum(FindUserPost findUserPost) {
        return adminDao.noticenum(findUserPost);
    }

    public List<PostInformation> findById(int serviceid) {
        return adminDao.findById(serviceid);
    }

    public void updatenotice(PostInformation postInformation) {
        adminDao.updatenotice(postInformation);
    }

    public List<PostInformation> allpost(FindUserPost findUserPost) {
        return adminDao.allpost(findUserPost);
    }

    public void replydel(int replyid) {
        adminDao.replydel(replyid);
    }

    public List<Nav> navs(FindUserPost findUserPost) {
        return adminDao.navs(findUserPost);
    }

    public List<Nav> navf(FindUserPost findUserPost) {
        return adminDao.navf(findUserPost);
    }

    public int navsnum() {
        return adminDao.navsnum();
    }

    public int navfnum() {
        return adminDao.navfnum();
    }

    public List<Nav> navffind() {
        return adminDao.navffind();
    }

    public void addnavf(NavF navF) {
        adminDao.addnavf(navF);
    }

    public void addnavs(NavS navS) {
        adminDao.addnavs(navS);
    }

    public NavS navsById(int navsid) {
        return adminDao.navsById(navsid);
    }

    public NavF navfById(int navfid) {
        return adminDao.navfById(navfid);
    }

    public void updatenavs(NavS navS) {
        adminDao.updatenavs(navS);
    }

    public void updatenavf(NavF navF) {
        adminDao.updatenavf(navF);
    }

    public int helpnum(int servicenavs) {
        return adminDao.helpnum(servicenavs);
    }
}
