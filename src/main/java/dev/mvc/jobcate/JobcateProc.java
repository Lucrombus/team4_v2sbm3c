package dev.mvc.jobcate;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.jobcate.JobcateProc")
public class JobcateProc implements JobcateProcInter {
  
  @Autowired
  private JobcateDAOInter jobcateDAO;
  
  
  @Override
  public int create(JobcateVO jobcateVO) { 
    
    int cnt = this.jobcateDAO.create(jobcateVO); 
    return cnt;
  }
  
  @Override
  public JobcateVO read(int jobcateno){
    
    JobcateVO jobcateVO = this.jobcateDAO.read(jobcateno);
    return jobcateVO;
  }
  
  @Override
  public ArrayList<JobcateVO> list_all(){
    
    ArrayList<JobcateVO> list = this.jobcateDAO.list_all();
    return list;
  }
  
  @Override
  public int delete(int jobcateno){
    
    int cnt = this.jobcateDAO.delete(jobcateno);
    return cnt;
  }
  

}
