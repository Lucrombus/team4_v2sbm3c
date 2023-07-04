package dev.mvc.score;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.ScoreProc")
public class ScoreProc implements ScoreProcInter {
  @Autowired
  private ScoreDAOInter scoreDAO;

  @Override
  public int scorecheck(ScoreVO scoreVO) {
    int cnt = this.scoreDAO.scorecheck(scoreVO);
    return cnt;
  }
  @Override
  public int create(ScoreVO goodVO) {
    int cnt = this.scoreDAO.create(goodVO);
    return cnt;
  }
  @Override
  public ArrayList<ScoreVO> list_all(ScoreVO scoreVO) {
    ArrayList<ScoreVO> list = this.scoreDAO.list_all(scoreVO);
    return list;
  }


}
