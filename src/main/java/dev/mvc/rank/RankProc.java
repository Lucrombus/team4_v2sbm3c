package dev.mvc.rank;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.rank.RankProc") // Controller가 사용하는 이름
public class RankProc implements RankProcInter {
  @Autowired
  private RankDAOInter rankDAO; // Spring이 CateDAOInter.java를 구현하여 객체를 자동 생성후 할당
  
  @Override
  public int create(RankVO rankVO) {
    int cnt = this.rankDAO.create(rankVO); // Spring이 자동으로 구현한 메소드를 호출
    return cnt;
  }

  @Override
  public ArrayList<RankVO> list_all() {
    ArrayList<RankVO> list = this.rankDAO.list_all();
    return list;
  }

  @Override
  public RankVO read(int rankno) {
    RankVO rankVO = this.rankDAO.read(rankno);
    return rankVO;
  }
  
  @Override
  public int update(RankVO rankVO) {
    int cnt = this.rankDAO.update(rankVO);
    return cnt;
  }

  @Override
  public int delete(int rankno) {
    int cnt = this.rankDAO.delete(rankno);
    return cnt;
  }
}





