package dev.mvc.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MessageCont {
  
  @Autowired
  @Qualifier("dev.mvc.message.MessageProc")
  private MessageProc MessageProc;
  
  public MessageCont() {
    
    System.out.println("");
  }
  
  @RequestMapping(value="", method=RequestMethod.GET)
  public ModelAndView create() {
    
    ModelAndView mav = new ModelAndView();
    return mav;
    
  }
}
