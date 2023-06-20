package dev.mvc.jobcate;

import java.util.ArrayList;
import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.guin_c.Guin_cProcInter;

@Controller
public class JobcateCont {

  @Autowired
  @Qualifier("dev.mvc.jobcate.JobcateProc")
  private JobcateProcInter jobcateProc;
  
  @Autowired
  @Qualifier("dev.mvc.guin_c.Guin_cProc")
  private Guin_cProcInter guin_cProc;

  public JobcateCont() {

    System.out.println("JobcateCont created");
  }

  // 등록 폼 조회
  // http://localhost:9093/jobcate/create.do
  @RequestMapping(value = "/jobcate/create.do", method = RequestMethod.GET)
  public ModelAndView create() {

    ModelAndView mav = new ModelAndView();
    mav.setViewName("/jobcate/create");
    return mav;

  }

  // 등록 처리
  // http://localhost:9093/jobcate/create.do
  @RequestMapping(value = "/jobcate/create.do", method = RequestMethod.POST)
  public ModelAndView create(JobcateVO jobcateVO) {

    int cnt = this.jobcateProc.create(jobcateVO);

    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/jobcate/list_all.do");
    return mav;

  }

  // 리스트 조회
  // http://localhost:9093/jobcate/list_all.do
  @RequestMapping(value = "/jobcate/list_all.do", method = RequestMethod.GET)
  public ModelAndView list_all() {

    ArrayList<JobcateVO> list = this.jobcateProc.list_all();

    ModelAndView mav = new ModelAndView();
    
    Function<Integer, Integer> f = (jobcateno) -> {
      int count = this.guin_cProc.count_by_jobcateno(jobcateno);
      System.out.println(count);
      return count;
    };
    
    mav.addObject("f", f);

    mav.addObject("list", list);
    mav.setViewName("/jobcate/list_all");

    return mav;

  }

// 삭제 폼 조회
// http://localhost:9093/jobcate/read_delete.do
  @RequestMapping(value = "/jobcate/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int jobcateno) {

    ArrayList<JobcateVO> list = this.jobcateProc.list_all();
    JobcateVO jobcateVO = this.jobcateProc.read(jobcateno);

    ModelAndView mav = new ModelAndView();
    
    Function<Integer, Integer> f = (jobcateno_read) -> {
      int count = this.guin_cProc.count_by_jobcateno(jobcateno_read);
      System.out.println(count);
      return count;
    };
    
    mav.addObject("f", f);

    mav.addObject("list", list);
    mav.addObject("jobcateVO", jobcateVO);
    mav.setViewName("/jobcate/read_delete");
    
    

    return mav;

  }

//삭제처리
//http://localhost:9093/jobcate/delete.do
  @RequestMapping(value = "/jobcate/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int jobcateno) {

    int cnt = this.jobcateProc.delete(jobcateno);

    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/jobcate/list_all.do");

    return mav;

  }

//수정 폼 조회
//http://localhost:9093/jobcate/read_update.do
  @RequestMapping(value = "/jobcate/read_update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int jobcateno) {

    ArrayList<JobcateVO> list = this.jobcateProc.list_all();
    JobcateVO jobcateVO = this.jobcateProc.read(jobcateno);

    ModelAndView mav = new ModelAndView();
    
    Function<Integer, Integer> f = (jobcateno_read) -> {
      int count = this.guin_cProc.count_by_jobcateno(jobcateno_read);
      System.out.println(count);
      return count;
    };
    
    mav.addObject("f", f);

    mav.addObject("list", list);
    mav.addObject("jobcateVO", jobcateVO);
    mav.setViewName("/jobcate/read_update");

    return mav;

  }

//수정처리
//http://localhost:9093/jobcate/update.do
  @RequestMapping(value = "/jobcate/update.do", method = RequestMethod.POST)
  public ModelAndView update(JobcateVO jobcateVO) {

    int cnt = this.jobcateProc.update(jobcateVO);

    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/jobcate/list_all.do");

    return mav;

  }

//출력순서 증가
//http://localhost:9093/jobcate/update_seqno_increase.do
  @RequestMapping(value = "/jobcate/update_seqno_increase.do", method = RequestMethod.GET)
  public ModelAndView update_seqno_increase(int jobcateno) {

    int cnt = this.jobcateProc.update_seqno_increase(jobcateno);

    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/jobcate/list_all.do");

    return mav;

  }

//출력순서 감소
//http://localhost:9093/jobcate/update_seqno_decrease.do
  @RequestMapping(value = "/jobcate/update_seqno_decrease.do", method = RequestMethod.GET)
  public ModelAndView update_seqno_decrease(int jobcateno) {

    JobcateVO jobcateVO = this.jobcateProc.read(jobcateno);

    if (jobcateVO.getSeqno() > 0) {
      int cnt = this.jobcateProc.update_seqno_decrease(jobcateno);
    } else {
      System.out.println("출력순서는 음수가 될수 없음");
    }

    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/jobcate/list_all.do");

    return mav;

  }
  
//공개모드로 전환
//http://localhost:9093/jobcate/update_visible_y.do
  @RequestMapping(value = "/jobcate/update_visible_y.do", method = RequestMethod.GET)
  public ModelAndView update_visible_y(int jobcateno) {


    int cnt = this.jobcateProc.update_visible_y(jobcateno);


    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/jobcate/list_all.do");

    return mav;

  }
  
//비공개모드로 전환
//http://localhost:9093/jobcate/update_visible_n.do
  @RequestMapping(value = "/jobcate/update_visible_n.do", method = RequestMethod.GET)
  public ModelAndView update_visible_n(int jobcateno) {


    int cnt = this.jobcateProc.update_visible_n(jobcateno);


    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/jobcate/list_all.do");

    return mav;

  }

}
