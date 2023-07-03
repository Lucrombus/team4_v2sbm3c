package dev.mvc.team4;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.board.BoardProcInter;
import dev.mvc.board.BoardVO;
import dev.mvc.jobcate.JobcateProcInter;
import dev.mvc.jobcate.JobcateVO;
import dev.mvc.message.MessageProcInter;

// Setvlet으로 작동함, GET/POST등의 요청을 처리함.
@Controller
public class HomeCont {
  @Autowired
  @Qualifier("dev.mvc.jobcate.JobcateProc")  // @Component("dev.mvc.cate.JobcateProc")
  private JobcateProcInter jobcateProc; // CateProc 객체가 자동 생성되어 할당됨.
  
  @Autowired
  @Qualifier("dev.mvc.board.BoardProc")
  private BoardProcInter boardProc;
  
  @Autowired
  @Qualifier("dev.mvc.message.MessageProc")
  private MessageProcInter messageProc;
  
  public HomeCont() {
    System.out.println("-> HomeCont created.");
  }
  
  // http://localhost:9093/
  // http://localhost:9093/index.do
  @RequestMapping(value= {"/", "/index.do"}, method=RequestMethod.GET)
  public ModelAndView home() {
    ModelAndView mav = new ModelAndView();
    // spring.mvc.view.prefix=/WEB-INF/views/
    // spring.mvc.view.suffix=.jsp
    mav.setViewName("/index"); // /WEB-INF/views/index.jsp
    
    return mav;
  }
  
  
  
  // http://localhost:9093/menu/top.do
  @RequestMapping(value= {"/menu/top.do"}, method=RequestMethod.GET)
  public ModelAndView top(HttpSession session) {
    ModelAndView mav = new ModelAndView();

    ArrayList<JobcateVO> list = this.jobcateProc.list_all();
    ArrayList<BoardVO> list_board = this.boardProc.list_all();
    mav.addObject("list", list);
    mav.addObject("list_board", list_board);
    
    // 로그인 상태 확인후 안읽은 쪽지 갯수 페이지에 반환
    if (session.getAttribute("memberno") != null) {
      int memberno = (int) session.getAttribute("memberno");
      int unread_cnt = this.messageProc.count_unread(memberno);
      mav.addObject("unread_cnt", unread_cnt);
    }
    
    
    mav.setViewName("/menu/top"); // /WEB-INF/views/menu/top.jsp
    
    return mav;
  }
  
  

  
}

