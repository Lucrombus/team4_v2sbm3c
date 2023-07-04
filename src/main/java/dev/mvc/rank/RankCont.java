package dev.mvc.rank;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;
import dev.mvc.tool.Tool;

@Controller
public class RankCont {
  @Autowired
  @Qualifier("dev.mvc.rank.RankProc")  // @Component("dev.mvc.rank.RankProc")
  private RankProcInter rankProc; // rankProc 객체가 자동 생성되어 할당됨.

  @Autowired
  @Qualifier("dev.mvc.member.MemberProc") 
  private MemberProcInter memberProc;
  
  public RankCont() {
    System.out.println("-> RankCont created.");
  }
  
  
  /**
   * POST 요청시 JSP 페이지에서 JSTL 호출 기능 지원
   * 새로고침 방지, EL에서 param으로 접근, GET -> POST
   * 
   * @return
   */
  @RequestMapping(value = "/rank/msg.do", method = RequestMethod.GET)
  public ModelAndView msg(String url) {
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward

    return mav; // forward
  } 
  
  // 등록폼
  // http://localhost:9091/rank/create.do
  @RequestMapping(value="/rank/create.do", method=RequestMethod.GET)
  public ModelAndView create(HttpSession session) {
    
    ModelAndView mav = new ModelAndView();
    
    if (this.memberProc.isAdmin(session) == true) {
      // spring.mvc.view.prefix=/WEB-INF/views/
      // spring.mvc.view.suffix=.jsp
      mav.setViewName("/rank/create"); // /WEB-INF/views/rank/create.jsp      
    } else {
      mav.setViewName("/member/admin_login_need"); // /WEB-INF/views/member/admin_login_need.jsp
    }

    return mav;
  }

  // 등록 처리
  // http://localhost:9091/rank/create.do
  @RequestMapping(value="/rank/create.do", method=RequestMethod.POST)
  public ModelAndView create(HttpSession session, RankVO rankVO) { // <form> 태그의 값이 자동으로 저장됨
    
    ModelAndView mav = new ModelAndView();
    
    if (this.memberProc.isAdmin(session) == true) {
      int cnt = this.rankProc.create(rankVO);
      
      if (cnt == 1) {
        // request.setAttribute("code", "create_success"); // 고전적인 jsp 방법 
        // mav.addObject("code", "create_success");
        mav.setViewName("redirect:/rank/list_all.do");     // 목록으로 자동 이동
        
      } else {
        // request.setAttribute("code", "create_fail");
        mav.addObject("code", "create_fail");
        mav.setViewName("/rank/msg"); // /WEB-INF/views/cate/msg.jsp // 등록 실패 메시지 출력

      }
      
      // request.setAttribute("cnt", cnt);
      mav.addObject("cnt", cnt);
    } else {
      mav.setViewName("/member/admin_login_need"); // /WEB-INF/views/admin/login_need.jsp
    }
    
    return mav;
  }
  
  // http://localhost:9091/rank/list_all.do
  @RequestMapping(value="/rank/list_all.do", method=RequestMethod.GET)
  public ModelAndView list_all(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (this.memberProc.isAdmin(session) == true) {
      mav.setViewName("/rank/list_all"); // /WEB-INF/views/cate/list_all.jsp
      
      ArrayList<RankVO> list = this.rankProc.list_all();
      mav.addObject("list", list);      
    } else {
      mav.setViewName("/member/admin_login_need"); // /WEB-INF/views/admin/login_need.jsp
    }
    
    return mav;
  }
  
  // http://localhost:9091/rank/read.do?rankno=1
  @RequestMapping(value="/rank/read.do", method=RequestMethod.GET)
  public ModelAndView read(HttpSession session, int rankno) {
    ModelAndView mav = new ModelAndView();
    
    if (this.memberProc.isAdmin(session) == true) {
      mav.setViewName("/rank/read"); // /WEB-INF/views/cate/read.jsp
      
      RankVO rankVO = this.rankProc.read(rankno);
      mav.addObject("rankVO", rankVO);
    } else {
      mav.setViewName("/member/admin_login_need"); 
    }
    
    return mav;
  }
  
