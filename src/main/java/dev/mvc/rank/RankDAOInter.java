package dev.mvc.rank;

import java.util.ArrayList;

public interface RankDAOInter {
  /**
   * 등록
   * @param rankVO 등록할 데이터
   * @return 등록된 레코드 갯수
   */
  public int create(RankVO rankVO); // 추상 메소드
 
  /**
   *  전체 목록
   * @return
   */
  public ArrayList<RankVO> list_all();
  
  /**
   * 등급 조회
   * @return
   */
  public RankVO read(int rankno);
  
  /**
   * 수정
   * @param rankVO
   * @return 수정된 레코드 갯수를 리턴
   */
  public int update(RankVO rankVO);
  
  /**
   * 삭제
   * @param rankno
   * @return 삭제된 레코드 갯수를 리턴
   */
  public int delete(int rankno);
}


