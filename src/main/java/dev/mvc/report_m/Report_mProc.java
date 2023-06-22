package dev.mvc.report_m;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.report_m.Report_mProc")
public class Report_mProc implements Report_mProcInter{
  
  @Autowired
  private Report_mDAOInter report_mDAO;

  @Override
  public int create(Report_mVO report_mVO) {
    int cnt = this.report_mDAO.create(report_mVO); 
    return cnt;
  }

  @Override
  public ArrayList<Report_mVO> list_all_by_memberno(int memberno) {
    ArrayList<Report_mVO> list = this.report_mDAO.list_all_by_memberno(memberno);
    return list;
  }

  @Override
  public ArrayList<Report_mVO> list_all() {
    ArrayList<Report_mVO> list = this.report_mDAO.list_all();
    return list;
  }

  @Override
  public Report_mVO read(int reportno) {
    Report_mVO report_mVO = this.report_mDAO.read(reportno);
    return report_mVO;
  }

  @Override
  public int delete(int reportno) {
    int cnt = this.report_mDAO.delete(reportno);
    return cnt;
  }

}
