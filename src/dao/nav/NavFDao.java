package dao.nav;

import po.nav.NavF;
import po.nav.NavS;

import java.util.List;

public interface NavFDao {
    public List<NavF> findAll(int navfid);

    public List<NavF> findNavf(int mark);

    public List<NavS> findKind(int nfid);
}
