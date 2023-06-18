package dev.mvc.board;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardCont {

  @Autowired
  @Qualifier("dev.mvc.board.BoardProc")
  private BoardProcInter boardProc;

  public BoardCont() {

    System.out.println("BoardCont created");
  }

  // 등록 폼 조회
  // http://localhost:9093/board/create.do
  @RequestMapping(value = "/board/create.do", method = RequestMethod.GET)
  public ModelAndView create() {

    ModelAndView mav = new ModelAndView();
    mav.setViewName("/board/create");
    return mav;

  }

  // 등록 처리
  // http://localhost:9093/board/create.do
  @RequestMapping(value = "/board/create.do", method = RequestMethod.POST)
  public ModelAndView create(BoardVO boardVO) {

    int cnt = this.boardProc.create(boardVO);

    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/board/list_all.do");
    return mav;

  }

  // 리스트 조회
  // http://localhost:9093/board/list_all.do
  @RequestMapping(value = "/board/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all() {

    ArrayList<BoardVO> list = this.boardProc.list_all();

    ModelAndView mav = new ModelAndView();

    mav.addObject("list", list);
    mav.setViewName("/board/list_all");

    return mav;

  }

// 삭제 폼 조회
// http://localhost:9093/board/read_delete.do
  @RequestMapping(value = "/board/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int boardno) {

    ArrayList<BoardVO> list = this.boardProc.list_all();
    BoardVO boardVO = this.boardProc.read(boardno);

    ModelAndView mav = new ModelAndView();

    mav.addObject("list", list);
    mav.addObject("boardVO", boardVO);
    mav.setViewName("/board/read_delete");

    return mav;

  }

//삭제처리
//http://localhost:9093/board/delete.do
  @RequestMapping(value = "/board/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int boardno) {

    int cnt = this.boardProc.delete(boardno);

    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/board/list_all.do");

    return mav;

  }

//수정 폼 조회
//http://localhost:9093/board/read_update.do
  @RequestMapping(value = "/board/read_update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int boardno) {

    ArrayList<BoardVO> list = this.boardProc.list_all();
    BoardVO boardVO = this.boardProc.read(boardno);

    ModelAndView mav = new ModelAndView();

    mav.addObject("list", list);
    mav.addObject("boardVO", boardVO);
    mav.setViewName("/board/read_update");

    return mav;

  }

//수정처리
//http://localhost:9093/board/update.do
  @RequestMapping(value = "/board/update.do", method = RequestMethod.POST)
  public ModelAndView update(BoardVO boardVO) {

    int cnt = this.boardProc.update(boardVO);

    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/board/list_all.do");

    return mav;

  }

//출력순서 증가
//http://localhost:9093/board/update_seqno_increase.do
  @RequestMapping(value = "/board/update_seqno_increase.do", method = RequestMethod.GET)
  public ModelAndView update_seqno_increase(int boardno) {

    int cnt = this.boardProc.update_seqno_increase(boardno);

    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/board/list_all.do");

    return mav;

  }

//출력순서 감소
//http://localhost:9093/board/update_seqno_decrease.do
  @RequestMapping(value = "/board/update_seqno_decrease.do", method = RequestMethod.GET)
  public ModelAndView update_seqno_decrease(int boardno) {

    BoardVO boardVO = this.boardProc.read(boardno);

    if (boardVO.getSeqno() > 0) {
      int cnt = this.boardProc.update_seqno_decrease(boardno);
    } else {
      System.out.println("출력순서는 음수가 될수 없음");
    }

    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/board/list_all.do");

    return mav;

  }
  
//공개모드로 전환
//http://localhost:9093/board/update_visible_y.do
  @RequestMapping(value = "/board/update_visible_y.do", method = RequestMethod.GET)
  public ModelAndView update_visible_y(int boardno) {


    int cnt = this.boardProc.update_visible_y(boardno);


    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/board/list_all.do");

    return mav;

  }
  
//비공개모드로 전환
//http://localhost:9093/board/update_visible_n.do
  @RequestMapping(value = "/board/update_visible_n.do", method = RequestMethod.GET)
  public ModelAndView update_visible_n(int boardno) {


    int cnt = this.boardProc.update_visible_n(boardno);


    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/board/list_all.do");

    return mav;

  }

}