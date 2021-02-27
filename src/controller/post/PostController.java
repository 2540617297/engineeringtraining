package controller.post;

import controller.other.Calpage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import po.integral.Integral;
import po.integral.IntegralRule;
import po.nav.NavF;
import po.nav.NavS;
import po.post.CollectPost;
import po.post.FindUserPost;
import po.post.PostInformation;
import po.post.UpdateView;
import po.reply.Find;
import po.reply.Last_User;
import po.reply.Reply;
import po.reply.Visit;
import po.user.User;
import service.admin.AdminService;
import service.integral.IntegralService;
import service.nav.NavFService;
import service.post.PostService;
import service.reply.ReplyService;
import service.user.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/postController")
public class PostController {
    @Autowired
    NavFService navFService;
    @Autowired
    PostService postService;
    @Autowired
    UserService userService;
    @Autowired
    ReplyService replyService;
    @Autowired
    AdminService adminService;
    @Autowired
    IntegralService integralService;

    @RequestMapping("/post_write")
    public String postWrite(Model model, @CookieValue(value = "username", required = false) String username, @RequestParam(value = "mark", required = false) String mark) {
        if (username == null) {
            return "redirect:/userController/login";
        } else {
            int kind = 11;
            List<List<NavF>> lists = navFService.findAll(0);
            List<NavS> kinds = navFService.findKind(kind);
            int userid = userService.findId(username);
            model.addAttribute("userid", userid);
            model.addAttribute("lists", lists);
            model.addAttribute("kinds", kinds);
            model.addAttribute("mark", mark);
            model.addAttribute("username", username);
            return "post_write";
        }
    }

    @RequestMapping("/postadd")
    public String postadd(@CookieValue("username") String username, String posttitle, int postnavs, String postcontent, String postcontenttext, int postuser) throws ParseException {
        int timedifference = postService.timedifference();
        System.out.println("postaddtime:" + timedifference);
        if (timedifference < 120) {
            return "redirect:/postController/post_write?mark=false";
        } else {
            //插入post数据
            Date nowtime = new Date();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
            String posttime = simpleDateFormat.format(nowtime);
            PostInformation postInformation = new PostInformation();
            postInformation.setPosttitle(posttitle);
            postInformation.setPostnavs(postnavs);
            postInformation.setPostcontent(postcontent);
            postInformation.setPostcontenttext(postcontenttext);
            postInformation.setPosttime(posttime);
            postInformation.setPostuser(postuser);
            postService.postAdd(postInformation);
            //查询应得分数
            String rulename = "帖子发布";
            IntegralRule integralRule = integralService.rulescore(rulename);
//            System.out.println(integralRule);
            //增加分数
            int userintegral = userService.findintegral(username);
            userintegral = userintegral + integralRule.getRulescore();
            User user = new User();
            user.setUsername(username);
            user.setIntegral(userintegral);
            userService.updateintegral(user);
            //插入记录
            Integral integral = new Integral();
            integral.setIntegralname(integralRule.getRuleid());
            integral.setIntegralscore(integralRule.getRulescore());
            integral.setIntegraltime(posttime);
            integral.setIntegraluser(postuser);
            integralService.addintegral(integral);

            return "redirect:/postController/post_write";
        }
    }

    @RequestMapping("userpost_list")
    public String userPosetList(Model model, @CookieValue(value = "username", required = false) String username, @RequestParam(value = "getnowpage", required = false) Integer getnowpage, @RequestParam(value = "question", required = false) String question) {
        if (username != null) {
            FindUserPost findUserPost = new FindUserPost();
            //获取用户id
            int userid = userService.findId(username);
            //用户id
            findUserPost.setUserid(userid);
            //用户查询条件
            if (question != null) {
                findUserPost.setQuestion(question);
            }
            //设置每页数据条数
            int page = 10;
            //获取总页数
            int nowpage;
            int linenum = postService.alluserpost(findUserPost);
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
            if (allpagenum == 0) {
                nowpage = 1;
            }
            findUserPost.setNowpage(nowpage);
            findUserPost.setStartpage(nowpage * page - page);
            findUserPost.setEndpage(page);
            findUserPost.setPage(page);
            List<User> userpostlists = postService.findUserPost(findUserPost);
            model.addAttribute("allpagenum", allpagenum);
            model.addAttribute("nowpage", nowpage);
            model.addAttribute("page", page);
            model.addAttribute("userpostlists", userpostlists);
            List<List<NavF>> lists = navFService.findAll(0);
            model.addAttribute("lists", lists);
            model.addAttribute("username", username);
            return "userpost_list";
        } else {
            return "redirect:/userController/login";
        }
    }

