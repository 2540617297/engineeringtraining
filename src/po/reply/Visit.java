package po.reply;

import java.util.ArrayList;
import java.util.List;

public class Visit {

    List<List<Reply>> lists=new ArrayList<>();

    public List<List<Reply>> getLists(){
        return  lists;
    }
    public void preOrder(Tree root) {
        if(!root.isEmpty()) {
            lists.add(root.getRootData());
            for(Tree child : root.getChilds()) {
                if(child != null) {
                    preOrder(child);
                }
            }
        }
    }
}
