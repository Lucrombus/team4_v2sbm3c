package dev.mvc.jobcate;

import java.util.ArrayList;

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
  private JobcateProcInter jobcateProc;
  
  public JobcateCont() {
    
    System.out.println("JobcateCont created");
  }
  
  
  // 등록 폼 조회 
  // http://localhost:9093/jobcate/create.do
  @RequestMapping(value="/jobcate/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/jobcate/create"); 
    return mav;
    
  }
  
  // 등록 처리
  // http://localhost:9093/jobcate/create.do
  @RequestMapping(value="/jobcate/create.do", method=RequestMethod.POST)
  public ModelAndView create(JobcateVO jobcateVO) {
    
    int cnt = this.jobcateProc.create(jobcateVO);
    
    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/jobcate/list_all.do"); 
    return mav;
    
  }
  
 // 리스트 조회
 // http://localhost:9093/jobcate/list_all.do
 @RequestMapping(value="/jobcate/list_all.do", method=RequestMethod.GET)
 public ModelAndView list_all() {
   
   ArrayList<JobcateVO> list = this.jobcateProc.list_all();
   
   ModelAndView mav = new ModelAndView();
   
   
   mav.addObject("list", list);
   
   
   return mav;
   
 } 
 
// 삭제 폼 조회
// http://localhost:9093/jobcate/create.do
@RequestMapping(value="/jobcate/read_delete.do", method=RequestMethod.GET)
public ModelAndView read_delete(int jobcateno) {
 
 ArrayList<JobcateVO> list = this.jobcateProc.list_all(); 
 JobcateVO jobcateVO = this.jobcateProc.read(jobcateno);
 
 ModelAndView mav = new ModelAndView();
 
 mav.addObject("list", list);
 mav.addObject("jobcateVO", jobcateVO);
 
 
 return mav;
 
} 

//삭제처리
//http://localhost:9093/jobcate/create.do
@RequestMapping(value="/jobcate/delete.do", method=RequestMethod.POST)
public ModelAndView delete(int jobcateno) {

int cnt = this.jobcateProc.delete(jobcateno);

ModelAndView mav = new ModelAndView();
mav.setViewName("redirect:/jobcate/list_all.do"); 

return mav;

} 
  
  
  
}
