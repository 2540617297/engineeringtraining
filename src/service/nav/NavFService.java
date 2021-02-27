package service.nav;

import dao.nav.NavFDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import po.nav.NavF;
import po.nav.NavS;

import java.util.ArrayList;
import java.util.List;

@Service("navFService")
public class NavFService {
    @Autowired
    NavFDao navFDao;

    public List<NavS> findKind(int nfid){
        return navFDao.findKind(nfid);
    }

    public List<NavF> findNavf(int mark){
        return navFDao.findNavf(mark);

    }
    public List findNavs(int id){
        return navFDao.findAll(id);
    }
    public List<List<NavF>> findAll(int mark){
        List<NavF> listNavf=findNavf(mark);
        List<List<NavF>> lists=new ArrayList<>();
        for (NavF listAll:listNavf) {
             lists.add(findNavs(listAll.getNavfid()));
//            System.out.println(listAll.getNavfid());
        }
        return lists;
    }
}
