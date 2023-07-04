package dev.mvc.score;

import java.util.ArrayList;

public interface ScoreDAOInter {

  /**
   * 중복 평점 검사
   * @param id
   * @return
   */
  public int scorecheck(ScoreVO scoreVO);
  
  /**
   * 평점 등록
   * @param goodVO
   * @return
   */
  public int create(ScoreVO goodVO);
  
  /**
   * 평점된 구인 목록
   * @param scoreVO
   * @return
   */
  public ArrayList<ScoreVO> list_all(ScoreVO scoreVO);
}
