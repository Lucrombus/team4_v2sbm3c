package dev.mvc.report_c;

import java.util.ArrayList;

public interface Report_cDAOInter {

  /**
   * 컨텐츠 신고 등록
   * @param Report_mVO
   * @return
   */
  public int create(Report_cVO report_cVO);
  
  /**
   * 회원별 컨텐츠 신고 목록
   * @param memberno
   * @return 전체목록을 ArrayList<ResumeVO>로 리턴
   */
  public ArrayList<Report_cVO> list_all_by_memberno(int memberno);
  
  /**
   * 관리자용 컨텐츠 신고 목록 전체
   * @param 
   * @return 전체목록을 ArrayList<ResumeVO>로 리턴
   */
  public ArrayList<Report_cVO> list_all();
  
  /**
   * 신고 글 조회
   * @return
   */
  public Report_cVO read(int reportno);
  
  
  /**
   * 신고 글 삭제
   * @return
   */
  public int delete(int reportno);
  
  /**
   * 신고 글 수정
   * @return
   */
  public int update(Report_cVO report_cVO);
}
