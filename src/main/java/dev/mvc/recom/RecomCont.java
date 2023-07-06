//package dev.mvc.recom;
//
//import java.util.ArrayList;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.ModelAndView;
//
//import dev.mvc.cate.CateVO;
//
//
//@Controller
//public class RecomCont{
//  
//  @Autowired
//  @Qualifier("dev.mvc.recom.RecomProc")
//  private RecomProcInter recomProc;
//  
//  private RecomCont() {
//    System.out.println("RecomCont created");
//  }
//  
//  
//  // http://localhost:9091/cate/list_all.do
//  @RequestMapping(value="/recom/list_all.do", method=RequestMethod.GET)
//  public ModelAndView list_all(HttpSession session) {
//    ModelAndView mav = new ModelAndView();
//    
//    if (this.recomProc.isAdmin(session) == true) {
//      mav.setViewName("/recom/list_all"); // /WEB-INF/views/cate/list_all.jsp
//      
//      ArrayList<RecomVO> list = this.recomProc.list_all();
//      mav.addObject("list", list);      
//    } else {
//      mav.setViewName("/recom/list_all.do"); // /WEB-INF/views/admin/login_need.jsp
//    }
//    
//    return mav;
//  }
//}