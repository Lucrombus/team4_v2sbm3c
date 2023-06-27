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
  public ArrayList<Like_guinVO> list_all(Like_guinVO like_guinVO) {
    ArrayList<Like_guinVO> list = this.like_guinDAO.list_all(like_guinVO);
    
    return list;
  }
  
  @Override
  public Like_guinVO read(int guin_cno) {
    Like_guinVO like_guinVO = this.like_guinDAO.read(guin_cno);
    return like_guinVO;
  }
  
  @Override
  public int delete(int like_guinno) {
    int cnt = this.like_guinDAO.delete(like_guinno);
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
