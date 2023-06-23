package dev.mvc.report_c;

import java.util.ArrayList;
import java.util.function.Function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.contents.ContentsProcInter;
import dev.mvc.contents.ContentsVO;
import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;
import dev.mvc.report_m.Report_mVO;
import dev.mvc.resume.Resume;
import dev.mvc.resume.ResumeVO;
import dev.mvc.tool.Tool;


@Controller
public class Report_cCont {
  
  @Autowired
  @Qualifier("dev.mvc.report_c.Report_cProc")
  private Report_cProcInter report_cProc;

  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  @Autowired
  @Qualifier("dev.mvc.contents.ContentsProc")
  private ContentsProcInter contentsProc;

  public Report_cCont() {
    System.out.println("Report_cCont created");
  }
  
  // 신고 등록 폼
  // http://localhost:9093/report_c/create.do
   @RequestMapping(value = "/report_c/create.do", method = RequestMethod.GET)
   public ModelAndView create(HttpSession session) { 
     ModelAndView mav = new ModelAndView();
  
     if (session.getAttribute("memberno") != null) { //로그인한 경우에는 접근 가능
       mav.setViewName("/report_c/create"); // /webapp/WEB-INF/views/report_c/create.jsp
     } else {
       mav.setViewName("/member/login_need");
     }
  
     return mav;
   }
 
   // 신고 등록 처리
   @RequestMapping(value = "/report_c/create.do", method = RequestMethod.POST)
   public ModelAndView create(HttpServletRequest request, HttpSession session, Report_cVO report_cVO) {

     ModelAndView mav = new ModelAndView();

     if ((int)session.getAttribute("memberno") == (report_cVO.getMemberno())) { // (로그인세션의 memberno와 report_c의 memberno가 같을경우에만 실행)


       // Call By Reference: 메모리 공유, Hashcode 전달
       int memberno = (int) session.getAttribute("memberno"); // memberno FK
       report_cVO.setMemberno(memberno);
       int cnt = this.report_cProc.create(report_cVO);

       // ------------------------------------------------------------------------------
       // PK의 return
       // ------------------------------------------------------------------------------
       // System.out.println("--> contentsno: " + contentsVO.getContentsno());
       // mav.addObject("contentsno", contentsVO.getContentsno()); // redirect parameter 적용
       // ------------------------------------------------------------------------------

       mav.addObject("memberno", memberno);
       mav.setViewName("redirect:/report_c/list_all.do");
       
     } else {
       mav.setViewName("/member/login_need"); // /WEB-INF/views/member/login_need.jsp
     }

     return mav;
   }
 
  // 회원 본인의 신고 리스트 조회
  //http://localhost:9093/report_c/list_all_by_memberno.do
  @RequestMapping(value="/report_c/list_all_by_memberno.do", method=RequestMethod.GET)
  public ModelAndView list_all_by_memberno(HttpSession session, Report_cVO report_cVO) {
    ModelAndView mav = new ModelAndView();
    int memberno = (int)session.getAttribute("memberno"); //회원 번호 불러오기
    report_cVO.setMemberno(memberno); //report_cVO에 세션 회원번호 저장
    //Report_cVO report_cVO = this.report_cProc.read(memberno); //회원번호에 따른 신고정보 불러오기
    
    System.out.println("now session memberno="+memberno);//tset
    System.out.println("now report_cVO memberno="+report_cVO.getMemberno());//test
    
    if ((int)session.getAttribute("memberno") == (report_cVO.getMemberno())) {
      //report_cVO.setMemberno(memberno);
      ArrayList<Report_cVO> list = this.report_cProc.list_all_by_memberno(memberno);
      mav.addObject("list", list);
      
      mav.setViewName("/report_c/list_all_by_memberno"); // /WEB-INF/views/resume/list_all_by_memberno.jsp
    
    } else {
      mav.setViewName("/member/login_need"); // /WEB-INF/views/member/login_need.jsp
    }
    
    return mav;
  }
  
  // 관리자 전용 신고 리스트 전체 조회
   //http://localhost:9093/report_c/list_all.do
   @RequestMapping(value="/report_c/list_all.do", method=RequestMethod.GET)
   public ModelAndView list_all(HttpSession session) {
     ModelAndView mav = new ModelAndView();
     
     if (this.memberProc.isAdmin(session)) {
     mav.setViewName("/report_c/list_all"); // /WEB-INF/views/resume/list_all.jsp
  
     ArrayList<Report_cVO> list = this.report_cProc.list_all();
     mav.addObject("list", list);     
     } else {
       mav.setViewName("/member/login_need"); // /WEB-INF/views/member/login_need.jsp
     }
     
     return mav;
   }
   
   // 신고 글 조회
   @RequestMapping(value="/report_c/read.do", method=RequestMethod.GET )
   public ModelAndView read(int reportno) {
     ModelAndView mav = new ModelAndView();

     Report_cVO report_cVO = this.report_cProc.read(reportno);
     
     String reason = report_cVO.getReason();
     //String title = report_cVO.getTitle();
     
     reason = Tool.convertChar(reason);  // 특수 문자 처리
     //title = Tool.convertChar(title); 
     
     report_cVO.setReason(reason);
     //report_cVO.setTitle(title);  
     
     mav.addObject("report_cVO", report_cVO); // request.setAttribute("resumeVO", resumeVO);
     
     // 회원 번호: admino -> AdminVO -> name
     String name = this.memberProc.read(report_cVO.getMemberno()).getName();
     mav.addObject("name", name);

     mav.setViewName("/report_c/read"); // /WEB-INF/views/resume/read.jsp
         
     return mav;
   }
   
   // 삭제 폼
   @RequestMapping(value="/report_c/delete.do", method=RequestMethod.GET )
   public ModelAndView delete(int reportno) { 
     ModelAndView mav = new  ModelAndView();
     
     // 삭제할 정보를 조회하여 확인
     Report_cVO report_cVO = this.report_cProc.read(reportno);
     mav.addObject("report_cVO", report_cVO);
     
     mav.setViewName("/report_c/delete");  // /webapp/WEB-INF/views/resume/delete.jsp
     
     return mav; 
   }

   // 삭제 처리
//   @RequestMapping(value = "/resume/delete.do", method = RequestMethod.POST)
//   public ModelAndView delete(HttpSession session, ResumeVO resumeVO) {
//     ModelAndView mav = new ModelAndView();
//         
//     this.resumeProc.delete(resumeVO.getResumeno()); // DBMS 삭제
//     
//     int memberno = (int) session.getAttribute("memberno");
//     mav.addObject("memberno", memberno);
//     mav.addObject("now_page", resumeVO.getNow_page());
//     mav.setViewName("redirect:/resume/list_all.do"); // request -> param으로 접근 전환
//     
//     return mav;
//   }  

}
