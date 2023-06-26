package dev.mvc.like_guin;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.board.BoardVO;
import dev.mvc.guin_c.Guin_cProcInter;
import dev.mvc.guin_c.Guin_cVO;
import dev.mvc.jobcate.JobcateProcInter;
import dev.mvc.jobcate.JobcateVO;
import dev.mvc.member.MemberProcInter;

@Controller
public class Like_guinCont {
  @Autowired
  @Qualifier("dev.mvc.like_guin.Like_guinProc")
  private Like_guinProcInter like_guinProc;
  
  @Autowired
  @Qualifier("dev.mvc.guin_c.Guin_cProc")
  private Guin_cProcInter guin_cProc;
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  public Like_guinCont() {
    System.out.println("-> Like_guinCont created.");
  }
  
  // 등록폼
  // http://localhost:9093/like_guin/create.do
  @RequestMapping(value="/like_guin/create.do", method=RequestMethod.GET)
  public ModelAndView create(int guin_cno, HttpSession session) {
   
    ModelAndView mav = new ModelAndView();

    Guin_cVO guin_cVO = this.guin_cProc.read(guin_cno);
    ArrayList<Guin_cVO> list = this.guin_cProc.list_by_jobcateno_search_paging(guin_cVO);
    mav.addObject("guin_cVO", guin_cVO);
    mav.addObject("list", list);
 
    if (session.getAttribute("id") != null) {
      mav.setViewName("/contents/create_test");
 
    } else {
      mav.setViewName("/member/login_need");
 
    }
 
    return mav;
  }
  
  // 검색 목록
  // http://localhost:9093/like_guin/list_all.do
  @RequestMapping(value = "/like_guin/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all(Like_guinVO like_guinVO) {
    ModelAndView mav = new ModelAndView();
    
    ArrayList<Like_guinVO> list = like_guinProc.list_all(like_guinVO);
    mav.addObject("list", list);

    Guin_cVO guin_cVO = guin_cProc.read(like_guinVO.getGuin_cno());
    mav.addObject("guin_cVO", guin_cVO);
  
    return mav;
  }
}
