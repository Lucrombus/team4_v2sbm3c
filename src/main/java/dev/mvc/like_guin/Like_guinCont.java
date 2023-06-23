/*
package dev.mvc.like_guin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.guin_c.Guin_cProcInter;
import dev.mvc.guin_c.Guin_cVO;
import dev.mvc.jobcate.JobcateProcInter;
import dev.mvc.jobcate.JobcateVO;
import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;
import dev.mvc.mypage.MypageProcInter;
import dev.mvc.mypage.MypageVO;

@Controller
public class Like_guinCont {
  @Autowired
  @Qualifier("dev.mvc.like_guin.Like_guinProc") 
  private Like_guinProcInter like_guinProc;
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc") 
  private MemberProcInter memberProc;
  
  @Autowired
  @Qualifier("dev.mvc.jobcate.JobcateProc") 
  private JobcateProcInter jobcateProc;
  
  public Like_guinCont() {
    System.out.println("Like_guinCont created");
  }
  
  @RequestMapping(value = "/like_guin/list_like_guin.do", method = RequestMethod.GET)
  public ModelAndView list_like_guin(int memberno) {
    ModelAndView mav = new ModelAndView();
    
    MemberVO memberVO = this.memberProc.read(memberno);
    mav.addObject("memberVO", memberVO);
    
    ArrayList<Like_guinVO> list = like_guinProc.list_like_guin(memberno);
    mav.addObject("list", list);
    
    mav.setViewName("/mypage/list_like_guin"); // /webapp/WEB-INF/views/mypage/list_like_guin.jsp

    return mav;
  }
}
*/