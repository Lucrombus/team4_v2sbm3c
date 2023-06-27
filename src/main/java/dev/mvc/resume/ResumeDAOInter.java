package dev.mvc.resume;

import java.util.ArrayList;

import dev.mvc.contents.ContentsVO;


public interface ResumeDAOInter {
  
  /**
   * 이력서 등록
   * @param ResumeVO
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
   * @return 전체목록을 ArrayList<ResumeVO>로 리턴
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

}
