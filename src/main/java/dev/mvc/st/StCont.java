package dev.mvc.st;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.member.MemberProcInter;


@Controller
public class StCont{
  @Autowired
  @Qualifier("dev.mvc.st.StProc") 
  private StProcInter stProc;
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc") 
  private MemberProcInter memberProc;
  
  public StCont() {
    System.out.println("-> StCont created");
  }
  
  //HttpSession session, HttpServletRequest request
  /** 
   * 통계 페이지, http://localhost:9093/st/stmain.do
   * @return
   */
  @RequestMapping(value="/st/stmain.do", method=RequestMethod.GET)
  public ModelAndView stmain(HttpSession session, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();

    double exp_y = this.stProc.exp_y().getPercent();
    double exp_n = this.stProc.exp_n().getPercent();
    double gender_m = this.stProc.gender_m().getPercent();
    double gender_w = this.stProc.gender_w().getPercent();
//    double age_10 = this.stProc.age_10().getPercent();
//    double age_20 = this.stProc.age_20().getPercent();
//    double age_30 = this.stProc.age_30().getPercent();
//    double age_40 = this.stProc.age_40().getPercent();
//    double age_50 = this.stProc.age_50().getPercent();
//    double age_etc = this.stProc.age_etc().getPercent();
    mav.addObject("exp_y",  exp_y);
    mav.addObject("exp_n",  exp_n);
    mav.addObject("gender_m",  gender_m);
    mav.addObject("gender_w",  gender_w);
//    mav.addObject("age_10",  age_10);
//    mav.addObject("age_20",  age_20);
//    mav.addObject("age_30",  age_30);
//    mav.addObject("age_410",  age_40);
//    mav.addObject("age_50",  age_50);
//    mav.addObject("age_etc",  age_etc);

    mav.setViewName("/st/stmain"); // /webapp/WEB-INF/views/st/stmain.jsp
    return mav;
  }
  

}
