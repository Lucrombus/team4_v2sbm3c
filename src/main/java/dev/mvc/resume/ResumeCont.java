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

import dev.mvc.board.BoardVO;
import dev.mvc.contents.ContentsVO;
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
      mav.setViewName("/resume/create"); // /webapp/WEB-INF/views/resume/create.jsp
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

      String upDir = Resume.getUploadDir();
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

      mav.addObject("memberno", memberno);
      mav.setViewName("redirect:/resume/list_all.do");
      
    } else {
      mav.setViewName("/member/login_need"); // /WEB-INF/views/member/login_need.jsp
    }

    return mav;
  }

  // 리스트 조회
  //http://localhost:9093/resume/list_all.do
  @RequestMapping(value="/resume/list_all.do", method=RequestMethod.GET)
  public ModelAndView list_all(HttpSession session, int memberno, ResumeVO resumeVO) {
    ModelAndView mav = new ModelAndView();
    
    if ((int)session.getAttribute("memberno") == (resumeVO.getMemberno())) {
    mav.setViewName("/resume/list_all"); // /WEB-INF/views/resume/list_all.jsp

    ArrayList<ResumeVO> list = this.resumeProc.list_all(memberno);
    mav.addObject("list", list);
    } else {
      mav.setViewName("/member/login_need"); // /WEB-INF/views/member/login_need.jsp
    }
    
    return mav;
  }
  
  /**
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9093/resume/list_by_memberno_search_paging.do?memberno=1&wantjob=스위스&now_page=1
   * 
   * @param memberno
   * @param wantjob
   * @param now_page
   * @return
   */
  @RequestMapping(value = "/resume/list_by_memberno_search_paging.do", method = RequestMethod.GET)
  public ModelAndView list_by_memberno_search_paging(ResumeVO resumeVO) {
    ModelAndView mav = new ModelAndView();

    // 검색 목록
    ArrayList<ResumeVO> list = resumeProc.list_by_memberno_search_paging(resumeVO);
    mav.addObject("list", list);

    MemberVO memberVO = memberProc.read(resumeVO.getMemberno());
    mav.addObject("MemberVO", memberVO);

    // 관리자번호로 관리자 이름 얻는 메소드를 람다식으로 객체화 후 페이지에 전달
//    Function<Integer, String> f = (memberno) -> {
//      memberVO = memberProc.readByMemberno(memberno);
//      String id = "(알수없음)";
//      
//      if (memberVO != null) {
//        id = memberVO.getId();
//      }
//      
//      return id;
//    };
//    mav.addObject("f", f);

    int search_count = resumeProc.search_count(resumeVO);

    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17 18 19 20 [다음]
     * 
     * @param typeno 카테고리번호
     * @param search_count 검색(전체) 레코드수
     * @param now_page 현재 페이지
     * @param word 검색어
     * @return 페이징용으로 생성된 HTML/CSS tag 문자열
     */
    String paging = resumeProc.pagingBox(resumeVO.getMemberno(), resumeVO.getNow_page(),
                                         resumeVO.getWantjob(), "list_by_memberno_search_paging.do");
    mav.addObject("paging", paging);

    // mav.addObject("now_page", resumeVO.getNow_page());

    mav.setViewName("/resume/list_by_memberno_search_paging"); // //resume/list_by_memberno_search_paging.jsp

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
    String gender = this.memberProc.read(resumeVO.getMemberno()).getGender();
    mav.addObject("name", name);
    mav.addObject("gender", gender);

    mav.setViewName("/resume/read"); // /WEB-INF/views/resume/read.jsp
        
    return mav;
  }

  // 이력서 글 수정 폼
  @RequestMapping(value = "/resume/update_text.do", method = RequestMethod.GET)
  public ModelAndView update_text(int resumeno) {
    ModelAndView mav = new ModelAndView();
    
    ResumeVO resumeVO = this.resumeProc.read(resumeno);
    mav.addObject("resumeVO", resumeVO);
    
    mav.setViewName("/resume/update_text"); // /WEB-INF/views/contents/update_text.jsp
    // String content = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
    // mav.addObject("content", content);

    return mav; // forward
  }

  // 이력서 글 수정 처리
  @RequestMapping(value = "/resume/update_text.do", method = RequestMethod.POST)
  public ModelAndView update_text(HttpSession session, ResumeVO resumeVO) {
    ModelAndView mav = new ModelAndView();
    
    if (this.memberProc.isMember(session)) { // 관리자 로그인
      int cnt = this.resumeProc.update_text(resumeVO);  
      
      mav.addObject("resumeno", resumeVO.getResumeno());
      mav.setViewName("redirect:/resume/read.do");
    } else { // 정상적인 로그인이 아닌 경우
      mav.setViewName("/member/login_need"); // /WEB-INF/views/member/login_need.jsp
    }
    
    mav.addObject("now_page", resumeVO.getNow_page()); // POST -> GET: 데이터 분실이 발생함으로 다시한번 데이터 저장 ★
    
    // URL에 파라미터의 전송
    // mav.setViewName("redirect:/resume/read.do?resumeno=" + resumeVO.getContentsno());             
    
    return mav; // forward
  }
  
  // 이력서 파일 수정 폼
  @RequestMapping(value = "/resume/update_file.do", method = RequestMethod.GET)
  public ModelAndView update_file(int resumeno) {
    ModelAndView mav = new ModelAndView();
    
    ResumeVO resumeVO = this.resumeProc.read(resumeno);
    mav.addObject("resumeVO", resumeVO);
    
    mav.setViewName("/resume/update_file"); // /WEB-INF/views/contents/update_file.jsp

    return mav; // forward
  }
  
  // 이력서 파일 수정 처리
  @RequestMapping(value = "/resume/update_file.do", method = RequestMethod.POST)
  public ModelAndView update_file(HttpSession session, ResumeVO resumeVO) {
    ModelAndView mav = new ModelAndView();
    
    if (this.memberProc.isMember(session)) {
      // 삭제할 파일 정보를 읽어옴, 기존에 등록된 레코드 저장용
      ResumeVO resumeVO_old = resumeProc.read(resumeVO.getResumeno());
      
      // -------------------------------------------------------------------
      // 파일 삭제 시작
      // -------------------------------------------------------------------
      String file1saved = resumeVO_old.getFile1saved();  // 실제 저장된 파일명
      String thumb1 = resumeVO_old.getThumb1();       // 실제 저장된 preview 이미지 파일명
      long size1 = 0;
         
      String upDir =  Resume.getUploadDir(); // C:/kd/deploy/team4_v2sbm3c/resume/storage/
      
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
      MultipartFile mf = resumeVO.getFile1MF();
          
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
          
      resumeVO.setFile1(file1);
      resumeVO.setFile1saved(file1saved);
      resumeVO.setThumb1(thumb1);
      resumeVO.setSize1(size1);
      // -------------------------------------------------------------------
      // 파일 전송 코드 종료
      // -------------------------------------------------------------------
          
      this.resumeProc.update_file(resumeVO); // Oracle 처리

      mav.addObject("resumeno", resumeVO.getResumeno());
      mav.setViewName("redirect:/resume/read.do"); // request -> param으로 접근 전환
                
    } else {
      
      mav.setViewName("/member/login_need"); // GET
    }

    // redirect하게되면 전부 데이터가 삭제됨으로 mav 객체에 다시 저장
    mav.addObject("now_page", resumeVO.getNow_page());
    
    return mav; // forward
  }   
  
  //삭제 폼
  @RequestMapping(value="/resume/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int resumeno) { 
    ModelAndView mav = new  ModelAndView();
    
    // 삭제할 정보를 조회하여 확인
    ResumeVO resumeVO = this.resumeProc.read(resumeno);
    mav.addObject("resumeVO", resumeVO);
    
    mav.setViewName("/resume/delete");  // /webapp/WEB-INF/views/resume/delete.jsp
    
    return mav; 
  }

  // 삭제 처리
  @RequestMapping(value = "/resume/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(HttpSession session, ResumeVO resumeVO) {
    ModelAndView mav = new ModelAndView();
    
    // -------------------------------------------------------------------
    // 파일 삭제 시작
    // -------------------------------------------------------------------
    // 삭제할 파일 정보를 읽어옴.
    ResumeVO resumeVO_read = resumeProc.read(resumeVO.getResumeno());
        
    String file1saved = resumeVO.getFile1saved();
    String thumb1 = resumeVO.getThumb1();
    
    String uploadDir = Resume.getUploadDir();
    Tool.deleteFile(uploadDir, file1saved);  // 실제 저장된 파일삭제
    Tool.deleteFile(uploadDir, thumb1);     // preview 이미지 삭제
    // -------------------------------------------------------------------
    // 파일 삭제 종료
    // -------------------------------------------------------------------
        
    this.resumeProc.delete(resumeVO.getResumeno()); // DBMS 삭제
    
    int memberno = (int) session.getAttribute("memberno");
    mav.addObject("memberno", memberno);
    mav.addObject("now_page", resumeVO.getNow_page());
    mav.setViewName("redirect:/resume/list_all.do"); // request -> param으로 접근 전환
    
    return mav;
  }   

}