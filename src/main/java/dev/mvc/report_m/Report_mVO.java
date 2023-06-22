package dev.mvc.report_m;

public class Report_mVO {
  
  private int reportno;
  private int memberno;
  private int target_mno;
  private String title;
  private String reason;
  private String rdate;
  
  private int start_num;
  private int end_num;
  private int now_page = 1;
  
  
  
  public int getReportno() {
    return reportno;
  }
  public void setReportno(int reportno) {
    this.reportno = reportno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public int getTarget_mno() {
    return target_mno;
  }
  public void setTarget_mno(int target_mno) {
    this.target_mno = target_mno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getReason() {
    return reason;
  }
  public void setReason(String reason) {
    this.reason = reason;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public int getStart_num() {
    return start_num;
  }
  public void setStart_num(int start_num) {
    this.start_num = start_num;
  }
  public int getEnd_num() {
    return end_num;
  }
  public void setEnd_num(int end_num) {
    this.end_num = end_num;
  }
  public int getNow_page() {
    return now_page;
  }
  public void setNow_page(int now_page) {
    this.now_page = now_page;
  }
  
  
  
  
  
}