    @RequestMapping("/classifyPost")
    public String classifyPost(Model model, @CookieValue(value = "username", required = false) String username, @RequestParam(value = "postnavs", required = false) Integer postnavs,
                               @RequestParam(value = "getnowpage", required = false) Integer getnowpage, @RequestParam(value = "question", required = false) String question) {
        if (username != null) {
            //导航条lists
            List<List<NavF>> lists = navFService.findAll(0);
            model.addAttribute("lists", lists);
            //分类查询条件
            FindUserPost findUserPost = new FindUserPost();
            //查询帖子id
            findUserPost.setPostnavs(postnavs);
            //查询条件
            if (question != null) {
                findUserPost.setQuestion(question);
            }
            //设置每页数据条数
            int page = 10;
            //获取总页数
            int nowpage;
            int linenum = postService.postnumbynavs(findUserPost);
            int allpagenum = (int) Math.ceil((double) linenum / (double) page);
            if (allpagenum == 0) {
                allpagenum = 1;
            }
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
            if (allpagenum == 0) {
                nowpage = 1;
            }
            findUserPost.setNowpage(nowpage);
            findUserPost.setStartpage((nowpage * page) - page);
            findUserPost.setEndpage(page);
            findUserPost.setPage(page);
            //分类内容
            List<PostInformation> classifyposts = postService.classifyPost(findUserPost);
            String navsname = postService.navsname(postnavs);
            model.addAttribute("navsname", navsname);
            model.addAttribute("allpagenum", allpagenum);
            model.addAttribute("nowpage", nowpage);
            model.addAttribute("page", page);
            model.addAttribute("classifyposts", classifyposts);
            model.addAttribute("username", username);
            return "classifyPost";
        } else {
            return "redirect:/userController/login";
        }
    }

    @RequestMapping("/postshow")
    public String postshow(Model model, int postid, @CookieValue(value = "username", required = false) String username, @CookieValue(value = "mark", required = false) String mark, @RequestParam(value = "recordpage", required = false) String recordpage) {
        if (username != null) {
            List<Reply> replyList = replyService.comments(postid);
            model.addAttribute("replyList", replyList);
            //递归存储
            Visit visit = new Visit();
            visit.preOrder(replyService.commentnull(postid));
            //递归查找并存储
            List<List<Reply>> replylists = visit.getLists();
            model.addAttribute("size", visit.getLists().size());
            Find find = new Find();
            for (Reply list : replylists.get(0)) {
                find.recursion(list, replylists.size(), replylists);
            }
            List<Reply> replies = find.getReplies();
            List<Last_User> lastUsers = replyService.finduser(replies);
            model.addAttribute("lastUsers", lastUsers);
            model.addAttribute("replies", replies);
            //获取到当前用户的id
            int userid = userService.findId(username);
            //获取当前帖子浏览量，页面刷新浏览量加一
            int postview = postService.findPostView(postid);
            postview = postview + 1;
            UpdateView updateView = new UpdateView();
            updateView.setPostid(postid);
            updateView.setCount(postview);
            postService.updateView(updateView);
            //查找帖子内容
            List<User> postinformation = postService.findById(postid);
            //跳转进入的界面
            model.addAttribute("recordpage", recordpage);
            //左侧导航栏
            List<List<NavF>> lists = navFService.findAll(Integer.parseInt(mark));
            model.addAttribute("userid", userid);
            model.addAttribute("postid", postid);
            model.addAttribute("lists", lists);
            model.addAttribute("postinformation", postinformation);
            model.addAttribute("username", username);
            CollectPost collectPost = new CollectPost();
            collectPost.setCollectuser(userid);
            collectPost.setCollectpost(postid);
            if (postService.collectfind(collectPost) == null) {
                model.addAttribute("collect", "1");
            } else {
                model.addAttribute("collect", "0");
            }
            return "post_show";
        } else {
            return "redirect:/userController/login";
        }
    }

    @RequestMapping("/postranking")
    public String postRanking(Model model, @CookieValue(value = "username", required = false) String username) {
        if (username != null) {
            FindUserPost findUserPost = new FindUserPost();
            int startpage = 0;
            int endpage = 20;
            findUserPost.setStartpage(startpage);
            findUserPost.setEndpage(endpage);
            //导航条lists
            List<List<NavF>> lists = navFService.findAll(0);
            model.addAttribute("lists", lists);
            //postranking
            List<User> postranking = postService.findRanking(findUserPost);
            model.addAttribute("postranking", postranking);
            model.addAttribute("username", username);
            return "post_ranking";
        } else {
            return "redirect:/userController/login";
        }
    }


