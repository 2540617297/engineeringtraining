package controller.administratot;

import controller.other.Calpage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import po.nav.Nav;
import po.nav.NavF;
import po.nav.NavS;
import po.post.FindUserPost;
import po.post.PostInformation;
import po.reply.Reply;
import po.user.User;
import service.admin.AdminService;
import service.nav.NavFService;
import service.post.PostService;
import service.reply.ReplyService;
import service.user.UserService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/adminController")
public class AdminController {
    @Autowired
    AdminService adminService;
    @Autowired
    NavFService navFService;
    @Autowired
    UserService userService;
    @Autowired
    PostService postService;
    @Autowired
    ReplyService replyService;

    @RequestMapping("/userlists")
    public String userLists(Model model, @CookieValue(value = "username", required = false) String username, @RequestParam(value = "getnowpage", required = false) Integer getnowpage,
                            @RequestParam(value = "question", required = false) String question) {
        if (username != null) {
            //导航条lists
            List<List<NavF>> lists = navFService.findAll(1);
            model.addAttribute("lists", lists);
            //分页查询条件
            FindUserPost findUserPost = new FindUserPost();
            findUserPost.setQuestion(question);
            //设置每页数据条数
            int page = 10;
            //获取总页数
            int nowpage;
            int linenum = adminService.usernum(findUserPost);
            Calpage calpage = new Calpage();
            int allpagenum = (int) Math.ceil((double) linenum / (double) page);
            nowpage = calpage.calpage(getnowpage, allpagenum);
            findUserPost.setNowpage(nowpage);
            findUserPost.setStartpage(nowpage * page - page);
            findUserPost.setEndpage(page);
            findUserPost.setPage(page);
            //用户信息
            List<User> userlists = adminService.userlists(findUserPost);
            model.addAttribute("userlists", userlists);
            model.addAttribute("allpagenum", allpagenum);
            model.addAttribute("nowpage", nowpage);
            model.addAttribute("page", page);
            model.addAttribute("username", username);
            return "user_lists";
        } else {
            return "redirect:/userController/login";
        }
    }

    @RequestMapping("/userdel")
    public String userdel(String userid) {
        adminService.userdel(Integer.parseInt(userid));
        return "redirect:/adminController/userlists";
    }

    @RequestMapping("/serviceedit")
    public String serviceedit(Model model, @CookieValue(value = "username", required = false) String username, @CookieValue(value = "mark", required = false) String mark) {
        if (username != null) {
            //导航条lists
            List<List<NavF>> lists = navFService.findAll(1);
            model.addAttribute("lists", lists);
            //服务编写类型
            int kind = 16;
            List<NavS> kinds = navFService.findKind(kind);
            int userid = userService.findId(username);
            model.addAttribute("kinds", kinds);
            model.addAttribute("userid", userid);
            model.addAttribute("mark", mark);
            model.addAttribute("username", username);


            return "service_edit";
        } else {
            return "redirect:/userController/login";
        }
    }

    @RequestMapping("/serviceadd")
    public String serviceadd(@CookieValue("username") String username, String servicetitle, int servicenavs, String servicecontent, int serviceuser) {
        //插入post数据
        Date nowtime = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        String servicetime = simpleDateFormat.format(nowtime);
        PostInformation postInformation = new PostInformation();
        postInformation.setPosttitle(servicetitle);
        postInformation.setPostnavs(servicenavs);
        postInformation.setPostcontent(servicecontent);
        postInformation.setPosttime(servicetime);
        postInformation.setPostuser(serviceuser);
        adminService.serviceAdd(postInformation);
        return "redirect:/adminController/serviceedit";
    }

