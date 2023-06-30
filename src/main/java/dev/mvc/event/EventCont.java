package dev.mvc.event;

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

import dev.mvc.contents.Contents;
import dev.mvc.contents.ContentsVO;
import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class EventCont {

  @Autowired
  @Qualifier("dev.mvc.event.EventProc")
  private EventProcInter eventProc;

  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  public EventCont() {
    System.out.println("EventCont created");
  }

  // 공지사항 등록 폼
  // http://localhost:9093/event/create.do
  @RequestMapping(value = "/event/create.do", method = RequestMethod.GET)
  public ModelAndView create(HttpSession session) {
    ModelAndView mav = new ModelAndView();

    if (this.memberProc.isAdmin(session)) {
      mav.setViewName("/event/create"); // /webapp/WEB-INF/views/event/create.jsp
    } else {
      mav.setViewName("/member/admin_login_need");
    }
    
    return mav;
  }

  // 공지사항 등록 처리
  @RequestMapping(value = "/event/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, HttpSession session, EventVO eventVO) {

    ModelAndView mav = new ModelAndView();

    if (this.memberProc.isAdmin(session)) { //관리자일경우
      // ------------------------------------------------------------------------------
      // 파일 전송 코드 시작
      // ------------------------------------------------------------------------------
      String file1 = "";          // 원본 파일명 image
      String file1saved = "";   // 저장된 파일명, image
      String thumb1 = "";     // preview image

      String upDir =  Event.getUploadDir();
      System.out.println("-> upDir: " + upDir);
      
      // 전송 파일이 없어도 file1MF 객체가 생성됨.
      // <input type='file' class="form-control" name='file1MF' id='file1MF' 
      //           value='' placeholder="파일 선택">
      MultipartFile mf = eventVO.getFile1MF();
      
      file1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출
      System.out.println("-> file1: " + file1);
      
      long size1 = mf.getSize();  // 파일 크기
      
      if (size1 > 0) { // 파일 크기 체크
        // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
        file1saved = Upload.saveFileSpring(mf, upDir); 
        
        if (Tool.isImage(file1saved)) { // 이미지인지 검사
          // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
          thumb1 = Tool.preview(upDir, file1saved, 200, 150); 
        }
        
      }    
      
      eventVO.setFile1(file1);   // 순수 원본 파일명
      eventVO.setFile1saved(file1saved); // 저장된 파일명(파일명 중복 처리)
      eventVO.setThumb1(thumb1);      // 원본이미지 축소판
      eventVO.setSize1(size1);  // 파일 크기
      // ------------------------------------------------------------------------------
      // 파일 전송 코드 종료
      // ------------------------------------------------------------------------------
      
      // Call By Reference: 메모리 공유, Hashcode 전달
      int memberno = (int)session.getAttribute("memberno"); // memberno FK
      eventVO.setMemberno(memberno);
      int cnt = this.eventProc.create(eventVO); 
      
      // ------------------------------------------------------------------------------
      // PK의 return
      // ------------------------------------------------------------------------------
      // System.out.println("--> contentsno: " + contentsVO.getContentsno());
      // mav.addObject("contentsno", contentsVO.getContentsno()); // redirect parameter 적용
      // ------------------------------------------------------------------------------

      mav.addObject("now_page", eventVO.getNow_page());
      mav.setViewName("redirect:/event/list_all_search_paging.do");
      
    } else {
      mav.setViewName("/member/admin_login_need"); // /WEB-INF/views/member/admin_login_need.jsp
    }

    return mav;
  }
   
   /**
    * 목록 + 검색 + 페이징 지원
    * http://localhost:9093/event/list_all_search_paging.do?word=스위스&now_page=1
    * 
    * @param word
    * @param now_page
    * @return
    */
   @RequestMapping(value = "/event/list_all_search_paging.do", method = RequestMethod.GET)
   public ModelAndView list_all_search_paging(EventVO eventVO) {
     ModelAndView mav = new ModelAndView();
     
     // 검색된 전체 글 수
     int search_count = this.eventProc.search_count(eventVO);
     mav.addObject("search_count", search_count);
     
     // 검색 목록: 검색된 레코드를 페이지 단위로 분할하여 가져옴
     ArrayList<EventVO> list = eventProc.list_all_search_paging(eventVO); 
     mav.addObject("list", list);
     
     // 관리자번호로 관리자 이름 얻는 메소드를 람다식으로 객체화 후 페이지에 전달
     Function<Integer, String> f = (memberno) -> {
       MemberVO memberVO = memberProc.readByMemberno(memberno);
       String id = memberVO.getId();
       return id;
     };
     mav.addObject("f", f);

     /*
      * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
      * 18 19 20 [다음]
      * @param cateno 카테고리번호
      * @param now_page 현재 페이지
      * @param word 검색어
      * @return 페이징용으로 생성된 HTML/CSS tag 문자열
      */
     String paging = eventProc.pagingBox(eventVO.getNow_page(), eventVO.getWord(), "list_all_search_paging.do");
     mav.addObject("paging", paging);

     // mav.addObject("now_page", now_page);
     
     mav.setViewName("/event/list_all_search_paging");  // /contents/list_by_cateno_search_paging.jsp

     return mav;
   }
   
   // 공지사항 조회
   @RequestMapping(value="/event/read.do", method=RequestMethod.GET )
   public ModelAndView read(int eventno) {
     ModelAndView mav = new ModelAndView();

     EventVO eventVO = this.eventProc.read(eventno);
     
     String title = eventVO.getTitle();
     String content = eventVO.getContent();
     
     title = Tool.convertChar(title);  // 특수 문자 처리
     content = Tool.convertChar(content); 
     
     eventVO.setTitle(title);
     eventVO.setContent(content);  
     
     long size1 = eventVO.getSize1();
     eventVO.setSize1_label(Tool.unit(size1));    
     
     mav.addObject("eventVO", eventVO); // request.setAttribute("eventVO", eventVO);
     
     // 회원 번호: admino -> AdminVO -> name
     String name = this.memberProc.read(eventVO.getMemberno()).getName();
     mav.addObject("name", name);

     mav.setViewName("/event/read"); // /WEB-INF/views/event/read.jsp
         
     return mav;
   }
   
   // 공지사항 글 수정 폼
   @RequestMapping(value = "/event/update_text.do", method = RequestMethod.GET)
   public ModelAndView update_text(HttpSession session, int eventno) {
     ModelAndView mav = new ModelAndView();
     
     EventVO eventVO = this.eventProc.read(eventno);
     mav.addObject("eventVO", eventVO);
     
     if (this.memberProc.isAdmin(session)) { //관리자일 경우에
     mav.setViewName("/event/update_text"); // /WEB-INF/views/contents/update_text.jsp
     // String content = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
     // mav.addObject("content", content);
     } else {
       mav.setViewName("/member/admin_login_need"); // /WEB-INF/views/member/admin_login_need.jsp
     }

     return mav; // forward
   }

   // 수정 처리
   @RequestMapping(value = "/event/update_text.do", method = RequestMethod.POST)
   public ModelAndView update_text(HttpSession session, EventVO eventVO) {
     ModelAndView mav = new ModelAndView();
     
     if (this.memberProc.isAdmin(session)) { //관리자일 경우에
       int cnt = this.eventProc.update_text(eventVO);  
       
       mav.addObject("eventno", eventVO.getEventno());
       mav.setViewName("redirect:/event/read.do");
     } else { // 정상적인 로그인이 아닌 경우
       mav.setViewName("/member/admin_login_need"); // /WEB-INF/views/member/admin_login_need.jsp
     }
     
     mav.addObject("now_page", eventVO.getNow_page()); // POST -> GET: 데이터 분실이 발생함으로 다시한번 데이터 저장 ★
     
     // URL에 파라미터의 전송
     // mav.setViewName("redirect:/event/read.do?eventno=" + eventVO.getContentsno());             
     
     return mav; // forward
   }
   
   // 파일 수정 폼
   @RequestMapping(value = "/event/update_file.do", method = RequestMethod.GET)
   public ModelAndView update_file(HttpSession session, int eventno) {
     ModelAndView mav = new ModelAndView();
     
     if (this.memberProc.isAdmin(session)) { //관리자일 경우에
       EventVO eventVO = this.eventProc.read(eventno);
       mav.addObject("eventVO", eventVO);
       
       mav.setViewName("/event/update_file"); // /WEB-INF/views/contents/update_file.jsp
     } else {
       mav.setViewName("/member/admin_login_need"); // /WEB-INF/views/member/admin_login_need.jsp
     }
     
     return mav; // forward
   }
   
   // 파일 수정 처리 
   @RequestMapping(value = "/event/update_file.do", method = RequestMethod.POST)
   public ModelAndView update_file(HttpSession session, EventVO eventVO) {
     ModelAndView mav = new ModelAndView();
     
     if (this.memberProc.isAdmin(session)) { //관리자일 경우에
       // 삭제할 파일 정보를 읽어옴, 기존에 등록된 레코드 저장용
       EventVO eventVO_old = eventProc.read(eventVO.getEventno());
       
       // -------------------------------------------------------------------
       // 파일 삭제 시작
       // -------------------------------------------------------------------
       String file1saved = eventVO_old.getFile1saved();  // 실제 저장된 파일명
       String thumb1 = eventVO_old.getThumb1();       // 실제 저장된 preview 이미지 파일명
       long size1 = 0;
          
       String upDir =  Event.getUploadDir(); // C:/kd/deploy/team4_v2sbm3c/event/storage/
       
       Tool.deleteFile(upDir, file1saved);  // 실제 저장된 파일삭제
       Tool.deleteFile(upDir, thumb1);     // preview 이미지 삭제
       // -------------------------------------------------------------------
       // 파일 삭제 종료
       // -------------------------------------------------------------------
           
       // -------------------------------------------------------------------
       // 파일 전송 시작
       // -------------------------------------------------------------------
       String file1 = "";          // 원본 파일명 image

       // 전송 파일이 없어도 file1MF 객체가 생성됨.
       // <input type='file' class="form-control" name='file1MF' id='file1MF' 
       //           value='' placeholder="파일 선택">
       MultipartFile mf = eventVO.getFile1MF();
           
       file1 = mf.getOriginalFilename(); // 원본 파일명
       size1 = mf.getSize();  // 파일 크기
           
       if (size1 > 0) { // 폼에서 새롭게 올리는 파일이 있는지 파일 크기로 체크 ★
         // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
         file1saved = Upload.saveFileSpring(mf, upDir); 
         
         if (Tool.isImage(file1saved)) { // 이미지인지 검사
           // thumb 이미지 생성후 파일명 리턴됨, width: 250, height: 200
           thumb1 = Tool.preview(upDir, file1saved, 250, 200); 
         }
         
       } else { // 파일이 삭제만 되고 새로 올리지 않는 경우
         file1="";
         file1saved="";
         thumb1="";
         size1=0;
       }
           
       eventVO.setFile1(file1);
       eventVO.setFile1saved(file1saved);
       eventVO.setThumb1(thumb1);
       eventVO.setSize1(size1);
       // -------------------------------------------------------------------
       // 파일 전송 코드 종료
       // -------------------------------------------------------------------
           
       this.eventProc.update_file(eventVO); // Oracle 처리

       mav.addObject("eventno", eventVO.getEventno());
       mav.setViewName("redirect:/event/read.do"); // request -> param으로 접근 전환
                 
     } else {
       
       mav.setViewName("/member/admin_login_need"); // GET
     }

     // redirect하게되면 전부 데이터가 삭제됨으로 mav 객체에 다시 저장
     mav.addObject("now_page", eventVO.getNow_page());
     
     return mav; // forward
   }   

   // 삭제 폼
   @RequestMapping(value="/event/delete.do", method=RequestMethod.GET )
   public ModelAndView delete(HttpSession session, int eventno) { 
     ModelAndView mav = new  ModelAndView();
     
     if (this.memberProc.isAdmin(session)) { //관리자일 경우에
     // 삭제할 정보를 조회하여 확인
       EventVO eventVO = this.eventProc.read(eventno);
       mav.addObject("eventVO", eventVO);
       
       mav.setViewName("/event/delete");  // /webapp/WEB-INF/views/event/delete.jsp
     } else {
       mav.setViewName("/member/admin_login_need");
     }
     
     return mav; 
   }

   // 삭제 처리
   @RequestMapping(value = "/event/delete.do", method = RequestMethod.POST)
   public ModelAndView delete(HttpSession session, EventVO eventVO) {
     ModelAndView mav = new ModelAndView();
     
     if (this.memberProc.isAdmin(session)) { //관리자일 경우에
       // -------------------------------------------------------------------
       // 파일 삭제 시작
       // -------------------------------------------------------------------
       // 삭제할 파일 정보를 읽어옴.
       EventVO eventVO_read = eventProc.read(eventVO.getEventno());
         
       String file1saved = eventVO.getFile1saved();
       String thumb1 = eventVO.getThumb1();
       
       String uploadDir = Event.getUploadDir();
       Tool.deleteFile(uploadDir, file1saved);  // 실제 저장된 파일삭제
       Tool.deleteFile(uploadDir, thumb1);     // preview 이미지 삭제
       // -------------------------------------------------------------------
       // 파일 삭제 종료
       // -------------------------------------------------------------------
           
       this.eventProc.delete(eventVO.getEventno()); // DBMS 삭제
       
      
       mav.setViewName("redirect:/event/list_all.do"); 
     } else {
       mav.setViewName("/member/admin_login_need");
     }
     
     return mav;
   }   



}