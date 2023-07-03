package dev.mvc.report_m;

import java.util.ArrayList;
import java.util.function.Function;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.contents.ContentsProcInter;
import dev.mvc.contents.ContentsVO;
import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;
import dev.mvc.message.MessageVO;
import dev.mvc.report_c.Report_cVO;
import dev.mvc.resume.Resume;
import dev.mvc.resume.ResumeVO;
import dev.mvc.tool.Tool;


@Controller
public class Report_mCont {
  
  @Autowired
  @Qualifier("dev.mvc.report_m.Report_mProc")
  private Report_mProcInter report_mProc;

  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  @Autowired
  @Qualifier("dev.mvc.contents.ContentsProc")
  private ContentsProcInter contentsProc;

  public Report_mCont() {
    System.out.println("Report_mCont created");
  }
  
  // 신고 등록 폼
  // http://localhost:9093/report_m/create.do
   @RequestMapping(value = "/report_m/create.do", method = RequestMethod.GET)
   public ModelAndView create(HttpSession session) { 
     ModelAndView mav = new ModelAndView();
  
     if (session.getAttribute("memberno") != null) { //로그인한 경우에는 접근 가능
       mav.setViewName("/report_m/create"); // /webapp/WEB-INF/views/report_m/create.jsp
     } else {
       mav.setViewName("/member/login_need");
     }
  
     return mav;
   }
   
   //아이디 확인후 membrno 반환 AJAX
   @ResponseBody
   @RequestMapping(value = "/report_m/checkid_ajax.do", method = RequestMethod.POST)
   public String check(String member_target) {

     System.out.println("응답성공");

     JSONObject json = new JSONObject();
     MemberVO memberVO = this.memberProc.readById(member_target);
     if (memberVO != null) {
       json.put("memberno", memberVO.getMemberno());
       json.put("result", "성공");

     } else {
       json.put("result", "실패");
     }

     return json.toString();

   }
 
   // 신고 등록 처리
   @RequestMapping(value = "/report_m/create.do", method = RequestMethod.POST)
   public ModelAndView create(HttpSession session, Report_mVO report_mVO) {

     ModelAndView mav = new ModelAndView();
     
     // Call By Reference: 메모리 공유, Hashcode 전달
     int memberno = (int) session.getAttribute("memberno"); // memberno FK
     report_mVO.setMemberno(memberno);
     
     if ((int)session.getAttribute("memberno") == (report_mVO.getMemberno())) { // (로그인세션의 memberno와 report_m의 memberno가 같을경우에만 실행)

       // answer 값이 존재하는지 확인하여 done 값을 설정
       if (report_mVO.getAnswer() != null && !report_mVO.getAnswer().isEmpty()) {
         report_mVO.setDone("Y");
       } else {
         report_mVO.setDone("N");
       }
       
       int cnt = this.report_mProc.create(report_mVO);

       // ------------------------------------------------------------------------------
       // PK의 return
       // ------------------------------------------------------------------------------
       // System.out.println("--> contentsno: " + contentsVO.getContentsno());
       // mav.addObject("contentsno", contentsVO.getContentsno()); // redirect parameter 적용
       // ------------------------------------------------------------------------------

       mav.addObject("memberno", memberno);
       mav.setViewName("redirect:/report_m/list_all_by_memberno.do");
       
     } else {
       mav.setViewName("/member/login_need"); // /WEB-INF/views/member/login_need.jsp
     }

     return mav;
   }
 
  // 회원 본인의 신고 리스트 조회
  //http://localhost:9093/report_m/list_all_by_memberno.do
  @RequestMapping(value="/report_m/list_all_by_memberno.do", method=RequestMethod.GET)
  public ModelAndView list_all_by_memberno(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (this.memberProc.isAdmin(session) || 
        session.getAttribute("memberno") != null) {
      int memberno = (int)session.getAttribute("memberno");
      ArrayList<Report_mVO> list = this.report_mProc.list_all_by_memberno(memberno);
      mav.addObject("list", list);
      
      Function<Integer, MemberVO> f = (target_mno) -> {
        MemberVO member_tVO = this.memberProc.readByMemberno(target_mno);
        return member_tVO;
      };
      mav.addObject("f", f);
      
      mav.setViewName("report_m/list_all_by_memberno");
      mav.addObject("memberno", memberno);
    } else {
      mav.setViewName("/member/login_need");
    }
    
    return mav;
  }
  