    @RequestMapping("/noticeshow")
    public String noticeshow(Model model, @CookieValue(value = "username", required = false) String username, @RequestParam(value = "getnowpage", required = false) Integer getnowpage, @CookieValue(value = "mark", required = false) String mark,
                             @RequestParam(value = "recordpage", required = false) String recordpage, @RequestParam(value = "question", required = false) String question) {
        if (username != null) {
            //导航条lists
            List<List<NavF>> lists = navFService.findAll(Integer.parseInt(mark));
            model.addAttribute("lists", lists);
            //分页查询条件
            FindUserPost findUserPost = new FindUserPost();
            findUserPost.setQuestion(question);
            //设置
            //设置每页数据条数
            int page = 1;
            //获取总页数
            int nowpage;
            int linenum = adminService.noticenum(findUserPost);
            int allpagenum = (int) Math.ceil((double) linenum / (double) page);
            if (getnowpage == null) {
                nowpage = 1;
            } else {
                nowpage = getnowpage;
            }
            if (nowpage < 1) {
                nowpage = 1;
            }
            if (nowpage > allpagenum) {
                nowpage = allpagenum;
            }
            findUserPost.setNowpage(nowpage);
            findUserPost.setStartpage(nowpage * page - page);
            findUserPost.setEndpage(page);
            findUserPost.setPage(page);
            findUserPost.setPostnavs(51);
            //记录跳入界面
            model.addAttribute("recordpage", recordpage);
            //查找帖子内容
            List<PostInformation> serviceinformation = adminService.findservicenotice(findUserPost);
            model.addAttribute("serviceinformation", serviceinformation);
            model.addAttribute("allpagenum", allpagenum);
            model.addAttribute("nowpage", nowpage);
            model.addAttribute("page", page);
            model.addAttribute("username", username);
            return "notice_show";
        } else {
            return "redirect:/userController/login";
        }
    }

    @RequestMapping("/servicelists")
    public String servicelists(@CookieValue(value = "username", required = false) String username, Model model, @RequestParam(value = "getnowpage", required = false) Integer getnowpage,
                               @RequestParam(value = "question", required = false) String question) {
        if (username != null) {
            //导航条lists
            List<List<NavF>> lists = navFService.findAll(1);
            model.addAttribute("lists", lists);
            //分页查询条件
            FindUserPost findUserPost = new FindUserPost();
            findUserPost.setQuestion(question);
            //设置每页数据条数
            int page = 10;
            //获取总页数
            int nowpage;
            int linenum = adminService.noticenum(findUserPost);
            int allpagenum = (int) Math.ceil((double) linenum / (double) page);
            Calpage calpage = new Calpage();
            nowpage = calpage.calpage(getnowpage, allpagenum);
            findUserPost.setNowpage(nowpage);
            findUserPost.setStartpage(nowpage * page - page);
            findUserPost.setEndpage(page);
            findUserPost.setPage(page);
            findUserPost.setPostnavs(51);
            //用户信息
            List<PostInformation> servicenotices = adminService.findservicenotice(findUserPost);
            findUserPost.setPostnavs(52);
            List<PostInformation> servicenotices1 = adminService.findservicenotice(findUserPost);
            servicenotices.addAll(servicenotices1);
            model.addAttribute("servicenotices", servicenotices);
            model.addAttribute("allpagenum", allpagenum);
            model.addAttribute("nowpage", nowpage);
            model.addAttribute("page", page);
            model.addAttribute("username", username);
            return "service_lists";
        } else {
            return "redirect:/userController/login";
        }
    }

    @RequestMapping("/postlists")
    public String postlists(@CookieValue(value = "username", required = false) String username, Model model, @RequestParam(value = "getnowpage", required = false) Integer getnowpage,
                            @RequestParam(value = "question", required = false) String question) {
        if (username != null) {
            //导航条lists
            List<List<NavF>> lists = navFService.findAll(1);
            model.addAttribute("lists", lists);
            //分页查询条件
            FindUserPost findUserPost = new FindUserPost();
            findUserPost.setQuestion(question);
            //设置每页数据条数
            int page = 10;
            //获取总页数
            int nowpage;
            int linenum = postService.allpostnum(findUserPost);
            int allpagenum = (int) Math.ceil((double) linenum / (double) page);
            Calpage calpage = new Calpage();
            nowpage = calpage.calpage(getnowpage, allpagenum);
            findUserPost.setNowpage(nowpage);
            findUserPost.setStartpage(nowpage * page - page);
            findUserPost.setEndpage(page);
            findUserPost.setPage(page);
            //用户信息
            List<PostInformation> postInformations = adminService.allpost(findUserPost);
            model.addAttribute("postInformations", postInformations);
            model.addAttribute("allpagenum", allpagenum);
            model.addAttribute("nowpage", nowpage);
            model.addAttribute("page", page);
            model.addAttribute("username", username);
            return "post_lists";
        } else {
            return "redirect:/userController/login";
        }
    }

