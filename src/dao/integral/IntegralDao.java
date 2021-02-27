package dao.integral;


import po.integral.Integral;
import po.integral.IntegralRule;
import po.post.FindUserPost;

import java.util.List;

public interface IntegralDao {
    public IntegralRule rulescore(String rulename);
    public void addintegral(Integral integral);
    public int findexist(Integral integral);
    public List<Integral> weekmanito();


}
