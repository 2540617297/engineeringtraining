package service.user;

import dao.user.UserDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.integral.Integral;
import po.other.FindNum;
import po.post.FindUserPost;
import po.user.User;

import java.util.List;

@Service("userService")
public class UserService  {

    @Autowired
    private UserDao userDao;

    public void addUser(User user) throws Exception {
        String user1=userDao.findByUserName(user.getUsername());
        if(user1==null){
            userDao.addUser(user);
        }else{
                throw new Exception("该用户已存在");

        }
    }

    public User finduser(User user){
        return userDao.find(user);
    }

    public boolean find(User user) {
        User user1=userDao.find(user);
        if(user1==null){
            return false;
        }else{
            return true;
        }
    }

    public User findAll(String username){
        return userDao.findAll(username);
    }

    public int findId(String username){
        int userid= userDao.findId(username);
        return userid;
    }

    public void editInformation(User user){
        userDao.editInformation(user);
    }

    public int findintegral(String username){
        int integral;
        if(userDao.findintegral(username)==null){
            integral=0;
        }else{
            integral=userDao.findintegral(username);
        }
        return integral;
    }

    public void updateintegral(User user){
        userDao.updateintegral(user);
    }

    public Integer findintegralbyid(int id){
        return userDao.findintegralbyid(id);
    }

    public List<Integral> integralrecord(FindUserPost findUserPost){
        return userDao.integralrecord(findUserPost);
    }

    public int integralnum(int userid){
        return userDao.integralnum(userid);
    }
}