    @RequestMapping("/collectAdd")
    @ResponseBody
    public String collectAdd(HttpServletRequest request, HttpServletResponse response) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowtime = sdf.format(date);
        CollectPost collectPost = new CollectPost();
        collectPost.setCollectuser(Integer.parseInt(request.getParameter("userid")));
        collectPost.setCollectpost(Integer.parseInt(request.getParameter("postid")));
        collectPost.setCollecttime(nowtime);
        if (postService.collectfind(collectPost) == null) {
            postService.collectadd(collectPost);
            return "0";
        } else {
            postService.collectdel(postService.collectfind(collectPost));
            return "1";
        }
    }

    @RequestMapping("/collectpost")
    public String collectpost(Model model, @CookieValue(value = "username", required = false) String username, @RequestParam(value = "getnowpage", required = false) Integer getnowpage) {
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
            int linenum = postService.collectnumbyuser(userid);
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
            if (allpagenum == 0) {
                nowpage = 1;
            }
            findUserPost.setUserid(userid);
            findUserPost.setNowpage(nowpage);
            findUserPost.setStartpage(nowpage * page - page);
            findUserPost.setEndpage(page);
            findUserPost.setPage(page);
            //分类内容
            List<CollectPost> collectPosts = postService.collectpost(findUserPost);
            model.addAttribute("allpagenum", allpagenum);
            model.addAttribute("nowpage", nowpage);
            model.addAttribute("page", page);
            model.addAttribute("collectPosts", collectPosts);
            model.addAttribute("username", username);
            return "collectpost";
        } else {
            return "redirect:/userController/login";
        }
    }

    @RequestMapping("/alter")
    public String alter(Model model, @RequestParam(value = "postid", required = false) String postid, @RequestParam(value = "serviceid", required = false) String serviceid, @CookieValue(value = "username", required = false) String username, @CookieValue(value = "mark") String mark) {
        if (username != null) {
            //userid
            int userid = userService.findId(username);
            model.addAttribute("userid", userid);
            int kind;
            if (mark.equals("0")) {
                //帖子种类
                kind = 11;
                //帖子信息
                List<User> userList = postService.findById(Integer.parseInt(postid));
                model.addAttribute("userList", userList);
                List<NavS> kinds = navFService.findKind(kind);
                List<NavS> kinds1 = navFService.findKind(9);
                kinds.addAll(kinds1);
                model.addAttribute("kinds", kinds);
            } else {
                kind = 16;
                List<PostInformation> postInformations = adminService.findById(Integer.parseInt(serviceid));
                model.addAttribute("postInformations", postInformations);
                List<NavS> kinds = navFService.findKind(kind);
                model.addAttribute("kinds", kinds);
            }
            //导航条lists
            List<List<NavF>> lists = navFService.findAll(Integer.parseInt(mark));
            model.addAttribute("lists", lists);
            return "alter";
        } else {
            return "redirect:/userController/login";
        }
    }

    @RequestMapping("/edit")
    public String edit(String servicetitle, String servicenavs, String servicecontent, @RequestParam(value = "postid", required = false) String postid,
                       @RequestParam(value = "serviceid", required = false) String serviceid, @RequestParam(value = "postcontenttext", required = false) String postcontenttext) {
        PostInformation postInformation = new PostInformation();
        postInformation.setPosttitle(servicetitle);
        postInformation.setPostnavs(Integer.parseInt(servicenavs));
        postInformation.setPostcontent(servicecontent);
        postInformation.setPostcontenttext(postcontenttext);
        if (postid != null) {
            postInformation.setPostid(Integer.parseInt(postid));
            postService.updatepost(postInformation);
            return "redirect:/postController/userpost_list";
        } else {
            postInformation.setPostid(Integer.parseInt(serviceid));
            adminService.updatenotice(postInformation);
            return "redirect:/adminController/servicelists";
        }

    }

    @RequestMapping("/daypost")
    public String daypost(Model model, @CookieValue(value = "username", required = false) String username, @CookieValue(value = "mark", required = false) String mark) {
        if (username != null) {
            List<List<NavF>> lists = navFService.findAll(Integer.parseInt(mark));
            model.addAttribute("lists", lists);
            model.addAttribute("username", username);
            FindUserPost findUserPost = new FindUserPost();
            int startpage = 0;
            int endpage = 5;
            findUserPost.setStartpage(startpage);
            findUserPost.setEndpage(endpage);
            findUserPost.setPostnavs(62);
            //postranking
            List<PostInformation> postInformations = postService.daypost(findUserPost);
            model.addAttribute("postInformations", postInformations);
            return "day_post";
        } else {
            return "redirect:/userController/login";
        }
    }

    @RequestMapping("daypostadd")
    public String daypostadd(@CookieValue("username") String username, String posttitle, String postcontent) {
        int postnavs = 62;
        PostInformation postInformation = new PostInformation();
        postInformation.setPosttitle(posttitle);
        postInformation.setPostnavs(postnavs);
        postInformation.setPostcontent(postcontent);
        int userid = userService.findId(username);
        Date nowtime = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        String posttime = simpleDateFormat.format(nowtime);
        postInformation.setPosttime(posttime);
        postInformation.setPostuser(userid);
        postService.postAdd(postInformation);
//        return "forward:daypost";
        return "redirect:/postController/daypost";
    }

    @ResponseBody
    @RequestMapping("/displaymore")
    public List<PostInformation> displaymore(HttpServletRequest request) {
        FindUserPost findUserPost = new FindUserPost();
        String startpage = request.getParameter("startpage");
        String endpage = request.getParameter("endpage");
        findUserPost.setStartpage(Integer.parseInt(startpage));
        findUserPost.setEndpage(Integer.parseInt(endpage));
        findUserPost.setPostnavs(62);
        //postranking
        List<PostInformation> postInformations = postService.daypost(findUserPost);
        return postInformations;
    }

    @ResponseBody
    @RequestMapping("/userpostdel")
    public void userpostdel(HttpServletRequest request) {
        String postid = request.getParameter("postid");
        postService.userpostdel(Integer.parseInt(postid));
    }

    @RequestMapping("/weekranking")
    public String weekranking(Model model, @CookieValue(value = "username", required = false) String username) {
        if (username != null) {
            FindUserPost findUserPost = new FindUserPost();
            int startpage = 0;
            int endpage = 20;
            findUserPost.setStartpage(startpage);
            findUserPost.setEndpage(endpage);
            //导航条lists
            List<List<NavF>> lists = navFService.findAll(0);
            model.addAttribute("lists", lists);
            //postranking
            List<PostInformation> weekrankings = postService.weekranking(findUserPost);
            model.addAttribute("weekrankings", weekrankings);
            model.addAttribute("username", username);
            return "week_ranking";
        } else {
            return "redirect:/userController/login";
        }
    }

    @RequestMapping("/weekmanito")
    public String weekmanito(Model model, @CookieValue(value = "username", required = false) String username) {
        if (username != null) {
            //导航条lists
            List<List<NavF>> lists = navFService.findAll(0);
            model.addAttribute("lists", lists);
            //本周牛人
            List<Integral> integrals = integralService.weekmanito();
            model.addAttribute("integrals", integrals);
            //当前时间
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String nowtime = sdf.format(date);
            //查询应得分数
            String rulename = "登本周牛人榜";
            IntegralRule integralRule = integralService.rulescore(rulename);
            //循环遍历以上榜名单
            for (Integral integral1 : integrals) {
                Integral integral = new Integral();
                integral.setIntegraluser(integral1.getUser().getId());
                integral.setIntegralname(integralRule.getRuleid());
                int countintegral = integralService.findexist(integral);
                if (countintegral == 0) {
                    System.out.println("jinlia");
                    //查询已有分数
                    int userintegral = userService.findintegralbyid(integral1.getUser().getId());
                    userintegral = userintegral + integralRule.getRulescore();
                    //增加积分
                    User user = new User();
                    user.setUsername(integral1.getUser().getUsername());
                    user.setIntegral(userintegral);
                    userService.updateintegral(user);
                    //插入记录
                    integral.setIntegraltime(nowtime);
                    integral.setIntegralscore(integralRule.getRulescore());
                    integralService.addintegral(integral);
                }
            }
            //username
            model.addAttribute("username", username);
            return "week_manito";
        } else {
            return "redirect:/userController/login";
        }
    }

    @RequestMapping("/postsearch")
    public String postsearch(Model model, @CookieValue(value = "username", required = false) String username, @RequestParam(value = "question", required = false) String question,
                             @RequestParam(value = "getnowpage", required = false) Integer getnowpage) {
        System.out.println(question);
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
            int linenum = postService.questionpostnum(question);
            int allpagenum = (int) Math.ceil((double) linenum / (double) page);
            Calpage calpage = new Calpage();
            nowpage = calpage.calpage(getnowpage, allpagenum);
            findUserPost.setQuestion(question);
            findUserPost.setNowpage(nowpage);
            findUserPost.setStartpage(nowpage * page - page);
            findUserPost.setEndpage(page);
            findUserPost.setPage(page);
            System.out.println(findUserPost);
            //分类内容
            List<PostInformation> postInformations = postService.questionpost(findUserPost);
            model.addAttribute("allpagenum", allpagenum);
            model.addAttribute("nowpage", nowpage);
            model.addAttribute("page", page);
            model.addAttribute("postInformations", postInformations);
            model.addAttribute("username", username);
            return "post_search";
        } else {
            return "redirect:/userController/login";
        }
    }


}
