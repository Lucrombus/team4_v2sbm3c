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
import dev.mvc.notice.NoticeVO;
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
   public ModelAndView create(HttpSession session, int contentsno) { 
     ModelAndView mav = new ModelAndView();
  
     if (session.getAttribute("memberno") != null) { //로그인한 경우에는 접근 가능
       Function<Integer, ContentsVO> f = (contentsnoparam) -> { //contentsnoparam로 contentsVO값 불러오기
         ContentsVO contentsVO = this.contentsProc.read(contentsnoparam);
         return contentsVO;
       };
       mav.addObject("f", f.apply(contentsno));
       
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

     if (this.memberProc.isMember(session)) { // (로그인세션의 memberno와 report_c의 memberno가 같을경우에만 실행)

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
       mav.setViewName("redirect:/report_c/list_all_by_memberno.do");
       
     } else {
       mav.setViewName("/member/login_need"); // /WEB-INF/views/member/login_need.jsp
     }

     return mav;
   }
 
  // 회원 본인의 신고 리스트 조회
  //http://localhost:9093/report_c/list_all_by_memberno.do
   @RequestMapping(value="/report_c/list_all_by_memberno.do", method=RequestMethod.GET)
   public ModelAndView list_all_by_memberno(HttpSession session) {
     ModelAndView mav = new ModelAndView();
     
     if (this.memberProc.isMember(session)) {
       int memberno = (int)session.getAttribute("memberno");
       ArrayList<Report_cVO> list = this.report_cProc.list_all_by_memberno(memberno);
       mav.addObject("list", list);
       
       Function<Integer, ContentsVO> f = (contentsno) -> { //contentsno로 contentsVO값 불러오기
         ContentsVO contentsVO = this.contentsProc.read(contentsno);
         return contentsVO;
       };
       mav.addObject("f", f);
       
       mav.setViewName("report_c/list_all_by_memberno");
       mav.addObject("memberno", memberno);
     } else {
       mav.setViewName("/member/login_need");
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
     
     // 특수 문자 처리------
     String reason = report_cVO.getReason();
     String title = report_cVO.getTitle();
     reason = Tool.convertChar(reason);  
     title = Tool.convertChar(title); 
     report_cVO.setReason(reason);
     report_cVO.setTitle(title);  
     //------------------
     
     mav.addObject("report_cVO", report_cVO); // request.setAttribute("resumeVO", resumeVO);
     
     Function<Integer, ContentsVO> f = (contentsno) -> { //contentsno로 contentsVO값 불러오기
       ContentsVO contentsVO = this.contentsProc.read(contentsno);
       return contentsVO;
     };
     
     // 회원 번호: admino -> AdminVO -> id
//     String id = this.memberProc.read(report_cVO.getMemberno()).getId(); //신고자
//     String id_t = this.memberProc.read(report_cVO.getContentsno()).getId(); //컨텐츠 작성자
     String title_c = this.contentsProc.read(report_cVO.getContentsno()).getTitle(); //컨텐츠 제목
//     mav.addObject("id", id);
//     mav.addObject("id_t", id_t);
     mav.addObject("title_c", title_c);

     mav.setViewName("/report_c/read"); // /WEB-INF/views/resume/read.jsp
         
     return mav;
   }
   
//   // 삭제 폼
//   @RequestMapping(value="/report_c/delete.do", method=RequestMethod.GET )
//   public ModelAndView delete(int reportno) { 
//     ModelAndView mav = new  ModelAndView();
//     
//     // 삭제할 정보를 조회하여 확인
//     Report_cVO report_cVO = this.report_cProc.read(reportno);
//     mav.addObject("report_cVO", report_cVO);
//     
//     mav.setViewName("/report_c/delete");  // /webapp/WEB-INF/views/resume/delete.jsp
//     
//     return mav; 
//   }

   // 삭제 처리
   @RequestMapping(value = "/report_c/delete.do", method = RequestMethod.POST)
   public ModelAndView delete(HttpSession session, Report_cVO report_cVO) {
     ModelAndView mav = new ModelAndView();
         
     System.out.println(report_cVO.getReportno());
     this.report_cProc.delete(report_cVO.getReportno()); // DBMS 삭제
     
     int memberno = (int) session.getAttribute("memberno");
     mav.addObject("memberno", memberno);
     mav.setViewName("redirect:/report_c/list_all_by_memberno.do"); // request -> param으로 접근 전환
     
     
     return mav;
   }  
   
   // 신고 글 수정 처리(answer 등록하기)
   @RequestMapping(value = "/report_c/update.do", method = RequestMethod.POST)
   public ModelAndView update(HttpSession session, Report_cVO report_cVO) {
     ModelAndView mav = new ModelAndView();
     
     if (this.memberProc.isAdmin(session)) { //관리자일 경우에
       int cnt = this.report_cProc.update(report_cVO);
       report_cVO = this.report_cProc.read(report_cVO.getReportno()); // 수정된 내용을 다시 읽어옴
       
       

       mav.addObject("report_cVO", report_cVO); // 수정된 내용을 다시 전달
       mav.setViewName("redirect:/report_c/read.do?reportno=" + report_cVO.getReportno());
     } else {
       mav.setViewName("/member/admin_login_need"); // 정상적인 로그인이 아닌 경우
     }           
     
     return mav; // forward
   }
   


   
  // 각종 MSG 처리
  @RequestMapping(value = "/report_c/msg.do", method = RequestMethod.GET)
  public ModelAndView msg(String url) {

    ModelAndView mav = new ModelAndView();
    mav.setViewName(url);
    return mav;

  }

}
