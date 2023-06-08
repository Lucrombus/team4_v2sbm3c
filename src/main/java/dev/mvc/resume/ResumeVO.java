package dev.mvc.resume;

public class ResumeVO {

//  CREATE TABLE resume(
//      resumeno                          NUMBER(10)     NOT NULL  PRIMARY KEY, 
//      memberno                          NUMBER(10)     NOT NULL,
//      resumetitle                       VARCHAR2(50)     NOT NULL,
//      resumep                           VARCHAR2(100)    NOT NULL,
//      intro                             VARCHAR2(100)    NOT NULL,
//      rdate                             DATE     NOT NULL,
//      FOREIGN KEY (MEMBERNO) REFERENCES member (MEMBERNO)
//  );
  
  /** 이력서 번호 */
  private int resumeno;
  /** 회원 번호 */
  private int memberno;
  /** 이력서 제목 */
  private String resumetitle;
  /** 이력서 사진 */
  private String resumep;
  /** 자기소개 */
  private String intro;
  /** 이력서 등록일 */
  private String rdate;
  
  
  public int getResumeno() {
    return resumeno;
  }
  public void setResumeno(int resumeno) {
    this.resumeno = resumeno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public String getResumetitle() {
    return resumetitle;
  }
  public void setResumetitle(String resumetitle) {
    this.resumetitle = resumetitle;
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
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
}
