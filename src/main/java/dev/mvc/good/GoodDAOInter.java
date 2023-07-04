package dev.mvc.good;

import java.util.ArrayList;

import dev.mvc.like_guin.Like_guinVO;

public interface GoodDAOInter {

  /**
   * 중복 좋아요 검사
   * @param id
   * @return
   */
  public int goodcheck(GoodVO goodVO);
  
  /**
   * 좋아요 등록
   * @param goodVO
   * @return
   */
  public int create(GoodVO goodVO);
  
  /**
   * 좋아요한 구인 조회
   * @param guin_cno
   * @return
   */
  public GoodVO read(int guin_cno);
  
  /**
   * 좋아요 취소
   * @param 
   * @return
   */
  public int delete_good(GoodVO goodVO);
  
  /**
   * 좋아요한 구인 목록
   * 
   * @return
   */
  public ArrayList<GoodVO> list_all(GoodVO goodVO);
}
