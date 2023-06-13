package dev.mvc.guin_c;

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
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;


import dev.mvc.jobcate.JobcateProcInter;
import dev.mvc.jobcate.JobcateVO;
import dev.mvc.member.MemberProc;
import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;



@Controller
public class Guin_cCont {
  
  @Autowired
  @Qualifier("dev.mvc.guin_c.Guin_cProc")
  private Guin_cProcInter guin_cProc;
  
  @Autowired
  @Qualifier("dev.mvc.jobcate.JobcateProc")
  private JobcateProcInter jobcateProc;
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  public Guin_cCont() {
    System.out.println("Guin_cCont created");
  }
  
  
  // 등록 폼 조회
  // http://localhost:9093/guin_c/create.do
  @RequestMapping(value="/guin_c/create.do", method=RequestMethod.GET)
  public ModelAndView create(int jobcateno, HttpSession session) {
    ModelAndView mav = new ModelAndView();

    JobcateVO jobcateVO = this.jobcateProc.read(jobcateno);
    ArrayList<JobcateVO> list = this.jobcateProc.list_all();
    mav.addObject("jobcateVO", jobcateVO);
    mav.addObject("list", list);
    
    if (this.memberProc.isMember(session) == true) {
      mav.setViewName("/guin_c/create_test");
      
    }else {
      mav.setViewName("/member/login_need");
      
    }
    
    
    
    return mav;
  }
  
//  // test 등록 폼
//  // http://localhost:9091/contents/create.do?typeno=1
//  @RequestMapping(value = "/contents/test.do", method = RequestMethod.GET)
//  public ModelAndView test(int typeno, HttpSession session) {
////  public ModelAndView create(HttpServletRequest request,  int typeno) {
//    ModelAndView mav = new ModelAndView();
//    System.out.println(session.getAttribute("adminno"));
//    
//    ArrayList<TypeVO> list = this.typeProc.list_all();
//    mav.addObject("list", list);
//    
//
//    if (this.adminProc.isAdmin(session) == true) {
//      TypeVO typeVO = this.typeProc.read(typeno);
//      mav.addObject("typeVO", typeVO);
////      request.setAttribute("typeVO", typeVO);
//      
//
//      mav.setViewName("/contents/create_test"); // /webapp/WEB-INF/views/contents/create.jsp
//
//    } else {
//      mav.setViewName("/member/login_need");
//    }
//
//    return mav;
//  }
  
