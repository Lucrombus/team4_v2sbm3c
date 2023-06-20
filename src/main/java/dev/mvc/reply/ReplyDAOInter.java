package dev.mvc.reply;

import java.util.ArrayList;

import dev.mvc.contents.ContentsVO;

public interface ReplyDAOInter {
  
  /**
   * 등록
   * @param ReplyVO
   * @return
   */
  public int create(ReplyVO replyVO);
  
  /**
   * 댓글번호로 특정 댓글조회
   * @param int
   * @return
   */
  public ReplyVO read (int replyno);
  
  /**
   * 컨텐츠별 댓글 리스트 조회
   * @param int
   * @return
   */
  public ArrayList<ReplyVO> list_by_contentsno (int contentsno);
  
  /**
   * 컨텐츠별 댓글 갯수
   * @param int
   * @return
   */
  public int count_by_contentsno (int contentsno);
  
  /**
   * 삭제
   * @param int
   * @return
   */
  public int delete(int replyno);
  

}
