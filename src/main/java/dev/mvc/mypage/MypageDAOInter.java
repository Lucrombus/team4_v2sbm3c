package dev.mvc.mypage;

import java.util.ArrayList;
import dev.mvc.mypage.MypageVO;

public interface MypageDAOInter {
  
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
   * @param like_gugicno
   * @return
   */
  public int create_like_gugik(MypageVO mypageVO);
  
  /**
   * 나의 관심 구인 목록
   * 관심 구인 목록을 ArrayList<MypageVO>로 리턴
   * @return
   */
  public ArrayList<MypageVO> list_like_guin();
  
  /**
   * 나의 관심 구직 목록
   * 관심 구직 목록을 ArrayList<MypageVO>로 리턴
   * @return
   */
  public ArrayList<MypageVO> list_like_gugik();
  
  /**
   * 나의 관심 구인 조회
   * @param like_guinno
   * @return
   */
  public MypageVO read_like_guin(int like_guinno);
  
  /**
   * 나의 관심 구직 조회
   * @param like_gugicno
   * @return
   */
  public MypageVO read_like_gugik(int like_gugicno);
  
  /**
   * 나의 관심 구인 삭제
   * @param like_guinno
   * @return
   */
  public int delete_like_guin(int like_guinno);
  
  /**
   * 나의 관심 구직 삭제
   * @param like_gugicno
   * @return
   */
  public int delete_like_gugik(int like_gugicno);
  
}

