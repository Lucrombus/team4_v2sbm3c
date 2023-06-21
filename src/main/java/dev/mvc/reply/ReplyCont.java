package dev.mvc.reply;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.board.BoardVO;
import dev.mvc.contents.ContentsVO;
import dev.mvc.like_reply.Like_replyProcInter;


@Controller
public class ReplyCont {
  
  @Autowired
  @Qualifier("dev.mvc.reply.ReplyProc")
  private ReplyProcInter replyProc;
  
  @Autowired
  @Qualifier("dev.mvc.like_reply.Like_replyProc")
  private Like_replyProcInter like_replyProc;
  
  public ReplyCont() {
    System.out.println("Reply Cont created");
  }
  
  
  // 등록 처리
  // http://localhost:9093/contents/create.do
  @RequestMapping(value="/reply/create.do", method=RequestMethod.POST)
  public ModelAndView create(HttpSession session, ReplyVO replyVO, ContentsVO contentsVO) {
    ModelAndView mav = new ModelAndView();
    
    if (session.getAttribute("id") != null) {
      replyVO.setMemberno((int) session.getAttribute("memberno"));
      int cnt = this.replyProc.create(replyVO);
      
      mav.addObject("contentsno", contentsVO.getContentsno());
      mav.addObject("boardno", contentsVO.getBoardno());
      mav.addObject("now_page", contentsVO.getNow_page());
      mav.addObject("word", contentsVO.getWord());
      
      mav.setViewName("redirect:/contents/read.do");

    } else {
      mav.addObject("url", "/member/login_need"); // /WEB-INF/views/admin/login_need.jsp
      mav.setViewName("redirect:/contents/msg.do"); 

    }
    
  
    return mav;
    
  }
  
  // 삭제 처리
  // http://localhost:9093/contents/create.do
  @RequestMapping(value="/reply/delete.do", method=RequestMethod.GET)
  public ModelAndView create(int replyno, ContentsVO contentsVO, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    ReplyVO replyVO = this.replyProc.read(replyno);
    
    if (session.getAttribute("memberno") != null && session.getAttribute("memberno").equals(replyVO.getMemberno())) {
      
      int cnt_like = this.like_replyProc.delete_by_replyno(replyno);
      int cnt = this.replyProc.delete(replyno);
      
      
      mav.addObject("contentsno", contentsVO.getContentsno());
      mav.addObject("boardno", contentsVO.getBoardno());
      mav.addObject("now_page", contentsVO.getNow_page());
      mav.addObject("word", contentsVO.getWord());
      
      mav.setViewName("redirect:/contents/read.do");
     


    } else {
      mav.addObject("url", "/contents/msg");
      mav.addObject("code", "member_different");
      mav.addObject("contentsno", contentsVO.getContentsno());
      mav.addObject("boardno", contentsVO.getBoardno());
      mav.addObject("now_page", contentsVO.getNow_page());
      mav.setViewName("redirect:/contents/msg.do");

    }
    
    
   
    return mav;
    
  }

}
