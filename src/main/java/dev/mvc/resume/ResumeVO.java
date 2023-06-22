package dev.mvc.resume;

import org.springframework.web.multipart.MultipartFile;

public class ResumeVO {
  
  
  private int resumeno;
  private int memberno;
  private String title;
  private String file1 ="";
  private String file1saved ="";
  private String thumb1 ="";
  private long size1;
  private String rdate;
  private String intro;
  private String tel;
  private String address;
  private String career;
  private String skills;
  private String langskill;
  private String wantjob;
  
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
  
  
  
  public int getResumeno() {
    return resumeno;
  }
  public void setResumeno(int resumeno) {
    this.resumeno = resumeno;
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
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getIntro() {
    return intro;
  }
  public void setIntro(String intro) {
    this.intro = intro;
  }
  public String getTel() {
    return tel;
  }
  public void setTel(String tel) {
    this.tel = tel;
  }
  public String getAddress() {
    return address;
  }
  public void setAddress(String address) {
    this.address = address;
  }
  public String getCareer() {
    return career;
  }
  public void setCareer(String career) {
    this.career = career;
  }
  public String getSkills() {
    return skills;
  }
  public void setSkills(String skills) {
    this.skills = skills;
  }
  public String getLangskill() {
    return langskill;
  }
  public void setLangskill(String langskill) {
    this.langskill = langskill;
  }
  public String getWantjob() {
    return wantjob;
  }
  public void setWantjob(String wantjob) {
    this.wantjob = wantjob;
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
