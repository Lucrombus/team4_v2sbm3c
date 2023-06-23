/*
package dev.mvc.like_guin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

import dev.mvc.guin_c.Guin_cDAOInter;
import dev.mvc.guin_c.Guin_cProcInter;
import dev.mvc.guin_c.Guin_cVO;
import dev.mvc.inquiry.InquiryVO;
import dev.mvc.tool.Tool;

@Component("dev.mvc.like_guin.Like_guinProc")
public class Like_guinProc implements Like_guinProcInter {
  @Autowired
  private Like_guinDAOInter like_guinDAO;
  
  @Override
  public ArrayList<Like_guinVO> list_like_guin(int memberno) {
    ArrayList<Like_guinVO> list = this.like_guinDAO.list_like_guin(memberno);
    return list; 
  }

  @Override
  public int create(Like_guinVO like_guinVO) {
    int cnt = this.like_guinDAO.create(like_guinVO);
    return cnt;
  }

  @Override
  public int delete(int like_guinno) {
    int cnt = this.like_guinDAO.delete(like_guinno);
    return cnt;
  }
}
*/