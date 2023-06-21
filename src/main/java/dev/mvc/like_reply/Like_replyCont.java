package dev.mvc.like_reply;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class Like_replyCont {

@Autowired
@Qualifier("dev.mvc.like_reply.Like_replyProc")
private Like_replyProcInter like_replyProc;


public Like_replyCont() {
  System.out.println("Reply Cont created");
}

@ResponseBody
@RequestMapping(value="/like_reply/gaechu_ajax.do", method=RequestMethod.POST)
public String create(HttpSession session, int replyno) {
  
  JSONObject json = new JSONObject();
  
  Like_replyVO like_replyVO = new Like_replyVO();
  
  like_replyVO.setReplyno(replyno);
  like_replyVO.setMemberno((int) session.getAttribute("memberno"));
  
  // 지금 로그인한 회원이 이 댓글에 몇번 추천했는지 (무조건 0번이어야 추천가능)
  int cnt = this.like_replyProc.check(like_replyVO);
  
  System.out.println("추천수: "+ cnt);
  
  if (cnt < 1) {
    System.out.println("추천을 시작합니다");
    int cnt2 = this.like_replyProc.create(like_replyVO);
    json.put("result", "성공");
    
  }else {
    json.put("result", "실패");
  }
  
  
  
  return json.toString();
  
}









}
