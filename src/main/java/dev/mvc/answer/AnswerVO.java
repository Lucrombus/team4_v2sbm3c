package dev.mvc.answer;

public class AnswerVO {
  
  /** 답변 번호 */
  private int answerno;
  /** 내용 */
  private String content;
  /** 등록일 */
  private String rdate;
  /** 문의 번호 */
  private int inquiryno;
  /** 회원 번호 */
  private int memberno;
  
  
  public int getAnswerno() {
    return answerno;
  }
  public void setAnswerno(int answerno) {
    this.answerno = answerno;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
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
  
}
