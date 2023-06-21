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
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.contents.ContentsProcInter;
import dev.mvc.contents.ContentsVO;
import dev.mvc.member.MemberProcInter;

 
@Controller
public class InquiryCont {
  @Autowired
  @Qualifier("dev.mvc.inquiry.InquiryProc")
  private InquiryProcInter inquiryProc;
  
  @Qualifier("dev.mvc.contents.ContentsProc")
  private ContentsProcInter contentsProc;
  
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  public InquiryCont(){
    System.out.println("-> InquiryCont created.");
  }

  // http://localhost:9093/inquiry/create.do?contentsno=3
  /**
  * 문의 글 등록
  * @return
  */
  @RequestMapping(value="/inquiry/create.do", method=RequestMethod.GET )
  public ModelAndView create(int contentsno) {
    ModelAndView mav = new ModelAndView();
    
    ContentsVO contentsVO = this.contentsProc.read(contentsno);
    mav.addObject("contentsVO", contentsVO);
    // request.setAttribute("contentsVO", contentsVO);
    
    mav.setViewName("/inquiry/create"); // /WEB-INF/views/inquiry/create.jsp
   
    return mav; // forward
  }
  
}