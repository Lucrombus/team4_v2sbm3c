package dev.mvc.message;

import java.util.Date;

public class messageVO {
  

    /** 쪽지 번호 */
    private int message_messageno;
    /** 보낸 회원번호 */
    private int message_memberno;
    /** 받는 회원번호 */
    private int message_receive_memberno;
    /** 제목 */
    private String title;
    /** 내용 */
    private String message_content;
    /** 날짜 */
    private Date message_rdate;
   
    
    public int getmessage_messageno() {
        return message_messageno;
    }
    public void setmessage_messageno(int message_messageno) {
        this.message_memberno = message_messageno;
    }
    public int getmessage_memberno() {
      return message_memberno;
    }
    public void setmessage_memberno(int message_memberno) {
    this.message_memberno = message_memberno;
    }
    public int getmessage_receive_memberno() {
    return message_receive_memberno;
    }
    public void setmessage_receive_memberno(int message_receive_memberno) {
    this.message_receive_memberno = message_receive_memberno;
    }
    public String gettitle() {
        return title;
    }
    public void settitle(String title) {
        this.title = title;
    }
    public String getmessage_content() {
        return message_content;
    }
    public void setmessage_content(String message_content) {
        this.message_content = message_content;
    }
    public Date getmessage_rdate() {
      return message_rdate;
    }
    public void setmessage_rdate(Date message_rdate) {
      this.message_rdate = message_rdate; 
      }
}