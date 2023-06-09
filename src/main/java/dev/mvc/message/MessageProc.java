package dev.mvc.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.message.MessageProc")
public class MessageProc implements MessageProcInter {
  
  @Autowired
  private MessageDAOInter MessageDAO;
  
  public MessageProc() {
    //System.out.println("JobcateProc Created");
  }
  
  
  

  }
  

