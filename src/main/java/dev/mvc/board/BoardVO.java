package dev.mvc.board;

/*CREATE TABLE jobcate(
boardno                        NUMBER(10)     NOT NULL    PRIMARY KEY,
name                              VARCHAR2(20)     NOT NULL,
seqno                             NUMBER(10)     NOT NULL,
visible                           CHAR(1)    DEFAULT 'N'     NOT NULL
)*/

public class BoardVO {
  
  private int boardno;
  private String name;
  private int seqno;
  private String visible;
 
  public int getBoardno() {
    return boardno;
  }
  public void setBoardno(int boardno) {
    this.boardno = boardno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }
  public String getVisible() {
    return visible;
  }
  public void setVisible(String visible) {
    this.visible = visible;
  }
  
  

}
