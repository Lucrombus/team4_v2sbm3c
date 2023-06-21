package dev.mvc.like_reply;


public interface Like_replyDAOInter {
  
  
  /**
   * 등록
   * 
   * @param Like_replyVO
   * @return insert 태그가 추가한 레코드 갯수를 리턴
   */
  public int create(Like_replyVO like_reply);
  
  /**
   * 체크
   * 
   * @param Like_replyVO
   * @return 특정 replyno에 동일한 memberno가 이미 추천을 눌렀는지
   */
  public int check(Like_replyVO like_reply);
  
  

}
