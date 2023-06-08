package dev.mvc.mypage;

import org.springframework.web.multipart.MultipartFile;

/*CREATE TABLE like_guin(
like_guinno                       NUMBER(10)     NOT NULL,
memberno                          NUMBER(10)     NOT NULL,
guin_cno                          NUMBER(10)     NOT NULL
);*/

public class MypageVO {
  /** 관심구인번호 */
  private int like_guinno;
  /** 회원번호 */
  private int memberno;
  /** 구인컨텐츠번호 */
  private int guin_cno;
  
  /** 신고번호 */
  private int reportno;
  /** 신고사유 */
  private String reason;
  /** 대상 URL */
  private String targetURL;
  
  /** 이력서번호 */
  private int resumeno;
  /** 대상 URL */
  private String resumep;
  /** 대상 URL */
  private String intro;
  
  public int getLike_guinno() {
    return like_guinno;
  }
  public void setLike_guinno(int like_guinno) {
    this.like_guinno = like_guinno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public int getGuin_cno() {
    return guin_cno;
  }
  public void setGuin_cno(int guin_cno) {
    this.guin_cno = guin_cno;
  }
  public int getReportno() {
    return reportno;
  }
  public void setReportno(int reportno) {
    this.reportno = reportno;
  }
  public String getReason() {
    return reason;
  }
  public void setReason(String reason) {
    this.reason = reason;
  }
  public String getTargetURL() {
    return targetURL;
  }
  public void setTargetURL(String targetURL) {
    this.targetURL = targetURL;
  }
  public int getResumeno() {
    return resumeno;
  }
  public void setResumeno(int resumeno) {
    this.resumeno = resumeno;
  }
  public String getResumep() {
    return resumep;
  }
  public void setResumep(String resumep) {
    this.resumep = resumep;
  }
  public String getIntro() {
    return intro;
  }
  public void setIntro(String intro) {
    this.intro = intro;
  }
  
}
