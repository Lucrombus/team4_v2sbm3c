package dev.mvc.like_guin;

import java.util.ArrayList;

public interface Like_guinDAOInter {
  
  /**
   * 문의 글 등록
   * @param Like_guinVO
   * @return
   */
  public int create(Like_guinVO like_guinVO);
  
  /**
   * 이미 관심등록 했는지 확인
   * @param Like_guinVO
   * @return
   */
  public int check(Like_guinVO like_guinVO);
  
  /**
   * 관싱등록한거 삭제
   * @param 
   * @return
   */
  public int delete_mine(Like_guinVO like_guinVO);
  
  /**
   * 나의 관심 구인 목록
   * 
   * @return
   */
  public ArrayList<Like_guinVO> list_mine(int memberno);
  
}
