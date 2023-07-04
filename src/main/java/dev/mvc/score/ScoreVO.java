package dev.mvc.score;

public class ScoreVO {
  /** 평점 번호 */
  private int scoreno;
  /** 구인 컨텐츠 번호 */
  private int guin_cno;
  /** 회원 번호 */
  private int memberno;
  /** 점수 */
  private int jumsu;
  /** 평점 날짜 */
  private String rdate;
  /**  */
  public int getScoreno() {
    return scoreno;
  }

  public void setScoreno(int scoreno) {
    this.scoreno = scoreno;
  }

  public int getGuin_cno() {
    return guin_cno;
  }

  public void setGuin_cno(int guin_cno) {
    this.guin_cno = guin_cno;
  }

  public int getMemberno() {
    return memberno;
  }

  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }

  public int getJumsu() {
    return jumsu;
  }

  public void setJumsu(int jumsu) {
    this.jumsu = jumsu;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }

  
  
}
