package dev.mvc.good;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.GoodProc")
public class GoodProc implements GoodProcInter {
  @Autowired
  private GoodDAOInter goodDAO;

  @Override
  public int GoodCheck(String id) {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public int create(GoodVO goodVO) {
    // TODO Auto-generated method stub
    return 0;
  }

}
