package dev.mvc.recom;

import javax.servlet.http.HttpSession;

public interface RecomProcInter{
  
  /**
   * 조회
   * @param recomno
   * @return
   */
  public RecomVO read(int memberno);


}