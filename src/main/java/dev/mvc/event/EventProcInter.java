package dev.mvc.event;

import java.util.ArrayList;

public interface EventProcInter {
  
  /**
   * 이벤트 등록
   * @param EventVO
   * @return
   */
  public int create(EventVO eventVO);
  
  /**
   * 검색된 레코드 갯수 리턴
   * @param eventVO
   * @return
   */
  public int search_count(EventVO eventVO);
  
  /**
   *  검색 + 페이징된 글목록
   *  spring framework이 JDBC 관련 코드를 모두 생성해줌
   * @return
   */
  public ArrayList<EventVO> list_all_search_paging(EventVO eventVO);
  
  /** 
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param now_page      현재 페이지
   * @param word 검색어
   * @param list_file 목록 파일명 
   * @return 페이징 생성 문자열
   */ 
  public String pagingBox(int now_page, String word, String list_file);
  
  /**
   * 이벤트 조회
   * @return
   */
  public EventVO read(int eventno);
  
  /**
   * 이벤트 글 수정
   * @return
   */
  public int update_text(EventVO eventVO);
  
  /**
   * 이벤트 파일 수정
   * @return
   */
  public int update_file(EventVO eventVO);
  
  /**
   * 이벤트 삭제
   * @return
   */
  public int delete(int eventno);
  
  

}
