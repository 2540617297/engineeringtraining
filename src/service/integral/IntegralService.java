package service.integral;

import dao.integral.IntegralDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.integral.Integral;
import po.integral.IntegralRule;

import java.util.List;

@Service("integralService")
public class IntegralService {
    @Autowired
    IntegralDao integralDao;

    public IntegralRule rulescore(String rulename){
        return integralDao.rulescore(rulename);
    }

    public void addintegral(Integral integral){
        integralDao.addintegral(integral);
    }

    public int findexist(Integral integral){
        return integralDao.findexist(integral);
    }

    public List<Integral> weekmanito(){
        return integralDao.weekmanito();
    }
}
