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
   * 이력서 전체 목록
   * @param 
   * @return 전체목록을 ArrayList<NoticeVO>로 리턴
   */
  public ArrayList<ResumeVO> list_all();
  
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
