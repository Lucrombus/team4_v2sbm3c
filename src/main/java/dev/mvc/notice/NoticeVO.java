package dev.mvc.notice;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {

  private int noticeno;
  private String topview;
  private int memberno;
  private String TITLE;
  private String CONTENT;
  private int RECOM;
  private int CNT;
  private int REPLYCNT;
  private String WORD ="";
  private String RDATE;
  private int wage;
  private String day;
  private String file1 ="";
  private String file1saved ="";
  private String thumb1 ="";
  private long size1;
  private String MAP ="";
  private String YOUTUBE ="";

  /**
   * 이미지 파일
   * <input type='file' class="form-control" name='file1MF' id='file1MF' value=''
   * placeholder="파일 선택">
   */
  private MultipartFile file1MF;

  /** 메인 이미지 크기 단위, 파일 크기 */
  private String size1_label = "";

  private int start_num;
  private int end_num;
  private int now_page = 1;
  
  
  public int getNoticeno() {
    return noticeno;
  }
  public void setNoticeno(int noticeno) {
    this.noticeno = noticeno;
  }
  public String getTopview() {
    return topview;
  }
  public void setTopview(String topview) {
    this.topview = topview;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public String getTITLE() {
    return TITLE;
  }
  public void setTITLE(String tITLE) {
    TITLE = tITLE;
  }
  public String getCONTENT() {
    return CONTENT;
  }
  public void setCONTENT(String cONTENT) {
    CONTENT = cONTENT;
  }
  public int getRECOM() {
    return RECOM;
  }
  public void setRECOM(int rECOM) {
    RECOM = rECOM;
  }
  public int getCNT() {
    return CNT;
  }
  public void setCNT(int cNT) {
    CNT = cNT;
  }
  public int getREPLYCNT() {
    return REPLYCNT;
  }
  public void setREPLYCNT(int rEPLYCNT) {
    REPLYCNT = rEPLYCNT;
  }
  public String getWORD() {
    return WORD;
  }
  public void setWORD(String wORD) {
    WORD = wORD;
  }
  public String getRDATE() {
    return RDATE;
  }
  public void setRDATE(String rDATE) {
    RDATE = rDATE;
  }
  public int getWage() {
    return wage;
  }
  public void setWage(int wage) {
    this.wage = wage;
  }
  public String getDay() {
    return day;
  }
  public void setDay(String day) {
    this.day = day;
  }
  public String getFile1() {
    return file1;
  }
  public void setFile1(String file1) {
    this.file1 = file1;
  }
  public String getFile1saved() {
    return file1saved;
  }
  public void setFile1saved(String file1saved) {
    this.file1saved = file1saved;
  }
  public String getThumb1() {
    return thumb1;
  }
  public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
  }
  public long getSize1() {
    return size1;
  }
  public void setSize1(long size1) {
    this.size1 = size1;
  }
  public String getMAP() {
    return MAP;
  }
  public void setMAP(String mAP) {
    MAP = mAP;
  }
  public String getYOUTUBE() {
    return YOUTUBE;
  }
  public void setYOUTUBE(String yOUTUBE) {
    YOUTUBE = yOUTUBE;
  }
  public MultipartFile getFile1MF() {
    return file1MF;
  }
  public void setFile1MF(MultipartFile file1mf) {
    file1MF = file1mf;
  }
  public String getSize1_label() {
    return size1_label;
  }
  public void setSize1_label(String size1_label) {
    this.size1_label = size1_label;
  }
  public int getStart_num() {
    return start_num;
  }
  public void setStart_num(int start_num) {
    this.start_num = start_num;
  }
  public int getEnd_num() {
    return end_num;
  }
  public void setEnd_num(int end_num) {
    this.end_num = end_num;
  }
  public int getNow_page() {
    return now_page;
  }
  public void setNow_page(int now_page) {
    this.now_page = now_page;
  }
  
  
  
  

}
