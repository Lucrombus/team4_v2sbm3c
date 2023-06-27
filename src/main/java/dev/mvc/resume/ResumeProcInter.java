package dev.mvc.resume;

import java.util.ArrayList;

public interface ResumeProcInter {
  
  /**
   * 이력서 등록
   * @param NoticeVO
   * @return
   */
  public int create(ResumeVO resumeVO);
  
  /**
   * 검색된 레코드 갯수 리턴
   * @return
   */
  public int search_count(ResumeVO resumeVO);
  
  /**
   * 카테고리별 검색 + 페이징된 글목록
   * @return
   */
  public ArrayList<ResumeVO> list_by_memberno_search_paging(ResumeVO resumeVO);
  
  /**
   * 이력서 전체 목록
   * @param 
   * @return 전체목록을 ArrayList<NoticeVO>로 리턴
   */
  public ArrayList<ResumeVO> list_all(int memberno);
  
  /**
   * 이력서 조회
   * @return
   */
  public ResumeVO read(int resumeno);
  
  /**
   * 이력서 글 수정
   * @return
   */
  public int update_text(ResumeVO resumeVO);
  
  /**
   * 이력서 파일 수정
   * @return
   */
  public int update_file(ResumeVO resumeVO);
  
  /**
   * 이력서 삭제
   * @return
   */
  public int delete(int resumeno);
  
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
  public String pagingBox(int memberno, int now_page, String wantjob, String list_file);

}
