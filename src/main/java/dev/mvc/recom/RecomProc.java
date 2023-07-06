package dev.mvc.recom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.recom.RecomProc")
public class RecomProc implements RecomProcInter{
  @Autowired
  public RecomDAOInter recomDAO;

  @Override
  public RecomVO read(int memberno) {
    RecomVO recomVO = this.recomDAO.read(memberno);
    return recomVO;
  }






  
  
  

  
}