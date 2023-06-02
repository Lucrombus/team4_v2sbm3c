package dev.mvc.jobcate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.jobcate.JobcateProc")
public class JobcateProc implements JobcateProcInter {
  
  @Autowired
  private JobcateDAOInter jobcateDAO;
  
  public JobcateProc() {
    //System.out.println("JobcateProc Created");
  }
  
  
  @Override
  public int create(JobcateVO jobcateVO) { 
    
    int cnt = this.jobcateDAO.create(jobcateVO); 
    return cnt;
  }
  

}
