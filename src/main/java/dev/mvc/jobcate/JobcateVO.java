package dev.mvc.jobcate;

/*CREATE TABLE jobcate(
    jobcateno                         NUMBER(10)     NOT NULL    PRIMARY KEY,
    name                              VARCHAR2(20)     NOT NULL,
    seqno                             NUMBER(10)     NOT NULL,
    visible                           CHAR(1)    DEFAULT 'N'     NOT NULL
)*/

public class JobcateVO {
  
  private int jobcateno;
  private String name;
  private int seqno;
  private String visible;
  
  public int getJobcateno() {
    return jobcateno;
  }
  public void setJobcateno(int jobcateno) {
    this.jobcateno = jobcateno;
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
 
  @Override
  public String toString() {
    return "JobcateVO [jobcateno=" + jobcateno + ", name=" + name + ", seqno=" + seqno + ", visible=" + visible + "]";
  }
  
  
  
  

}
