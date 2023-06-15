package dev.mvc.board;

import java.util.ArrayList;

import dev.mvc.board.BoardVO;

public interface BoardDAOInter {
  
  /**
   * 등록
   * 
   * @param boardVO
   * @return insert 태그가 추가한 레코드 갯수를 리턴
   */
  public int create(BoardVO boardVO);
  
  /**
   * 조회
   * 
   * @return BoardVO
   */
  public BoardVO read(int boardno);
  
  /**
   * 조회: 목록
   * 
   * @return 전체목록을 ArrayList<BoardVO>로 리턴
   */
  public ArrayList<BoardVO> list_all();
  
  /**
   * 삭제
   * 
   * @return 삭제된 레코드 갯수 리턴
   */
  public int delete(int boardno);
  
  /**
   * 수정
   * 
   * @return 수정된 레코드 갯수 리턴
   */
  public int update(BoardVO boardVO);
  
  /**
   * 수정: 출력순서 증가
   * 
   * @return 수정된 레코드 갯수 리턴
   */
  public int update_seqno_increase(int boardno);
  
  /**
   * 수정: 출력순서 감소
   * 
   * @return 수정된 레코드 갯수 리턴
   */
  public int update_seqno_decrease(int boardno);
  
  /**
   * 수정: 공개
   * 
   * @return 수정된 레코드 갯수 리턴
   */
  public int update_visible_y(int boardno);
  
  /**
   * 수정: 비공개
   * 
   * @return 수정된 레코드 갯수 리턴
   */
  public int update_visible_n(int boardno);
  

}
