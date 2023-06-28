package dev.mvc.answer;

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

  // http://localhost:9093/answer/create.do?answerno=1
  /**
   * 답변 등록
   * 
   * @return
   */
  @RequestMapping(value = "/answer/create.do", method = RequestMethod.GET)
  public ModelAndView create(HttpSession session, int memberno) {
    ModelAndView mav = new ModelAndView();

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
        mav.setViewName("redirect:/inquiry/list_by_memberno.do");
      } else {
        mav.setViewName("redirect:/inquiry/list_by_member");
      }
//     mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
//     
      mav.addObject("memberno", answerVO.getMemberno()); // redirect parameter 적용
//     mav.addObject("answer", inquiryVO.getAnswer()); // redirect parameter 적용
//
//     mav.addObject("url", "/inquiry/msg"); // msg.jsp, redirect parameter 적용
//    

    } else {
      mav.addObject("url", "/member/admin_login_need"); // /WEB-INF/views/admin/login_need.jsp
    }

    return mav; // forward
  }
}
