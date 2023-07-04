package dev.mvc.good;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.GoodProc")
public class GoodProc implements GoodProcInter {
  @Autowired
  private GoodDAOInter goodDAO;

  @Override
  public int goodcheck(GoodVO goodVO) {
    int cnt = this.goodDAO.goodcheck(goodVO);
    return cnt;
  }

  @Override
  public int create(GoodVO goodVO) {
    int cnt = this.goodDAO.create(goodVO);
    return cnt;
  }

  @Override
  public GoodVO read(int guin_cno) {
    GoodVO goodVO = this.goodDAO.read(guin_cno);
    return goodVO;
  }

  @Override
  public int delete_good(GoodVO goodVO) {
    int cnt = this.goodDAO.delete_good(goodVO);
    return cnt;
  }

  @Override
  public ArrayList<GoodVO> list_all(GoodVO goodVO) {
    ArrayList<GoodVO> list = this.goodDAO.list_all(goodVO);
    return list;
  }
}
