package dev.mvc.contents;

import java.util.ArrayList;


public interface ContentsDAOInter {
  
  /**
   * 등록
   * @param ContentsVO
   * @return
   */
  public int create(ContentsVO contentsVO);
  
  
  /**
   * 검색된 레코드 갯수 리턴
   * @return
   */
  public int search_count(ContentsVO contentsVO);
  
  /**
   * 카테고리별 검색 + 페이징된 글목록
   * @return
   */
  public ArrayList<ContentsVO> list_by_boardno_search_paging(ContentsVO contentsVO);
  
  /**
   * 조회
   * @return
   */
  public ContentsVO read(int boardno);
  
  /**
   * 수정
   * @return
   */
  public int update(ContentsVO contentsVO);
  
  /**
   * 삭제
   * @return
   */
  public int delete(int contentsno);
  
  /**
   * 검색된 레코드 갯수 리턴
   * @return
   */
  public int count_by_boardno(int boardno);
  
  /**
   * 일괄삭제
   * @return
   */
  public int delete_all(int boardno);
  
  

}
