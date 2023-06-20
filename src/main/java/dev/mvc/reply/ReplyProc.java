package dev.mvc.reply;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.reply.ReplyProc")
public class ReplyProc implements ReplyProcInter {
  
  @Autowired
  private ReplyDAOInter replyDAO;
  
  @Override
  public int create(ReplyVO replyVO) {
    
    int cnt = this.replyDAO.create(replyVO);
    return cnt;
  }
  
  @Override
  public ReplyVO read(int replyno) {
    
    ReplyVO replyVO = this.replyDAO.read(replyno);
    return replyVO;
  }
  
  @Override
  public ArrayList<ReplyVO> list_by_contentsno(int contentsno) {
    
    ArrayList<ReplyVO> list = this.replyDAO.list_by_contentsno(contentsno);
    return list;
  }
  
  @Override
  public int count_by_contentsno(int contentsno) {
    
    int cnt = this.replyDAO.count_by_contentsno(contentsno);
    return cnt;
  }
  
  @Override
  public int delete(int replyno) {
    
    int cnt = this.replyDAO.delete(replyno);
    return cnt;
  }

}