    @RequestMapping("replylists")
    public String replylists(@CookieValue(value = "username", required = false) String username, Model model, @RequestParam(value = "getnowpage", required = false) Integer getnowpage,
                             @RequestParam(value = "question", required = false) String question) {
        if (username != null) {
            //导航条lists
            List<List<NavF>> lists = navFService.findAll(1);
            model.addAttribute("lists", lists);
            //分页查询条件
            FindUserPost findUserPost = new FindUserPost();
            findUserPost.setQuestion(question);
            //设置每页数据条数
            int page = 10;
            //获取总页数
            int nowpage;
            int linenum = replyService.replynum(findUserPost);
            int allpagenum = (int) Math.ceil((double) linenum / (double) page);
            Calpage calpage = new Calpage();
            nowpage = calpage.calpage(getnowpage, allpagenum);
            findUserPost.setNowpage(nowpage);
            findUserPost.setStartpage(nowpage * page - page);
            findUserPost.setEndpage(page);
            findUserPost.setPage(page);
            //用户信息
            List<Reply> replies = replyService.allreply(findUserPost);
            model.addAttribute("replies", replies);
            model.addAttribute("allpagenum", allpagenum);
            model.addAttribute("nowpage", nowpage);
            model.addAttribute("page", page);
            model.addAttribute("username", username);
            return "reply_lists";
        } else {
            return "redirect:/userController/login";
        }
    }

    @RequestMapping("/replydel")
    public String replydel(String replyid) {
        adminService.replydel(Integer.parseInt(replyid));
        return "redirect:/adminController/replylists";
    }

    @RequestMapping("/menulists")
    public String menulists(Model model, @CookieValue(value = "username", required = false) String username, @RequestParam(value = "grand", required = false) String grand, @RequestParam(value = "getnowpage", required = false) Integer getnowpage) {
        if (username != null) {
            //导航条lists
            List<List<NavF>> lists = navFService.findAll(1);
            model.addAttribute("lists", lists);
            //分页查询条件
            FindUserPost findUserPost = new FindUserPost();
            //设置每页数据条数
            int page = 10;
            //获取总页数
            int nowpage;
            int linenum;
            if (grand == null || grand.equals("1")) {
                linenum = adminService.navfnum();
            } else {
                linenum = adminService.navsnum();
            }
            int allpagenum = (int) Math.ceil((double) linenum / (double) page);
            if (getnowpage == null) {
                nowpage = 1;
            } else {
                nowpage = getnowpage;
            }
            if (nowpage < 1) {
                nowpage = 1;
            }
            if (nowpage > allpagenum) {
                nowpage = allpagenum;
            }
            findUserPost.setNowpage(nowpage);
            findUserPost.setStartpage(nowpage * page - page);
            findUserPost.setEndpage(page);
            findUserPost.setPage(page);
            List<Nav> navLists;
            //用户信息
            if (grand == null || grand.equals("1")) {
                navLists = adminService.navf(findUserPost);
                model.addAttribute("grand", "1");
            } else {
                navLists = adminService.navs(findUserPost);
                model.addAttribute("grand", "2");
            }
            model.addAttribute("navLists", navLists);
            model.addAttribute("allpagenum", allpagenum);
            model.addAttribute("nowpage", nowpage);
            model.addAttribute("page", page);
            model.addAttribute("username", username);
            return "menu_lists";
        } else {
            return "redirect:/userController/login";
        }

    }

    @RequestMapping("/menuedit")
    public String menuedit(Model model, @CookieValue(value = "username", required = false) String username) {
        if (username != null) {
            //导航条lists
            List<List<NavF>> lists = navFService.findAll(1);
            model.addAttribute("lists", lists);
            model.addAttribute("username", username);
            return "menu_edit";
        } else {
            return "redirect:/userController/login";
        }
    }

    /*@ResponseBody
    @RequestMapping("navfind")
    public Map<String, Object> navfind(){
        List<Nav> navList=adminService.navffind();
        Map<String, Object> dataMap = new HashMap<String, Object>();
        dataMap.put("navList", navList);
        System.out.println("datamap:"+dataMap);
        return dataMap;
    }*/
    @ResponseBody
    @RequestMapping("navfind")
    public List<Nav> navfind() {
        List<Nav> navList = adminService.navffind();
        return navList;
    }

