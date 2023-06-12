package dev.mvc.recom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class RecomCont{
  
  @Autowired
  @Qualifier("dev.mvc.recom.RecomProc")
  private RecomProcInter recomProc;
  
  private RecomCont() {
    System.out.println("RecomCont created");
  }
  
  // 등록 폼 조회
  // http://localhost:9093/recom/create.do
  @RequestMapping(value="/recom/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/recom/create");
    return mav;
  }
}