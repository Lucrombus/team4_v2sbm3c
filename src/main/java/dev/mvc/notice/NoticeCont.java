package dev.mvc.notice;

import java.util.ArrayList;

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

    if (this.memberProc.isMember(session) != true) {
      int cnt = this.noticeProc.create(noticeVO);

      if (cnt == 1) {
        mav.addObject("code", "create_success");
        //mav.setViewName("redirect:/notice/list_all.do"); // 목록으로 자동 이동
      } else {
        mav.addObject("code", "create_fail");
        //mav.setViewName("/notice/msg"); // /WEB-INF/views/cate/msg.jsp // 등록 실패 메시지 출력
      }
      mav.addObject("cnt", cnt);
      
      mav.addObject("url", "/notice/msg");
      mav.setViewName("redirect:/notice/msg.do");
      
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
     
     return mav;
   }
  // 조회

  // 삭제 폼

  // 삭제 처리

  // 수정 폼

  // 수정 처리

}