  // 관리자 전용 신고 리스트 전체 조회
   //http://localhost:9093/report_m/list_all.do
   @RequestMapping(value="/report_m/list_all.do", method=RequestMethod.GET)
   public ModelAndView list_all(HttpSession session) {
     ModelAndView mav = new ModelAndView();
     
     if (this.memberProc.isAdmin(session)) {
     mav.setViewName("/report_m/list_all"); // /WEB-INF/views/resume/list_all.jsp
  
     ArrayList<Report_mVO> list = this.report_mProc.list_all();
     mav.addObject("list", list);     
     
     Function<Integer, String> f = (memberno) -> {
       MemberVO memberVO = memberProc.readByMemberno(memberno);
       String id = memberVO.getId();
       return id;
     };
     mav.addObject("f", f);
     
     Function<Integer, String> f2 = (target_mno) -> {
       MemberVO memberVO = memberProc.readByMemberno(target_mno);
       String id = memberVO.getId();
       return id;
     };
     mav.addObject("f2", f2);
     
     } else {
       mav.setViewName("/member/login_need"); // /WEB-INF/views/member/login_need.jsp
     }
     
     return mav;
   }
   
   // 신고 글 조회
   @RequestMapping(value="/report_m/read.do", method=RequestMethod.GET )
   public ModelAndView read(int reportno) {
     ModelAndView mav = new ModelAndView();

     Report_mVO report_mVO = this.report_mProc.read(reportno);
     
     // 특수 문자 처리------
     String reason = report_mVO.getReason();
     String title = report_mVO.getTitle();
     reason = Tool.convertChar(reason);  
     title = Tool.convertChar(title); 
     report_mVO.setReason(reason);
     report_mVO.setTitle(title);  
     //------------------
     
     mav.addObject("report_mVO", report_mVO); // request.setAttribute("resumeVO", resumeVO);
     
     // 회원 번호: admino -> AdminVO -> id
     String id = this.memberProc.read(report_mVO.getMemberno()).getId();
     String id_t = this.memberProc.read(report_mVO.getTarget_mno()).getId();
     mav.addObject("id", id);
     mav.addObject("id_t", id_t);

     mav.setViewName("/report_m/read"); // /WEB-INF/views/resume/read.jsp
         
     return mav;
   }
   
//   // 삭제 폼
//   @RequestMapping(value="/report_m/delete.do", method=RequestMethod.GET )
//   public ModelAndView delete(int reportno) { 
//     ModelAndView mav = new  ModelAndView();
//     
//     // 삭제할 정보를 조회하여 확인
//     Report_mVO report_mVO = this.report_mProc.read(reportno);
//     mav.addObject("report_mVO", report_mVO);
//     
//     mav.setViewName("/report_m/delete");  // /webapp/WEB-INF/views/resume/delete.jsp
//     
//     return mav; 
//   }

   // 삭제 처리
   @RequestMapping(value = "/report_m/delete.do", method = RequestMethod.POST)
   public ModelAndView delete(HttpSession session, Report_mVO report_mVO) {
     ModelAndView mav = new ModelAndView();
         
     System.out.println(report_mVO.getReportno());
     this.report_mProc.delete(report_mVO.getReportno()); // DBMS 삭제
     
     int memberno = (int) session.getAttribute("memberno");
     mav.addObject("memberno", memberno);
     mav.setViewName("redirect:/report_m/list_all_by_memberno.do"); // request -> param으로 접근 전환
     
     
     return mav;
   }  
   
   // 신고 글 수정 처리(answer 등록하기)
   @RequestMapping(value = "/report_m/update.do", method = RequestMethod.POST)
   public ModelAndView update(HttpSession session, Report_mVO report_mVO) {
     ModelAndView mav = new ModelAndView();
     
     if (this.memberProc.isAdmin(session)) { //관리자일 경우에
       
       // answer 값이 존재하는지 확인하여 done 값을 설정
       if (report_mVO.getAnswer() != null && !report_mVO.getAnswer().isEmpty()) {
         report_mVO.setDone("Y");
       } else {
         report_mVO.setDone("N");
       }
       
       int cnt = this.report_mProc.update(report_mVO);
       report_mVO = this.report_mProc.read(report_mVO.getReportno()); // 수정된 내용을 다시 읽어옴

       mav.addObject("report_cVO", report_mVO); // 수정된 내용을 다시 전달
       mav.setViewName("redirect:/report_m/read.do?reportno=" + report_mVO.getReportno());
     } else {
       mav.setViewName("/member/admin_login_need"); // 정상적인 로그인이 아닌 경우
     }           
     
     return mav; // forward
   }
   
  // 각종 MSG 처리
  @RequestMapping(value = "/report_m/msg.do", method = RequestMethod.GET)
  public ModelAndView msg(String url) {

    ModelAndView mav = new ModelAndView();
    mav.setViewName(url);
    return mav;

  }

}
