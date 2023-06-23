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
  
  // 메시지 조회 폼
  @RequestMapping(value = "/message/read.do", method = RequestMethod.GET)
  public ModelAndView read(int messageno, HttpSession session) {

    ModelAndView mav = new ModelAndView();
    
    MessageVO messageVO = this.messageProc.read(messageno);
    mav.addObject("messageVO", messageVO);
    
    if (session.getAttribute("memberno") != null) {
      // 자신이 보내거나 받은 메시지만 읽을 수 있도록 조건 추가

      if ((int) session.getAttribute("memberno") == messageVO.getMemberno()
          || (int) session.getAttribute("memberno") == messageVO.getReceive_memberno()) {

        // memberno로 memberVO를 찾는 메소드를 람다식으로 구현후 페이지에 넣음

        Function<Integer, MemberVO> f = (memberno) -> {
          MemberVO memberVO = this.memberProc.readByMemberno(memberno);
          return memberVO;
        };

        mav.addObject("f", f);

        mav.setViewName("/message/read");

      } else { // 내가 보내거나 받은 메시지가 아닐경우
        mav.addObject("code", "member_different");
        mav.setViewName("redirect:/message/msg.do");
      }

    } else { //로그인 상태가 아닐 경우
      mav.setViewName("/member/login_need");

    }
    
    
    return mav;

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
    mav.setViewName("redirect:/message/list_send.do");
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
      
      //memberno로 memberVO를 찾는 메소드를 람다식으로 구현후 페이지에 넣음
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
  
//내가 보낸 메시지 리스트
 @RequestMapping(value = "/message/list_send.do", method = RequestMethod.GET)
 public ModelAndView list_send(HttpSession session) {
   
   ModelAndView mav = new ModelAndView();
   
   if (session.getAttribute("memberno") != null) { //로그인 확인
     int send_memberno = (int) session.getAttribute("memberno");
     ArrayList<MessageVO> list = this.messageProc.list_send(send_memberno);
     mav.addObject("list", list);
     
     Function<Integer, MemberVO> f = (memberno) -> {
       MemberVO memberVO = this.memberProc.readByMemberno(memberno);
       return memberVO;
     };
     
     mav.addObject("f", f);
     
   
     mav.setViewName("/message/list_send");
     
   }else {
     mav.setViewName("/member/login_need");
     
   }
  
   return mav;

 }
 
 // 각종 MSG 처리
 @RequestMapping(value = "/message/msg.do", method = RequestMethod.GET)
 public ModelAndView msg() {

   ModelAndView mav = new ModelAndView();
   mav.setViewName("/message/msg");
   return mav;

 }

}
