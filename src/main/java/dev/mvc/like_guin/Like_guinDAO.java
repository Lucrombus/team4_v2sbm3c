package dev.mvc.like_guin;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

@Repository
public class Like_guinDAO implements Like_guinDAOInter {

  @Override
  public int create(Like_guinVO like_guinVO) {
    return 0;
  }

  @Override
  public ArrayList<Like_guinVO> list_all(Like_guinVO like_guinVO) {
    return null;
  }

  @Override
  public Like_guinVO read(int guin_cno) {
    return null;
  }

  @Override
  public int delete(int like_guinno) {
    return 0;
  }
  
}