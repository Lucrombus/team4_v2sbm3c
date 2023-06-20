package dev.mvc.resume;

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

import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;
import dev.mvc.notice.Notice;
import dev.mvc.notice.NoticeVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

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

  // 이력서 등록 폼
  // http://localhost:9093/resume/create.do
  @RequestMapping(value = "/resume/create.do", method = RequestMethod.GET)
  public ModelAndView create(HttpSession session) {
    // public ModelAndView create(HttpServletRequest request, int cateno) {
    ModelAndView mav = new ModelAndView();

    if (this.memberProc.isMember(session)) { //회원일 경우
      mav.setViewName("/resume/create"); // /webapp/WEB-INF/views/notice/create.jsp
    } else {
      mav.setViewName("/member/login_need");
    }

    return mav;
  }

  // 이력서 등록 처리
  @RequestMapping(value = "/resume/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, HttpSession session, ResumeVO resumeVO) {

    ModelAndView mav = new ModelAndView();

    if (this.memberProc.isMember(session)) { // 회원일 경우
      // ------------------------------------------------------------------------------
      // 파일 전송 코드 시작
      // ------------------------------------------------------------------------------
      String file1 = ""; // 원본 파일명 image
      String file1saved = ""; // 저장된 파일명, image
      String thumb1 = ""; // preview image

      String upDir = Notice.getUploadDir();
      System.out.println("-> upDir: " + upDir);

      // 전송 파일이 없어도 file1MF 객체가 생성됨.
      // <input type='file' class="form-control" name='file1MF' id='file1MF'
      // value='' placeholder="파일 선택">
      MultipartFile mf = resumeVO.getFile1MF();

      file1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출
      System.out.println("-> file1: " + file1);

      long size1 = mf.getSize(); // 파일 크기

      if (size1 > 0) { // 파일 크기 체크
        // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
        file1saved = Upload.saveFileSpring(mf, upDir);

        if (Tool.isImage(file1saved)) { // 이미지인지 검사
          // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
          thumb1 = Tool.preview(upDir, file1saved, 200, 150);
        }

      }

      resumeVO.setFile1(file1); // 순수 원본 파일명
      resumeVO.setFile1saved(file1saved); // 저장된 파일명(파일명 중복 처리)
      resumeVO.setThumb1(thumb1); // 원본이미지 축소판
      resumeVO.setSize1(size1); // 파일 크기
      // ------------------------------------------------------------------------------
      // 파일 전송 코드 종료
      // ------------------------------------------------------------------------------

      // Call By Reference: 메모리 공유, Hashcode 전달
      int memberno = (int) session.getAttribute("memberno"); // memberno FK
      resumeVO.setMemberno(memberno);
      int cnt = this.resumeProc.create(resumeVO);

      // ------------------------------------------------------------------------------
      // PK의 return
      // ------------------------------------------------------------------------------
      // System.out.println("--> contentsno: " + contentsVO.getContentsno());
      // mav.addObject("contentsno", contentsVO.getContentsno()); // redirect parameter 적용
      // ------------------------------------------------------------------------------

      mav.setViewName("redirect:/resume/list_all.do");

    } else {
      mav.setViewName("/member/login_need"); // /WEB-INF/views/member/login_need.jsp
    }

    return mav;
  }

  // 리스트 조회
  //http://localhost:9093/resume/list_all.do
  @RequestMapping(value="/resume/list_all.do", method=RequestMethod.GET)
  public ModelAndView list_all(int memberno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/resume/list_all"); // /WEB-INF/views/resume/list_all.jsp
    
    MemberVO memberVO = this.memberProc.read(memberno);
    mav.addObject("memberVO", memberVO);
    
    ArrayList<ResumeVO> list = this.resumeProc.list_all(memberno);
    mav.addObject("list", list);
    
    return mav;
  }

  // 이력서 조회
  @RequestMapping(value="/resume/read.do", method=RequestMethod.GET )
  public ModelAndView read(int resumeno) {
    ModelAndView mav = new ModelAndView();

    ResumeVO resumeVO = this.resumeProc.read(resumeno);
    
    String title = resumeVO.getTitle();
    String intro = resumeVO.getIntro();
    
    title = Tool.convertChar(title);  // 특수 문자 처리
    intro = Tool.convertChar(intro); 
    
    resumeVO.setTitle(title);
    resumeVO.setIntro(intro);  
    
    long size1 = resumeVO.getSize1();
    resumeVO.setSize1_label(Tool.unit(size1));    
    
    mav.addObject("resumeVO", resumeVO); // request.setAttribute("resumeVO", resumeVO);
    
    // 회원 번호: admino -> AdminVO -> name
    String name = this.memberProc.read(resumeVO.getMemberno()).getName();
    mav.addObject("name", name);

    mav.setViewName("/resume/read"); // /WEB-INF/views/notice/read.jsp
        
    return mav;
  }

  // 이력서 삭제 폼

  // 이력서 삭제 처리

  // 이력서 수정 폼

  // 이력서 수정 처리

}