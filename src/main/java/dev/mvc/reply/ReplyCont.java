package dev.mvc.reply;

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
  // http://localhost:9093/contents/create_ajax.do
  @ResponseBody
  @RequestMapping(value="/reply/create_ajax.do", method=RequestMethod.POST)
  public String create(HttpSession session, ReplyVO replyVO) {
    
    JSONObject json = new JSONObject();
    
    if (session.getAttribute("id") != null) {
      replyVO.setMemberno((int) session.getAttribute("memberno"));
      int cnt = this.replyProc.create(replyVO);
      
      json.put("result", "성공");

    } else {
      json.put("result", "실패"); // 로그인 한함


    }
    
  
    return json.toString();
    
  }
  
  // 삭제 처리
  // http://localhost:9093/contents/delete_ajax.do
  @ResponseBody
  @RequestMapping(value="/reply/delete_ajax.do", method=RequestMethod.POST)
  public String create(int replyno, HttpSession session) {
    
    JSONObject json = new JSONObject();
    
    System.out.println("받은 댓글번호: "+ replyno);
    
    ReplyVO replyVO = this.replyProc.read(replyno);
    
    if (session.getAttribute("memberno") != null && session.getAttribute("memberno").equals(replyVO.getMemberno())) {
      
      int cnt_like = this.like_replyProc.delete_by_replyno(replyno);
      int cnt = this.replyProc.delete(replyno);
      
      json.put("result", "성공");

     


    } else {
      
      json.put("result", "실패");


    }
    
    
   
    return json.toString();
    
  }

}
