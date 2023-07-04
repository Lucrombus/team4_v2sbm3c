package dev.mvc.good;

public interface GoodDAOInter {

  /**
   * 중복 좋아요 검사
   * @param id
   * @return
   */
  public int GoodCheck(String id);
  
  /**
   * 좋아요 등록
   * @param goodVO
   * @return
   */
  public int create(GoodVO goodVO);
}
