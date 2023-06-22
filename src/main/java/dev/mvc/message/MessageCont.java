package dev.mvc.message;

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

import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;

@Controller
public class MessageCont {

  @Autowired
  @Qualifier("dev.mvc.message.MessageProc")
  private MessageProcInter messageProc;

  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;

  public MessageCont() {

    System.out.println("MessageCont Created");
  }

  // 메시지 전송 폼
  @RequestMapping(value = "/message/create.do", method = RequestMethod.GET)
  public ModelAndView create() {

    ModelAndView mav = new ModelAndView();
    mav.setViewName("/message/create");
    return mav;

  }

//아이디 확인후 membrno 반환 AJAX
  @ResponseBody
  @RequestMapping(value = "/message/checkid_ajax.do", method = RequestMethod.POST)
  public String check(String member_receive) {

    System.out.println("응답성공");

    JSONObject json = new JSONObject();
    MemberVO memberVO = this.memberProc.readById(member_receive);
    if (memberVO != null) {
      json.put("memberno", memberVO.getMemberno());
      json.put("result", "성공");

    } else {
      json.put("result", "실패");
    }

    return json.toString();

  }
  
  // 메시지 전송 처리
  @RequestMapping(value = "/message/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpSession session, MessageVO messageVO) {
    
    ModelAndView mav = new ModelAndView();
    
    messageVO.setMemberno((int) session.getAttribute("memberno")); // 보내는 사람 memberno 저장
    
    int cnt = this.messageProc.create(messageVO);
    mav.setViewName("redirect:/message/create.do");
    return mav;

  }
  
  // 내가 받은 메시지 리스트
  @RequestMapping(value = "/message/list_receive.do", method = RequestMethod.GET)
  public ModelAndView list_receive(HttpSession session) {
    
    ModelAndView mav = new ModelAndView();
    
    if (session.getAttribute("memberno") != null) { //로그인 확인
      int receive_memberno = (int) session.getAttribute("memberno");
      ArrayList<MessageVO> list = this.messageProc.list_receive(receive_memberno);
      mav.addObject("list", list);
      
      Function<Integer, MemberVO> f = (memberno) -> {
        MemberVO memberVO = this.memberProc.readByMemberno(memberno);
        return memberVO;
      };
      
      mav.addObject("f", f);
      
    
      mav.setViewName("/message/list_receive");
      
    }else {
      mav.setViewName("/member/login_need");
      
    }
   
    return mav;

  }

}
