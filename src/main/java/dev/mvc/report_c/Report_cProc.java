package dev.mvc.report_c;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.report_c.Report_cProc")
public class Report_cProc implements Report_cProcInter{
  
  @Autowired
  private Report_cDAOInter report_cDAO;

  @Override
  public int create(Report_cVO report_cVO) {
    int cnt = this.report_cDAO.create(report_cVO); 
    return cnt;
  }

  @Override
  public ArrayList<Report_cVO> list_all_by_memberno(int memberno) {
    ArrayList<Report_cVO> list = this.report_cDAO.list_all_by_memberno(memberno);
    return list;
  }

  @Override
  public ArrayList<Report_cVO> list_all() {
    ArrayList<Report_cVO> list = this.report_cDAO.list_all();
    return list;
  }

  @Override
  public Report_cVO read(int reportno) {
    Report_cVO report_cVO = this.report_cDAO.read(reportno);
    return report_cVO;
  }

  @Override
  public int delete(int reportno) {
    int cnt = this.report_cDAO.delete(reportno);
    return cnt;
  }

  @Override
  public int update(Report_cVO report_cVO) {
    int cnt = this.report_cDAO.update(report_cVO);
    return cnt;
  }

}
