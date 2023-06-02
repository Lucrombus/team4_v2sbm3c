package dev.mvc.jobcate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JobcateCont {
  
  @Autowired
  @Qualifier("dev.mvc.jobcate.JobcateProc")
  private JobcateProc jobcateProc;
  
  public JobcateCont() {
    
    System.out.println("JobcateCont created");
  }
  
  @RequestMapping(value="/jobcate/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    
    ModelAndView mav = new ModelAndView();
    return mav;
    
  }
}
