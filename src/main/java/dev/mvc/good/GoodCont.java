package dev.mvc.good;

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

import dev.mvc.guin_c.Guin_cProcInter;
import dev.mvc.guin_c.Guin_cVO;
import dev.mvc.like_guin.Like_guinVO;
import dev.mvc.member.MemberVO;


@Controller
public class GoodCont{
//  @Autowired
//  @Qualifier("dev.mvc.good.GoodProc")
//  private GoodProcInter goodProc;
  
  @Autowired
  @Qualifier("dev.mvc.guin_c.Guin_cProc")
  private Guin_cProcInter guin_cProc;
  
  public GoodCont() {
    System.out.println("-> GoodCont created");
  }
  
  // 등록폼
  // http://localhost:9093/good/create.do
  @RequestMapping(value = "/good/create.do", method = RequestMethod.GET)
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
  
  
//  
//  // AJAX
//  // 좋아요 등록
//  @ResponseBody
//  @RequestMapping(value = "/good/good_y.do", method = RequestMethod.POST)
//  public String good_y(int guin_cno, HttpSession session) {
//
//    JSONObject json = new JSONObject();
//
//    if (session.getAttribute("memberno") != null) {
//      GoodVO goodVO = new GoodVO();
//      int memberno = (int) session.getAttribute("memberno");
//
//      goodVO.setGuin_cno(guin_cno); // 선택한 컨텐츠 넘버와 현재 로그인한 사용자의 memberno로 관심 테이블에 등록
//      goodVO.setMemberno(memberno); // 선택한 컨텐츠 넘버와 현재 로그인한 사용자의 memberno로 관심 테이블에 등록
//      System.out.println("등록된 guin_cno: " + guin_cno);
//      System.out.println("등록된 memberno: " + memberno);
//
//      int cnt = this.goodProc.create(goodVO);
//
//      if (cnt > 0) {
//        System.out.println("좋아요 성공");
//        json.put("result", "성공");
//
//      } else {
//        System.out.println("좋아요 실패");
//        json.put("result", "실패");
//      }
//
//    } else {
//      System.out.println("로그인이 안됨");
//      json.put("result", "실패");
//
//    }
//
//    return json.toString();
//
//  }
//  
//  //관심 구인 해제 (관심구인 목록에서 요청)
//  // http://localhost:9093/guin_c/good_n.do
//  @RequestMapping(value = "/good/good_n.do", method = RequestMethod.GET)
//  public ModelAndView like_n_mine(int guin_cno, HttpSession session) {
//
//    ModelAndView mav = new ModelAndView();
//
//    if (session.getAttribute("memberno") != null) {
//      GoodVO goodVO = new GoodVO();
//      int memberno = (int) session.getAttribute("memberno");
//
//      goodVO.setGuin_cno(guin_cno); // 선택한 컨텐츠 넘버와 현재 로그인한 사용자의 memberno로 관심 테이블에 등록
//      goodVO.setMemberno(memberno); // 선택한 컨텐츠 넘버와 현재 로그인한 사용자의 memberno로 관심 테이블에 등록
//      System.out.println("삭제할 guin_cno: " + guin_cno);
//      System.out.println("삭제할 memberno: " + memberno);
//
//      int cnt = this.goodProc.delete_good(goodVO);
//
//      mav.addObject("memberno", memberno);
//      mav.setViewName("redirect:/like_guin/list_all.do");
//
//    } else {
//      mav.setViewName("/member/login_need");
//    }
//
//    return mav;
//
//  }

}
