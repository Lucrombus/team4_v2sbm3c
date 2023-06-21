package dev.mvc.like_reply;

public interface Like_replyProcInter {
  
  /**
   * 등록
   * 
   * @param Like_replyVO
   * @return insert 태그가 추가한 레코드 갯수를 리턴
   */
  public int create(Like_replyVO like_replyVO);
  
  /**
   * 체크
   * 
   * @param Like_replyVO
   * @return 특정 replyno에 동일한 memberno가 이미 추천을 눌렀는지
   */
  public int check(Like_replyVO like_replyVO);
  
  /**
   * 조회
   * 
   * @param Like_replyVO
   * @return 특정 replyno에 달린 총 좋아요 수
   */
  public int count_by_replyno(int replyno);
  
  /**
   * 삭제
   * 
   * @param int replyno
   * @return replyno로 댓글에 달린 좋아요 삭제
   */
  public int delete_by_replyno(int replyno);

}
