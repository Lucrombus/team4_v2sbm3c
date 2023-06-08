package dev.mvc.resume;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.resume.ResumeProc")
public class ResumeProc implements ResumeProcInter {
  
  @Autowired
  private ResumeDAOInter resumeDAO;

  /** 이력서 등록 */
  @Override
  public int create(ResumeVO resumeVO) {
    int cnt = this.resumeDAO.create(resumeVO);
    return cnt;
  }
  
  /** 이력서 전체 목록 */
  @Override
  public ArrayList<ResumeVO> list_all() {
    ArrayList<ResumeVO> list = this.resumeDAO.list_all();
    return list;
  }
  
  /** 이력서 조회 */
  @Override
  public ResumeVO read(int resumeno) {
    ResumeVO resumeVO = this.resumeDAO.read(resumeno);
    return resumeVO;
  }
  
  /** 삭제 */
  @Override
  public int delete(int resumeno) {
    int cnt = this.resumeDAO.delete(resumeno);
    return cnt;
  }
  
  /** 수정 */
  @Override
  public int update(ResumeVO resumeVO) {
    int cnt = this.resumeDAO.update(resumeVO);
    return 0;
  }

}
