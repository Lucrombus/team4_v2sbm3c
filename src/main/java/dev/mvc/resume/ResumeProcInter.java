package dev.mvc.resume;

import java.util.ArrayList;

public interface ResumeProcInter {
  
  /**
   * 이력서 등록
   * @param resumeVO
   * @return insert 태그가 추가한 레코드 갯수를 리턴
   */
  public int create(ResumeVO resumeVO);
  
  /**
   * 이력서 전체 목록
   * @param 
   * @return 전체목록을 ArrayList<ResumeVO>로 리턴
   */
  public ArrayList<ResumeVO> list_all();
  
  /**
   * 이력서 조회
   * @param resumeno
   * @return ResumeVO
   */
  public ResumeVO read(int resumeno);
  
  /**
   * 삭제
   * @param resumeno
   * @return int(삭제된 레코드 갯수 리턴)
   */
  public int delete(int resumeno);
  
  /**
   * 수정
   * @param resumeVO
   * @return int(수정된 레코드 갯수 리턴)
   */
  public int update(ResumeVO resumeVO);

}
