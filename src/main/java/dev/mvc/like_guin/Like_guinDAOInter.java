package dev.mvc.like_guin;

import java.util.ArrayList;

public interface Like_guinDAOInter {
    
  /**
   * 문의 글 등록
   * @param inquiryVO
   * @return
   */
  public int create(Like_guinVO like_guinVO);
  
  /**
   * 관심 구인 목록
   * 
   * @return
   */
  public ArrayList<Like_guinVO> list_like_guin(int memberno);
  
  /**
   * 문의 글 삭제 처리
   * @param inquiryno
   * @return
   */
  public int delete(int like_guinno);
  
}