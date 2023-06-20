package dev.mvc.mypage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;
  
@Controller
public class MypageCont {
  @Autowired
  @Qualifier("dev.mvc.mypage.MypageProc") 
  private MypageProcInter mypageProc;
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc") 
  private MemberProcInter memberProc;
  
  public MypageCont () {
    System.out.println("-> MypageCont created.");
  }
  
  /**
  * 마이페이지, http://localhost:9093/mypage/mypage_main.do
  * @return
  */
  @RequestMapping(value="/mypage/mypage_main.do", method=RequestMethod.GET )
  public ModelAndView mypage_main(HttpSession session, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    int memberno = 0;
    if (this.memberProc.isMember(session) || this.memberProc.isAdmin(session) || this.memberProc.isEnterprise(session)) { 
      // 로그인한 경우

      if (this.memberProc.isMember(session)) { // 회원으로 로그인
        memberno = (int)session.getAttribute("memberno");  // 본인의 회원 정보 조회
      }
      else if (this.memberProc.isEnterprise(session)) { // 기업으로 로그인
        memberno = (int)session.getAttribute("memberno");  // 본인의 회원 정보 조회
      }
      else if (this.memberProc.isAdmin(session)) { // 관리자로 로그인
        memberno = Integer.parseInt(request.getParameter("memberno")); // 관리자는 누구나 조회 가능
        
      }
      
      MemberVO memberVO = this.memberProc.read(memberno);
      mav.addObject("memberVO", memberVO);
      mav.setViewName("/mypage/mypage_main"); // /WEB-INF/views/mypage/mypage_main.jsp
      
    } else {
      // 로그인을 하지 않은 경우
      mav.setViewName("/member/login_need"); // /webapp/WEB-INF/views/member/login_need.jsp
    }
   
    return mav;
  }
  
  /**
  * 내 정보, http://localhost:9093/mypage/myinfo.do
  * @return
  */
  @RequestMapping(value="/mypage/myinfo.do", method=RequestMethod.GET )
  public ModelAndView myinfo(HttpSession session, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    int memberno = 0;
    if (this.memberProc.isMember(session) || this.memberProc.isAdmin(session) || this.memberProc.isEnterprise(session)) { 
      // 로그인한 경우

      if (this.memberProc.isMember(session)) { // 회원으로 로그인
        memberno = (int)session.getAttribute("memberno");  // 본인의 회원 정보 조회
      }
      else if (this.memberProc.isEnterprise(session)) { // 기업으로 로그인
        memberno = (int)session.getAttribute("memberno");  // 본인의 회원 정보 조회
      }
      else if (this.memberProc.isAdmin(session)) { // 관리자로 로그인
        memberno = (int)session.getAttribute("memberno"); // 관리자는 누구나 조회 가능
      }
      
      MemberVO memberVO = this.memberProc.read(memberno);
      mav.addObject("memberVO", memberVO);
      mav.setViewName("/mypage/myinfo"); // /WEB-INF/views/mypage/mypage_main.jsp
      
    } else {
      // 로그인을 하지 않은 경우
      mav.setViewName("/member/login_need"); // /webapp/WEB-INF/views/member/login_need.jsp
    }
   
    return mav;
  }
  
  /**
   * 나의 관심 구직 목록, http://localhost:9093/mypage/list_like_guin.do
   * @return
   */
  @RequestMapping(value="/mypage/list_like_guin.do", method=RequestMethod.GET)
  public ModelAndView list_like_guin() {
    ModelAndView mav = new ModelAndView();
    
    ArrayList<MypageVO> list = this.mypageProc.list_like_guin();
    mav.addObject("list", list);
    
    mav.setViewName("/mypage/list_like_guin"); // /webapp/WEB-INF/views/mypage/list_like_guin.jsp
    
    return mav;
  }
  
  /**
   * 나의 관심 구인 목록, http://localhost:9093/mypage/list_like_gugik.do
   * @return
   */
  @RequestMapping(value="/mypage/list_like_gugik.do", method=RequestMethod.GET)
  public ModelAndView list_like_gugik() {
    ModelAndView mav = new ModelAndView();
    
    ArrayList<MypageVO> list = this.mypageProc.list_like_gugik();
    mav.addObject("list", list);
    
    mav.setViewName("/mypage/list_like_gugik"); // /webapp/WEB-INF/views/mypage/list_like_gugik.jsp
    
    return mav;
  }
}