  /**
   * 이미지 업로드 반응
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/guin_c/test.do", method = RequestMethod.POST)
  public String test(MultipartRequest request) {
//    ModelAndView mav = new ModelAndView();
    
    System.out.println("연결성공");
    
    String upDir = Contents.getUploadDir();
    String file1 = ""; // 원본 파일명 image
    String file1saved = ""; // 저장된 파일명, image
    
    MultipartFile uploadFile = request.getFile("upload");
    long size1 = uploadFile.getSize();
    file1 = uploadFile.getOriginalFilename();
        
    System.out.println("원본 파일명: " + file1);
    System.out.println("이미지 용량: " + size1);
    System.out.println("저장경로: "+ upDir);
    

    
    
    if (size1 > 0) { // 파일 크기 체크
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      file1saved = Upload.saveFileSpring(uploadFile, upDir);

    }

    JSONObject json = new JSONObject();
    
//  mav.addObject("uploaded", true);
//  mav.addObject("url", upDir+file1saved);
//  mav.addObject("fileName", file1saved);
  
  json.put("file1", file1 );
  json.put("file1saved", file1saved );
  json.put("size1", size1 );
  
  
  
  
  json.put("uploaded", true);
  json.put("url", "/contents/storage/"+file1saved);
  json.put("fileName", file1saved);
  
  System.out.println("업로드 성패: " + json.get("uploaded"));
  System.out.println("업로드 url: " + json.get("url"));
  System.out.println("업로드 파일네임: " + json.get("fileName"));
  
  return json.toString();


  }
  
  /**
   * 등록 처리 http://localhost:9091/contents/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/guin_c/create_test.do", method = RequestMethod.POST)
  public ModelAndView create_test(HttpServletRequest request, HttpSession session, Guin_cVO guin_cVO) {
    ModelAndView mav = new ModelAndView();

    // ------------------------------------------------------------------------------
    // 파일 전송 코드 시작
    // ------------------------------------------------------------------------------
    String thumb1 = "";     // preview image

    String upDir =  Contents.getUploadDir();
    System.out.println("-> upDir: " + upDir);
    
    MultipartFile mf = guin_cVO.getFile1MF();
    
    thumb1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출
    
    long thumb1_size1 = mf.getSize();  // 파일 크기
    
    if (thumb1_size1 > 0) { // 파일 크기 체크
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      thumb1 = Upload.saveFileSpring(mf, upDir); 
      if (Tool.isImage(thumb1)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
        thumb1 = Tool.preview(upDir, thumb1, 200, 150); 
      }
      
    }   
    
    // ------------------------------------------------------------------------------
    // 파일 전송 코드 종료
    // ------------------------------------------------------------------------------
    
    System.out.println(thumb1);
    guin_cVO.setThumb1(thumb1); // 원본이미지 축소판
    System.out.println(guin_cVO.getThumb1());

    

    // Call By Reference: 메모리 공유, Hashcode 전달
    int cnt = this.guin_cProc.create(guin_cVO);

    // --------------------------------------------------------------------------- ---
    // PK의 return
    // ------------------------------------------------------------------------------
    // System.out.println("--> guin_cno: " + contentsVO.getContentsno());
    // mav.addObject("guin_cno", contentsVO.getContentsno()); // redirect
    // parameter 적용
    // ------------------------------------------------------------------------------

    if (cnt == 1) {
      mav.addObject("code", "create_success");
      // typeProc.increaseCnt(contentsVO.getTypeno()); // 글수 증가
    } else {
      mav.addObject("code", "create_fail");
    }
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

    // System.out.println("--> typeno: " + contentsVO.getTypeno());
    // redirect시에 hidden tag로 보낸것들이 전달이 안됨으로 request에 다시 저장
    // mav.addObject("typeno", contentsVO.getTypeno()); // redirect parameter 적용
    // mav.addObject("url", "/contents/msg"); // msg.jsp, redirect parameter 적용
    // mav.setViewName("redirect:/contents/msg.do");

    mav.addObject("url", "/contents/msg");
    mav.addObject("jobcateno", guin_cVO.getJobcateno());
    mav.addObject("now_page", guin_cVO.getNow_page());
    mav.setViewName("redirect:/guin_c/list_by_jobcateno_search_paging.do");

    return mav; // forward
  }
  
  /**
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9090/contents/list_by_typeno_search_paging.do?typeno=1&word=스위스&now_page=1
   * 
   * @param typeno
   * @param word
   * @param now_page
   * @return
   */
  @RequestMapping(value = "/guin_c/list_by_jobcateno_search_paging.do", method = RequestMethod.GET)
  public ModelAndView list_by_jobcateno_search_paging(Guin_cVO guin_cVO) {
    ModelAndView mav = new ModelAndView();


    // 검색 목록
    ArrayList<Guin_cVO> list = guin_cProc.list_by_jobcateno_search_paging(guin_cVO);
    mav.addObject("list", list);

    JobcateVO jobcateVO = jobcateProc.read(guin_cVO.getJobcateno());
    mav.addObject("jobcateVO", jobcateVO);
    
    // 관리자번호로 관리자 이름 얻는 메소드를 람다식으로 객체화 후 페이지에 전달
    Function<Integer, String> f = (memberno) -> {
      MemberVO memberVO = memberProc.readByMemberno(memberno);
      String id = memberVO.getId();
      return id;
  };
    mav.addObject("f", f);
    
    int search_count = guin_cProc.search_count(guin_cVO);

    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
     * 18 19 20 [다음]
     * @param typeno 카테고리번호
     * @param search_count 검색(전체) 레코드수
     * @param now_page 현재 페이지
     * @param word 검색어
     * @return 페이징용으로 생성된 HTML/CSS tag 문자열
     */
    String paging = guin_cProc.pagingBox(guin_cVO.getJobcateno(), search_count, guin_cVO.getNow_page(), guin_cVO.getWord(), "list_by_jobcateno_search_paging.do");     
    mav.addObject("paging", paging); 

    // mav.addObject("now_page", now_page);
    
    mav.setViewName("/guin_c/list_by_jobcateno_search_paging");  // /contents/list_by_typeno_search_paging.jsp

    return mav;
  }
  
  /**
   * 조회
   * 
   * @return
   */
  @RequestMapping(value = "/guin_c/read.do", method = RequestMethod.GET)
  public ModelAndView read(int guin_cno) {
    ModelAndView mav = new ModelAndView();

    Guin_cVO guin_cVO = this.guin_cProc.read(guin_cno);
    MemberVO memberVO = this.memberProc.readByMemberno(guin_cVO.getMemberno());
     
    
    mav.addObject("guin_cVO", guin_cVO); // request.setAttribute("contentsVO", contentsVO);
    mav.addObject("memberVO", memberVO);

    JobcateVO jobcateVO = this.jobcateProc.read(guin_cVO.getJobcateno()); // 그룹 정보를 읽기
    mav.addObject("jobcateVO", jobcateVO);

    mav.setViewName("/guin_c/read"); // /WEB-INF/views/contents/read.jsp

    return mav;
  }
  
  
  
  

}
