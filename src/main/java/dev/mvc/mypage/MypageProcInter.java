package dev.mvc.mypage;

import java.util.ArrayList;

public interface MypageProcInter {
  
  /**
   * 내 정보
   * @param myinfo
   * @return
   */
  public int myinfo(MypageVO mypageVO);
  
  /**
   * 마이페이지
   * @param mypage_main
   * @return
   */
  public MypageVO mypage_main(int memberno);
  
  /**
   * 나의 관심 구인 등록
   * @param like_guinno
   * @return
   */
  public int create_like_guin(MypageVO mypageVO);
  
  /**
   * 나의 관심 구직 등록
   * @param like_gugikno
   * @return
   */
  public int create_like_gugik(MypageVO mypageVO);
  
  /**
   * 나의 관심 구인 조회
   * @param like_guinno
   * @return
   */
  public MypageVO read_like_guin(int like_guinno);
  
  /**
   * 나의 관심 구직 조회
   * @param like_gugikno
   * @return
   */
  public MypageVO read_like_gugik(int like_gugikno);
  
  /**
   * 나의 관심 구인 삭제
   * @param like_guinno
   * @return
   */
  public int delete_like_guin(int like_guinno);
  
  /**
   * 나의 관심 구직 삭제
   * @param like_gugikno
   * @return
   */
  public int delete_like_gugik(int like_gugikno);
  
  /**
   * 신고 및 문의
   * @param report
   * @return
   */
  public MypageVO report(int reportno);
}