    @RequestMapping("/addnav")
    public String addnav(String navname, String grand, @RequestParam(value = "navfmark", required = false) String navfmark, @RequestParam(value = "navf", required = false) String navf, @RequestParam(value = "href", required = false) String href) {
        Nav nav = new Nav();
        if (grand.equals("1")) {
            NavF navF = new NavF();
            navF.setNavfname(navname);
            navF.setNavfmark(Integer.parseInt(navfmark));
            adminService.addnavf(navF);
        } else {
            NavS navS = new NavS();
            navS.setNavsname(navname);
            navS.setNavfid(Integer.parseInt(navf));
            navS.setNavsherf(href);
            adminService.addnavs(navS);
        }
        return "redirect:/adminController/menuedit";
    }

    @RequestMapping("/menualter")
    public String menualter(Model model, String grand, String navid, @CookieValue(value = "username", required = false) String username) {
        if (grand.equals("1")) {
            NavF navFLists = adminService.navfById(Integer.parseInt(navid));
            model.addAttribute("navF", navFLists);
        } else {
            List<Nav> navFLists = adminService.navffind();
            model.addAttribute("navFLists", navFLists);
            NavS navSLists = adminService.navsById(Integer.parseInt(navid));
            model.addAttribute("navS", navSLists);
        }
        model.addAttribute("grand", grand);
        //导航条lists
        List<List<NavF>> lists = navFService.findAll(1);
        model.addAttribute("lists", lists);
        model.addAttribute("username", username);
        return "menu_edit";
    }

    @RequestMapping("/menuupdate")
    public String menuupdate(String navid, String navname, String grand, @RequestParam(value = "navfmark", required = false) String navfmark, @RequestParam(value = "navf", required = false) String navf, @RequestParam(value = "navshref", required = false) String navshref) {
        if (grand.equals("1")) {
            NavF navF = new NavF();
            navF.setNavfname(navname);
            navF.setNavfmark(Integer.parseInt(navfmark));
            navF.setNavfid(Integer.parseInt(navid));
            adminService.updatenavf(navF);
        } else {
            NavS navS = new NavS();
            navS.setNavsname(navname);
            navS.setNavsherf(navshref);
            navS.setNavsfid(Integer.parseInt(navf));
            navS.setNavsid(Integer.parseInt(navid));
            adminService.updatenavs(navS);
        }
        return "redirect:/adminController/menulists";
    }

    @RequestMapping("/helpshow")
    public String helpshow(Model model, @CookieValue(value = "username", required = false) String username, @RequestParam(value = "getnowpage", required = false) Integer getnowpage, @CookieValue(value = "mark", required = false) String mark, @RequestParam(value = "recordpage", required = false) String recordpage) {
        if (username != null) {
            //导航条lists
            List<List<NavF>> lists = navFService.findAll(Integer.parseInt(mark));
            model.addAttribute("lists", lists);
            //分页查询条件
            FindUserPost findUserPost = new FindUserPost();
            //设置
            //设置每页数据条数
            int page = 1;
            //获取总页数
            int nowpage;
            int linenum = adminService.helpnum(52);
            int allpagenum = (int) Math.ceil((double) linenum / (double) page);
            if (getnowpage == null) {
                nowpage = 1;
            } else {
                nowpage = getnowpage;
            }
            if (nowpage < 1) {
                nowpage = 1;
            }
            if (nowpage > allpagenum) {
                nowpage = allpagenum;
            }
            findUserPost.setNowpage(nowpage);
            findUserPost.setStartpage(nowpage * page - page);
            findUserPost.setEndpage(page);
            findUserPost.setPage(page);
            findUserPost.setPostnavs(52);
            //记录跳入界面
            model.addAttribute("recordpage", recordpage);
            //查找帖子内容
            List<PostInformation> serviceinformation = adminService.findservicenotice(findUserPost);
            model.addAttribute("serviceinformation", serviceinformation);
            model.addAttribute("allpagenum", allpagenum);
            model.addAttribute("nowpage", nowpage);
            model.addAttribute("page", page);
            model.addAttribute("username", username);
            return "help_show";
        } else {
            return "redirect:/userController/login";
        }
    }


}
