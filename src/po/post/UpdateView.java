package po.post;

public class UpdateView {
    private int count;
    private int postid;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }



    public int getPostid() {
        return postid;
    }

    public void setPostid(int postid) {
        this.postid = postid;
    }

    @Override
    public String toString() {
        return "UpdateView{" +
                "count=" + count +
                ", postid=" + postid +
                '}';
    }
}
