package dev.mvc.guin_c;

import java.util.ArrayList;


public interface Guin_cProcInter {
  
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
  
  /** 
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param cateno          카테고리번호 
   * @param search_count  검색(전체) 레코드수 
   * @param now_page      현재 페이지
   * @param word 검색어
   * @return 페이징 생성 문자열
   */ 
  public String pagingBox(int typeno, int search_count, int now_page, String word, String list_file);


  


}
