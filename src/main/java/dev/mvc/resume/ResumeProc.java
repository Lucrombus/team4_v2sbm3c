package dev.mvc.resume;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.notice.NoticeVO;

@Component("dev.mvc.resume.ResumeProc")
public class ResumeProc implements ResumeProcInter {
  
  @Autowired
  private ResumeDAOInter resumeDAO;

  @Override
  public int create(ResumeVO resumeVO) { 
    
    int cnt = this.resumeDAO.create(resumeVO); 
    return cnt;
  }
  
  @Override
  public ArrayList<ResumeVO> list_all() {
    ArrayList<ResumeVO> list = this.resumeDAO.list_all();
    return list;
  }
  
  @Override
  public ResumeVO read(int resumeno) {
    ResumeVO resumeVO = this.resumeDAO.read(resumeno);
    return resumeVO;
    
  }
  
  @Override
  public int update_text(ResumeVO resumeVO) {
    int cnt = this.resumeDAO.update_text(resumeVO);
    return cnt;
  }

  @Override
  public int update_file(ResumeVO resumeVO) {
      int cnt = this.resumeDAO.update_file(resumeVO);
      return cnt;
  }

  @Override
  public int delete(int resumeno) {
    int cnt = this.resumeDAO.delete(resumeno);
    return cnt;
  }

}
