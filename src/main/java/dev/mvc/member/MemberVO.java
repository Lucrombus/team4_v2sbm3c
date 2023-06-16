package dev.mvc.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
    /*
     * memberno INT NOT NULL AUTO_INCREMENT, -- 회원 번호, 레코드를 구분하는 컬럼 
     * id VARCHAR(20) NOT NULL UNIQUE, -- 아이디, 중복 안됨, 레코드를 구분 
     * passwd VARCHAR(20) NOT NULL, -- 패스워드, 영숫자 조합 
     * name VARCHAR(30) NOT NULL, -- 성명, 한글 10자 저장 가능 
     * tel VARCHAR(14) NOT NULL, -- 전화번호 
     * zipcode VARCHAR(5) NULL, -- 우편번호, 12345 
     * address1 VARCHAR(80) NULL, -- 주소 1 
     * address2 VARCHAR(50) NULL, -- 주소 2 
     * mdate DATETIME NOT NULL, -- 가입일 
     * grade NUMBER(2) NOT NULL, -- 등급(1 ~ 10: 관리자, 11~20: 회원, 비회원: 30~39, 정지 회원: 40~49) 
     * PRIMARY KEY (mno) -- 한번 등록된 값은 중복 안됨
     */

    /** 회원 번호 */
    private int memberno;
    /** 아이디(이메일) */
    private String id = "";
    /** 패스워드 */
    private String passwd = "";
    /** 회원 성명 */
    private String name = "";
    /** 전화 번호 */
    private String tel = "";
    /** 가입일 */
    private String rdate = "";
    /** 등급 */
    private int rankno = 0;
    /** 경력 여부 */
    private String experience = "";
    /** 성별 */
    private String gender = "";
    /** 생년월일 */
    private String birth = "";
    /** 학력 */
    private String education = "";
    /** 등록된 패스워드 */
    private String old_passwd = "";
    /** id 저장 여부 */
    private String id_save = "";
    /** passwd 저장 여부 */
    private String passwd_save = "";
    /** 이동할 주소 저장 */
    private String url_address = "";
    public int getMemberno() {
      return memberno;
    }
    public void setMemberno(int memberno) {
      this.memberno = memberno;
    }
    public String getId() {
      return id;
    }
    public void setId(String id) {
      this.id = id;
    }
    public String getPasswd() {
      return passwd;
    }
    public void setPasswd(String passwd) {
      this.passwd = passwd;
    }
    public String getName() {
      return name;
    }
    public void setName(String name) {
      this.name = name;
    }
    public String getTel() {
      return tel;
    }
    public void setTel(String tel) {
      this.tel = tel;
    }
    public String getRdate() {
      return rdate;
    }
    public void setRdate(String rdate) {
      this.rdate = rdate;
    }
    public int getRankno() {
      return rankno;
    }
    public void setRankno(int rankno) {
      this.rankno = rankno;
    }
    public String getExperience() {
      return experience;
    }
    public void setExperience(String experience) {
      this.experience = experience;
    }
    public String getGender() {
      return gender;
    }
    public void setGender(String gender) {
      this.gender = gender;
    }
    public String getBirth() {
      return birth;
    }
    public void setBirth(String birth) {
      this.birth = birth;
    }
    public String getEducation() {
      return education;
    }
    public void setEducation(String education) {
      this.education = education;
    }
    public String getOld_passwd() {
      return old_passwd;
    }
    public void setOld_passwd(String old_passwd) {
      this.old_passwd = old_passwd;
    }
    public String getId_save() {
      return id_save;
    }
    public void setId_save(String id_save) {
      this.id_save = id_save;
    }
    public String getPasswd_save() {
      return passwd_save;
    }
    public void setPasswd_save(String passwd_save) {
      this.passwd_save = passwd_save;
    }
    public String getUrl_address() {
      return url_address;
    }
    public void setUrl_address(String url_address) {
      this.url_address = url_address;
    }
}