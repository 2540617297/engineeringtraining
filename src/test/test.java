package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import other.RemoveHtml;
import po.reply.Reply;
import po.reply.Visit;
import po.reply.Find;
import service.reply.ReplyService;

import java.util.*;

public class test {
/*    public static void main(String[] args) throws Exception{
        String text = "http://192.168.1.7:8080/classdesign/pages/all_admin_index.jsp";//二维码的内容
        int width = 400;
        int height = 400;
        String format = "png";
        Hashtable hints= new Hashtable();
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
        BitMatrix bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, width, height,hints);
        File outputFile = new File("F:\\Desktop\\zxing\\out/shuchu.png");
        MatrixToImageWriter.writeToFile(bitMatrix, format, outputFile);
        System.out.println("It is ok!");
    }*/
/*    public static void main(String[] args) {
        ApplicationContext ctx=new ClassPathXmlApplicationContext("config/applicationContext.xml");
*//*        NavFService navFService= (NavFService) ctx.getBean("navFService");
        List<NavF> navflist=navFService.findNavf();
        System.out.println(navflist);*//*
        NavFService navFService= (NavFService) ctx.getBean("navFService");
        List<List<NavF>> navflist=navFService.findAll(1);
        System.out.println(navflist.size());
        for (List<NavF> lists :
                navflist) {
//            System.out.println(lists.get(0).getNavss());
            System.out.println(lists.size());
            System.out.println(lists);
        }*/
       /* public static void main(String[] args) throws ParseException {
           *//* ApplicationContext ctx=new ClassPathXmlApplicationContext("config/applicationContext.xml");
            PostService postService= (PostService) ctx.getBean("postService");
            FindUserPost findUserPost=new FindUserPost();
            int startpage=0;
            int endpage=20;
            findUserPost.setStartpage(startpage);
            findUserPost.setEndpage(endpage);
           List<User> postranking=postService.findRanking(findUserPost);
            Iterator it=postranking.iterator();
            while (it.hasNext()){
                PostInformation postInformation= (PostInformation) it.next();
                System.out.println(postInformation);
            }*//*
            *//*int a=1;
            int b=3;
            int allpagenum= (int) Math.ceil((double)3/(double)1);
            System.out.println(allpagenum);*//*
           *//* ApplicationContext ctx=new ClassPathXmlApplicationContext("config/applicationContext.xml");
            PostDao postDao= (PostDao) ctx.getBean("postDao");
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
            System.out.println("相差时间数（秒）："+diff);*//*

        }*/
/*public static void main(String[] args) {
    Reply reply=new Reply();
    Integer user=null;
    reply.setLastid(user);
    Integer.valueOf(null);
    System.out.println(reply);
}*/


    /*public static void main(String[] args) {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("config/applicationContext.xml");
        ReplyService replyService = (ReplyService) ctx.getBean("replyService");
        replyService.commentnull(12);
        Visit visit = new Visit();
        visit.preOrder(replyService.commentnull(12));
        List<List<Reply>> lists=visit.getLists();
        for (Reply list :
                visit.getLists().get(0)) {
            System.out.println(list);
            Find find=new Find();
            find.recursion(list,visit.getLists().size(),lists);

        }

    }*/
    public static void main(String[] args) {
        String html="<p>欢迎使用IT社区！</p><p><br></p>&nbsp;";
        System.out.println(html.replaceAll("&nbsp;",""));

    }


    }


