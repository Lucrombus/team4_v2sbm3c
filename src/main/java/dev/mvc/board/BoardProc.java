package dev.mvc.board;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.board.BoardDAOInter;
import dev.mvc.board.BoardVO;

@Component("dev.mvc.board.BoardProc")
public class BoardProc implements BoardProcInter {

  @Autowired
  private BoardDAOInter boardDAO;

  @Override
  public int create(BoardVO boardVO) {

    int cnt = this.boardDAO.create(boardVO);
    return cnt;
  }

  @Override
  public BoardVO read(int boardno) {

    BoardVO boardVO = this.boardDAO.read(boardno);
    return boardVO;
  }

  @Override
  public ArrayList<BoardVO> list_all() {

    ArrayList<BoardVO> list = this.boardDAO.list_all();
    return list;
  }

  @Override
  public int delete(int boardno) {

    int cnt = this.boardDAO.delete(boardno);
    return cnt;
  }

  @Override
  public int update(BoardVO boardVO) {

    int cnt = this.boardDAO.update(boardVO);
    return cnt;
  }

  @Override
  public int update_seqno_increase(int boardno) {

    int cnt = this.boardDAO.update_seqno_increase(boardno);
    return cnt;
  }

  @Override
  public int update_seqno_decrease(int boardno) {

    int cnt = this.boardDAO.update_seqno_decrease(boardno);
    return cnt;
  }

  @Override
  public int update_visible_y(int boardno) {

    int cnt = this.boardDAO.update_visible_y(boardno);
    return cnt;
  }

  @Override
  public int update_visible_n(int boardno) {

    int cnt = this.boardDAO.update_visible_n(boardno);
    return cnt;
  }

}
