package controller.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import po.integral.Integral;
import po.integral.IntegralRule;
import po.reply.Reply;
import po.user.User;
import service.integral.IntegralService;
import service.reply.ReplyService;
import service.user.UserService;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/replyController")
public class ReplyController {

    @Autowired
    ReplyService replyService;
    @Autowired
    UserService userService;
    @Autowired
    IntegralService integralService;

    @RequestMapping("/addreply")
    public String addreply(String userid, String postid, @RequestParam(value = "lastid", required = false) String lastid, String replycontent,
                           @CookieValue(value = "username", required = false) String username, @RequestParam(value = "recordpage", required = false) String recordpage) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String replytime = sdf.format(date);
        Reply reply = new Reply();
        Integer reallastid;
        if (lastid == null || lastid == "") {
            reallastid = null;
        } else {
            reallastid = Integer.valueOf(lastid);
        }
        reply.setLastid(reallastid);
        reply.setPostid(Integer.parseInt(postid));
        reply.setReplycontent(replycontent);
        reply.setUserid(Integer.parseInt(userid));
        reply.setReplytime(replytime);
        replyService.addreply(reply);
        //查询已有分数
        int userintegral = userService.findintegral(username);
        //查询应得分数
        String rulename = "评论帖子";
        IntegralRule integralRule = integralService.rulescore(rulename);
        //判断字数是否符合加分要求
        if (replycontent.length() > 15) {
            Integral integral = new Integral();
            integral.setIntegralpost(Integer.parseInt(postid));
            integral.setIntegraluser(Integer.parseInt(userid));
            integral.setIntegralname(integralRule.getRuleid());
            int countintegral = integralService.findexist(integral);
            if (countintegral == 0) {
                //增加积分
                userintegral = userintegral + integralRule.getRulescore();
                User user = new User();
                user.setUsername(username);
                user.setIntegral(userintegral);
                userService.updateintegral(user);
                //插入记录
                integral.setIntegraltime(replytime);
                integral.setIntegralscore(integralRule.getRulescore());
                integralService.addintegral(integral);
            }
        }
        return "redirect:/postController/postshow?postid=" + postid + "&recordpage=" + recordpage;
    }
}
