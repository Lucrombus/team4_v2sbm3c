package dev.mvc.answer;

import java.util.ArrayList;
import java.util.function.Function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.inquiry.InquiryProcInter;
import dev.mvc.inquiry.InquiryVO;
import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;

@Controller
public class AnswerCont {
  @Autowired
  @Qualifier("dev.mvc.answer.AnswerProc")
  private AnswerProcInter answerProc;

  @Autowired
  @Qualifier("dev.mvc.inquiry.InquiryProc")
  private InquiryProcInter inquiryProc;

  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;

  public AnswerCont() {
    System.out.println("-> AnswerCont created.");
  }

  // http://localhost:9093/answer/create.do?inquiry=1
  /**
   * 답변 등록
   * 
   * @return
   */
  @RequestMapping(value = "/answer/create.do", method = RequestMethod.GET)
  public ModelAndView create(HttpSession session, AnswerVO answerVO, int inquiryno) {
    ModelAndView mav = new ModelAndView();
    
    InquiryVO inquiryVO = this.inquiryProc.read(answerVO.getInquiryno());
    mav.addObject("inquiryVO", inquiryVO);
    
    if (this.memberProc.isAdmin(session)) {
      mav.setViewName("/answer/create"); // /WEB-INF/views/inquiry/create.jsp
    } else {
      mav.setViewName("/member/admin_login_need"); // /WEB-INF/views/admin/login_need.jsp
    }

    return mav; // forward
  }

  /**
   * 답변 등록 처리 http://localhost:9093/answer/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/answer/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, HttpSession session, AnswerVO answerVO) {
    ModelAndView mav = new ModelAndView();
    
    if (this.memberProc.isAdmin(session)) {
      int cnt = answerProc.create(answerVO);

      if (cnt == 1) {
        mav.setViewName("redirect:/inquiry/list_all.do");
      } else {
        mav.setViewName("redirect:/inquiry/list_by_member");
      }
    } else {
      mav.addObject("url", "/member/admin_login_need"); // /WEB-INF/views/admin/login_need.jsp
    }
    return mav; // forward
  }
  
  /**
   * 모든 답변, http://localhost:9093/answer/list_all.do
   * 
   * @return
   */
  @RequestMapping(value = "/answer/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all(HttpServletRequest request, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/answer/list_all"); // /webapp/WEB-INF/views/inquiry/list_all.jsp

    if (this.memberProc.isAdmin(session)) {
      ArrayList<AnswerVO> list = this.answerProc.list_all();
      
      mav.addObject("list", list);
    } else {
      mav.setViewName("/member/admin_login_need");
    }

    // 관리자번호로 관리자 이름 얻는 메소드를 람다식으로 객체화 후 페이지에 전달
    Function<Integer, String> f = (memberno) -> {
      MemberVO memberVO = memberProc.readByMemberno(memberno);
      String id = memberVO.getId();
      return id;
    };
    mav.addObject("f", f);

    return mav;
  }
}
