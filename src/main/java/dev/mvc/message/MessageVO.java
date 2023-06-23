package dev.mvc.message;

import java.util.Date;

public class MessageVO {
  

    /** 쪽지 번호 */
    private int messageno;
    /** 보낸 회원번호 */
    private int memberno;
    /** 받는 회원번호 */
    private int receive_memberno;
    /** 제목 */
    private String title;
    /** 내용 */
    private String content;
    /** 날짜 */
    private String rdate;
    /** 읽음 상태 */
    private String read = "N";
    
    
    public int getMessageno() {
      return messageno;
    }
    public void setMessageno(int messageno) {
      this.messageno = messageno;
    }
    public int getMemberno() {
      return memberno;
    }
    public void setMemberno(int memberno) {
      this.memberno = memberno;
    }
    public int getReceive_memberno() {
      return receive_memberno;
    }
    public void setReceive_memberno(int receive_memberno) {
      this.receive_memberno = receive_memberno;
    }
    public String getTitle() {
      return title;
    }
    public void setTitle(String title) {
      this.title = title;
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
    public String getRead() {
      return read;
    }
    public void setRead(String read) {
      this.read = read;
    }
    
    
    
    
   
    
    
}