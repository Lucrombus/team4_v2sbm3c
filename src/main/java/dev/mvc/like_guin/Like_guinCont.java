package dev.mvc.like_guin;

import java.util.ArrayList;
import java.util.function.Function;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.board.BoardVO;
import dev.mvc.guin_c.Guin_cProcInter;
import dev.mvc.guin_c.Guin_cVO;
import dev.mvc.jobcate.JobcateProcInter;
import dev.mvc.jobcate.JobcateVO;
import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;

@Controller
public class Like_guinCont {
  @Autowired
  @Qualifier("dev.mvc.like_guin.Like_guinProc")
  private Like_guinProcInter like_guinProc;

  @Autowired
  @Qualifier("dev.mvc.guin_c.Guin_cProc")
  private Guin_cProcInter guin_cProc;

  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;

  public Like_guinCont() {
    System.out.println("-> Like_guinCont created.");
  }

  // 등록폼
  // http://localhost:9093/like_guin/create.do
  @RequestMapping(value = "/like_guin/create.do", method = RequestMethod.GET)
  public ModelAndView create(int guin_cno, HttpSession session) {

    ModelAndView mav = new ModelAndView();

    Guin_cVO guin_cVO = this.guin_cProc.read(guin_cno);
    ArrayList<Guin_cVO> list = this.guin_cProc.list_by_jobcateno_search_paging(guin_cVO);
    mav.addObject("guin_cVO", guin_cVO);
    mav.addObject("list", list);

    if (session.getAttribute("id") != null) {
      mav.setViewName("/contents/create_test");

    } else {
      mav.setViewName("/member/login_need");

    }

    return mav;
  }

  // 나의 관심목록
  // http://localhost:9093/like_guin/list_all.do
  @RequestMapping(value = "/like_guin/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all(int memberno, HttpSession session) {
    ModelAndView mav = new ModelAndView();

    if (session.getAttribute("memberno") != null) {
      if ((int) session.getAttribute("memberno") == memberno) {
        ArrayList<Like_guinVO> list = like_guinProc.list_mine(memberno);
        mav.addObject("list", list);

        // 관리자번호로 관리자 이름 얻는 메소드를 람다식으로 객체화 후 페이지에 전달
        Function<Integer, String> f = (memberno_read) -> {
          MemberVO memberVO = memberProc.readByMemberno(memberno_read);
          String id = "(알수없음)";

          if (memberVO != null) {
            id = memberVO.getId();
          }

          return id;
        };
        mav.addObject("f", f);

        mav.setViewName("/like_guin/list_all");

      } else {
        mav.addObject("code", "property_different");
        mav.addObject("url", "/like_guin/msg");
        mav.setViewName("redirect:/like_guin/msg.do");

      }

    } else {
      mav.setViewName("/member/login_need");
    }

    return mav;
  }

  // AJAX
  // 관심구인 등록
  @ResponseBody
  @RequestMapping(value = "/like_guin/like_y.do", method = RequestMethod.POST)
  public String like_y(int guin_cno, HttpSession session) {

    JSONObject json = new JSONObject();

    if (session.getAttribute("memberno") != null) {
      Like_guinVO like_guinVO = new Like_guinVO();
      int memberno = (int) session.getAttribute("memberno");

      like_guinVO.setGuin_cno(guin_cno); // 선택한 컨텐츠 넘버와 현재 로그인한 사용자의 memberno로 관심 테이블에 등록
      like_guinVO.setMemberno(memberno); // 선택한 컨텐츠 넘버와 현재 로그인한 사용자의 memberno로 관심 테이블에 등록
      System.out.println("등록된 guin_cno: " + guin_cno);
      System.out.println("등록된 memberno: " + memberno);

      int cnt = this.like_guinProc.create(like_guinVO);

      if (cnt > 0) {
        System.out.println("관심등록 성공");
        json.put("result", "성공");

      } else {
        System.out.println("관심등록 실패");
        json.put("result", "실패");
      }

    } else {
      System.out.println("로그인이 안됨");
      json.put("result", "실패");

    }

    return json.toString();

  }

  // 관심구인 해제
  @ResponseBody
  @RequestMapping(value = "/like_guin/like_n.do", method = RequestMethod.POST)
  public String like_n(int guin_cno, HttpSession session) {

    JSONObject json = new JSONObject();

    if (session.getAttribute("memberno") != null) {
      Like_guinVO like_guinVO = new Like_guinVO();
      int memberno = (int) session.getAttribute("memberno");

      like_guinVO.setGuin_cno(guin_cno); // 선택한 컨텐츠 넘버와 현재 로그인한 사용자의 memberno로 관심 테이블에 등록
      like_guinVO.setMemberno(memberno); // 선택한 컨텐츠 넘버와 현재 로그인한 사용자의 memberno로 관심 테이블에 등록
      System.out.println("삭제할 guin_cno: " + guin_cno);
      System.out.println("삭제할 memberno: " + memberno);

      int cnt = this.like_guinProc.delete_mine(like_guinVO);

      if (cnt > 0) {
        System.out.println("관심등록 성공");
        json.put("result", "성공");

      } else {
        System.out.println("관심등록 실패");
        json.put("result", "실패");
      }

    } else {
      System.out.println("로그인이 안됨");
      json.put("result", "실패");

    }

    return json.toString();

  }

  //관심 구인 해제 (관심구인 목록에서 요청)
  // http://localhost:9093/guin_c/like_n.do
  @RequestMapping(value = "/like_guin/like_n_mine.do", method = RequestMethod.GET)
  public ModelAndView like_n_mine(int guin_cno, HttpSession session) {

    ModelAndView mav = new ModelAndView();

    if (session.getAttribute("memberno") != null) {
      Like_guinVO like_guinVO = new Like_guinVO();
      int memberno = (int) session.getAttribute("memberno");

      like_guinVO.setGuin_cno(guin_cno); // 선택한 컨텐츠 넘버와 현재 로그인한 사용자의 memberno로 관심 테이블에 등록
      like_guinVO.setMemberno(memberno); // 선택한 컨텐츠 넘버와 현재 로그인한 사용자의 memberno로 관심 테이블에 등록
      System.out.println("삭제할 guin_cno: " + guin_cno);
      System.out.println("삭제할 memberno: " + memberno);

      int cnt = this.like_guinProc.delete_mine(like_guinVO);

      mav.addObject("memberno", memberno);
      mav.setViewName("redirect:/like_guin/list_all.do");

    } else {
      mav.setViewName("/member/login_need");
    }

    return mav;

  }

  /**
   * 각종 메시지 처리
   * 
   * @param url
   * @return
   */
  @RequestMapping(value = "/like_guin/msg.do", method = RequestMethod.GET)
  public ModelAndView msg(String url) {
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward

    return mav; // forward
  }
}
