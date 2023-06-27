package dev.mvc.answer;

public class AnswerVO {
  
  /** 답변 번호 */
  private int ANSWERNO;
  /** 내용 */
  private String CONTENT;
  /** 등록일 */
  private String RDATE;
  /** 문의 번호 */
  private int inquiryno;
  /** 회원 번호 */
  private int memberno;
  
  
  public int getANSWERNO() {
    return ANSWERNO;
  }
  public void setANSWERNO(int aNSWERNO) {
    ANSWERNO = aNSWERNO;
  }
  public String getCONTENT() {
    return CONTENT;
  }
  public void setCONTENT(String cONTENT) {
    CONTENT = cONTENT;
  }
  public String getRDATE() {
    return RDATE;
  }
  public void setRDATE(String rDATE) {
    RDATE = rDATE;
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
