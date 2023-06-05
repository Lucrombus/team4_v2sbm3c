package dev.mvc.jobcate;

import java.util.ArrayList;
import java.util.HashMap;

public interface JobcateProcInter {
 
  
  /**
   * 등록
   * 
   * @param jobcateVO
   * @return insert 태그가 추가한 레코드 갯수를 리턴
   */
  public int create(JobcateVO jobcateVO);
  
  /**
   * 조회
   * 
   * @return JobcateVO
   */
  public JobcateVO read(int jobcateno);
  
  /**
   * 조회: 목록
   * 
   * @return 전체목록을 ArrayList<JobcateVO>로 리턴
   */
  public ArrayList<JobcateVO> list_all();
  
  /**
   * 삭제
   * 
   * @return 삭제된 레코드 갯수 리턴
   */
  public int delete(int jobcateno);
  
  /**
   * 수정
   * 
   * @return 수정된 레코드 갯수 리턴
   */
  public int update(JobcateVO jobcateVO);
  
  /**
   * 수정
   * 
   * @return 수정된 레코드 갯수 리턴
   */
  public int update_seqno_increase(int jobcateno);
  
  /**
   * 수정
   * 
   * @return 수정된 레코드 갯수 리턴
   */
  public int update_seqno_decrease(int jobcateno);
  
  /**
   * 수정: 공개
   * 
   * @return 수정된 레코드 갯수 리턴
   */
  public int update_visible_y(int jobcateno);
  
  /**
   * 수정: 비공개
   * 
   * @return 수정된 레코드 갯수 리턴
   */
  public int update_visible_n(int jobcateno);
  

  
  
}
