package dev.mvc.guin_c;

import java.util.ArrayList;

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


import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;



@Controller
public class Guin_cCont {
  
  @Autowired
  @Qualifier("dev.mvc.guin_c.Guin_cProc")
  private Guin_cProcInter guin_cProc;
  
  public Guin_cCont() {
    System.out.println("Guin_cCont created");
  }
  
  
  // 등록 폼 조회
  // http://localhost:9093/guin_c/create.do
  @RequestMapping(value="/guin_c/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/guin_c/create");
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
//      mav.setViewName("/contents/test"); // /webapp/WEB-INF/views/contents/create.jsp
//
//    } else {
//      mav.setViewName("/admin/login_need");
//    }
//
//    return mav;
//  }
//  
//  /**
//   * 이미지 업로드 반응
//   * 
//   * @return
//   */
//  @ResponseBody
//  @RequestMapping(value = "/contents/test.do", method = RequestMethod.POST)
//  public String test(MultipartRequest request) {
////    ModelAndView mav = new ModelAndView();
//    
//    System.out.println("연결성공");
//    
//    String upDir = Contents.getUploadDir();
//    String file1 = ""; // 원본 파일명 image
//    String file1saved = ""; // 저장된 파일명, image
//    String thumb1 = ""; // preview image
//    
//    
//    MultipartFile uploadFile = request.getFile("upload");
//    long size1 = uploadFile.getSize();
//    file1 = uploadFile.getOriginalFilename();
//        
//    System.out.println("원본 파일명: " + file1);
//    System.out.println("이미지 용량: " + size1);
//    System.out.println("저장경로: "+ upDir);
//    
//
//    
//    
//    if (size1 > 0) { // 파일 크기 체크
//      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
//      file1saved = Upload.saveFileSpring(uploadFile, upDir);
//
//      if (Tool.isImage(file1saved)) { // 이미지인지 검사
//        // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
//        thumb1 = Tool.preview(upDir, file1saved, 200, 150);
//      }
//
//    }
//
//    JSONObject json = new JSONObject();
//    
////    mav.addObject("uploaded", true);
////    mav.addObject("url", upDir+file1saved);
////    mav.addObject("fileName", file1saved);
//    
//    json.put("file1", file1 );
//    json.put("file1saved", file1saved );
//    json.put("thumb1", thumb1);
//    json.put("size1", size1 );
//    
//    
//    
//    
//    json.put("uploaded", true);
//    json.put("url", "/contents/storage/"+file1saved);
//    json.put("fileName", file1saved);
//    
//    System.out.println("업로드 성패: " + json.get("uploaded"));
//    System.out.println("업로드 url: " + json.get("url"));
//    System.out.println("업로드 파일네임: " + json.get("fileName"));
//    
//    return json.toString();
//
//
//  }
//  
//  /**
//   * 등록 처리 http://localhost:9091/contents/create.do
//   * 
//   * @return
//   */
//  @RequestMapping(value = "/contents/create_test.do", method = RequestMethod.POST)
//  public ModelAndView create_test(HttpServletRequest request, HttpSession session, ContentsVO contentsVO, JSONObject json) {
//    ModelAndView mav = new ModelAndView();
//
//    // ------------------------------------------------------------------------------
//    // 파일 전송 코드 시작
//    // ------------------------------------------------------------------------------
//    contentsVO.getContent();
//    
//    // ------------------------------------------------------------------------------
//    // 파일 전송 코드 종료
//    // ------------------------------------------------------------------------------
//    
//    String file1 = contentsVO.getFile1();
//    String file1saved = contentsVO.getFile1saved();
//    String thumb1 = contentsVO.getThumb1();
//    long size1 = contentsVO.getSize1();
//    
//    contentsVO.setFile1(file1); // 순수 원본 파일명
//    contentsVO.setFile1saved(file1saved); // 저장된 파일명(파일명 중복 처리)
//    contentsVO.setThumb1(thumb1); // 원본이미지 축소판
//    contentsVO.setSize1(size1); // 파일 크기
//    
//
//    // Call By Reference: 메모리 공유, Hashcode 전달
//    int cnt = this.contentsProc.create(contentsVO);
//
//    // ------------------------------------------------------------------------------
//    // PK의 return
//    // ------------------------------------------------------------------------------
//    // System.out.println("--> contentsno: " + contentsVO.getContentsno());
//    // mav.addObject("contentsno", contentsVO.getContentsno()); // redirect
//    // parameter 적용
//    // ------------------------------------------------------------------------------
//
//    if (cnt == 1) {
//      mav.addObject("code", "create_success");
//      // typeProc.increaseCnt(contentsVO.getTypeno()); // 글수 증가
//    } else {
//      mav.addObject("code", "create_fail");
//    }
//    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
//
//    // System.out.println("--> typeno: " + contentsVO.getTypeno());
//    // redirect시에 hidden tag로 보낸것들이 전달이 안됨으로 request에 다시 저장
//    // mav.addObject("typeno", contentsVO.getTypeno()); // redirect parameter 적용
//    // mav.addObject("url", "/contents/msg"); // msg.jsp, redirect parameter 적용
//    // mav.setViewName("redirect:/contents/msg.do");
//
//    mav.addObject("url", "/contents/msg");
//    mav.addObject("typeno", contentsVO.getTypeno());
//    mav.addObject("now_page", contentsVO.getNow_page());
//    mav.setViewName("redirect:/contents/msg.do");
//
//    return mav; // forward
//  }
  
  

}
