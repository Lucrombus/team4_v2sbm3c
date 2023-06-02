package dev.mvc.jobcate;

import java.util.HashMap;

public interface JobcateProcInter {
 
  
  /**
   * 등록
   * 
   * @param jobcateVO
   * @return insert 태그가 추가한 레코드 갯수를 리턴
   */
  public int create(JobcateVO jobcateVO);

  
  
}
