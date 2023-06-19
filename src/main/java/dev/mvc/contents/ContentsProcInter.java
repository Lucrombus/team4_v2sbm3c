package dev.mvc.contents;

import java.util.ArrayList;

public interface ContentsProcInter {
  
  /**
   * 등록
   * @param NoticeVO
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
