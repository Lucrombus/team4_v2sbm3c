package dev.mvc.report;

import org.springframework.web.multipart.MultipartFile;

public class reportVO {
   

    /** 신고번호 */
    private int reportno;
    /** 회원번호 (신고자) */
    private int memberno;
    /** 신고사유 */
    private String reason;
    /** 대상 URL */
    private String targetURL;
    /** 컨텐츠 번호 */
    private int contentsno;
   
    public int getreportno() {
        return reportno;
    }
    public void setreportno(int reportno) {
        this.reportno = reportno;
    }
    public int getmemberno() {
      return reportno;
    }
    public void setmemberno(int memberno) {
      this.memberno = memberno;
    }
    public String  reason() {
        return  reason;
    }
    public void setreason(String reason) {
        this.reason = reason;
    }
    public String getreason() {
        return reason;
    }
    public void settargetURL(String targetURL) {
        this.targetURL = targetURL;
    }
    public int getcontentsno() {
      return reportno;
  }
  public void setcontentsno(int contentsno) {
      this.contentsno = contentsno;
      
  }
}