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
import dev.mvc.tool.Tool;

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
  
  /**
   * POST 요청시 JSP 페이지에서 JSTL 호출 기능 지원
   * 새로고침 방지, EL에서 param으로 접근, GET -> POST
   * 
   * @return
   */
  @RequestMapping(value = "/answer/msg.do", method = RequestMethod.GET)
  public ModelAndView msg(String url) {
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward

    return mav; // forward
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
    
    InquiryVO inquiryVO = this.inquiryProc.read(inquiryno);
    // ArrayList<InquiryVO> list = this.inquiryProc.list_all();
    mav.addObject("inquiryVO", inquiryVO);
    // mav.addObject("list", list);
    
    if (this.memberProc.isAdmin(session)) {
      mav.setViewName("/answer/create"); // /WEB-INF/views/inquiry/create.jsp
    } else {
      mav.setViewName("/member/admin_login_need"); // /WEB-INF/views/admin/login_need.jsp
    }
    
    Function<Integer, String> f = (memberno) -> {
      MemberVO memberVO = memberProc.readByMemberno(memberno);
      String id = memberVO.getId();
      return id;
    };
    mav.addObject("f", f);

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
      int memberno = (int)session.getAttribute("memberno");
      answerVO.setMemberno(memberno);
      
      int cnt = answerProc.create(answerVO);
      if (cnt == 1) {
        mav.addObject("code", "create_success");
      } else {
        mav.addObject("code", "create_fail");
      }
      
      // redirect시에 hidden tag로 보낸것들이 전달이 안됨으로 request에 다시 저장
      mav.addObject("memberno", memberno); // redirect parameter 적용
      mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
      mav.addObject("url", "/answer/msg"); // /member/msg -> /member/msg.jsp
      mav.setViewName("redirect:/answer/msg.do");
      
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
  
  /**
   * inquiryno에 따른 답변 목록, http://localhost:9093/answer/list_by_memberno.do
   * 
   * @return
   */
  @RequestMapping(value = "/answer/list_by_inquiryno.do", method = RequestMethod.GET)
  public ModelAndView list_by_inquiryno(HttpServletRequest request, HttpSession session, int inquiryno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/answer/list_by_inquiryno"); // /webapp/WEB-INF/views/inquiry/list_all.jsp

    ArrayList<AnswerVO> list = this.answerProc.list_by_inquiryno(inquiryno);
    
    mav.addObject("list", list);

    // 관리자번호로 관리자 이름 얻는 메소드를 람다식으로 객체화 후 페이지에 전달
    Function<Integer, String> f = (memberno_read) -> {
      MemberVO memberVO = memberProc.readByMemberno(memberno_read);
      String id = "(알수없음)";

      if (memberVO != null) {
        id = memberVO.getId();
      }

      return id;
    };
    mav.addObject("f", f);

    return mav;
  }
  
  // 문의 조회
 @RequestMapping(value = "/answer/read.do", method = RequestMethod.GET)
 public ModelAndView read(int answerno) {
   ModelAndView mav = new ModelAndView();

   AnswerVO answerVO = this.answerProc.read(answerno);

   String content = answerVO.getContent();
   content = Tool.convertChar(content);
   answerVO.setContent(content);

   mav.addObject("answerVO", answerVO); // request.setAttribute("inquiryVO", inquiryVO);

   Function<Integer, String> f = (memberno) -> {
     MemberVO memberVO = memberProc.readByMemberno(memberno);
     String id = memberVO.getId();
     return id;
   };
   mav.addObject("f", f);

   mav.setViewName("/answer/read"); // /WEB-INF/views/notice/read.jsp

   return mav;
 }

 /**
  * 문의 글 수정 폼 http://localhost:9093/inquiry/update.do?answerno=1
  * 
  * @return
  */
 @RequestMapping(value = "/answer/update.do", method = RequestMethod.GET)
 public ModelAndView update(int answerno) {
   ModelAndView mav = new ModelAndView();

   AnswerVO answerVO = this.answerProc.read(answerno); // 수정용 데이터

   mav.addObject("answerVO", answerVO);

   mav.setViewName("/answer/update");

   return mav; // forward
 }
 
 /**
  * 답변 수정 처리 http://localhost:9093/answer/update.do?answerno=1
  * 
  * @return
  */
 @RequestMapping(value = "/answer/update.do", method = RequestMethod.POST)
 public ModelAndView update(HttpSession session, AnswerVO answerVO) {
   ModelAndView mav = new ModelAndView();
   int memberno = (int)session.getAttribute("memberno");
   answerVO.setMemberno(memberno);
   // System.out.println("-> word: " + contentsVO.getWord());

   if (this.memberProc.isAdmin(session)) { // 회원이나 기업 로그인
     int cnt = this.answerProc.update(answerVO);
     
     if (cnt == 1) {
       mav.addObject("code", "update_success");
     } else {
       mav.addObject("code", "update_fail");
     }
     
     mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
     mav.addObject("url", "/answer/msg");  // /member/msg -> /member/msg.jsp
     mav.addObject("answerno", answerVO.getAnswerno());
     mav.addObject("memberno", memberno);
     mav.setViewName("redirect:/answer/msg.do");

   } else {
     mav.addObject("url", "/member/admin_login_need"); // /WEB-INF/views/admin/login_need.jsp
   }
   return mav; // forward
 }
 
 /**
  * 삭제 폼
  * @param answerno
  * @return
  */
 @RequestMapping(value="/answer/delete.do", method=RequestMethod.GET )
 public ModelAndView delete(int answerno) { 
   ModelAndView mav = new  ModelAndView();
   
   // 삭제할 정보를 조회하여 확인
   AnswerVO answerVO = this.answerProc.read(answerno);
   mav.addObject("answerVO", answerVO);
   
   mav.setViewName("/answer/delete");  // /webapp/WEB-INF/views/inquiry/delete.jsp
   
   return mav; 
 }
 
 /**
  * 삭제 처리 http://localhost:9093/answer/delete.do
  * 
  * @return
  */
 @RequestMapping(value = "/answer/delete.do", method = RequestMethod.POST)
 public ModelAndView delete(AnswerVO answerVO) {
   ModelAndView mav = new ModelAndView();
   
   this.answerProc.delete(answerVO.getAnswerno()); // DBMS 삭제
   
   mav.setViewName("redirect:/answer/list_all.do"); 
   
   return mav;
 }   
 
// /** 문의 및 답변 조회
//  * 
//  * @param inquiryno
//  * @return
//  */
//
// @RequestMapping(value = "/answer/read_by_inquiryno.do", method = RequestMethod.GET)
// public ModelAndView read_by_inquiryno(HttpSession session, int inquiryno) {
//   ModelAndView mav = new ModelAndView();
////   int memberno = (int)(session.getAttribute("memberno");
//   
//   InquiryVO inquiryVO = this.inquiryProc.read(inquiryno);
//  
//   String inquiryTitle = inquiryVO.getInquiryTitle();
//   String inquiryReason = inquiryVO.getInquiryReason();
//
//   inquiryTitle = Tool.convertChar(inquiryTitle);
//   inquiryReason = Tool.convertChar(inquiryReason);
//   
//   inquiryVO.setInquiryTitle(inquiryTitle);
//   inquiryVO.setInquiryReason(inquiryReason);
//   
//   
//   AnswerVO answerVO = this.answerProc.read_by_inquiryno(inquiryno);
//   if (answerVO != null) {
//     String content = answerVO.getContent();
//     content = Tool.convertChar(content);
//     answerVO.setContent(content);
//   }
//   
//   mav.addObject("inquiryVO", inquiryVO);
//   mav.addObject("answerVO", answerVO); // request.setAttribute("inquiryVO", inquiryVO);
//
//   Function<Integer, String> f = (memberno) -> {
//     MemberVO memberVO = memberProc.readByMemberno(memberno);
//     String id = memberVO.getId();
//     return id;
//   };
//   mav.addObject("f", f);
//
//   mav.setViewName("/answer/read_by_inquiryno"); // /WEB-INF/views/notice/read.jsp
//
//   return mav;
// }
 
}
