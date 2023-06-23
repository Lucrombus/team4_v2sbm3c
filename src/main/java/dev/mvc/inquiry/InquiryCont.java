package dev.mvc.inquiry;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.board.BoardVO;
import dev.mvc.contents.Contents;
import dev.mvc.contents.ContentsProcInter;
import dev.mvc.contents.ContentsVO;
import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;
import dev.mvc.notice.NoticeVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class InquiryCont {
  @Autowired
  @Qualifier("dev.mvc.inquiry.InquiryProc")
  private InquiryProcInter inquiryProc;

  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;

  public InquiryCont() {
    System.out.println("-> InquiryCont created.");
  }

  // http://localhost:9093/inquiry/create.do?contentsno=3
  /**
   * 문의 글 등록
   * 
   * @return
   */
  @RequestMapping(value = "/inquiry/create.do", method = RequestMethod.GET)
  public ModelAndView create(HttpSession session, int memberno) {
    ModelAndView mav = new ModelAndView();

    if (this.memberProc.isMember(session) || this.memberProc.isEnterprise(session)) {
      mav.setViewName("/inquiry/create"); // /WEB-INF/views/inquiry/create.jsp
    } else {
      mav.setViewName("/member/login_need"); // /WEB-INF/views/admin/login_need.jsp
    }

    return mav; // forward
  }

  /**
   * 등록 처리 http://localhost:9093/inquiry/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/inquiry/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, HttpSession session, InquiryVO inquiryVO) {
    ModelAndView mav = new ModelAndView();

    if (session.getAttribute("id") != null) {
//      int memberno = (int)session.getAttribute("memberno"); // adminno FK
//      inquiryVO.setMemberno(memberno);
      int cnt = inquiryProc.create(inquiryVO);

      if (cnt == 1) {
        mav.setViewName("redirect:/inquiry/list_by_memberno.do");
      } else {
        mav.setViewName("redirect:/inquiry/list_by_member");
      }
//      mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
//      
      mav.addObject("memberno", inquiryVO.getMemberno()); // redirect parameter 적용
//      mav.addObject("answer", inquiryVO.getAnswer()); // redirect parameter 적용
//
//      mav.addObject("url", "/inquiry/msg"); // msg.jsp, redirect parameter 적용
//     

    } else {
      mav.addObject("url", "/member/login_need"); // /WEB-INF/views/admin/login_need.jsp
      mav.setViewName("redirect:/inquiry/msg.do");
    }

    return mav; // forward
  }

  /**
   * 모든 문의에 등록된 글 목록, http://localhost:9093/inquiry/list_all.do
   * 
   * @return
   */
  @RequestMapping(value = "/inquiry/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all(HttpServletRequest request, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/inquiry/list_all"); // /webapp/WEB-INF/views/inquiry/list_all.jsp

    if (this.memberProc.isAdmin(session)) {
      ArrayList<InquiryVO> list = this.inquiryProc.list_all();
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
   * memberno에 따른 문의 글목록 
   * http://localhost:9093/inquiry/list_by_memberno.do?memberno=1
   * http://localhost:9091/inquiry/list_by_memberno.do?memberno=2
   * http://localhost:9091/inquiry/list_by_memberno.do?memberno=3
   * 
   * @return
   */
  @RequestMapping(value = "/inquiry/list_by_memberno.do", method = RequestMethod.GET)
  public ModelAndView list_by_memberno(HttpServletRequest request, HttpSession session, int memberno) {
    ModelAndView mav = new ModelAndView();

    MemberVO memberVO = this.memberProc.read(memberno);
    mav.addObject("memberVO", memberVO);

    if (this.memberProc.isMember(session) || this.memberProc.isEnterprise(session)) {
      ArrayList<InquiryVO> list = this.inquiryProc.list_by_memberno(memberno);
      mav.addObject("list", list);

      mav.setViewName("/inquiry/list_by_memberno"); // /webapp/WEB-INF/views/inquiry/list_by_memberno.jsp
    } else {
      mav.setViewName("/member/admin_login_need");
    }

    return mav;
  }

  // 문의 조회
  @RequestMapping(value = "/inquiry/read.do", method = RequestMethod.GET)
  public ModelAndView read(int inquiryno) {
    ModelAndView mav = new ModelAndView();

    InquiryVO inquiryVO = this.inquiryProc.read(inquiryno);

    String title = inquiryVO.getInquiryTitle();
    String content = inquiryVO.getInquiryReason();

    title = Tool.convertChar(title); // 특수 문자 처리
    content = Tool.convertChar(content);

    inquiryVO.setInquiryTitle(title);
    inquiryVO.setInquiryReason(content);

    mav.addObject("inquiryVO", inquiryVO); // request.setAttribute("inquiryVO", inquiryVO);

    // 회원 번호: admino -> AdminVO -> name
    String name = this.memberProc.read(inquiryVO.getMemberno()).getName();
    mav.addObject("name", name);

    mav.setViewName("/inquiry/read"); // /WEB-INF/views/notice/read.jsp

    return mav;
  }

  /**
   * 문의 글 수정 폼 http://localhost:9093/inquiry/update.do?inquiryno=1
   * 
   * @return
   */
  @RequestMapping(value = "/inquiry/update.do", method = RequestMethod.GET)
  public ModelAndView update(int inquiryno) {
    ModelAndView mav = new ModelAndView();

    InquiryVO inquiryVO = this.inquiryProc.read(inquiryno); // 수정용 데이터

    mav.addObject("inquiryVO", inquiryVO);

    mav.setViewName("/inquiry/update");

    return mav; // forward
  }
//  /**
//   * 회원 정보 수정 처리
//   * @param memberVO
//   * @return
//   */
//  @RequestMapping(value="/inquiry/update.do", method=RequestMethod.POST)
//  public ModelAndView update(InquiryVO inquiryVO){
//    ModelAndView mav = new ModelAndView();
//    
//    int cnt = this.inquiryProc.update(inquiryVO);
//    
//    if (cnt == 1) {
//      mav.addObject("code", "update_success");
//    } else {
//      mav.addObject("code", "update_fail");
//    }
//
//    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
//    mav.addObject("url", "/inquiry/msg");  // /member/msg -> /member/msg.jsp
//    mav.addObject("inquiryno", inquiryVO.getInquiryno()); // redirect parameter 적용
//    mav.addObject("memberno", inquiryVO.getMemberno()); // redirect parameter 적용
//    mav.addObject("rdate", inquiryVO.getRdate()); // redirect parameter 적용
//    
//    mav.setViewName("redirect:/inquiry/msg.do");
//    
//    return mav;
//  }

  /**
   * 수정 처리 http://localhost:9093/contents/update_text.do?contentsno=1
   * 
   * @return
   */
  @RequestMapping(value = "/inquiry/update.do", method = RequestMethod.POST)
  public ModelAndView update(HttpSession session, InquiryVO inquiryVO) {
    ModelAndView mav = new ModelAndView();

    // System.out.println("-> word: " + contentsVO.getWord());

    if (this.memberProc.isMember(session) || this.memberProc.isMember(session)) { // 회원이나 기업 로그인
      int cnt = this.inquiryProc.update(inquiryVO);
      
      mav.addObject("inquiryno", inquiryVO.getInquiryno());
      mav.setViewName("redirect:/inquiry/read.do");

    } else {
      mav.addObject("url", "/member/login_need"); // /WEB-INF/views/admin/login_need.jsp
    }
    return mav; // forward
  }
  
  /**
   * 삭제 폼
   * @param contentsno
   * @return
   */
  @RequestMapping(value="/inquiry/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int inquiryno) { 
    ModelAndView mav = new  ModelAndView();
    
    // 삭제할 정보를 조회하여 확인
    InquiryVO inquiryVO = this.inquiryProc.read(inquiryno);
    mav.addObject("inquiryVO", inquiryVO);
    
    mav.setViewName("/inquiry/delete");  // /webapp/WEB-INF/views/inquiry/delete.jsp
    
    return mav; 
  }
  
  /**
   * 삭제 처리 http://localhost:9091/contents/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/inquiry/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(InquiryVO inquiryVO) {
    ModelAndView mav = new ModelAndView();
    
    this.inquiryProc.delete(inquiryVO.getInquiryno()); // DBMS 삭제
    
    mav.addObject("memberno", inquiryVO.getMemberno());
    
    mav.setViewName("redirect:/inquiry/list_by_memberno.do"); 
    
    return mav;
  }   
}