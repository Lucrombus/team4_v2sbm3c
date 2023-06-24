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
  @RequestMapping(value = "/guin_c/create.do", method = RequestMethod.GET)
  public ModelAndView create(int jobcateno, HttpSession session) {
    ModelAndView mav = new ModelAndView();

    JobcateVO jobcateVO = this.jobcateProc.read(jobcateno);
    ArrayList<JobcateVO> list = this.jobcateProc.list_all();
    mav.addObject("jobcateVO", jobcateVO);
    mav.addObject("list", list);

    if (session.getAttribute("id") != null) {
      mav.setViewName("/guin_c/create_test");

    } else {
      mav.setViewName("/member/login_need");

    }

    return mav;
  }

  /**
   * AJAX
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
    System.out.println("저장경로: " + upDir);

    if (size1 > 0) { // 파일 크기 체크
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      file1saved = Upload.saveFileSpring(uploadFile, upDir);

    }

    JSONObject json = new JSONObject();

//  mav.addObject("uploaded", true);
//  mav.addObject("url", upDir+file1saved);
//  mav.addObject("fileName", file1saved);

    json.put("file1", file1);
    json.put("file1saved", file1saved);
    json.put("size1", size1);

    json.put("uploaded", true);
    json.put("url", "/contents/storage/" + file1saved);
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

    if (session.getAttribute("id") != null) {
      // ------------------------------------------------------------------------------
      // 파일 전송 코드 시작
      // ------------------------------------------------------------------------------
      String thumb1 = ""; // preview image
      String thumb1_origin = ""; // original image

      String upDir = Contents.getUploadDir();
      System.out.println("-> upDir: " + upDir);

      MultipartFile mf = guin_cVO.getFile1MF();

      thumb1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출

      long thumb1_size1 = mf.getSize(); // 파일 크기

      if (thumb1_size1 > 0) { // 파일 크기 체크
        // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
        thumb1_origin = Upload.saveFileSpring(mf, upDir);
        if (Tool.isImage(thumb1)) { // 이미지인지 검사
          // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
          thumb1 = Tool.preview(upDir, thumb1, 200, 150);
        }

      }

      // ------------------------------------------------------------------------------
      // 파일 전송 코드 종료
      // ------------------------------------------------------------------------------

      System.out.println("저장할 썸네일" + thumb1);
      guin_cVO.setThumb1(thumb1); // 원본이미지 축소판
      System.out.println("저장된 썸네일" + guin_cVO.getThumb1());

      System.out.println("저장할 썸네일 원본" + thumb1_origin);
      guin_cVO.setThumb1_origin(thumb1_origin); // 원본이미지
      System.out.println("저장된 썸네일 원본" + guin_cVO.getThumb1_origin());

      System.out.println("저장할 사이즈: " + thumb1_size1);
      guin_cVO.setSize1(thumb1_size1);
      System.out.println("저장된 사이즈: " + guin_cVO.getSize1());

      // Call By Reference: 메모리 공유, Hashcode 전달
      int cnt = this.guin_cProc.create(guin_cVO);

      // ---------------------------------------------------------------------------
      // ---
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

    } else {
      mav.addObject("url", "/member/login_need"); // /WEB-INF/views/admin/login_need.jsp
      mav.setViewName("redirect:/contents/msg.do"); 

    }

    return mav; // forward
  }
  
  /**
   * AJAX
   * 등록 중 submit 하지 않고 페이지를 나갈때 이미 CKEditor를 통해 저장소에 업로드된 이미지를 삭제함
   * 
   * @param url
   * @return
   */
  @ResponseBody
  @RequestMapping(value= {"/guin_c/ajax.do"}, method=RequestMethod.POST)
  public String one_ajax(String value) {
   
    System.out.println("응답성공 저장하던 이미지 지우자");
    System.out.println("받은 파일 문자열: "+ value);
    
    String upDir = Contents.getUploadDir();
    
    if (value.length() > 0) { // 뭐가 있을 때만

      String[] file1saved_list = value.split("---");
      System.out.println("분할된 리스트: " + file1saved_list);

      for (String item : file1saved_list) {
        Tool.deleteFile(upDir, item); // ckeditor로 업로드된 파일삭제
      }
      
    }

    return "";
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
      String id = ("알 수 없음");
      if (memberVO != null) {
        id = memberVO.getId();
      }
      
      return id;
    };
    mav.addObject("f", f);

    int search_count = guin_cProc.search_count(guin_cVO);

    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
     * 18 19 20 [다음]
     * 
     * @param typeno 카테고리번호
     * 
     * @param search_count 검색(전체) 레코드수
     * 
     * @param now_page 현재 페이지
     * 
     * @param word 검색어
     * 
     * @return 페이징용으로 생성된 HTML/CSS tag 문자열
     */
    String paging = guin_cProc.pagingBox(guin_cVO.getJobcateno(), search_count, guin_cVO.getNow_page(),
        guin_cVO.getWord(), "list_by_jobcateno_search_paging.do");
    mav.addObject("paging", paging);

    // mav.addObject("now_page", now_page);

    mav.setViewName("/guin_c/list_by_jobcateno_search_paging"); // /contents/list_by_typeno_search_paging.jsp

    return mav;
  }

  /**
   * 조회
   * 
   * @return
   */
  @RequestMapping(value = "/guin_c/read.do", method = RequestMethod.GET)
  public ModelAndView read(int guin_cno, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    String currentUrl = request.getRequestURL().toString();
    String queryString = request.getQueryString(); // URL의 쿼리 스트링 파라미터 가져오기
    
    if (queryString != null) {
        currentUrl += "?" + queryString; // URL과 쿼리 스트링 연결
    }
    
    System.out.println(currentUrl);
    

    Guin_cVO guin_cVO = this.guin_cProc.read(guin_cno);
    MemberVO memberVO = this.memberProc.readByMemberno(guin_cVO.getMemberno());

    mav.addObject("guin_cVO", guin_cVO); // request.setAttribute("contentsVO", contentsVO);
    mav.addObject("memberVO", memberVO);

    JobcateVO jobcateVO = this.jobcateProc.read(guin_cVO.getJobcateno()); // 그룹 정보를 읽기
    mav.addObject("jobcateVO", jobcateVO);

    mav.setViewName("/guin_c/read"); // /WEB-INF/views/contents/read.jsp

    return mav;
  }

  /**
   * 수정 폼
   * 
   * @return
   */
  @RequestMapping(value = "/guin_c/update.do", method = RequestMethod.GET)
  public ModelAndView update(int guin_cno, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    Guin_cVO guin_cVO = this.guin_cProc.read(guin_cno);

    if (session.getAttribute("memberno") != null && session.getAttribute("memberno").equals(guin_cVO.getMemberno())) {

      MemberVO memberVO = this.memberProc.readByMemberno(guin_cVO.getMemberno());

      mav.addObject("guin_cVO", guin_cVO);
      mav.addObject("memberVO", memberVO);

      JobcateVO jobcateVO = this.jobcateProc.read(guin_cVO.getJobcateno()); // 그룹 정보를 읽기
      mav.addObject("jobcateVO", jobcateVO);

      mav.setViewName("/guin_c/update"); // /WEB-INF/views/contents/read.jsp

    } else {
      mav.addObject("url", "/guin_c/msg");
      mav.addObject("code", "member_different");
      mav.addObject("guin_cno", guin_cVO.getGuin_cno());
      mav.addObject("jobcateno", guin_cVO.getJobcateno());
      mav.addObject("now_page", guin_cVO.getNow_page());
      mav.setViewName("redirect:/guin_c/msg.do");

    }

    return mav;
  }

  /**
   * 수정 처리
   * 
   * @return
   */
  @RequestMapping(value = "/guin_c/update.do", method = RequestMethod.POST)
  public ModelAndView update(Guin_cVO guin_cVO, HttpSession session) {
    ModelAndView mav = new ModelAndView();

    System.out.println("전달받은 썸네일명: " + guin_cVO.getThumb1());

    // 삭제할 파일 정보를 읽어옴, 기존에 등록된 레코드 저장용
    Guin_cVO guin_cVO_old = guin_cProc.read(guin_cVO.getGuin_cno());

    if (session.getAttribute("memberno") != null && session.getAttribute("memberno").equals(guin_cVO_old.getMemberno())) {
      // ------------------------------------------------------------------------------
      // 파일 전송 코드 시작
      // ------------------------------------------------------------------------------
      String thumb1_old = guin_cVO_old.getThumb1(); // 원래 이미지
      String thumb1_old_origin = guin_cVO_old.getThumb1_origin(); // 원래 이미지
      long thumb1_old_size = guin_cVO_old.getSize1(); // 원래 사이즈

      String thumb1_new = ""; // 새로운 이미지
      String thumb1_new_origin = ""; // 새로운 이미지

      String upDir = Contents.getUploadDir();
      System.out.println("-> upDir: " + upDir);

      MultipartFile mf = guin_cVO.getFile1MF();

      thumb1_new = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출

      long thumb1_new_size1 = mf.getSize(); // 파일 크기

      if (thumb1_new_size1 > 0) { // 파일 크기 체크
        // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
        Tool.deleteFile(upDir, thumb1_old);
        Tool.deleteFile(upDir, thumb1_old_origin);
        thumb1_new_origin = Upload.saveFileSpring(mf, upDir);
        if (Tool.isImage(thumb1_new)) { // 이미지인지 검사
          // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
          thumb1_new = Tool.preview(upDir, thumb1_new, 200, 150);

        }
      } else { // 파일 수정이 없을경우 원래 데이터를 그대로 저장
        thumb1_new = thumb1_old;
        thumb1_new_origin = thumb1_old_origin;
        thumb1_new_size1 = thumb1_old_size;
      }

      // ------------------------------------------------------------------------------
      // 파일 전송 코드 종료
      // ------------------------------------------------------------------------------

      System.out.println("저장할 썸네일" + thumb1_new);
      guin_cVO.setThumb1(thumb1_new); // 원본이미지 축소판
      System.out.println("저장된 썸네일" + guin_cVO.getThumb1());

      System.out.println("저장할 썸네일 원본" + thumb1_new_origin);
      guin_cVO.setThumb1_origin(thumb1_new_origin); // 원본이미지
      System.out.println("저장된 썸네일 원본" + guin_cVO.getThumb1_origin());

      System.out.println("저장할 썸네일 사이즈: " + thumb1_new_size1);
      guin_cVO.setSize1(thumb1_new_size1);
      System.out.println("저장된 썸네일 사이즈: " + guin_cVO.getSize1());
      
      System.out.println("저장할 파일 리스트: " + guin_cVO.getFile1saved());
      guin_cVO.setFile1saved(guin_cVO_old.getFile1saved() + guin_cVO.getFile1saved()); // 기존 파일리스트와 추가한 파일리스트 합침
      System.out.println("저장된 파일 리스트: " + guin_cVO.getFile1saved());
      
      System.out.println("저장할 파일원본 리스트: " + guin_cVO.getFile1());
      guin_cVO.setFile1(guin_cVO_old.getFile1() + guin_cVO.getFile1()); // 기존 파일리스트와 추가한 파일리스트 합침
      System.out.println("저장된 파일원본 리스트: " + guin_cVO.getFile1());

      MemberVO memberVO = this.memberProc.readByMemberno(guin_cVO.getMemberno());

      int cnt = this.guin_cProc.update(guin_cVO);

      JobcateVO jobcateVO = this.jobcateProc.read(guin_cVO.getJobcateno()); // 그룹 정보를 읽기
      mav.addObject("jobcateno", guin_cVO.getJobcateno());
      mav.addObject("now_page", guin_cVO.getNow_page());
      mav.addObject("guin_cno", guin_cVO.getGuin_cno());
      mav.setViewName("redirect:/guin_c/read.do");

    } else {
      mav.addObject("url", "/guin_c/msg");
      mav.addObject("code", "member_different");
      mav.addObject("guin_cno", guin_cVO.getGuin_cno());
      mav.addObject("jobcateno", guin_cVO.getJobcateno());
      mav.addObject("now_page", guin_cVO.getNow_page());
      mav.setViewName("redirect:/guin_c/msg.do");

    }

    return mav;
  }

  /**
   * 삭제 폼
   * 
   * @param guin_cno
   * @return
   */
  @RequestMapping(value = "/guin_c/delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int guin_cno, HttpSession session) {
    ModelAndView mav = new ModelAndView();

    // 삭제할 정보를 조회하여 확인
    Guin_cVO guin_cVO = this.guin_cProc.read(guin_cno);
    
    if (session.getAttribute("memberno") != null && session.getAttribute("memberno").equals(guin_cVO.getMemberno())) {
      mav.addObject("guin_cVO", guin_cVO);

      JobcateVO jobcateVO = this.jobcateProc.read(guin_cVO.getJobcateno());
      mav.addObject("jobcateVO", jobcateVO);

      mav.setViewName("/guin_c/delete"); // /webapp/WEB-INF/views/contents/delete.jsp

    

    } else {
      mav.addObject("url", "/guin_c/msg");
      mav.addObject("code", "member_different");
      mav.addObject("guin_cno", guin_cVO.getGuin_cno());
      mav.addObject("jobcateno", guin_cVO.getJobcateno());
      mav.addObject("now_page", guin_cVO.getNow_page());
      mav.setViewName("redirect:/guin_c/msg.do");

    }
    
    
   

    return mav;
  }

  /**
   * 삭제 처리
   * 
   * @param guin_cno
   * @return
   */
  @RequestMapping(value = "/guin_c/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int guin_cno, HttpSession session) {
    ModelAndView mav = new ModelAndView();

    // 삭제할 정보를 조회하여 확인
    Guin_cVO guin_cVO = this.guin_cProc.read(guin_cno);
    
    if (session.getAttribute("memberno") != null && session.getAttribute("memberno").equals(guin_cVO.getMemberno())) {
      String file1saved = guin_cVO.getFile1saved();
      String thumb1 = guin_cVO.getThumb1();
      String thumb1_origin = guin_cVO.getThumb1_origin();
      System.out.println("원래 문자열: " + file1saved);

      String upDir = Contents.getUploadDir();

      String[] file1saved_list = file1saved.split("---");
      System.out.println("분할된 리스트: " + file1saved_list);

      for (String item : file1saved_list) {
        Tool.deleteFile(upDir, item); // ckeditor로 저장된 파일삭제
      }

      Tool.deleteFile(upDir, thumb1); // 썸네일 삭제
      Tool.deleteFile(upDir, thumb1_origin); // 썸네일 삭제

      int cnt = this.guin_cProc.delete(guin_cno);

      mav.addObject("jobcateno", guin_cVO.getJobcateno());
      mav.addObject("now_page", guin_cVO.getNow_page());
      mav.setViewName("redirect:/guin_c/list_by_jobcateno_search_paging.do"); // /webapp/WEB-INF/views/contents/delete.jsp
   
    

    } else {
      mav.addObject("url", "/guin_c/msg");
      mav.addObject("code", "member_different");
      mav.addObject("guin_cno", guin_cVO.getGuin_cno());
      mav.addObject("jobcateno", guin_cVO.getJobcateno());
      mav.addObject("now_page", guin_cVO.getNow_page());
      mav.setViewName("redirect:/guin_c/msg.do");

    }

  

    return mav;
  }
  
  /**
   * 맵 조회
   * http://localhost:9091/contents/map.do
   * @return
   */
  @RequestMapping(value="/guin_c/map.do", method=RequestMethod.GET )
  public ModelAndView map(int guin_cno, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    // 삭제할 정보를 조회하여 확인
    Guin_cVO guin_cVO = this.guin_cProc.read(guin_cno);
    
    if (session.getAttribute("memberno") != null && session.getAttribute("memberno").equals(guin_cVO.getMemberno())) {
      mav.addObject("guin_cVO", guin_cVO); // request.setAttribute("contentsVO", contentsVO);

      JobcateVO jobcateVO = this.jobcateProc.read(guin_cVO.getJobcateno()); //그룹 정보를 읽기
      mav.addObject("jobcateVO", jobcateVO); 

      
      mav.setViewName("/guin_c/map"); // /WEB-INF/views/contents/read.jsp
    
    

    } else {
      mav.addObject("url", "/guin_c/msg");
      mav.addObject("code", "member_different");
      mav.addObject("guin_cno", guin_cVO.getGuin_cno());
      mav.addObject("jobcateno", guin_cVO.getJobcateno());
      mav.addObject("now_page", guin_cVO.getNow_page());
      mav.setViewName("redirect:/guin_c/msg.do");

    }
    
    

    
   
        
    return mav;
  }

  /**
   * MAP 등록/수정/삭제 처리 http://localhost:9091/contents/map.do
   * 
   * @return
   */
  @RequestMapping(value = "/guin_c/map.do", method = RequestMethod.POST)
  public ModelAndView map_update(Guin_cVO guin_cVO, HttpSession session) {
    // System.out.println("-> contentsno: " + contentsno);

    ModelAndView mav = new ModelAndView();

    if (session.getAttribute("memberno") != null && session.getAttribute("memberno").equals(guin_cVO.getMemberno())) {
      this.guin_cProc.map(guin_cVO);

      mav.setViewName("redirect:/guin_c/read.do?jobcateno=" + guin_cVO.getJobcateno() + "&now_page="
          + guin_cVO.getNow_page() + "&guin_cno=" + guin_cVO.getGuin_cno());

    } else {
      mav.addObject("url", "/guin_c/msg");
      mav.addObject("code", "member_different");
      mav.addObject("guin_cno", guin_cVO.getGuin_cno());
      mav.addObject("jobcateno", guin_cVO.getJobcateno());
      mav.addObject("now_page", guin_cVO.getNow_page());
      mav.setViewName("redirect:/guin_c/msg.do");

    }

    return mav;
  }
  
  /**
   * 각종 메시지 처리
   * 
   * @param url
   * @return
   */
  @RequestMapping(value = "/guin_c/msg.do", method = RequestMethod.GET)
  public ModelAndView msg(String url) {
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward

    return mav; // forward
  }
  
  // 관심 구인 등록
  // http://localhost:9093/guin_c/like_y.do
  @RequestMapping(value = "/guin_c/like_y.do", method = RequestMethod.GET)
  public ModelAndView like_y(int guin_cno) {


    int cnt = this.guin_cProc.like_y(guin_cno);


    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/guin_c/like_y.do");

    return mav;

  }
  
  // 관심 구인 해제
  // http://localhost:9093/guin_c/like_n.do
  @RequestMapping(value = "/guin_c/like_n.do", method = RequestMethod.GET)
  public ModelAndView like_n(int guin_cno) {


    int cnt = this.guin_cProc.like_n(guin_cno);


    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/guin_c/like_n.do");

    return mav;

  }
  
  
  

}
