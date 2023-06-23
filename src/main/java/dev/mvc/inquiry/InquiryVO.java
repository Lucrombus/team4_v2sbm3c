//  /**********************************/
//  /* Table Name: 문의 */
//  /**********************************/
//  CREATE TABLE inquiry(
//      inquiryno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
//      memberno                        INTEGER(10)    NOT NULL,
//      inquiryTitle                       VARCHAR2(50) NOT NULL ,
//      inquiryReason                    VARCHAR2(100)  NOT NULL ,
//      contentsno                        NUMBER(10)     NOT NULL ,
//      boardno                           NUMBER(10)     NOT NULL ,
//    FOREIGN KEY (memberno) REFERENCES member (memberno),
//    FOREIGN KEY (contentsno) REFERENCES contents (contentsno),
//    FOREIGN KEY (boardno) REFERENCES board (boardno)
//  );

package dev.mvc.inquiry;

import org.springframework.web.multipart.MultipartFile;

public class InquiryVO {
  
  /** 문의 번호 */
  private int inquiryno;
  /** 회원 번호 */
  private int memberno;
  /** 문의 제목 */
  private String inquiryTitle;
  /** 문의 내용 */
  private String inquiryReason;
  /** 등록일 */
  private String rdate;
  
  public int getInquiryno() {
    return inquiryno;
  }
  public void setInquiryno(int inquiryno) {
    this.inquiryno = inquiryno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public String getInquiryReason() {
    return inquiryReason;
  }
  public void setInquiryReason(String inquiryReason) {
    this.inquiryReason = inquiryReason;
  }
  public String getInquiryTitle() {
    return inquiryTitle;
  }
  public void setInquiryTitle(String inquiryTitle) {
    this.inquiryTitle = inquiryTitle;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
}