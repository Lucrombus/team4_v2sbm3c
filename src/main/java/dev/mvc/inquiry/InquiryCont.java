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
   * @return
   */
  @RequestMapping(value="/inquiry/list_all.do", method=RequestMethod.GET)
  public ModelAndView list_all(HttpServletRequest request, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/inquiry/list_all"); // /webapp/WEB-INF/views/inquiry/list_all.jsp
   
    if(this.memberProc.isAdmin(session)) {
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
   * 특정 카테고리의 등록된 글목록
   * http://localhost:9091/inquiry/list_by_memberno.do?memberno=1
   * http://localhost:9091/inquiry/list_by_memberno.do?memberno=2
   * http://localhost:9091/inquiry/list_by_memberno.do?memberno=3
   * @return
   */
  @RequestMapping(value="/inquiry/list_by_memberno.do", method=RequestMethod.GET)
  public ModelAndView list_by_memberno(HttpServletRequest request, HttpSession session, int memberno) {
    ModelAndView mav = new ModelAndView();
    
    MemberVO memberVO = this.memberProc.read(memberno);
    mav.addObject("memberVO", memberVO);
    
    if(this.memberProc.isMember(session) || this.memberProc.isEnterprise(session)) {
    ArrayList<InquiryVO> list = this.inquiryProc.list_by_memberno(memberno);
    mav.addObject("list", list);
    
    mav.setViewName("/inquiry/list_by_memberno"); // /webapp/WEB-INF/views/inquiry/list_by_memberno.jsp
    } else {
      mav.setViewName("/member/admin_login_need");
    }
    
    return mav;
  }
}