package dao.user;

import po.integral.Integral;
import po.other.FindNum;
import po.post.FindUserPost;
import po.user.User;

import java.util.List;

public interface UserDao {
    public void addUser(User user);
    public String findByUserName(String username);
    public User find(User user);
    public User findAll(String username);
    public void editInformation(User user);
    public int findId(String username);
    public Integer findintegral(String username);
    public Integer findintegralbyid(int id);
    public void updateintegral(User user);
    public List<Integral> integralrecord(FindUserPost findUserPost);
    public int integralnum(int userid);


}
