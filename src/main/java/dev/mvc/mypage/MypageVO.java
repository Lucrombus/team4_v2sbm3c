package dev.mvc.mypage;

import org.springframework.web.multipart.MultipartFile;

// CREATE TABLE like_guin(
//     like_guinno                       NUMBER(10)     NOT NULL,
//     memberno                          NUMBER(10)     NOT NULL,
//     guin_cno                          NUMBER(10)     NOT NULL
//     );
// CREATE TABLE like_gujik(
//     like_gujikno                      NUMBER(10)     NOT NULL,
//     memberno                          NUMBER(10)     NOT NULL,
//     gujik_cno                         NUMBER(10)     NOT NULL
// );

public class MypageVO {
  /** 관심구인번호 */
  private int like_guinno;
  /** 관심구직번호 */
  private int like_gugikno;
  /** 회원번호 */
  private int memberno;
  /** 구인컨텐츠번호 */
  private int guin_cno;
  /** 구직컨텐츠번호 */
  private int gugic_cno;
  
  /** 관심구인이름 */
  private String title_like_guin;
  /** 관심구인내용 */
  private String detail_like_guin;
  /** 관심구직이름 */
  private String title_like_gugik;
  /** 관심구직내용 */
  private String detail_like_gugik;

  /** 신고번호 */
  private int reportno;
  /** 신고사유 */
  private String reason;
  /** 대상 URL */
  private String targetURL;
  
  
  public int getLike_guinno() {
    return like_guinno;
  }
  public void setLike_guinno(int like_guinno) {
    this.like_guinno = like_guinno;
  }
  public int getLike_gugikno() {
    return like_gugikno;
  }
  public void setLike_gugikno(int like_gugikno) {
    this.like_gugikno = like_gugikno;
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
  public int getGugic_cno() {
    return gugic_cno;
  }
  public void setGugic_cno(int gugic_cno) {
    this.gugic_cno = gugic_cno;
  }
  public String getTitle_like_guin() {
    return title_like_guin;
  }
  public void setTitle_like_guin(String title_like_guin) {
    this.title_like_guin = title_like_guin;
  }
  public String getDetail_like_guin() {
    return detail_like_guin;
  }
  public void setDetail_like_guin(String detail_like_guin) {
    this.detail_like_guin = detail_like_guin;
  }
  public String getTitle_like_gugik() {
    return title_like_gugik;
  }
  public void setTitle_like_gugik(String title_like_gugik) {
    this.title_like_gugik = title_like_gugik;
  }
  public String getDetail_like_gugik() {
    return detail_like_gugik;
  }
  public void setDetail_like_gugik(String detail_like_gugik) {
    this.detail_like_gugik = detail_like_gugik;
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
  
  
}