package po.reply;

import java.util.ArrayList;
import java.util.List;

public class Tree {
    private List<Reply> data;
    private List<Tree> childs;
    public Tree(){
        data=null;
        childs=new ArrayList<>();
        childs.clear();
    }
    public Tree(List<Reply> data){
        this.data=data;
        childs=new ArrayList<>();
        childs.clear();
    }
    public void addNode(Tree tree){
        childs.add(tree);

    }

    public Tree getFirstChild(int i){
        return childs.get(i);
    }

    public boolean isLeaf(){
        if(childs.isEmpty()){
            return true;
        }
        return false;
    }

    public Tree root(){
        return this;
    }

    public void setRootData(List<Reply> data){
        this.data=data;
    }

    public List<Reply> getRootData(){
        return data;
    }

    public boolean isEmpty() {
        if(childs.isEmpty() && data == null)
            return true;
        return false;
    }

    public List<Tree> getChilds() {
        return childs;
    }





}
