package dev.mvc.event;

import org.springframework.web.multipart.MultipartFile;

public class EventVO {

  private int eventno;
  private int memberno;
  private String title;
  private String content;
  private int viewcnt;
  private String rdate;
  private String file1 ="";
  private String file1saved ="";
  private String thumb1 ="";
  private String thumb1_origin ="";
  private long size1;
  private String word ="";

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
  
  
  public int getEventno() {
    return eventno;
  }
  public void setEventno(int eventno) {
    this.eventno = eventno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
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
  public String getThumb1_origin() {
    return thumb1_origin;
  }
  public void setThumb1_origin(String thumb1_origin) {
    this.thumb1_origin = thumb1_origin;
  }
  public long getSize1() {
    return size1;
  }
  public void setSize1(long size1) {
    this.size1 = size1;
  }
  public String getWord() {
    return word;
  }
  public void setWord(String word) {
    this.word = word;
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
  public int getViewcnt() {
    return viewcnt;
  }
  public void setViewcnt(int viewcnt) {
    this.viewcnt = viewcnt;
  }
  
  
  
  

}
