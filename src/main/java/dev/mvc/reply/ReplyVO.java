package dev.mvc.reply;

public class ReplyVO {
  
  private int replyno;
  private int contentsno;
  private int memberno;
  private String reply_content;
  private String rdate;
  
  
  
  public int getReplyno() {
    return replyno;
  }
  public void setReplyno(int replyno) {
    this.replyno = replyno;
  }
  public int getContentsno() {
    return contentsno;
  }
  public void setContentsno(int contentsno) {
    this.contentsno = contentsno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }

  public String getReply_content() {
    return reply_content;
  }
  public void setReply_content(String reply_content) {
    this.reply_content = reply_content;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
  

}
