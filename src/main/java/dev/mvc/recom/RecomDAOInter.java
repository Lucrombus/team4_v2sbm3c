package dev.mvc.recom;

public interface RecomDAOInter{
  
  
  /**
   * 조회
   * @param recomno
   * @return
   */
  public RecomVO read(int memberno);
  
}