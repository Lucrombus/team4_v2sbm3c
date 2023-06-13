package dev.mvc.guin_c;

import java.util.ArrayList;

public interface Guin_cDAOInter {
  
  /**
   * 등록
   * @param Guin_cVO
   * @return
   */
  public int create(Guin_cVO guin_cVO);
  
  
  /**
   * 검색된 레코드 갯수 리턴
   * @return
   */
  public int search_count(Guin_cVO guin_cVO);
  
  /**
   * 카테고리별 검색 + 페이징된 글목록
   * @return
   */
  public ArrayList<Guin_cVO> list_by_jobcateno_search_paging(Guin_cVO guin_cVO);
  
  

}
