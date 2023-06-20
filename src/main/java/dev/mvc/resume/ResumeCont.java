package dev.mvc.resume;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.member.MemberProcInter;

@Controller
public class ResumeCont {
  
  @Autowired
  @Qualifier("dev.mvc.resume.ResumeProc")
  private ResumeProcInter resumeProc;
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  public ResumeCont() {
    System.out.println("ResumeCont created");
  }

  //이력서 등록 폼
  //http://localhost:9093/resume/create.do
   @RequestMapping(value = "/resume/create.do", method = RequestMethod.GET)
   public ModelAndView create(HttpSession session) {
     // public ModelAndView create(HttpServletRequest request, int cateno) {
     ModelAndView mav = new ModelAndView();
  
     if (this.memberProc.isMember(session) != true) {
       mav.setViewName("/resume/create"); // /webapp/WEB-INF/views/notice/create.jsp
     } else {
       mav.setViewName("/member/login_need");
     }
     
     return mav;
   }
   
  //이력서 등록 처리
  
  //리스트 조회
  
  //이력서 조회
  
  //이력서 삭제 폼
  
  //이력서 삭제 처리
  
  //이력서 수정 폼
  
  //이력서 수정 처리
  
  
}