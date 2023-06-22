package dev.mvc.inquiry;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    
    
    if (this.memberProc.isMember(session) || this.memberProc.isAdmin(session) || this.memberProc.isEnterprise(session)) {
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
      int cnt = this.inquiryProc.create(inquiryVO); 
    
      if (cnt == 1) {
          mav.addObject("code", "create_success");
      } else {
          mav.addObject("code", "create_fail");
      }
      mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
      
      mav.addObject("memberno", inquiryVO.getMemberno()); // redirect parameter 적용
      mav.addObject("answer", inquiryVO.getAnswer()); // redirect parameter 적용

      mav.addObject("url", "/inquiry/msg"); // msg.jsp, redirect parameter 적용
     
      mav.setViewName("redirect:/inquiry/msg.do"); 

    } else {
      mav.addObject("url", "/member/login_need"); // /WEB-INF/views/admin/login_need.jsp
      mav.setViewName("redirect:/inquiry/msg.do"); 
    }
    
    return mav; // forward
  }
}