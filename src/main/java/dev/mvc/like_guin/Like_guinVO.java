package dev.mvc.like_guin;

public class Like_guinVO {
  
  /** 관심구인번호 */
  private int like_guinno;
  /** 회원번호 */
  private int memberno;
  /** 구인컨텐츠번호 */
  private int guin_cno;
  
  
  public int getLike_guinno() {
    return like_guinno;
  }
  public void setLike_guinno(int like_guinno) {
    this.like_guinno = like_guinno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public int getGuin_cno() {
    return guin_cno;
  }
  public void setGuin_cno(int guin_cno) {
    this.guin_cno = guin_cno;
  }
}
