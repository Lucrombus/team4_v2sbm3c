package dev.mvc.guin_c;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class Guin_cCont {
  
  @Autowired
  @Qualifier("dev.mvc.guin_c.Guin_cProc")
  private Guin_cProcInter guin_cProc;
  
  public Guin_cCont() {
    System.out.println("Guin_cCont created");
  }
  
  
  // 등록 폼 조회
  // http://localhost:9093/guin_c/create.do
  @RequestMapping(value="/guin_c/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/guin_c/create");
    return mav;
  }

}