  // 수정폼
  // http://localhost:9091/rank/read_update.do?rankno=1
  // http://localhost:9091/rank/read_update.do?rankno=2
  // http://localhost:9091/rank/read_update.do?rankno=3
  @RequestMapping(value="/rank/read_update.do", method=RequestMethod.GET)
  public ModelAndView read_update(HttpSession session, int rankno) {
    ModelAndView mav = new ModelAndView();
    
    if (this.memberProc.isAdmin(session) == true) {
      mav.setViewName("/rank/read_update"); // /WEB-INF/views/rank/read_update.jsp
      
      RankVO rankVO = this.rankProc.read(rankno); // 수정용 데이터
      mav.addObject("rankVO", rankVO);
      
      ArrayList<RankVO> list = this.rankProc.list_all(); // 목록 출력용 데이터
      mav.addObject("list", list);
      
    } else {
      mav.setViewName("/member/admin_login_need"); // /WEB-INF/views/admin/login_need.jsp
      
    }
    
    return mav;
  }
  
  // 수정 처리
  @RequestMapping(value="/rank/update.do", method=RequestMethod.POST)
  public ModelAndView update(HttpSession session, RankVO rankVO) { // <form> 태그의 값이 자동으로 저장됨
    
    ModelAndView mav = new ModelAndView();

    if (this.memberProc.isAdmin(session) == true) {
      int cnt = this.rankProc.update(rankVO);
      
      if (cnt == 1) {
        // request.setAttribute("code", "update_success"); // 고전적인 jsp 방법 
        // mav.addObject("code", "update_success");
        mav.setViewName("redirect:/rank/list_all.do");       // 자동 주소 이동, Spring 재호출
        
      } else {
        // request.setAttribute("code", "update_fail");
        mav.addObject("code", "update_fail");
        mav.setViewName("/rank/msg"); // /WEB-INF/views/cate/msg.jsp
      }
      
      // request.setAttribute("cnt", cnt);
      mav.addObject("cnt", cnt);
      
    } else {
      mav.setViewName("/admin/login_need"); // /WEB-INF/views/admin/login_need.jsp
    }
    
    return mav;
  }
 
  // 삭제폼, 수정폼을 복사하여 개발 
  // http://localhost:9093/rank/read_delete.do?rankno=1
  @RequestMapping(value="/rank/read_delete.do", method=RequestMethod.GET)
  public ModelAndView read_delete(HttpSession session, int rankno) {
    ModelAndView mav = new ModelAndView();
    
    if (this.memberProc.isAdmin(session) == true) {
      RankVO rankVO = this.rankProc.read(rankno); // 수정용 데이터
      mav.addObject("rankVO", rankVO);
      
      ArrayList<RankVO> list = this.rankProc.list_all(); // 목록 출력용 데이터
      mav.addObject("list", list);
      
      mav.setViewName("/rank/read_delete"); // /WEB-INF/views/cate/read_delete.jsp
      
    } else {
      mav.setViewName("/member/admin_login_need"); // /WEB-INF/views/admin/login_need.jsp
    }
    
    return mav;
    }
  
  // 삭제 처리, 수정 처리를 복사하여 개발
  // 자식 테이블 레코드 삭제 -> 부모 테이블 레코드 삭제
  @RequestMapping(value="/rank/delete.do", method=RequestMethod.POST)
  public ModelAndView delete(HttpSession session, int rankno) { // <form> 태그의 값이 자동으로 저장됨
    //    System.out.println("-> cateno: " + cateVO.getCateno());
    //    System.out.println("-> name: " + cateVO.getName());
    
    ModelAndView mav = new ModelAndView();
    
    if (this.memberProc.isAdmin(session) == true) {           
      ArrayList<MemberVO> list = this.memberProc.list_by_rankno(rankno); // 자식 레코드 목록 읽기
      this.memberProc.delete_by_rankno(rankno);
      int cnt = this.rankProc.delete(rankno); // 카테고리 삭제
      
      if (cnt == 1) {
        mav.setViewName("redirect:/rank/list_all.do");       // 자동 주소 이동, Spring 재호출
        
      } else {
        mav.addObject("code", "delete_fail");
        mav.setViewName("/rank/msg"); // /WEB-INF/views/rank/msg.jsp
      }
      mav.addObject("cnt", cnt); 
    } else {
      mav.setViewName("/member/admin_login_need"); // /WEB-INF/views/admin/login_need.jsp
    }
    return mav;
  }
}






