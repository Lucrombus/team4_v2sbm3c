package dev.mvc.mypage;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
  
@Controller
public class MypageCont {
  @Autowired
  @Qualifier("dev.mvc.mypage.MypageProc") 
  private MypageProcInter mypageProc;
  
  public MypageCont () {
    System.out.println("-> MypageCont created.");
  }
  
  /**
   * 나의 관심 구직 목록, http://localhost:9093/mypage/list_like_guin.do
   * @return
   */
  @RequestMapping(value="/mypage/list_like_guin.do", method=RequestMethod.GET)
  public ModelAndView list_like_guin() {
    ModelAndView mav = new ModelAndView();
    
    ArrayList<MypageVO> list = this.mypageProc.list_like_guin();
    mav.addObject("list", list);
    
    mav.setViewName("/mypage/list_like_guin"); // /webapp/WEB-INF/views/mypage/list_like_guin.jsp
    
    return mav;
  }
  
  
}
