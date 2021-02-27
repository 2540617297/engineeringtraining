package controller.other;

public class Calpage {
    public Calpage() {
    }

    public int calpage(Integer getnowpage, int allpagenum) {
        int nowpage;
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
        return nowpage;
    }
}
