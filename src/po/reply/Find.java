package po.reply;

import java.util.ArrayList;
import java.util.List;

public class Find {
    List<Reply> replies=new ArrayList<>();

    public List<Reply> getReplies(){
        return replies;
    }

    public void recursion(Reply list, int size, List<List<Reply>> reqlyLists){
        replies.add(list);
        for(int i=1;i<size;i++) {
            for(Reply list1:reqlyLists.get(i)) {
                if (list1.getLastid()== list.getReplyid()){
                    recursion(list1,size,reqlyLists);
                }
            }
        }

    }
}
