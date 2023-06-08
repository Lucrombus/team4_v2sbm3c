package dev.mvc.guin_c;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.jobcate.JobcateVO;
import dev.mvc.tool.Tool;

@Component("dev.mvc.guin_c.Guin_cProc")
public class Guin_cProc implements Guin_cProcInter {
  @Autowired
  private Guin_cDAOInter guin_cDAO;
  
  @Override
  public int create(Guin_cVO guin_cVO) { 
    
    int cnt = this.guin_cDAO.create(guin_cVO); 
    return cnt;
  }

 

}