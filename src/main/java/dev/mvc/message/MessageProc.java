package dev.mvc.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.message.MessageProc")
public class MessageProc implements MessageProcInter {
  
  @Autowired
  private MessageDAOInter MessageDAO;
  
  
  
  @Override
  public int create(MessageVO messageVO) {
    
    int cnt = this.MessageDAO.create(messageVO);
    return cnt;
  }
  
  
  
  

  }
  

