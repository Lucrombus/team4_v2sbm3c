package dev.mvc.like_guin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.like_guin.Like_guinProc")
public class Like_guinProc implements Like_guinProcInter{
  @Autowired
  private Like_guinDAOInter like_guinDAO;
  
  @Override
  public int create(Like_guinVO like_guinVO) {
    int cnt = this.like_guinDAO.create(like_guinVO); 
    return cnt;
  }
  
  @Override
  public int check(Like_guinVO like_guinVO) {
    int cnt = this.like_guinDAO.check(like_guinVO);
    return cnt;
  }
  
  @Override
  public int delete_mine(Like_guinVO like_guinVO) {
    int cnt = this.like_guinDAO.delete_mine(like_guinVO);
    return cnt;
  }
  
  @Override
  public ArrayList<Like_guinVO> list_mine(int memberno) {
    ArrayList<Like_guinVO> list = this.like_guinDAO.list_mine(memberno);
    
    return list;
  }
}
