package controller.user;

import controller.other.Calpage;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import po.integral.Integral;
import po.nav.NavF;
import po.post.FindUserPost;
import po.user.User;
import service.nav.NavFService;
import service.post.PostService;
import service.user.UserService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/userController")
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    NavFService navFService;
    @Autowired
    PostService postService;


    /**
     * 登录路径
     * @return
     */
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    /**
     * 注册路径
     * @return
     */
    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    /**
     * 注册添加用户
     * @param user
     * @return  返回到登录界面
     * @throws Exception
     */
    @RequestMapping("/add")
    public String addUser(User user) throws Exception {
        user.setIntegral(0);
        user.setMark(0);
        userService.addUser(user);
        return "login";
    }

    /**
     * 登录验证
     * @param user
     * @param request
     * @param response
     * @return  'nofind'表示没找到，其他则返回到用户首页或者是管理员界面
     * @throws UnsupportedEncodingException
     */
    @RequestMapping("/find")
    public String find(User user, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        boolean b = userService.find(user);
        if (!b) {
            return "nofind";
        } else {
            if (userService.finduser(user).getMark() == 0) {
                String username = URLEncoder.encode(user.getUsername(), "utf-8");
                String mark = URLEncoder.encode(String.valueOf(userService.finduser(user).getMark()), "utf-8");
                Cookie cookie = new Cookie("username", username);
                Cookie cookie1 = new Cookie("mark", mark);
                cookie.setMaxAge(60 * 30);
                cookie1.setMaxAge(60 * 30);
                cookie.setPath("/");
                cookie1.setPath("/");
                response.addCookie(cookie);
                response.addCookie(cookie1);
                return "redirect:/navController/all_admin_index";
            } else {
                String username = URLEncoder.encode(user.getUsername(), "utf-8");
                String mark = URLEncoder.encode(String.valueOf(userService.finduser(user).getMark()), "utf-8");
                Cookie cookie = new Cookie("username", username);
                Cookie cookie1 = new Cookie("mark", mark);
                cookie.setMaxAge(60 * 30);
                cookie1.setMaxAge(60 * 30);
                cookie.setPath("/");
                cookie1.setPath("/");
                response.addCookie(cookie);
                response.addCookie(cookie1);
                return "redirect:/adminController/userlists";
            }
        }
    }


    @RequestMapping("/user_information")
    public String user_information(Model model, String edituser, @CookieValue(value = "username", required = false) String username, @CookieValue(value = "mark", required = false) String mark, HttpServletRequest request) {
        if (username != null) {
            User userinformation = null;
            if (!mark.equals("1")) {
                userinformation = userService.findAll(username);

            } else {
                userinformation = userService.findAll(edituser);
            }
            List<List<NavF>> lists = navFService.findAll(Integer.parseInt(mark));
            model.addAttribute("lists", lists);
            model.addAttribute("userinformation", userinformation);
            model.addAttribute("mark", mark);
            model.addAttribute("username", username);
            return "user_information";
        } else {
            return "login";
        }

    }

    @RequestMapping("/editInformation")
    public String editInformation(String userid, String username, String password, String name, String gender, String birthday, String phonenum, String speciality, MultipartFile photo, @RequestParam(value = "integral", required = false) Integer integral, @RequestParam(value = "mark", required = false) String mark) throws IOException {
//        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//        String sdf=dateFormat.format(birthday);
        User user = new User();
        user.setId(Integer.parseInt(userid));
        String name1 = UUID.randomUUID().toString().replaceAll("-", "");
        String imagename = photo.getOriginalFilename();
        String ext = FilenameUtils.getExtension(photo.getOriginalFilename());
        String filePath = "D:\\idea\\IDEA-WORKSPACE\\engineeringtraining\\web\\upload\\";
        photo.transferTo(new File(filePath + "/" + name1 + "." + ext));
//        //把图片存储路径保存到数据库
        user.setBirthday(birthday);
        user.setGender(gender);
        user.setPassword(password);
        user.setPhonenum(phonenum);
        user.setUsername(username);
        user.setName(name);
        user.setSpeciality(speciality);
        if (integral != null) {
            user.setIntegral(integral);
            user.setMark(Integer.parseInt(mark));
        }
        user.setPhotopath("upload/" + name1 + "." + ext);
        userService.editInformation(user);
        return "redirect:user_information?edituser=" + username;

    }

    @RequestMapping("/iframe")
    public String iframe(Model model, @CookieValue(value = "username", required = false) String username, @CookieValue(value = "mark", required = false) String mark) {
        List<List<NavF>> lists = navFService.findAll(Integer.parseInt(mark));
        model.addAttribute("lists", lists);
        model.addAttribute("mark", mark);
        model.addAttribute("username", username);
        return "iframe";
    }

    @RequestMapping("/iframetest")
    public String iframetest() {
        return "iframetest";
    }


    @RequestMapping("/integralrecord")
    public String integralrecord(Model model, @CookieValue(value = "username", required = false) String username, @RequestParam(value = "getnowpage", required = false) Integer getnowpage) {
        if (username != null) {
            //获取到当前用户的id
            int userid = userService.findId(username);
            //导航条lists
            List<List<NavF>> lists = navFService.findAll(0);
            model.addAttribute("lists", lists);
            //分类查询条件
            FindUserPost findUserPost = new FindUserPost();
            //设置每页数据条数
            int page = 10;
            //获取总页数
            int nowpage;
            int linenum = userService.integralnum(userid);
            int allpagenum = (int) Math.ceil((double) linenum / (double) page);
            Calpage calpage = new Calpage();
            nowpage = calpage.calpage(getnowpage, allpagenum);
            findUserPost.setUserid(userid);
            findUserPost.setNowpage(nowpage);
            findUserPost.setStartpage(nowpage * page - page);
            findUserPost.setEndpage(page);
            findUserPost.setPage(page);
            //分类内容
            List<Integral> integrals = userService.integralrecord(findUserPost);
            model.addAttribute("allpagenum", allpagenum);
            model.addAttribute("nowpage", nowpage);
            model.addAttribute("page", page);
            model.addAttribute("integrals", integrals);
            model.addAttribute("username", username);
            return "integral_record";
        } else {
            return "redirect:/userController/login";
        }

    }


}

