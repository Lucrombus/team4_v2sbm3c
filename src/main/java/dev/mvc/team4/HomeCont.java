package dev.mvc.team4;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.jobcate.JobcateProcInter;
import dev.mvc.jobcate.JobcateVO;

// Setvlet으로 작동함, GET/POST등의 요청을 처리함.
@Controller
public class HomeCont {
  @Autowired
  @Qualifier("dev.mvc.jobcate.JobcateProc")  // @Component("dev.mvc.cate.JobcateProc")
  private JobcateProcInter jobcateProc; // CateProc 객체가 자동 생성되어 할당됨.
  
  public HomeCont() {
    System.out.println("-> HomeCont created.");
  }
  
  // http://localhost:9093/
  // http://localhost:9093/index.do
  @RequestMapping(value= {"/", "/index.do"}, method=RequestMethod.GET)
  public ModelAndView home() {
    ModelAndView mav = new ModelAndView();
    // spring.mvc.view.prefix=/WEB-INF/views/
    // spring.mvc.view.suffix=.jsp
    mav.setViewName("/index"); // /WEB-INF/views/index.jsp
    
    return mav;
  }
  
  // http://localhost:9093/menu/top.do
  @RequestMapping(value= {"/menu/top.do"}, method=RequestMethod.GET)
  public ModelAndView top() {
    ModelAndView mav = new ModelAndView();

    ArrayList<JobcateVO> list = this.jobcateProc.list_all();
    mav.addObject("list", list);
    
    System.out.println("HomeCont의 top.do 컨트롤러 입니다 ->" + list);
    
    mav.setViewName("/menu/top"); // /WEB-INF/views/menu/top.jsp
    
    return mav;
  }
  
  
}

