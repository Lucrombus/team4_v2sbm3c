package dev.mvc.notice;

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
public class NoticeCont {

  @Autowired
  @Qualifier("dev.mvc.notice.NoticeProc")
  private NoticeProcInter noticeProc;

  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  public NoticeCont() {
    System.out.println("NoticeCont created");
  }

  // 등록 폼
  // http://localhost:9093/notice/create.do
  @RequestMapping(value = "/notice/create.do", method = RequestMethod.GET)
  public ModelAndView create(HttpSession session) {
    // public ModelAndView create(HttpServletRequest request, int cateno) {
    ModelAndView mav = new ModelAndView();

    if (this.memberProc.isMember(session) != true) {
      mav.setViewName("/notice/create"); // /webapp/WEB-INF/views/contents/create.jsp
    } else {
      mav.setViewName("/member/login_need");
    }
    
    return mav;
  }

  // 등록 처리
  @RequestMapping(value = "/notice/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, HttpSession session, NoticeVO noticeVO) {

    ModelAndView mav = new ModelAndView();

    if (this.memberProc.isMember(session) != true) { //관리자일경우
   // ------------------------------------------------------------------------------
      // 파일 전송 코드 시작
      // ------------------------------------------------------------------------------
      String file1 = "";          // 원본 파일명 image
      String file1saved = "";   // 저장된 파일명, image
      String thumb1 = "";     // preview image

      String upDir =  Contents.getUploadDir();
      System.out.println("-> upDir: " + upDir);
      
      // 전송 파일이 없어도 file1MF 객체가 생성됨.
      // <input type='file' class="form-control" name='file1MF' id='file1MF' 
      //           value='' placeholder="파일 선택">
      MultipartFile mf = noticeVO.getFile1MF();
      
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
      
      noticeVO.setFile1(file1);   // 순수 원본 파일명
      noticeVO.setFile1saved(file1saved); // 저장된 파일명(파일명 중복 처리)
      noticeVO.setThumb1(thumb1);      // 원본이미지 축소판
      noticeVO.setSize1(size1);  // 파일 크기
      // ------------------------------------------------------------------------------
      // 파일 전송 코드 종료
      // ------------------------------------------------------------------------------
      
      // Call By Reference: 메모리 공유, Hashcode 전달
      int memberno = (int)session.getAttribute("memberno"); // memberno FK
      noticeVO.setMemberno(memberno);
      int cnt = this.noticeProc.create(noticeVO); 
      
      // ------------------------------------------------------------------------------
      // PK의 return
      // ------------------------------------------------------------------------------
      // System.out.println("--> contentsno: " + contentsVO.getContentsno());
      // mav.addObject("contentsno", contentsVO.getContentsno()); // redirect parameter 적용
      // ------------------------------------------------------------------------------

      if (cnt == 1) {
        mav.addObject("code", "create_success");
        //mav.setViewName("redirect:/notice/list_all.do"); // 목록으로 자동 이동
      } else {
        mav.addObject("code", "create_fail");
        //mav.setViewName("/notice/msg"); // /WEB-INF/views/cate/msg.jsp // 등록 실패 메시지 출력
      }
      mav.addObject("cnt", cnt);
      
      mav.addObject("url", "/notice/msg");
      mav.setViewName("redirect:/notice/list_all.do");
      
    } else {
      mav.setViewName("/member/login_need"); // /WEB-INF/views/admin/login_need.jsp
    }

    return mav;
  }

  // 리스트 조회
  //http://localhost:9093/notice/list_all.do
   @RequestMapping(value="/notice/list_all.do", method=RequestMethod.GET)
   public ModelAndView list_all() {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/notice/list_all"); // /WEB-INF/views/notice/list_all.jsp
     
     ArrayList<NoticeVO> list = this.noticeProc.list_all();
     mav.addObject("list", list);
     
  // 관리자번호로 관리자 이름 얻는 메소드를 람다식으로 객체화 후 페이지에 전달
     Function<Integer, String> f = (memberno) -> {
       MemberVO memberVO = memberProc.readByMemberno(memberno);
       String id = memberVO.getId();
       return id;
     };
     mav.addObject("f", f);
     
     return mav;
   }
  // 조회

  // 삭제 폼

  // 삭제 처리

  // 수정 폼

  // 수정 처리

}