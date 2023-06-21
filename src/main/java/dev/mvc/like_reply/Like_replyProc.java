package dev.mvc.like_reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.like_reply.Like_replyProc")
public class Like_replyProc implements Like_replyProcInter {
  
  @Autowired
  private Like_replyDAOInter like_replyDAO;
  
  @Override
  public int create(Like_replyVO like_replyVO) { 
    
    int cnt = this.like_replyDAO.create(like_replyVO); 
    return cnt;
  }
  
  @Override
  public int check(Like_replyVO like_replyVO) { 
    
    int cnt = this.like_replyDAO.create(like_replyVO); 
    return cnt;
  }

}
